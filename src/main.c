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
 * by Aaron M. Hoover 
 *
 * v.00beta
 *
 * Revisions:
 *  <AUTHOR     DATE    COMMENT>
 *
 * Notes:
 * 
 * At the moment the basestation uses a very stripped down MAC layer
 * implementation Inter-PAN communication is not possible and all 
 * addressing is 16-bit only. Communication is also limited to one static
 * channel.
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
#include "payload.h"
#include <stdio.h>
#include "lcd.h"

// _FOSCSEL(FNOSC_PRIPLL);
// _FOSC(FCKSM_CSDCMD & OSCIOFNC_OFF & POSCMD_XT);
// _FWDT(FWDTEN_OFF);

void init(void);
void uartSendPacket(void);

#define RX_START            0x7E
#define UART_RX_WAITING     0x00
#define UART_RX_ON          0x01

#define RX_START_POS        0 
#define LEN_HB_POS          1
#define LEN_LB_POS          2
#define API_ID_POS          3
#define FRAME_ID_POS        4
#define DEST_ADDR_HB_POS    5
#define DEST_ADDR_LB_POS    6
#define OPTIONS_POS         7

#define RX_FRAME_OFFSET     8
#define RX_DATA_OFFSET      3 //Offset for accounting for RX_START and LEN_HB/LB bytes

// Default source address and pan id, eventually will get them from program memory
// For now, you need to replace these values with the appropriate ones for your
// project.
//<<<<<<< .mine
#define SRC_ADDR			0x2011
#define SRC_PAN_ID			0x2020
#define MY_CHAN             0x17
//=======
//#define SRC_ADDR	    0x1020
//#define SRC_PAN_ID          0x1000
//#define MY_CHAN             0x15
//>>>>>>> .r931

#define LED_RED             LED_0
#define LED_YLW1            LED_1
#define LED_YLW2            LED_2
#define LED_BLU             LED_3

int main(void) {
    init();

    while(1) {
        if (!radioIsRxQueueEmpty())
        {
            uartSendPacket();
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
    radioInit(src_addr, src_pan_id, 100, 100);
    radioSetChannel(MY_CHAN); //Set to my channel
}

void __attribute__((__interrupt__, no_auto_psv)) _U1RXInterrupt(void)
{
    static unsigned char uart_rx_state = UART_RX_WAITING;
    static unsigned char uart_rx_cnt = 0;
    static Payload rx_pld;
    static WordVal rx_pld_len;
    static byte    rx_checksum;
    static WordVal dst_addr;
    
    unsigned char c;
	MacPacket tx_packet;

    if(U1STAbits.OERR)
    {
        U1STAbits.OERR = 0;
    }

    c = ReadUART1();
    if (uart_rx_state == UART_RX_WAITING && c == RX_START)
    {
        uart_rx_state = UART_RX_ON;
        uart_rx_cnt = 1;
        rx_checksum = 0x00;
    }else if (uart_rx_state == UART_RX_ON)
    {
        switch (uart_rx_cnt)
        {
            //XBee interface uses two bytes for payload length, despite the
            //fact that packets can't be longer than 128 bytes. The high byte
            //is extracted, but never used here.
            case LEN_HB_POS:
                rx_pld_len.byte.HB = c;
                uart_rx_cnt++;
                break;
            case LEN_LB_POS:
                rx_pld_len.byte.LB = c;
                rx_pld = payCreateEmpty(rx_pld_len.byte.LB-(RX_FRAME_OFFSET-RX_DATA_OFFSET)-PAYLOAD_HEADER_LENGTH);
                uart_rx_cnt++;
                break;
            case API_ID_POS:
                //Currently, we're only supporting the 16-bit TX/RX API, 
                //but other possible IDs are AT (configuration commands)
                //and the 64 bit TX/RX modes.
                rx_checksum += c;
                uart_rx_cnt++;
                break;
            case FRAME_ID_POS:
                //We may want to do something with the frame id at some point.
                rx_checksum += c;
                uart_rx_cnt++;
                break;
            case DEST_ADDR_HB_POS:
                rx_checksum += c;
                dst_addr.byte.HB = c;
                uart_rx_cnt++;
                break;
            case DEST_ADDR_LB_POS:
                rx_checksum += c;
                dst_addr.byte.LB = c;
                uart_rx_cnt++;
                break;
            case OPTIONS_POS:
                //Options byte currently unused. XBee docs set use 0x01 to
                //disable ACKS and 0x04 to send with broadcast PAN ID
                rx_checksum += c;
                uart_rx_cnt++;
                break;
            default:
                if (uart_rx_cnt == (rx_pld_len.byte.LB + RX_DATA_OFFSET))
                {
                    if (rx_checksum + c == 0xFF) //We have a legit packet
                    {
						//Place packet in radio queue for sending
						tx_packet = macCreatePacket();
						tx_packet->payload = rx_pld;
						tx_packet->payload_length = payGetPayloadLength(rx_pld);//rx_pld_len.byte.LB - (RX_FRAME_OFFSET - RX_DATA_OFFSET);
						//tx_packet->dest_pan_id = src_pan_id; //Already set when macCreatePacket is called.
						tx_packet->dest_addr = dst_addr;
						radioEnqueueTxPacket(tx_packet);
                    }else //Start over
                    {
                        payDelete(rx_pld);
                    }

                    uart_rx_state = UART_RX_WAITING;
                }else
                {
                    rx_pld->pld_data[uart_rx_cnt - RX_FRAME_OFFSET] = c;
                    rx_checksum += c;
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

void uartSendPacket()
{
    int i;
    unsigned char checksum=0;
    unsigned char rssi;
    MacPacket rx_packet;

    CRITICAL_SECTION_START
        rx_packet = radioDequeueRxPacket();
        
        // for(i = 0; i < payGetPayloadLength(rx_pld); i++)
        //         {
        //             LED_1 = ON;
        //             delay_ms(300);
        //             LED_1 = OFF;
        //             delay_ms(300);
        //         }
        
		//Start Byte
		while(BusyUART1());
        WriteUART1(RX_START);
		
		//Length High Byte
		while(BusyUART1());
		WriteUART1(0x00);
		
		//Length Low Byte
		while(BusyUART1());
        WriteUART1(payGetPayloadLength(rx_packet->payload)+5);
        
		//API Identifier - Currently only support the RX type
		checksum += 0x81;
		while(BusyUART1());
		WriteUART1(0x81);
		
		//Source Address High byte
        checksum += rx_packet->src_addr.byte.HB;
		while(BusyUART1());
		WriteUART1(rx_packet->src_addr.byte.HB);
		
		//Source Address Low Byte
		checksum += rx_packet->src_addr.byte.LB;
		while(BusyUART1());
		WriteUART1(rx_packet->src_addr.byte.LB);
		
        rssi = phyReadRSSI();
		checksum += rssi;
		while(BusyUART1());
	    WriteUART1(rssi);
		
		//'Options' Not currently implemented
		checksum += 0x00;
		while(BusyUART1());
		WriteUART1(0x00);
		
		//Send Payload data
        for(i = 0; i < payGetPayloadLength(rx_packet->payload); i++)
        {
            checksum += rx_packet->payload->pld_data[i];
            while(BusyUART1());
            WriteUART1(rx_packet->payload->pld_data[i]);
        }

		//Send Checksum Data
        while(BusyUART1());
        WriteUART1(0xFF - checksum);
        payDelete(rx_packet->payload);
        macDeletePacket(rx_packet);
    CRITICAL_SECTION_END
}

