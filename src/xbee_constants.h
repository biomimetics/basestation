/*
 * Copyright (c) 2011, Regents of the University of California
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
 * Constants for the Biomimetic Millisystems Lab 802.15.4 USB basestation.
 *
 * by Kevin Peterson
 *
 * v.beta
 *
 * Revisions:
 *  Kevin Peterson      2011-10-14     Initial release
 *
 * 
 * 
 *
 *
 */

#ifndef __AT_VALUES_H
#define __AT_VALUES_H


#define RX_START            0x7E
#define UART_RX_WAITING     0x00
#define UART_RX_ON          0x01

//Offsets for packets received from computer
#define RX_FRAME_OFFSET     8
#define RX_DATA_OFFSET      4 //Offset for accounting for RX_START, LEN_HB/LB bytes, and API ID
#define FRAME_HEADER_LEN    5

//These are transmit modes for the xbee
#define AT_COMMAND_MODE     0x08
#define TX_16BIT            0x01

//Position of bytes in a TX_16BIT packet
#define RX_START_POS        0
#define LEN_HB_POS          1
#define LEN_LB_POS          2
#define API_ID_POS          3
#define FRAME_ID_POS        4
#define DEST_ADDR_HB_POS    5
#define DEST_ADDR_LB_POS    6
#define OPTION_POS          7

//These are various parameters of the xbee
#define AT_CHANNEL          0x4348  //CH
#define AT_PAN_ID           0x4944  //ID
#define AT_SRC_ADR          0x4D59  //MY
#define AT_ACK_LAST         0x4541  //EA
#define AT_SNIFFER          0x534E  //SN

//These are the response modes of the xbee
#define AT_RESPONSE         0x88
#define ATR_API_POS         0
#define ATR_FRAME_ID_POS    1
#define ATR_COMMAND_HB_POS  2
#define ATR_COMMAND_LB_POS  3
#define ATR_STATUS_POS      4

#define RX_16BIT            0x81
#define RX_API_POS          0
#define RX_SRC_ADR_HB_POS   1
#define RX_SRC_ADR_LB_POS   2
#define RX_RSSI_POS         3
#define RX_OPTIONS_POS      4


#endif
