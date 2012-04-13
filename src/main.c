/*
 * Copyright (c) 2010, Regents of the University of California
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of the University of California, Berkeley nor the names
 *   of its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * Firmware for the Biomimetic Millisystems Lab 802.15.4 USB basestation. 
 *
 * by Aaron M. Hoover & Kevin Peterson
 *
 * v2.00
 *
 * Revisions:
 *  <AUTHOR     DATE    COMMENT>
 *
 * Notes:
 * 
 * At the moment the basestation uses a very stripped down MAC layer
 * implementation Inter-PAN communication is not possible and all 
 * addressing is 16-bit only. 
 *
 * Usage:
 *  <SAMPLE USAGE>
 */

#include "p33Fxxxx.h"
#include "generic_typedefs.h"
#include "init_default.h"
#include "utils.h"
#include "init.h"
#include "uart.h"
#include "mac_packet.h"
#include "radio.h"
#include "at86rf.h"
#include "payload.h"
#include <stdio.h>
#include "xbee_constants.h"
#include "xbee_handler.h"
//#include "lcd.h"

// _FOSCSEL(FNOSC_PRIPLL);
// _FOSC(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMD_XT);
// _FWDT(FWDTEN_OFF);

void init(void);

// Default source address and pan id, eventually will get them from program memory
// For now, you need to replace these values with the appropriate ones for your
// project.  These can be changed from python now.
// RSF working address 9/2011
//#define SRC_ADDR	    0x2011
//#define SRC_PAN_ID	    0x2060
//#define MY_CHAN             0x13

//Motile Release
#define SRC_ADDR	    0x3001
#define SRC_PAN_ID	    0x3000
#define MY_CHAN             0x0e

//#define SRC_ADDR	    0x2000
//#define SRC_PAN_ID	    0x2000
//#define MY_CHAN             0x16


#define LED_RED             LED_0
#define LED_YLW1            LED_1
#define LED_YLW2            LED_2
#define LED_BLU             LED_3

int main(void) {
    init();

    while(1) {
        if (!radioIsRxQueueEmpty())
        {
            xbeeHandleRx();
            LED_BLU = ~LED_BLU;
        }
        if (!radioIsTxQueueEmpty())
        {
            macSendPacket();
            LED_RED = ~LED_RED;
        }
        
    }
}

void init(void)
{
    int i;
    volatile WordVal src_addr = {SRC_ADDR};
    volatile WordVal src_pan_id = {SRC_PAN_ID};

    SetupClock();
    SwitchClocks();
    SetupPorts();

    for (i = 0; i < 6; i++)
    {
        LED_RED = ~LED_RED;
        delay_ms(50);
        LED_YLW1 = ~LED_YLW1;
        delay_ms(50);
        LED_YLW2 = ~LED_YLW2;
        delay_ms(50);
        LED_BLU = ~LED_BLU;
        delay_ms(50);
    }

    SetupUART1();
    SetupInterrupts();
    EnableIntU1TX;
    EnableIntU1RX;
    radioInit(src_addr, src_pan_id, 150, 150);
    radioSetChannel(MY_CHAN); //Set to my channel

    //Set this if the electronics for Ant diversity are installed
    atSetAntDiversity(1);
}

//read data from the UART, and call the proper function based on the Xbee code
void __attribute__((__interrupt__, no_auto_psv)) _U1RXInterrupt(void)
{
    static unsigned char uart_rx_state = UART_RX_WAITING;
    static unsigned char uart_rx_cnt = 0;
    static Payload uart_pld;
    static WordVal uart_pld_len;
    static byte    uart_checksum;
    static unsigned char packet_type = 0;
    static unsigned char test;
    
    unsigned char c;

    if(U1STAbits.OERR)
    {
        U1STAbits.OERR = 0;
    }

    c = ReadUART1();
    if (uart_rx_state == UART_RX_WAITING && c == RX_START)
    {
        uart_rx_state = UART_RX_ON;
        packet_type = 0;
        uart_rx_cnt = 1;
        uart_checksum = 0x00;
    }else if (uart_rx_state == UART_RX_ON)
    {
        switch (uart_rx_cnt)
        {
            //XBee interface uses two bytes for payload length, despite the
            //fact that packets can't be longer than 128 bytes. The high byte
            //is extracted, but never used here.
            case LEN_HB_POS:
                uart_pld_len.byte.HB = c;
                uart_rx_cnt++;
                break;
            case LEN_LB_POS:
                uart_pld_len.byte.LB = c;
                //We create a payload structure to store the data incoming from the uart
                uart_pld = payCreateEmpty(uart_pld_len.byte.LB-PAYLOAD_HEADER_LENGTH);
                test = uart_pld_len.byte.LB;
                uart_rx_cnt++;
                break;
            case API_ID_POS:
                //Currently, we're only supporting the 16-bit TX/RX API, 
                //and the AT command mode
                packet_type = c;
                uart_checksum += c;
                uart_rx_cnt++;
                break;
            default:
            if (uart_rx_cnt == (uart_pld_len.byte.LB + RX_DATA_OFFSET-1))
            {
                if (uart_checksum + c == 0xFF) //We have a legit packet
                {
                    //Check for type of packet and call relevant function
                    switch (packet_type)
                    {
                        case AT_COMMAND_MODE:
                            xbeeHandleAt(uart_pld);
                            break;

                        case TX_16BIT:
                            xbeeHandleTx(uart_pld);
                            break;

                        default:
                            //do nothing, but probably should send an error
                            break;
                    }
                    payDelete(uart_pld);

                }else //Start over
                {
                    payDelete(uart_pld);
                }

                uart_rx_state = UART_RX_WAITING;
            }else
            {
                uart_pld->pld_data[uart_rx_cnt-RX_DATA_OFFSET] = c;
                uart_checksum += c;
                uart_rx_cnt++;
            }
            break;
        }
            
    }
    _U1RXIF = 0;
}

void __attribute__((interrupt, no_auto_psv)) _U1TXInterrupt(void)
{
    _U1TXIF = 0;
}



