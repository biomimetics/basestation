#!/usr/bin/env python
"""
authors: Kevin Peterson
Modification on 2011-03-7:

"""

import numpy as np
import lib.command 
from struct import *
import time, serial, sys, os
from lib.basestation import BaseStation
from lib.base_functions import BaseFunctions
from lib.robot_functions import RobotFunctions

#Define constants to use
DEST_ADDR = '\x20\x12'

#Define functions to use
def xbee_received(packet):
    
    #Check type of packet:
    name = packet.get('id')
    #The packet is a response to an AT command
    if name == 'at_response':
        frame_id = packet.get('frame_id')
        command = packet.get('command')
        status = packet.get('status')
        parameter = packet.get('parameter')
        #Handle packet in whatever way is appropriate
        print command
        print len(parameter)        

    #The packet is data recieved from the radio
    elif name == 'rx':
        src_addr = packet.get('source_addr')
        rssi = packet.get('rssi')
        options = packet.get('options')
        data = packet.get('rf_data')
        #Handle packet in whatever way is appropriate
        print 'Packet received'
        
    
#Initialize the basestation and the helper functions
xb = BaseStation('/dev/tty.usbserial-A800fdFZ', 230400, DEST_ADDR, xbee_received)
base = BaseFunctions(xb)
robot = RobotFunctions(xb)

if __name__ == '__main__':
    
    base.getChannel('a')
    base.getSrcAddr('b')
    base.getPanID('c')
    
    base.setChannel('\x17')

    robot.go(40)
    
    time.sleep(1)
    
    robot.stop()
    
    print '\n'
    sys.exit()