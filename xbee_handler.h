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
 * by Kevin Peterson
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
 * addressing is 16-bit only.
 *
 * Usage:
 *  <SAMPLE USAGE>
 */

#ifndef __XBEE_HANDLER_H
#define __XBEE_HANDLER_H

/******************************************************************************
* Function Name : xbeeHandleAt
* Description   : Read the AT command byte and perform the appropriate action
* Parameters    : A payload received from the UART/Python
* Return Value  : None
*******************************************************************************/
void xbeeHandleAt(Payload rx_pld);



/******************************************************************************
* Function Name : xbeeHandleTx
* Description   : Take a payload received over the UART, package it and send
*                 over the radio
* Parameters    : A payload received from the UART/Python
* Return Value  : None
*******************************************************************************/
void xbeeHandleTx(Payload rx_pld);



/******************************************************************************
* Function Name : xbeeHandleRx
* Description   : Retrieve a packet from the radio, put it in the correct format
*                 and pass it along the UART
* Parameters    : None, this is called when the radio puts a packet in the
*                 receive queue
* Return Value  : None
*******************************************************************************/
void xbeeHandleRx(void);



/******************************************************************************
* Function Name : xbeeHandleATR
* Description   : Create a AT response packet and send it over the UART
* Parameters    : frame_id: pass the frame id from Python back to allow syncing
*                 this packet with the request
*                 command: The command executed by the AT packet
*                 *data: a pointer to an array with the requested return values
*                 length: the number of bytes in *data to send
* Return Value  : None
*******************************************************************************/
void xbeeHandleATR(unsigned char frame_id, WordVal command, unsigned char *data, unsigned char length);



/******************************************************************************
* Function Name : sendUART
* Description   : Send a frame header and payload over the UART
* Parameters    : frame_header: a 5 byte header for sending UART packets in xbee
*                 format
*                 data: any additional payload to be sent
*                 length: length of the data array
* Return Value  : None
*******************************************************************************/
void sendUART(unsigned char *frame_header, unsigned char *data, unsigned char length);



#endif
