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
ifeq "$(wildcard nbproject/Makefile-local-XC16_24HJ128GP202.mk)" "nbproject/Makefile-local-XC16_24HJ128GP202.mk"
include nbproject/Makefile-local-XC16_24HJ128GP202.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC16_24HJ128GP202
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

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
	${MAKE}  -f nbproject/Makefile-XC16_24HJ128GP202.mk ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  .generated_files/flags/XC16_24HJ128GP202/8508e1c459e28ba8b3dcc155c704deb72b859b57 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24HJ128GP202/9683c91511b60a6d7215962ed40aa6e7d6e2537d .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  .generated_files/flags/XC16_24HJ128GP202/ca70ffdf70c885a24f86c58ed66e9315a7bd4b49 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  .generated_files/flags/XC16_24HJ128GP202/144bbc0ddcfcad8ed2330248083ad2cffb554776 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  .generated_files/flags/XC16_24HJ128GP202/e2ccaa6f4ff41c32316489e9f7ddbb922404d787 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  .generated_files/flags/XC16_24HJ128GP202/ce1dd2b9f6e9aa462749df57d8698cfaece3dc5e .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  .generated_files/flags/XC16_24HJ128GP202/a15e1a4844c0462ddfd9616181cd4b4de48a0b86 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  .generated_files/flags/XC16_24HJ128GP202/bc84b6b404462c384fc1d02ce376d4720170497d .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  .generated_files/flags/XC16_24HJ128GP202/f52fe37a8c155c8ed13683b658c76986d6f7a198 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  .generated_files/flags/XC16_24HJ128GP202/1e9dc712eef96438d878abec5d5d16bd4f6acd17 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24HJ128GP202/6cda66e97c53d9d01797881870f7550384b9474c .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24HJ128GP202/8f9942704cacca7b82107e016b7a4078bab7ccf1 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24HJ128GP202/2edac276401b79a58e5e1fde193e71f8f3a5ee8e .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24HJ128GP202/cda66693fbe5b16dad51625668587c3ee0463860 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  .generated_files/flags/XC16_24HJ128GP202/7827a889c9a4056a5d97b8a9017914b8160504c9 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1    -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
else
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  .generated_files/flags/XC16_24HJ128GP202/84d68dd2842e6ac0d891cf04d1bf84c6d3e08f66 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24HJ128GP202/8c541b9d66a666db1d24175bceccfc416de6c54c .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  .generated_files/flags/XC16_24HJ128GP202/4e1b6cec28003a98057d0c73d40b4cbcb5fb06f3 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  .generated_files/flags/XC16_24HJ128GP202/f5334b7d512bcb4bd28f0de533da5da7a0b2ebc6 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  .generated_files/flags/XC16_24HJ128GP202/9d017e5e5d74cb66c61fd1f18bda653b4803c44 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  .generated_files/flags/XC16_24HJ128GP202/d2f54ab90dec59dc1a317fb0d0c6989887245935 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  .generated_files/flags/XC16_24HJ128GP202/d053d60b0c7ab7bc6ffd7e747ea249893aa6ba78 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  .generated_files/flags/XC16_24HJ128GP202/338111c6147d8157e224dd1d3b90bdd6e52ad86f .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  .generated_files/flags/XC16_24HJ128GP202/f24bd03bed34774a5fe5d5c1ed46530db62f27f9 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  .generated_files/flags/XC16_24HJ128GP202/1349071fed3cd70bddaaa8f72ea169927b71d4e5 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24HJ128GP202/68e021b879de3fee6765c10b9dde7f3ce19c462 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24HJ128GP202/69169ea03bdbdefae5a8e080a9849f6c9649b1fb .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24HJ128GP202/f8ca177ed6302cf2320e94a03340f57512858333 .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24HJ128GP202/e47e8e867d17a7e53fb2b3026d0940febe346a3b .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  .generated_files/flags/XC16_24HJ128GP202/1d6b26fa9ac296ab867dbbae174d828a649c4add .generated_files/flags/XC16_24HJ128GP202/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"        -g -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
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
${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem$(MP_EXTRA_LD_POST)  
	
else
${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_24HJ128GP202=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem$(MP_EXTRA_LD_POST)  
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
