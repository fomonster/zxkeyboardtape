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
ifeq "$(wildcard nbproject/Makefile-local-XC16_24FJ64GC010.mk)" "nbproject/Makefile-local-XC16_24FJ64GC010.mk"
include nbproject/Makefile-local-XC16_24FJ64GC010.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC16_24FJ64GC010
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
	${MAKE}  -f nbproject/Makefile-XC16_24FJ64GC010.mk ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  .generated_files/flags/XC16_24FJ64GC010/3a5cbcd60ac919900e6b15cb250450ee33ef4e21 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24FJ64GC010/313ace098414adcaeb63101a9ac93d309b1c6b79 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  .generated_files/flags/XC16_24FJ64GC010/91aa483dbebb275678176bc3567790701b279164 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  .generated_files/flags/XC16_24FJ64GC010/7d2dab9d0628e09f725659ce3be8a625006e98d .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  .generated_files/flags/XC16_24FJ64GC010/711ba4cb300259c632360716d21a0592b1607c6a .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  .generated_files/flags/XC16_24FJ64GC010/e519cf0988b0d7265af494b96cf464b40a568299 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  .generated_files/flags/XC16_24FJ64GC010/16c5e62e285b81c9e9fc0044d541fb3d9e3a91df .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  .generated_files/flags/XC16_24FJ64GC010/189328713c9504835c32e3e2b702c0717c00b924 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  .generated_files/flags/XC16_24FJ64GC010/69dfd90b90967beb58b13fce26ba6d1c0d710b95 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  .generated_files/flags/XC16_24FJ64GC010/5c6ba04ae226d09a7adc7b6e13bdfeeb3d1f96a7 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24FJ64GC010/5691b37113e41e02067f50e7c81c328c1335e391 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24FJ64GC010/36d2a6973d319ff02578f364a06559917652ab8c .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24FJ64GC010/8354d0b4492d114604410ceb2a7b31b743abe640 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24FJ64GC010/e0ccd877040eecd101134b87fcead4187f94737f .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  .generated_files/flags/XC16_24FJ64GC010/484fe5e79f14fb850ed558da78af79572576ba19 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
else
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  .generated_files/flags/XC16_24FJ64GC010/64f08575cd9f6e029dd8aa372ba083950e4d3449 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24FJ64GC010/758d124e18b3a2b2ef6ff361ca00cb64c70cf559 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  .generated_files/flags/XC16_24FJ64GC010/b76c0ca1d6deef468afb1c6e378b6a5e4a5977e7 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  .generated_files/flags/XC16_24FJ64GC010/8ed3a523ba991bcb9dc90af63a687c00f9dc542b .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  .generated_files/flags/XC16_24FJ64GC010/3edb8a6120f823224bf596a9731d290395f5116e .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  .generated_files/flags/XC16_24FJ64GC010/486e211cc5be472179826b8a0ba5ecffdb5dacaf .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  .generated_files/flags/XC16_24FJ64GC010/cb24ea28c995825b62555b8be2e70a1f7d0e70a4 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  .generated_files/flags/XC16_24FJ64GC010/830d339c8248d69c4ee0d6165ef64c3d215f5024 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  .generated_files/flags/XC16_24FJ64GC010/357b3dbab9d83ca15c4443942024eed06afde285 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  .generated_files/flags/XC16_24FJ64GC010/3a8dd3677c0b3e555994c91ff5fb1a2d48bf38c4 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24FJ64GC010/5a9869abb16887ebad1cb76b04d9b885b18679bc .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24FJ64GC010/9b84fd3acab8d8a79211d6fb34d72decc15c0dc .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24FJ64GC010/b82b6d159142cccbb22b0fe33865eb1b5fc7346b .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24FJ64GC010/427a1ca909a11ade93d493330f3569bb050a592e .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  .generated_files/flags/XC16_24FJ64GC010/124c8969773d74e1fb33222840be1fe904e4bea1 .generated_files/flags/XC16_24FJ64GC010/f8806e13e88a914280bbeb485fc4f3e20e1a147a
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"        -g -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off   
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST)  
	
else
${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_24FJ64GC010=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST)  
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
