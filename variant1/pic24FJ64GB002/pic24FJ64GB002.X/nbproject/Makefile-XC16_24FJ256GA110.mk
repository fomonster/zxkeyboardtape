#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-XC16_24FJ256GA110.mk)" "nbproject/Makefile-local-XC16_24FJ256GA110.mk"
include nbproject/Makefile-local-XC16_24FJ256GA110.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC16_24FJ256GA110
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c interrupts.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c main.c system.c traps.c user.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/695812370/ff.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/_ext/695812370/diskio.o ${OBJECTDIR}/_ext/1510298835/mcc.o ${OBJECTDIR}/_ext/695812370/ccsbcs.o ${OBJECTDIR}/_ext/794497298/usb_config.o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o ${OBJECTDIR}/_ext/95349475/usb_host.o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/695812370/ff.o.d ${OBJECTDIR}/interrupts.o.d ${OBJECTDIR}/_ext/695812370/diskio.o.d ${OBJECTDIR}/_ext/1510298835/mcc.o.d ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d ${OBJECTDIR}/_ext/794497298/usb_config.o.d ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d ${OBJECTDIR}/_ext/95349475/usb_host.o.d ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/traps.o.d ${OBJECTDIR}/user.o.d ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/695812370/ff.o ${OBJECTDIR}/interrupts.o ${OBJECTDIR}/_ext/695812370/diskio.o ${OBJECTDIR}/_ext/1510298835/mcc.o ${OBJECTDIR}/_ext/695812370/ccsbcs.o ${OBJECTDIR}/_ext/794497298/usb_config.o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o ${OBJECTDIR}/_ext/95349475/usb_host.o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/traps.o ${OBJECTDIR}/user.o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o

# Source Files
SOURCEFILES=C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c interrupts.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c main.c system.c traps.c user.c C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-XC16_24FJ256GA110.mk dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/695812370/ff.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/interrupts.o: interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/interrupts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/695812370/diskio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1510298835/mcc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/794497298/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/traps.o: traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/695812370/ff.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/interrupts.o: interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/interrupts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/695812370/diskio.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1510298835/mcc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/794497298/usb_config.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_host.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/system.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/traps.o: traps.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/traps.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/traps.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/user.o: user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/user.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/user.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Os -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/pic24FJ64GB002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/XC16_24FJ256GA110
	${RM} -r dist/XC16_24FJ256GA110

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
