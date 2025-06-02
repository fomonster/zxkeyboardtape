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
FINAL_IMAGE=${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
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
	${MAKE}  -f nbproject/Makefile-XC16_24FJ256GA110.mk ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=p24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  .generated_files/flags/XC16_24FJ256GA110/2d990fdcb75c3a578f6c3ab8507031f9e50ee90b .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24FJ256GA110/682c67b18a610911cc57e6c4b5cfb9c789ae6407 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  .generated_files/flags/XC16_24FJ256GA110/6a680ee6e4b8835db51e471d0a6e5a1c82b237ef .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  .generated_files/flags/XC16_24FJ256GA110/1c42b77f102a39e8a2de2dd5ad3d5eb680a9ab8d .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  .generated_files/flags/XC16_24FJ256GA110/963497aec7b077086446fdddd776afe6c1fdbfa6 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  .generated_files/flags/XC16_24FJ256GA110/1baa917a5d7ee4c8b59f01a1930a3a058cbecbc7 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  .generated_files/flags/XC16_24FJ256GA110/cfa5e4bf7f5b5efe6af14aaf4b7fd7576cf8f254 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  .generated_files/flags/XC16_24FJ256GA110/e92e91ae84d6e6bd552dbe7308a76687a563caf0 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  .generated_files/flags/XC16_24FJ256GA110/48ff8e4fc8d93cea0ab5513f115e4473fb71b7cb .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  .generated_files/flags/XC16_24FJ256GA110/f3c277fe927534592020e8d44a8116677eccfe87 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24FJ256GA110/8b577aa0893dc2a731865315414f2967d784c947 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24FJ256GA110/5c081ab6ccbfa5741b0e51f568c82081f4d36145 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24FJ256GA110/687c8ef492b8f52581a5d9bde3d9d650bd451221 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24FJ256GA110/650261f1c77ffa20323269423436a3619f5804 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  .generated_files/flags/XC16_24FJ256GA110/74fec01455b9be3ce2253fd61e56779e8841dfba .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
else
${OBJECTDIR}/_ext/695812370/ff.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  .generated_files/flags/XC16_24FJ256GA110/185e5f326e57456ba81302f8eb81e6244b0b2206 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ff.c  -o ${OBJECTDIR}/_ext/695812370/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ff.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/interrupts.o: interrupts.c  .generated_files/flags/XC16_24FJ256GA110/f989db6d53614ca4d8a8670e9a51ce0f18fc4054 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interrupts.o.d 
	@${RM} ${OBJECTDIR}/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interrupts.c  -o ${OBJECTDIR}/interrupts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/interrupts.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/diskio.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  .generated_files/flags/XC16_24FJ256GA110/c74dbd659fa96e010ea0244d8fe04dbb1762491 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/diskio.c  -o ${OBJECTDIR}/_ext/695812370/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/diskio.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/1510298835/mcc.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  .generated_files/flags/XC16_24FJ256GA110/8afce52653819c1ca04e69214e151b49b775b502 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1510298835" 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1510298835/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/gen/mcc.c  -o ${OBJECTDIR}/_ext/1510298835/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/1510298835/mcc.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/695812370/ccsbcs.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  .generated_files/flags/XC16_24FJ256GA110/8ec5de4a81a5287edeeed4f9b4c798e200b5bbbe .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/695812370" 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o.d 
	@${RM} ${OBJECTDIR}/_ext/695812370/ccsbcs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/sd/ccsbcs.c  -o ${OBJECTDIR}/_ext/695812370/ccsbcs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/695812370/ccsbcs.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/usb_config.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  .generated_files/flags/XC16_24FJ256GA110/296ed2be6d341da4c4b493ead0465eb5fd884180 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb_config.c  -o ${OBJECTDIR}/_ext/794497298/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/usb_config.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  .generated_files/flags/XC16_24FJ256GA110/2d01fa8cb5432aae649b60a0bde65aa4eaae090e .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_hal_pic24f.c  -o ${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_hal_pic24f.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  .generated_files/flags/XC16_24FJ256GA110/ac19bd8e1f6adf8059b3e582e7a3b6fcb9cd7799 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host.c  -o ${OBJECTDIR}/_ext/95349475/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  .generated_files/flags/XC16_24FJ256GA110/e11e6785086662f6497963ba9b4b13b53182fe70 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  .generated_files/flags/XC16_24FJ256GA110/f443cc2baf30396024695ef26a009078586feb79 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/95349475" 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/usb/usb_host_hid_parser.c  -o ${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/95349475/usb_host_hid_parser.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/XC16_24FJ256GA110/5dfccf3559ba8d889bc989667315b8fefbccdfe6 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/system.o: system.c  .generated_files/flags/XC16_24FJ256GA110/72bf01cb4be60ca9914aba5411efe40ede5f3aba .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/traps.o: traps.c  .generated_files/flags/XC16_24FJ256GA110/6417bda20ed5224a30aeb3beb0d2eac3dfa0243b .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/traps.o.d 
	@${RM} ${OBJECTDIR}/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  traps.c  -o ${OBJECTDIR}/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/traps.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/user.o: user.c  .generated_files/flags/XC16_24FJ256GA110/5988ab82c0a65aac2495a71a2b20f23ee70c3fd2 .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/user.o.d 
	@${RM} ${OBJECTDIR}/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  user.c  -o ${OBJECTDIR}/user.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/user.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o: C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  .generated_files/flags/XC16_24FJ256GA110/7772b359f8ead37679c03e4e77cb34e22d3c913c .generated_files/flags/XC16_24FJ256GA110/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/794497298" 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Work/zx-keyboard/pic24FJ64GB002/pic24FJ64GB002.X/app_host_hid_keyboard.c  -o ${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/_ext/794497298/app_host_hid_keyboard.o.d"        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -O1 -msmart-io=1 -Wall -msfr-warn=off   
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
	
else
${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/pic24FJ64GB002.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_XC16_24FJ256GA110=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=2000,--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  
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
