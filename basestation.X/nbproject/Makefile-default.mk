#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 
# Macros
CND_CONF=default

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf
endif
# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}
# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/877975035/packet_queue.o ${OBJECTDIR}/_ext/877975035/init_default.o ${OBJECTDIR}/_ext/877975035/radio.o ${OBJECTDIR}/_ext/877975035/at86rf.o ${OBJECTDIR}/_ext/877975035/buffer.o ${OBJECTDIR}/_ext/877975035/delay.o ${OBJECTDIR}/_ext/877975035/queue.o ${OBJECTDIR}/_ext/1360937237/traps.o ${OBJECTDIR}/_ext/877975035/payload.o ${OBJECTDIR}/_ext/877975035/lcd.o ${OBJECTDIR}/_ext/1360937237/init.o ${OBJECTDIR}/_ext/877975035/ipspi1.o ${OBJECTDIR}/_ext/1360937237/xbee_handler.o ${OBJECTDIR}/_ext/1360937237/main.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

OS_ORIGINAL="Darwin"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/Applications/microchip/mplabc30/v3.24/bin/pic30-gcc
MP_AS=/Applications/microchip/mplabc30/v3.24/bin/pic30-as
MP_LD=/Applications/microchip/mplabc30/v3.24/bin/pic30-ld
MP_AR=/Applications/microchip/mplabc30/v3.24/bin/pic30-ar
MP_CC_DIR=/Applications/microchip/mplabc30/v3.24/bin
MP_AS_DIR=/Applications/microchip/mplabc30/v3.24/bin
MP_LD_DIR=/Applications/microchip/mplabc30/v3.24/bin
MP_AR_DIR=/Applications/microchip/mplabc30/v3.24/bin
.build-conf: ${BUILD_SUBPROJECTS}
ifneq ($(OS_CURRENT),$(OS_ORIGINAL))
	@echo "***** WARNING: This make file contains OS dependent code. The OS this makefile is being run is different from the OS it was created in."
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
.PHONY: ${OBJECTDIR}/_ext/877975035/delay.o
${OBJECTDIR}/_ext/877975035/delay.o: ../../shared/delay.s  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${MP_CC}  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -c -mcpu=33FJ128MC706  -o ${OBJECTDIR}/_ext/877975035/delay.o ../../shared/delay.s  -Wa,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,-I".."
else
.PHONY: ${OBJECTDIR}/_ext/877975035/delay.o
${OBJECTDIR}/_ext/877975035/delay.o: ../../shared/delay.s  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${MP_CC}  -omf=elf -c -mcpu=33FJ128MC706  -o ${OBJECTDIR}/_ext/877975035/delay.o ../../shared/delay.s  -Wa,--defsym=__MPLAB_BUILD=1,-I".."
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/877975035/packet_queue.o: ../../shared/packet_queue.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/packet_queue.o.d -o ${OBJECTDIR}/_ext/877975035/packet_queue.o ../../shared/packet_queue.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/packet_queue.o.d > ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/packet_queue.o.d > ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/init_default.o: ../../shared/init_default.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/init_default.o.d -o ${OBJECTDIR}/_ext/877975035/init_default.o ../../shared/init_default.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/init_default.o.d > ${OBJECTDIR}/_ext/877975035/init_default.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/init_default.o.d > ${OBJECTDIR}/_ext/877975035/init_default.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/radio.o: ../../shared/radio.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/radio.o.d -o ${OBJECTDIR}/_ext/877975035/radio.o ../../shared/radio.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/radio.o.d > ${OBJECTDIR}/_ext/877975035/radio.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/radio.o.tmp ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/radio.o.d > ${OBJECTDIR}/_ext/877975035/radio.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/radio.o.tmp ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/at86rf.o: ../../shared/at86rf.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/at86rf.o.d -o ${OBJECTDIR}/_ext/877975035/at86rf.o ../../shared/at86rf.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/at86rf.o.d > ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/at86rf.o.d > ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/buffer.o: ../../shared/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/buffer.o.d -o ${OBJECTDIR}/_ext/877975035/buffer.o ../../shared/buffer.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/buffer.o.d > ${OBJECTDIR}/_ext/877975035/buffer.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/buffer.o.d > ${OBJECTDIR}/_ext/877975035/buffer.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/queue.o: ../../shared/queue.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/queue.o.d -o ${OBJECTDIR}/_ext/877975035/queue.o ../../shared/queue.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/queue.o.d > ${OBJECTDIR}/_ext/877975035/queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/queue.o.tmp ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/queue.o.d > ${OBJECTDIR}/_ext/877975035/queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/queue.o.tmp ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/traps.o: ../src/traps.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/traps.o.d -o ${OBJECTDIR}/_ext/1360937237/traps.o ../src/traps.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/traps.o.d > ${OBJECTDIR}/_ext/1360937237/traps.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/traps.o.d > ${OBJECTDIR}/_ext/1360937237/traps.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/payload.o: ../../shared/payload.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/payload.o.d -o ${OBJECTDIR}/_ext/877975035/payload.o ../../shared/payload.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/payload.o.d > ${OBJECTDIR}/_ext/877975035/payload.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/payload.o.tmp ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/payload.o.d > ${OBJECTDIR}/_ext/877975035/payload.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/payload.o.tmp ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/lcd.o: ../../shared/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/lcd.o.d -o ${OBJECTDIR}/_ext/877975035/lcd.o ../../shared/lcd.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/lcd.o.d > ${OBJECTDIR}/_ext/877975035/lcd.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/lcd.o.d > ${OBJECTDIR}/_ext/877975035/lcd.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/init.o: ../src/init.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/init.o.d -o ${OBJECTDIR}/_ext/1360937237/init.o ../src/init.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/init.o.d > ${OBJECTDIR}/_ext/1360937237/init.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/init.o.tmp ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/init.o.d > ${OBJECTDIR}/_ext/1360937237/init.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/init.o.tmp ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/ipspi1.o: ../../shared/ipspi1.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/ipspi1.o.d -o ${OBJECTDIR}/_ext/877975035/ipspi1.o ../../shared/ipspi1.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/ipspi1.o.d > ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/ipspi1.o.d > ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/xbee_handler.o: ../src/xbee_handler.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d -o ${OBJECTDIR}/_ext/1360937237/xbee_handler.o ../src/xbee_handler.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d > ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d > ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${MP_CC} -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/main.o.d -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/main.o.d > ${OBJECTDIR}/_ext/1360937237/main.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/main.o.tmp ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/main.o.d > ${OBJECTDIR}/_ext/1360937237/main.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/main.o.tmp ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.tmp}
endif
else
${OBJECTDIR}/_ext/877975035/packet_queue.o: ../../shared/packet_queue.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/packet_queue.o.d -o ${OBJECTDIR}/_ext/877975035/packet_queue.o ../../shared/packet_queue.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/packet_queue.o.d > ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/packet_queue.o.d > ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp ${OBJECTDIR}/_ext/877975035/packet_queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/packet_queue.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/init_default.o: ../../shared/init_default.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/init_default.o.d -o ${OBJECTDIR}/_ext/877975035/init_default.o ../../shared/init_default.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/init_default.o.d > ${OBJECTDIR}/_ext/877975035/init_default.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/init_default.o.d > ${OBJECTDIR}/_ext/877975035/init_default.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp ${OBJECTDIR}/_ext/877975035/init_default.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/init_default.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/radio.o: ../../shared/radio.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/radio.o.d -o ${OBJECTDIR}/_ext/877975035/radio.o ../../shared/radio.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/radio.o.d > ${OBJECTDIR}/_ext/877975035/radio.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/radio.o.tmp ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/radio.o.d > ${OBJECTDIR}/_ext/877975035/radio.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/radio.o.tmp ${OBJECTDIR}/_ext/877975035/radio.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/radio.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/at86rf.o: ../../shared/at86rf.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/at86rf.o.d -o ${OBJECTDIR}/_ext/877975035/at86rf.o ../../shared/at86rf.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/at86rf.o.d > ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/at86rf.o.d > ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp ${OBJECTDIR}/_ext/877975035/at86rf.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/at86rf.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/buffer.o: ../../shared/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/buffer.o.d -o ${OBJECTDIR}/_ext/877975035/buffer.o ../../shared/buffer.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/buffer.o.d > ${OBJECTDIR}/_ext/877975035/buffer.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/buffer.o.d > ${OBJECTDIR}/_ext/877975035/buffer.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp ${OBJECTDIR}/_ext/877975035/buffer.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/buffer.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/queue.o: ../../shared/queue.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/queue.o.d -o ${OBJECTDIR}/_ext/877975035/queue.o ../../shared/queue.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/queue.o.d > ${OBJECTDIR}/_ext/877975035/queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/queue.o.tmp ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/queue.o.d > ${OBJECTDIR}/_ext/877975035/queue.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/queue.o.tmp ${OBJECTDIR}/_ext/877975035/queue.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/queue.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/traps.o: ../src/traps.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/traps.o.d -o ${OBJECTDIR}/_ext/1360937237/traps.o ../src/traps.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/traps.o.d > ${OBJECTDIR}/_ext/1360937237/traps.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/traps.o.d > ${OBJECTDIR}/_ext/1360937237/traps.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp ${OBJECTDIR}/_ext/1360937237/traps.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/traps.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/payload.o: ../../shared/payload.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/payload.o.d -o ${OBJECTDIR}/_ext/877975035/payload.o ../../shared/payload.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/payload.o.d > ${OBJECTDIR}/_ext/877975035/payload.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/payload.o.tmp ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/payload.o.d > ${OBJECTDIR}/_ext/877975035/payload.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/payload.o.tmp ${OBJECTDIR}/_ext/877975035/payload.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/payload.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/lcd.o: ../../shared/lcd.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/lcd.o.d -o ${OBJECTDIR}/_ext/877975035/lcd.o ../../shared/lcd.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/lcd.o.d > ${OBJECTDIR}/_ext/877975035/lcd.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/lcd.o.d > ${OBJECTDIR}/_ext/877975035/lcd.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp ${OBJECTDIR}/_ext/877975035/lcd.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/lcd.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/init.o: ../src/init.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/init.o.d -o ${OBJECTDIR}/_ext/1360937237/init.o ../src/init.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/init.o.d > ${OBJECTDIR}/_ext/1360937237/init.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/init.o.tmp ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/init.o.d > ${OBJECTDIR}/_ext/1360937237/init.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/init.o.tmp ${OBJECTDIR}/_ext/1360937237/init.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/init.o.tmp}
endif
${OBJECTDIR}/_ext/877975035/ipspi1.o: ../../shared/ipspi1.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/877975035 
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/877975035/ipspi1.o.d -o ${OBJECTDIR}/_ext/877975035/ipspi1.o ../../shared/ipspi1.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/877975035/ipspi1.o.d > ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/877975035/ipspi1.o.d > ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${CP} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp ${OBJECTDIR}/_ext/877975035/ipspi1.o.d 
	${RM} ${OBJECTDIR}/_ext/877975035/ipspi1.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/xbee_handler.o: ../src/xbee_handler.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d -o ${OBJECTDIR}/_ext/1360937237/xbee_handler.o ../src/xbee_handler.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d > ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d > ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/xbee_handler.o.tmp}
endif
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1360937237 
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${MP_CC}  -omf=elf -x c -c -mcpu=33FJ128MC706 -Wall -D__BASESTATION -I"../src" -I"../../shared" -MMD -MF ${OBJECTDIR}/_ext/1360937237/main.o.d -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	 sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1360937237/main.o.d > ${OBJECTDIR}/_ext/1360937237/main.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/main.o.tmp ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.tmp}
else 
	 sed -e 's/\"//g' ${OBJECTDIR}/_ext/1360937237/main.o.d > ${OBJECTDIR}/_ext/1360937237/main.o.tmp
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${CP} ${OBJECTDIR}/_ext/1360937237/main.o.tmp ${OBJECTDIR}/_ext/1360937237/main.o.d 
	${RM} ${OBJECTDIR}/_ext/1360937237/main.o.tmp}
endif
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  -omf=elf  -mcpu=33FJ128MC706  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf ${OBJECTFILES}      -Wl,--defsym=__MPLAB_BUILD=1,-Tp33FJ128MC706.gld,--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,--heap=2048,-L"../C:/Program Files/Microchip/MPLAB C30/lib",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem
else
dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC}  -omf=elf  -mcpu=33FJ128MC706  -o dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf ${OBJECTFILES}      -Wl,--defsym=__MPLAB_BUILD=1,-Tp33FJ128MC706.gld,--heap=2048,-L"../C:/Program Files/Microchip/MPLAB C30/lib",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem
	${MP_CC_DIR}/pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/basestation.X.${IMAGE_TYPE}.elf -omf=elf
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist
# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
