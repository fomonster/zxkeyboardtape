/*******************************************************************************
 *                                                     
 ******************************************************************************/

/* Device header file */
#if defined(__XC16__)
    #include <xc.h>
#elif defined(__C30__)
    #if defined(__PIC24E__)
    	#include <p24Exxxx.h>
    #elif defined (__PIC24F__)||defined (__PIC24FK__)
	#include <p24Fxxxx.h>
    #elif defined(__PIC24H__)
	#include <p24Hxxxx.h>
    #endif
#endif

#include <stdint.h>         
#include <stdbool.h>

#include "user.h"            
#include "system.h"        
#include "app_host_hid_keyboard.h"
#include "sd/ff.h"
#include "ps2tozxtable.h"
/*******************************************************************************
 * Hardware configuration bits                             
 ******************************************************************************/

// CONFIG4
#pragma config DSWDTPS = DSWDTPS3       // DSWDT Postscale Select (1:128 (132 ms))
#pragma config DSWDTOSC = LPRC          // Deep Sleep Watchdog Timer Oscillator Select (DSWDT uses Low Power RC Oscillator (LPRC))
#pragma config RTCOSC = SOSC            // RTCC Reference Oscillator Select (RTCC uses Secondary Oscillator (SOSC))
#pragma config DSBOREN = OFF            // Deep Sleep BOR Enable bit (BOR disabled in Deep Sleep)
#pragma config DSWDTEN = OFF            // Deep Sleep Watchdog Timer (DSWDT disabled)

// CONFIG3
#pragma config WPFP = WPFP0             // Write Protection Flash Page Segment Boundary (Page 0 (0x0))
#pragma config SOSCSEL = 00             // RA4 pin 12 setup as I/O 
#pragma config WUTSEL = LEG             // Voltage Regulator Wake-up Time Select (Default regulator start-up time used)
#pragma config WPDIS = WPDIS            // Segment Write Protection Disable (Segmented code protection disabled)
#pragma config WPCFG = WPCFGDIS         // Write Protect Configuration Page Select (Last page and Flash Configuration words are unprotected)
#pragma config WPEND = WPENDMEM         // Segment Write Protection End Page Select (Write Protect from WPFP to the last page of memory)

// CONFIG2
#pragma config POSCMOD = NONE              // Primary Oscillator Select (Internal oscillator selected)
#pragma config I2C1SEL = PRI            // I2C1 Pin Select bit (Use default SCL1/SDA1 pins for I2C1 )
#pragma config IOL1WAY = OFF             // IOLOCK One-Way Set Enable (The IOLOCK bit can be set and cleared using the unlock sequence)
#pragma config OSCIOFNC = OFF //ON            // RA3 pin 10 setup as I/O 
#pragma config FCKSM = CSDCMD           // Clock Switching and Fail-Safe Clock Monitor (Sw Disabled, Mon Disabled)
#pragma config FNOSC = FRCPLL               // Initial Oscillator Select (Primary Oscillator with PLL module (XTPLL, HSPLL, ECPLL))
#pragma config PLL96MHZ = ON             // 96MHz PLL Startup Select (96 MHz PLL Startup is enabled automatically on start-up)
#pragma config PLLDIV = DIV2            // USB 96 MHz PLL Prescaler Select (Oscillator input divided by 2 (8 MHz input))
#pragma config IESO = OFF                 // Internal External Switchover (IESO mode (Two-Speed Start-up) disabled)

// CONFIG1
#pragma config WDTPS = PS32768          // Watchdog Timer Postscaler (1:32768)
#pragma config FWPSA = PR128            // WDT Prescaler (Prescaler ratio of 1:128)
#pragma config WINDIS = OFF             // Windowed WDT (Standard Watchdog Timer enabled,(Windowed-mode is disabled))
#pragma config FWDTEN = OFF             // Watchdog Timer (Watchdog Timer is disabled)
#pragma config ICS = PGx1               // Emulator Pin Placement Select bits (Emulator functions are shared with PGEC1/PGED1)
#pragma config GWRP = OFF               // General Segment Write Protect (Writes to program memory are allowed)
#pragma config GCP = OFF                // General Segment Code Protect (Code protection is disabled)
#pragma config JTAGEN = OFF             // JTAG Port Enable (JTAG port is disabled)


static uint8_t replaced = 0; // != 0 when key replacement with shift down
// ALTERA ports data 
volatile static uint8_t outPorts[11] = 
{
    // keyboard
    0x00, // 0 - #FEFE - CS,Z,X,C,V    "11111110"
    0x00, // 1 - #FDFE - A,S,D,F,G     "11111101"  
    0x00, // 2 - #FBFE - Q,W,E,R,T     "11111011"  
    0x00, // 3 - #F7FE - 1,2,3,4,5     "11110111"  
    0x00, // 4 - #EFFE - 0...6     "11101111"
    0x00, // 5 - #DFFE - P...Y     "11011111"  
    0x00, // 6 - #BFFE - Enter...H "10111111"   
    0x00, // 7 - #7FFE - Space...B "01111111"
    // mouse
    0x00, // TAPEIN/OUT, RESET, NMI dsd
          // D0 left btn, D1 right btn, D2 middle btn, D3 reset, D4-D7 wheel 
    0xF5, // #FBDF - mouse X  245
    0xDA  // #FFDF - mouse Y  218
};
volatile static uint8_t needSave = false;
/*******************************************************************************
 * Initialize User Ports/Peripherals/Project here                             
 ******************************************************************************/
/****************************************************************************/
/* Useful Macros */
#define BITS2WORD(sfrBitfield) ( *((unsigned int*) &sfrBitfield) )
// Convert a bitfield to a word (unsigned int).
#define BITS2BYTEL(sfrBitfield) ( ((unsigned char*) &sfrBitfield)[0] )
// Return the low byte (as a unsigned char) of a bitfield.
#define BITS2BYTEH(sfrBitfield) ( ((unsigned char*) &sfrBitfield)[1] )
// Return the high byte (as a unsigned char) of a bitfield.
void hardwareConfig(void)
{
    /*unsigned int pllCounter;
    OSCCONBITS OSCCONbitsCopy;

    // Copy the current Clock Setup
    OSCCONbitsCopy = OSCCONbits;
    // Slow output clock down to 4Mhz
    CLKDIVbits.CPDIV = 3;
    // Enable the PLL ? Note: Fuse bits don?t do this
    CLKDIVbits.PLLEN = 1;
    // Wait for the PLL to stabalise
    for (pllCounter = 0; pllCounter < 600; pllCounter++);

    // Check to see what clock setup is defined ? either internal or external
    #ifdef USE_FRC_CLOCK
    // Setup the uC to use the internal FRCPLL mode
    OSCCONbitsCopy.NOSC = 1;
    OSCCONbitsCopy.OSWEN = 1;
    #else
    // Setup the uC to use the external crystal with the PLL
    OSCCONbitsCopy.NOSC = 3;
    OSCCONbitsCopy.OSWEN = 1;
    #endif

    // Switch over to the new clock setup
    __builtin_write_OSCCONH( BITS2BYTEH( OSCCONbitsCopy ) );
    __builtin_write_OSCCONL( BITS2BYTEL( OSCCONbitsCopy ) );
    // Wait for this transfer to take place
    while (OSCCONbits.COSC != OSCCONbits.NOSC);
    // Setup the DIV bits for the FRC, this values means the config word needs to be: PLLDIV_DIV2
    CLKDIVbits.RCDIV0 = 0;

    // Setup the PLL divider for the correct clock frequency
    if (CLOCK_FREQ == 32000000)
    {
        CLKDIVbits.CPDIV = 0;
    }
    else if (CLOCK_FREQ == 16000000)
    {
        CLKDIVbits.CPDIV = 1;
    }
    else if (CLOCK_FREQ == 8000000)
    {
        CLKDIVbits.CPDIV = 2;
    }
    else if (CLOCK_FREQ == 4000000)
    {
        CLKDIVbits.CPDIV = 3;
    }

    // Check that the PLL is enabled again and locked properly to the new setup
    CLKDIVbits.PLLEN = 1;
    // Note ? don?t want to do this check if we are running in the MPLAB X simulator as it won?t work
    #ifndef __MPLAB_SIM
    while(_LOCK != 1);
    #endif*/

    //OSCCON = 0b01110010; //Enable 16MHz internal oscillator, running from INTOSC
    
    
    /*DOZE<2:0>: CPU Peripheral Clock Ratio Select bits
    111 = 1:128
    110 = 1:64
    101 = 1:32
    100 = 1:16
    011 = 1:8
    010 = 1:4
    001 = 1:2
    000 = 1:1*/
    
    
    /*RCDIV<2:0>: FRC Postscaler Select bits
    111 = 31.25 kHz (divide-by-256)
    110 = 125 kHz (divide-by-64)
    101 = 250 kHz (divide-by-32)
    100 = 500 kHz (divide-by-16)
    011 = 1 MHz (divide-by-8)
    010 = 2 MHz (divide-by-4)
    001 = 4 MHz (divide by 2)
    000 = 8 MHz (divide by 1)*/
   // CLKDIVbits.RCDIV = 000;
    /*CPDIV<1:0>: System Clock Select bits(2)
    11 = 4 MHz (divide-by-8)(3)
    10 = 8 MHz (divide-by-4)(3)
    01 = 16 MHz (divide-by-2)
    00 = 32 MHz (divide-by-1)*/
   // CLKDIVbits.CPDIV = 00;
    
    /*PLLEN: 96 MHz PLL Enable bit(2)
    The 96 MHz PLL must be enabled when the USB or the graphics controller module is enabled; This control bit can be overridden by Configuration bits in some PIC24F devices. Refer to Section 6.6.2 ?96 MHz*/
    
    
    //OSCCON2.PLLRDY
    // NOSC LPFRC; SOSCEN enabled; OSWEN Request Switch; 
    //__builtin_write_OSCCONH((uint8_t) ((0x0603 >> _OSCCON_NOSC_POSITION) & 0x00FF));
    //__builtin_write_OSCCONL((uint8_t) (0x0603 & 0x00FF));
    // Wait for Clock switch to occur
    //while (OSCCONbits.OSWEN != 0);
            
    /* Setup analog functionality and port direction */
    AD1PCFGL= 0x9fff;          //ALL PORTB digital pins
  
    
    //OSCCONbits.P
    // Configure PLL factors
    CLKDIVbits.PLLEN = 0;   
    //PLLFBDbits.PLLDIV = 70;
    CLKDIVbits.RCDIV = 000; // 8MHz
    CLKDIVbits.CPDIV = 00; // 32Mhz
    CLKDIVbits.DOZE = 000;
    // enable pll module
    {
        unsigned int pll_startup_counter = 600;  
        CLKDIVbits.PLLEN = 1;
        while(pll_startup_counter--);
     }
    

    /* Initialize peripherals */
    
    LATB =  0xD00C;
    TRISB = 0b1000000000000000;//  TABLE 4-13: 
    // RB13 as output 
    //
    
    LATA =  0x0011;
    TRISA = 0b00000000; // ????? RA0 - RA7 
    _CN15PUE = 1;
    _CN16PUE = 1;

    PORTA = 0;
    PORTB = 0;
    _LATB9 = 1; // CS to HIGHT - disable SD card
    
    /* UART1 Initialize */
    
    //RPOR1 = 0x0003;		/* U1TX -- RP2 */
    //RPINR18 = 0x1F03;	/* U1RX -- RP3 */

    /* Timer1 register to 16kHz */
    _T1IE = 0;  /* Disable Timer1 interrupt */
    T1CON = 0;              /* Disable Timer */
    T1CONbits.TCS = 0;      /* Instruction cycle clock - using FOSC/2 */
    T1CONbits.TGATE = 0;    /* Disable Gated Timer mode */
    T1CONbits.TCKPS = 0b0; /* Select 1:256 Prescaler */
    T1CONbits.TSYNC = 0;    /* Synchronize external clock input */
    TMR1 = 0;               /* Clear timer register */
    PR1 = 1000; //( CLOCK_FREQ (32MHz / ( 2 * 16000 )) ;
    IPC0bits.T1IP = 0x04;   /* Set Timer1 Interrupt Priority Level */
    IFS0bits.T1IF = 0;      /* Clear Timer1 Interrupt Flag */
    IEC0bits.T1IE = 1;      /* Enable Timer1 interrupt */
    T1CONbits.TON = 1;      /* Start Timer */

    /* CLK OUT pin 24 - RB13 */
    REFOCONbits.ROEN = 1;   // at REFO pin (RB15)
    //REFOCONbits.ROSEL = 0;  // System clock used as the base clock; base clock reflects any clock switching of the device
    //REFOCONbits.ROSSLP = 0; // Reference oscillator continues to run in Sleep
    //REFOCONbits.RODIV = 0;  // div = 1
    
    //FOSC
    //POSCMD
    //OSCCONBITS.
    //OSCIOFNC_ON = 1;
   // _OSCIOFNC = 1; 
    
    
    /* Initialize SPI1 module - See SPI1_Initialize() in mmc.c module  */
    _SPIEN = 0;
    
    // See RPINR20, RPOR6, RPOR7 registers in datasheet
    RPINR20 = 0x1F0F;	/* SCK1 -> 1F pin (31) Assign -  SDI1 -> C pin (RB15 - physical 26 chip pin) */        
    RPOR1 = 0x0800;		/* Assign SCK1OUT -> RB3 physical 7 chip pin */
    //RPOR6 = 0x0800;		/* Assign SCK1OUT -> RP13 physical 24 chip pin */
    RPOR7 = 0x0007;		/* Assign RP15 -> nothing, RP14 -> to SDO1 physical 25 chip pin */
    
    //RPINR20 = 0x1F06;	/* SCK1 -> 1F pin (31) Assign -  SDI1 -> C pin (RB6 - physical 1 chip pin) */        
    //RPOR6 = 0x0000;		/* Assign nothing */
    //RPOR7 = 0x0807;		/* Assign RP15 -> SCK1OUT physical 26 chip pin, RP14 -> to SDO1 physical 25 chip pin */
    //_DI();
    //while(1) {
    //    _LATA0 ^= 1;
    //}
}

/*******************************************************************************
 * SD FAT                                                          
 ******************************************************************************/

bool FatFsInited;
bool FatFsFileOpened;
FATFS FatFs;     
FIL Fil;

void fatInit()
{
    if ( !FatFsInited ) {
        if ( f_mount(&FatFs, "", 1) == FR_OK) {	/* Mount SD Card*/
            FatFsInited = true;            
        }
    }
}

void fatDone()
{
    if ( FatFsInited ) {
        f_mount(0, "", 0);
        FatFsInited = false;
    }
}

void SDInitialize(void)
{
    FatFsInited = false;
    FatFsFileOpened = false;

    /*uint8_t b_flag;
     * 
    f_mount(&Fatfs[0], "", 0);
    b_flag = f_open(&Fil, "TEMPAAA", FA_WRITE | FA_CREATE_ALWAYS);
    f_close( &Fil ); 
    return b_flag;*/
    
    
    //UINT bw;
    //FRESULT r = f_mount(&FatFs, "", 1);
    //if ( r == FR_OK) {	/* Mount SD */
     //   FatFsInited = true;
        //if (f_open(&Fil, "TEMPAAA", FA_WRITE | FA_CREATE_ALWAYS) == FR_OK) {
            
        //}
        
		//if (f_open(&Fil, "hello.txt", FA_OPEN_ALWAYS | FA_READ | FA_WRITE) == FR_OK) {	/* Open or create a file */

		//	if ((Fil.fsize != 0) && (f_lseek(&Fil, Fil.fsize) != FR_OK)) goto endSD;	/* Jump to the end of the file */

		//	f_write(&Fil, "Hello world!\r\n", 14, &bw);	/* Write data to the file */

		//	endSD: f_close(&Fil);								/* Close the file */
		//}
        //f_mount(0, "", 0); // Unmount */
	//}   
    
}

void SDTasks(void)
{
    
}

/*******************************************************************************
 * Tape
 ******************************************************************************/

#define TAPE_OUT_STOP      0
#define TAPE_OUT_LEAD      1
#define TAPE_OUT_SYNCHRO   2
#define TAPE_OUT_DATA      3
#define TAPE_OUT_DATA_END  4
#define TAPE_IN_WAIT       5
#define TAPE_IN_LOAD       6
#define TAPE_IN_SAVE       7
#define TAPE_OUT_ZXSTOP    8 
#define TAPE_OUT_ZXVIEW    9 
#define TAPE_OUT_ZXVIEW_DATA 10 

#define TAPE_FILE_NONE          0
#define TAPE_FILE_DONE          1
#define TAPE_FILE_INITPLAY      2
#define TAPE_FILE_PLAY          3
#define TAPE_FILE_INITRECORD    4
#define TAPE_FILE_RECORD        5
#define TAPE_FILE_ERROR         6


#define TAPE_OUT_PORT PORTBbits.RB7
#define TAPE_OUT_PIN TRISBbits.TRISB7

#define TAPE_LEAD_SIZE 4000

#define TAPE_DATA_SIZE  1024;
#define TAPE_BLOCK_COUNT  4;


///
volatile uint16_t DelayBitTimer;
volatile uint8_t TapeOutVolume; // out bit signal
volatile uint16_t LeadToneCounter; // lead tone time counter
volatile uint8_t TapeOutMode = TAPE_OUT_STOP;
volatile uint8_t TapeFileState = TAPE_FILE_NONE;

volatile uint16_t blockTimer = 0;
volatile uint8_t blockCounter = 0;
volatile uint8_t blockByte = 0;
volatile uint8_t blockIndex = 0;
volatile uint16_t blockOffset = 0;
volatile uint16_t fileOffset = 0;
volatile uint16_t blockSize = 0;
volatile uint8_t blockData[1024];
volatile uint8_t blockState[16];

volatile uint8_t* currentFileName;
volatile uint8_t fileNameLoad[256]; // filename and path for Ctrl + F5 loading
volatile char currentDirectory[256];

//volatile uint8_t fileNameSave[256]; // filename and path for Ctrl + F6 save/load(+shift)

void SaveConfig()
{    
    UINT bw;
    fatInit();
    if (f_open(&Fil, "config.ini", FA_WRITE | FA_CREATE_ALWAYS) == FR_OK) {
        f_write(&Fil, fileNameLoad, 256, &bw);
        f_write(&Fil, fileNameLoad /*fileNameSave*/, 256, &bw);
        f_close(&Fil);								/* Close the file */
    }    
    fatDone();
}

void LoadConfig()
{
    uint16_t readed = 0;
    fatInit();
    FRESULT r = f_open(&Fil, "config.ini", FA_READ | FA_OPEN_EXISTING);
    if (r == FR_OK) {
        f_read(&Fil, fileNameLoad, 256, &readed);
        f_read(&Fil, fileNameLoad /*fileNameSave*/, 256, &readed);
        f_close(&Fil);
    } else if ( r == FR_NO_FILE ) {
        SaveConfig();
    }
    fatDone();
}

UINT min(UINT a, UINT b)
{
    if ( a < b ) return a;
    else return b;
}
void tapeInitialize(void)
{
    fileNameLoad[0] = 0;    
    //strcpy(fileNameLoad /*fileNameSave*/, fileNameSaveTemplate);    
    
    
    LoadConfig();
    
    
    TapeFileState = TAPE_FILE_NONE;
    TapeOutMode = TAPE_OUT_STOP;
    LeadToneCounter = TAPE_LEAD_SIZE;     
}


void tapeTasks(void)
{
    if ( TapeFileState == TAPE_FILE_NONE ) {
        
    } else if ( TapeFileState == TAPE_FILE_ERROR ) {
        TapeFileState = TAPE_FILE_DONE;
        
    } else if ( TapeFileState == TAPE_FILE_DONE ) {
        
        if ( FatFsFileOpened ) {
            f_close(&Fil);
            FatFsFileOpened = false;
        }
        fatDone();        
        
    } else if ( TapeFileState == TAPE_FILE_INITPLAY ) {
        
        
        TAPE_OUT_PIN = 0; // Output mode 5 pin PIC                  
        outPorts[8] &= 254; // port mode out EPM
        needSave = true;
        
        fatInit();
        if ( FatFsInited ) {
            if (f_open(&Fil, currentFileName, FA_READ | FA_OPEN_EXISTING ) == FR_OK) { /* Open or create a file */
                FatFsFileOpened = true;
                fileOffset = 0;
                blockCounter = 0;
                TapeFileState = TAPE_FILE_PLAY;
                TapeOutMode = TAPE_OUT_STOP;
            } else {
                TapeFileState = TAPE_FILE_DONE;
            }
        } else {
            TapeFileState = TAPE_FILE_DONE;  
        }

    } else if ( TapeFileState == TAPE_FILE_INITRECORD ) {
        
        TAPE_OUT_PIN = 1; // Input mode 5 pin PIC
        outPorts[8] |= 1; // port mode in EPM
        needSave = true;
        
        fatInit();
        if ( FatFsInited ) {
            if (f_open(&Fil, currentFileName, FA_OPEN_ALWAYS | FA_READ | FA_WRITE ) == FR_OK) {
                FatFsFileOpened = true;
                fileOffset = 0;
                blockCounter = 0;
                TapeFileState = TAPE_FILE_RECORD;
                TapeOutMode = TAPE_OUT_STOP;
            } else {
                TapeFileState = TAPE_FILE_DONE;
            }
        } else {
            TapeFileState = TAPE_FILE_DONE;
        }
        
    } else if ( TapeFileState == TAPE_FILE_PLAY ) {
        
        if ( TapeOutMode == TAPE_OUT_STOP ) { // init block playing
            
            fileOffset = 0;
            blockOffset = 0;
            UINT readed = 0;
            if ( f_read(&Fil, (void*)&blockSize, 2, &readed) == FR_OK ) {                
                if (readed == 2) {
                    UINT size = min((UINT)blockSize, 256);
                    if ( f_read(&Fil, (void*)&blockData[fileOffset & 1023], size, &readed) == FR_OK ) {
                        fileOffset += readed;

                        TapeOutMode = TAPE_OUT_LEAD;
                        LeadToneCounter = TAPE_LEAD_SIZE;
                        if ( (blockCounter & 1) == 0 ) {
                            DelayBitTimer = 32000; //16000; // 1 sec
                        } else {
                            DelayBitTimer = 32000; //16000; // 1 sec
                        }                        
                        TapeOutVolume = 1;

                    } else {
                        TapeFileState = TAPE_FILE_ERROR;
                    } 
                } else {
                    // NORMAL STOP PLAY;
                    TapeFileState = TAPE_FILE_DONE;
                }
            } else {
                TapeFileState = TAPE_FILE_ERROR;
            }  
            
        } else if ( TapeOutMode == TAPE_OUT_DATA ) {
            
            if ( fileOffset < blockSize && (((fileOffset >> 8) & 3) != ((blockOffset >> 8) & 3)) ) {
               UINT readed = 0; 
               UINT size = min((UINT)blockSize - fileOffset, 256);
               if ( f_read(&Fil, (void*)&blockData[fileOffset & 1023], size, &readed) == FR_OK ) {
                    fileOffset += readed;
               } else {
                    TapeFileState = TAPE_FILE_ERROR;
               }
                
            }
        }
        
    } else if ( TapeFileState == TAPE_FILE_RECORD ) {
        
        if ( TapeOutMode == TAPE_OUT_STOP ) { // init block playing
            
            blockSize = 0;
            fileOffset = 0;
            blockOffset = 0;
            LeadToneCounter = 0;
            DelayBitTimer = 0; //16000; // 1 sec
            blockTimer = 0;
            TapeOutVolume = TAPE_OUT_PORT;
                        
            TapeOutMode = TAPE_IN_WAIT;
            if ( blockCounter > 0 ) {                     
                DelayBitTimer = 100; //16000; // 1 sec
            }
        } else if ( TapeOutMode == TAPE_IN_WAIT ) {
            // lead and synchro
            
        } else if ( TapeOutMode == TAPE_IN_LOAD ) {  
            
            // data 
            if ( blockOffset > 0 && (((fileOffset >> 8) & 3) != ((blockOffset >> 8) & 3)) ) {                
                UINT writed = 0; 
                UINT size = 0;
                if ( fileOffset == 0 ) {                    
                    if (  f_write(&Fil, &blockOffset, 2, &writed ) != FR_OK ) { // Write 2 byte size. In this place not actual size. Must be saved later second time.
                        TapeFileState = TAPE_FILE_ERROR;
                    }
                }
                size = min((UINT)blockOffset - fileOffset, 256); // save data                
                if ( f_write(&Fil, (void*)&blockData[fileOffset & 1023], size, &writed) == FR_OK ) {
                    fileOffset += writed;
                } else {
                    TapeFileState = TAPE_FILE_ERROR;
                }                
            }
            
        } else if ( TapeOutMode == TAPE_IN_SAVE ) {       
                        
            // data 
            if ( blockOffset > 0 ) {
                UINT writed = 0; 
                UINT size = 0;
                
                if ( fileOffset == 0 ) {
                    if (  f_write(&Fil, &blockOffset, 2, &writed ) != FR_OK ) { // Write 2 byte size. In this place not actual size. Must be saved later second time.
                        TapeFileState = TAPE_FILE_ERROR;
                    }
                } else {
                    if ( f_lseek(&Fil, Fil.fsize - fileOffset - 2 ) == FR_OK) {
                        if (  f_write(&Fil, &blockOffset, 2, &writed ) == FR_OK ) { // Write 2 byte size. Actual.
                            if ( f_lseek(&Fil, Fil.fsize ) != FR_OK) {
                                TapeFileState = TAPE_FILE_ERROR;
                            }
                        } else {
                            TapeFileState = TAPE_FILE_ERROR;
                        }
                    } else {
                        TapeFileState = TAPE_FILE_ERROR;
                    }
                }                
                if ( TapeFileState != TAPE_FILE_ERROR ) {
                    size = min((UINT)blockOffset - fileOffset, 256); // save data   
                    while ( size > 0 ) {
                        if ( f_write(&Fil, (void*)&blockData[fileOffset & 1023], size, &writed) == FR_OK ) {
                            fileOffset += writed;
                        } else {
                            TapeFileState = TAPE_FILE_ERROR;
                            break;
                        }   
                        size = min((UINT)blockOffset - fileOffset, 256); // save data  
                    }                    
                }
                if ( blockCounter > 0 ) {
                    TapeFileState = TAPE_FILE_DONE; // TODO: Check how work! Every 2 block stops
                }
                blockCounter++; 
            } 
            TapeOutMode = TAPE_OUT_STOP; 
        }
    }
}

void tapeInterrupt(void)
{        
    /* zxview send data */
    if ( TapeOutMode == TAPE_OUT_ZXVIEW || TapeOutMode == TAPE_OUT_ZXSTOP ) {

        /* Constant */
        TAPE_OUT_PORT = TapeOutVolume;
        
        DelayBitTimer--;
        if ( DelayBitTimer > 0 ) return;
        
        DelayBitTimer = 8; // TODO: ???? 8
        
        TapeOutVolume ^= 1;

    } else if ( TapeOutMode == TAPE_OUT_ZXVIEW_DATA ) {
        
        TAPE_OUT_PORT = TapeOutVolume;
        
        DelayBitTimer--;
        if ( DelayBitTimer > 0 ) return;
        if ( LeadToneCounter > 0) {
            DelayBitTimer = LeadToneCounter;
            LeadToneCounter = 0;
            TapeOutVolume ^= 1;
            return;
        }
        
        if (blockIndex >= 8)
        {
            if (blockOffset >= blockSize)
            {
                DelayBitTimer = 32;
  
                TapeOutMode = TAPE_OUT_ZXSTOP;
                return;
            }
            blockIndex = 0;
            blockByte = blockData[blockOffset & 1023];
            blockOffset++;
        }

        TapeOutVolume ^= 1;
        
        // encode bit 1/0
        if (blockByte & 128) DelayBitTimer = 8; // TODO: ???? 8
        else DelayBitTimer = 4; // TODO: ???? 4
        
        if ( TapeOutVolume == 0 ) {
            blockByte <<= 1;
            blockIndex++;
        }
        
        return;
        
    } else if ( TapeOutMode == TAPE_IN_WAIT ) { 
    
        uint8_t value = TAPE_OUT_PORT;
        
        if ( value == TapeOutVolume ) {
            DelayBitTimer++;
        } else {

            if ( DelayBitTimer > 8 && DelayBitTimer < 12 ) { // Lead
                if ( value == 1 ) {
                    LeadToneCounter++;               
                }
            } else if ( DelayBitTimer > 1 && DelayBitTimer < 5 ) { // Synchro
                if ( value == 1 && LeadToneCounter > 300 ) {
                    blockIndex = 0;
                    blockOffset = 0;
                    blockByte = 0;
                    TapeOutMode = TAPE_IN_LOAD;                    
                }
            }
            TapeOutVolume = TAPE_OUT_PORT;
            DelayBitTimer = 0;
        }
        if ( DelayBitTimer > 16000 ) { // 1 sec
            DelayBitTimer = 0;
            blockTimer++;
            if ( blockTimer > 10 ) { // 10 sec wait if nothing stops
                TapeOutMode = TAPE_OUT_STOP;
                TapeFileState = TAPE_FILE_DONE;
                return;
            }
        }
        return;
    } else if ( TapeOutMode == TAPE_IN_LOAD ) {        
        uint8_t value = TAPE_OUT_PORT;
        if ( value == TapeOutVolume ) {
            DelayBitTimer++;
            if ( DelayBitTimer > 9 ) {
                // stop and save
                TapeOutMode = TAPE_IN_SAVE;
            }
        } else {
            TapeOutVolume = value;
            if ( value == 1 ) {                
                
                blockByte <<= 1;
                blockIndex++;
                
                if ( DelayBitTimer > 5 ) { //&& DelayBitTimer < 10 ) { // One  
                    blockByte |= 1;
                }
                
                if (blockIndex >= 8)
                {
                    blockIndex = 0;
                    blockData[blockOffset & 1023] = blockByte;
                    blockOffset++;
                    blockByte = 0;
                }
            }
            
            DelayBitTimer = 0;
        }        
        return;
    }
    /* player */
    DelayBitTimer--;
    if ( DelayBitTimer > 0) return;        
    
    if (TapeOutMode == TAPE_OUT_STOP)
    {
        TAPE_OUT_PORT = 0;
        return;
    }
    
    TAPE_OUT_PORT = TapeOutVolume;
   
    if ( TapeOutMode == TAPE_OUT_LEAD ) // send pilot ton
    {
       
        DelayBitTimer = 10;        
        if (LeadToneCounter > 0 )
        {
            LeadToneCounter--;
        }
        else
        {
            if ( TapeOutVolume == 0 ) {
                TapeOutMode = TAPE_OUT_SYNCHRO;                
            }
        }        
    } 
    else if ( TapeOutMode == TAPE_OUT_SYNCHRO ) // send synhcro 1
    {        
        DelayBitTimer = 3;
        if ( TapeOutVolume == 0 ) {
            blockIndex = 8;
            blockOffset = 0;
            TapeOutMode = TAPE_OUT_DATA;
        }        
    }
    else if ( TapeOutMode == TAPE_OUT_DATA) // send data
    {   
        if (blockIndex >= 8)
        {
            if (blockOffset >= blockSize)
            {                
                TapeOutMode = TAPE_OUT_DATA_END; 
                DelayBitTimer = 32;
                TapeOutVolume ^= 1;
                return;
            }
            blockIndex = 0;
            blockByte = blockData[blockOffset & 1023];
            blockOffset++;
        }

        // encode bit 1/0
        if (blockByte & 128) DelayBitTimer = 8; // 1
        else DelayBitTimer = 4; // 0

        if ( TapeOutVolume == 0 ) {
            blockByte <<= 1;
            blockIndex++;
        }   
    }
    else if ( TapeOutMode == TAPE_OUT_DATA_END) // send data
    { 
        TAPE_OUT_PORT = 0;
        TapeOutMode = TAPE_OUT_STOP;
        blockCounter++;
        return;
    }
    
    TapeOutVolume ^= 1;
}

/*******************************************************************************
 * Keyboard                                                   
 ******************************************************************************/

#define KEYBOARD_STATE_NONE 0
#define KEYBOARD_STATE_CSSS_WAIT 1
#define KEYBOARD_STATE_CSSS_KEY_SEND  2
#define KEYBOARD_STATE_CSSS_END 3
#define KEYBOARD_STATE_DOS_WRITE  4
#define KEYBOARD_STATE_DOS_WRITE_UP  5
#define KEYBOARD_STATE_DOS_START_TAPE_PLAY  6
#define KEYBOARD_STATE_DOS_START_TAPE_RECORD  7
#define KEYBOARD_STATE_DOS_ZXVIEW_PLAY  8
#define KEYBOARD_STATE_DOS_ZXVIEW 9

volatile static uint8_t* keyToWrite = NULL;
volatile static uint8_t delayedKey = 0; // dalayed key code
volatile static uint16_t keyDelay = 0; // delay for auto dalayed key press
volatile static uint8_t shift_ctrl_alt = 0; // when shift , ctrl , alt keys pressed
volatile static uint8_t keyboardState = KEYBOARD_STATE_NONE; // 
volatile static uint8_t keyboardStateNext = KEYBOARD_STATE_NONE; // 



// Set port bit
void updatePort(uint8_t bit_id, uint8_t set)
{
    uint8_t a = (1 << ((bit_id >> 3) & 7));
    if ( set ) outPorts[bit_id & 7] |= a;
    else outPorts[bit_id & 7] &= ~a;
}

// Needed for shift, ctrl, alt and mouse keys
void calculateBitsFromTable(uint8_t* keyCode, uint8_t* keyDown, uint8_t* bits, uint8_t table[], uint8_t count, uint8_t clearIfFound)
{
    uint8_t i;
    for( i = 0; i < count;i++) {
        if ( (*keyCode) == table[i] ) {
            if ( (*keyDown) ) {
                (*bits) |= (1 << i);
            } else {
                (*bits) &= ~(1 << i);
            }
            if ( clearIfFound ) {
                (*keyCode) = 0;
            }
            break;
        }
    }
}

// Update key by key code
void updateKey(uint8_t key, uint8_t down) // true when down
{   
    uint8_t code = 0xFF;
    uint8_t localShift = (((shift_ctrl_alt & IK_SHIFT) > 0) && replaced == 0); // All replaced keys is when shift pressed  
    uint8_t localCtrl = (shift_ctrl_alt & IK_CTRL) > 0;
    code = codeToMatrix[key];
    if ( code != 0xFF ) {
        updatePort(code, down);
        localShift |= ((code & 64) > 0);
        localCtrl |= ((code & 128) > 0);
    }   
    if ( down ) {
        updatePort(0x00, localShift ); // caps shift  
        updatePort(0x0F, localCtrl ); // symbol shift
    }
}

void myDelay()
{
    //uint8_t i;
    //for(i= 0; i < 6; i++) {
        
    //}
}

// Send data to Altera
void sendDataToAltera()
{       
    LATAbits.LATA4 = 1; // STROBE
    LATBbits.LATB2 = 0; // RESTRIG
    myDelay();
    LATBbits.LATB2 = 1; // RESTRIG
    myDelay();
    LATBbits.LATB2 = 0; // RESTRIG    
    myDelay();
    int8_t i, j;
    for(i=0;i<9;i++) {
        LATAbits.LATA4 = 1; //STROBE
        int8_t k = ~outPorts[i];
        for(j = 0; j < 2; j++) {
            LATA = (LATA & 0xF0) | ( k & 0x0F );
            LATAbits.LATA4 = 0; //STROBE 
            k = k >> 4;
            myDelay();
            LATAbits.LATA4 = 1; //STROBE
        }
    }
    LATAbits.LATA0 = 1;
    needSave = false;
}

void writeKeys(const uint8_t* keys, const uint8_t afterWriteState)
{
    keyDelay = 300;
    keyToWrite = keys;
    uint8_t i;
    for(i=0;i<8;i++) {
        outPorts[i] = 0;
    }
    shift_ctrl_alt = 0;
    keyboardState = KEYBOARD_STATE_DOS_WRITE;
    keyboardStateNext = afterWriteState;
}

void processKeyCode(uint8_t keyCode, uint8_t keyDown, uint8_t _shift_ctrl_alt)
{
    // reset  ctrl + alt + delete => RES
    if ( (shift_ctrl_alt & IK_CTRL) > 0 && (shift_ctrl_alt & IK_ALT) > 0 && keyCode == 76 && keyDown  ) {                
        keyboardState = KEYBOARD_STATE_NONE;
        if ( TapeFileState != TAPE_FILE_NONE) {
            tapeInitialize();
        }
        TapeOutMode = TAPE_OUT_STOP;
        outPorts[8] |= 4;
        needSave = true;
        return;
    } else {
        outPorts[8] &= 251;
    }
    
    // ctrl + scroll lock => NMI
    if ( (shift_ctrl_alt & IK_CTRL) > 0 && keyCode == 70 && keyDown ) {  
        outPorts[8] |= 8;     
        needSave = true;
        return;        
    } else {
        outPorts[8] &= 247;
    }
    
    if ( keyboardState != KEYBOARD_STATE_NONE && keyboardState != KEYBOARD_STATE_DOS_ZXVIEW) return;
    
    shift_ctrl_alt = _shift_ctrl_alt;

    calculateBitsFromTable(&keyCode, &keyDown, &shift_ctrl_alt, importantKeys, 6, false);

    if ( keyboardState == KEYBOARD_STATE_NONE && keyDown && (shift_ctrl_alt & IK_CTRL) > 0 ) {
        
        if ( keyCode == 58 ) { // F1
            writeKeys(strVer, KEYBOARD_STATE_NONE);            
        } else if( keyCode == 62 ) { // F5             
            currentFileName = &fileNameLoad[0];
            writeKeys(strLoad, KEYBOARD_STATE_DOS_START_TAPE_PLAY);
        } else if( keyCode == 63 ) { // F6
            currentFileName = &fileNameLoad[0]; //&fileNameSave[0];
            if ( (shift_ctrl_alt & IK_SHIFT) > 0 ) {
                keyboardState = KEYBOARD_STATE_DOS_START_TAPE_PLAY;
            } else {
                keyboardState = KEYBOARD_STATE_DOS_START_TAPE_RECORD;
            }
        } else if( keyCode == 64 ) { // F7
            currentFileName = &fileNameAutoexec[0];
            writeKeys(strLoad, KEYBOARD_STATE_DOS_ZXVIEW_PLAY);          
        }
    }    
    
    if ( keyboardState == KEYBOARD_STATE_DOS_ZXVIEW && keyDown ) {
        dosKeyPressed(keyCode);
    }

    // replace data if shift down for some keys in replaceOnShiftKeyDown table            
    int8_t i;
    for( i = 0; i < 41 ;i+=2) {
        if ( keyCode == replaceOnShiftKeyDown[i] ) {
            if ( (((shift_ctrl_alt & IK_SHIFT) > 0) && replaced == 0) || replaced == keyCode) {
                if ( keyDown ) replaced = keyCode;
                else replaced = 0;
                keyCode = replaceOnShiftKeyDown[i+1];
            } else {
                if ( replaced != 0 ) keyCode = 0; // Ignore this key
            }
            break;
        }
    }

    // Delayed keys ( Del, [, ], {, }, ~ )
    // Those symbols intered by sequence : CS and SS both on ... delay ... key code on ... delay ... CS or SS off.
    for( i = 0; i < 8; i++) {
        if ( keyCode == replaceOnDelayKeyDown[i] ) {
            if ( keyDown ) {
                if ( keyboardState == KEYBOARD_STATE_NONE ) {
                    delayedKey = keyCode;
                    keyDelay = 800; //2600;
                    keyCode = 253; // CS + SS key
                    keyboardState = KEYBOARD_STATE_CSSS_WAIT;
                } else {
                    keyCode = 0;
                }                    
                break;
            } else {
                //updateKey(keyCode, false );
            }
        }
    }

    updateKey(keyCode, keyDown); 
    
    needSave = true;
}

void keyboardInitialize(void)
{
    keyToWrite = NULL;
    keyDelay = 0;
    delayedKey = 0;
    shift_ctrl_alt = 0;
    replaced = 0;
    keyboardState = KEYBOARD_STATE_NONE;
    keyboardStateNext = KEYBOARD_STATE_NONE;
    sendDataToAltera();
    
}

void keyboardInterrupt(void)
{
    if ( keyDelay != 0 ) {
        keyDelay--;
        if ( keyboardState == KEYBOARD_STATE_CSSS_WAIT ) {
            if ( keyDelay == 0 ) {
                keyboardState = KEYBOARD_STATE_CSSS_END;
            } else if ( keyDelay == 400 /*1500*/ ) {
                keyboardState = KEYBOARD_STATE_CSSS_KEY_SEND;            
            }
        }
    }
}


/*******************************************************************************
 * 
 ******************************************************************************/

#define DOS_STATE_WAIT 0 
#define DOS_STATE_VIEW 1


#define DOS_VIEW_MASK_ALL 15
#define DOS_VIEW_MASK_TOP 1
#define DOS_VIEW_MASK_FILES 2
#define DOS_VIEW_MASK_INFO 4
//#define DOS_VIEW_MASK_BOTTOM 8
#define DOS_VIEW_MASK_CURSOR 8

volatile uint8_t dosState = 0;
volatile uint8_t dosViewMask = 0;
volatile uint16_t dosDelay = 0;
volatile int8_t pageSize; // ?????????? ?????? ? ??????? ??????????
volatile int8_t pagePosition; // ??????? ?????? ?????? (????? ???????? ???????? ? 0-?)
#define pageViewSize 15
// ???-?? ?????? ?? ??????
volatile int8_t pageCursorPosition; // ??????? ??????? 
volatile int8_t pageCursorPositionPrev; // ??????? ??????? 

/*******************************************************************************
 * 
 ******************************************************************************/

void keyboardTasks(void)
{
    if ( keyboardState == KEYBOARD_STATE_NONE ) {
        
    } else if ( keyboardState == KEYBOARD_STATE_CSSS_END ) {
        updatePort(0x00, false); // caps shift reset
        keyboardState = KEYBOARD_STATE_NONE;
        needSave = true;
    } else if ( keyboardState == KEYBOARD_STATE_CSSS_KEY_SEND ) {
        updateKey(delayedKey, true );
        delayedKey = 0;
        keyboardState = KEYBOARD_STATE_CSSS_WAIT;
        needSave = true;
    } else if ( keyboardState == KEYBOARD_STATE_DOS_WRITE ) {
        if ( keyDelay == 0 ) {
            if ( keyToWrite == NULL ) {
                keyboardState = keyboardStateNext;                
            } else if ( *keyToWrite == 0 ) {                
                keyboardState = keyboardStateNext;
            } else {                
                updateKey(*keyToWrite, true );
                keyboardState = KEYBOARD_STATE_DOS_WRITE_UP;
                
            }
            needSave = true;
            keyDelay = 600;
        }
    } else if ( keyboardState == KEYBOARD_STATE_DOS_WRITE_UP ) {
        if ( keyDelay == 0 ) {
            uint8_t i;
            for(i=0;i<8;i++) {
                outPorts[i] = 0;
            }
            keyboardState = KEYBOARD_STATE_DOS_WRITE;
            keyToWrite++;               
            needSave = true;
            keyDelay = 600;
        }
    } else if ( keyboardState == KEYBOARD_STATE_DOS_START_TAPE_PLAY ) {
        
        if ( TapeFileState == TAPE_FILE_NONE || TapeFileState == TAPE_FILE_DONE ) {  
            TapeFileState = TAPE_FILE_INITPLAY;
        }
        keyboardState = KEYBOARD_STATE_NONE;
        
    } else if ( keyboardState == KEYBOARD_STATE_DOS_START_TAPE_RECORD ) {
        
        if ( TapeFileState == TAPE_FILE_NONE || TapeFileState == TAPE_FILE_DONE ) {
            TapeFileState = TAPE_FILE_INITRECORD;
        }
        keyboardState = KEYBOARD_STATE_NONE;
        
    } else if ( keyboardState == KEYBOARD_STATE_DOS_ZXVIEW_PLAY ) {
        
        if ( TapeFileState == TAPE_FILE_NONE ) {
            TapeFileState = TAPE_FILE_INITPLAY;
        } else if ( TapeFileState == TAPE_FILE_DONE ) {            
            keyboardState = KEYBOARD_STATE_DOS_ZXVIEW;
            TapeOutVolume = 0;
            DelayBitTimer = 8;
            TapeOutMode = TAPE_OUT_ZXSTOP;    
            dosState = DOS_STATE_VIEW;
            dosViewMask = DOS_VIEW_MASK_ALL;
            dosDelay = 12000;
            TAPE_OUT_PIN = 0; // Output mode 5 pin PIC  
            if ( outPorts[8] & 254 > 0) {
                outPorts[8] &= 254; // port mode out EPM
                sendDataToAltera();
            }
            dosInit();
        } else  if ( TapeFileState == TAPE_FILE_ERROR ) { 
            keyboardState = KEYBOARD_STATE_NONE;
            TapeFileState = TAPE_FILE_NONE;
        }
        
    } else if ( keyboardState == KEYBOARD_STATE_DOS_ZXVIEW ) {
        
        if ( TapeOutMode == TAPE_OUT_ZXSTOP ) {
            // 
            dosTasks();
            
        } else if ( TapeOutMode == TAPE_OUT_ZXVIEW ) {
            
            //
            
        } else if ( TapeOutMode == TAPE_OUT_ZXVIEW_DATA ) {
            
            //
            
        }
        
    }

    if ( needSave) {
        sendDataToAltera();
    }
}

/*******************************************************************************
 *                                                    
 ******************************************************************************/

void dosSendBegin()
{
    if ( TapeOutMode == TAPE_OUT_ZXSTOP ) {
        blockIndex = 16;
        blockOffset = 0;
        blockSize = 0;
    }
}

void dosSendEnd()
{
    if ( TapeOutMode == TAPE_OUT_ZXSTOP ) {

        if ( TapeOutVolume == 1) {
            LeadToneCounter = 32;
        } else {
            if ( DelayBitTimer < 32 ) {
                DelayBitTimer = 32 - DelayBitTimer;
            } else {
                DelayBitTimer = 32;
            }
            LeadToneCounter = 0;
        }

        TapeOutMode = TAPE_OUT_ZXVIEW_DATA;
    }
}

void dosSendData(uint8_t* str, uint16_t size)
{
    if ( TapeOutMode == TAPE_OUT_ZXSTOP ) {
        memcpy(blockData+blockSize, str, size);
        blockSize += size;
    }
}

void dosInit()
{
    strcpy(currentDirectory, "/");
    pageCursorPosition = 0;
    pageCursorPositionPrev = -1;
    pageSize = 0;
    pagePosition = 0;
}

void dosKeyPressed(int key)
{       
    if ( TapeOutMode == TAPE_OUT_ZXSTOP && dosState == DOS_STATE_WAIT  ) {        
        if ( key == 40 ) { // Enter
            fatInit();
            readDirectory(false);            
            fatDone();
        } else if ( key == 75 ) { // Page Up
            if ( pagePosition - pageViewSize >= 0 ) {
                pagePosition -= pageViewSize;
                pageCursorPosition -= pageViewSize;                
                if ( pageCursorPosition < 0 )pageCursorPosition = 0;
                dosState = DOS_STATE_VIEW;
                dosViewMask |= DOS_VIEW_MASK_FILES;
                dosViewMask |= DOS_VIEW_MASK_CURSOR;
            }
        } else if ( key == 78 ) { // Page Down
            if ( pagePosition + pageViewSize < pageSize ) {
                pagePosition += pageViewSize;
                pageCursorPosition += pageViewSize;
                if ( pageCursorPosition >= pageSize )pageCursorPosition = pageSize - 1;
                dosState = DOS_STATE_VIEW;
                dosViewMask |= DOS_VIEW_MASK_FILES;
                dosViewMask |= DOS_VIEW_MASK_CURSOR;
            }
        } else if ( key == 82 ) { // Up
            if ( pageCursorPosition > 0) {
                pageCursorPosition--;
                if ( pageCursorPosition >= pagePosition ) {
                    dosState = DOS_STATE_VIEW;
                    dosViewMask |= DOS_VIEW_MASK_CURSOR;
                } else {
                    // next page                
                    if ( pagePosition - pageViewSize >= 0 ) {
                        pagePosition -= pageViewSize;
                        dosState = DOS_STATE_VIEW;
                        dosViewMask |= DOS_VIEW_MASK_FILES;
                        dosViewMask |= DOS_VIEW_MASK_CURSOR;
                    }

                }
            }
        } else if ( key == 81 ) { // Down
            if ( pageCursorPosition < pageSize - 1 ) {
                pageCursorPosition++;
                if ( pageCursorPosition < pagePosition + pageViewSize ) {
                    dosState = DOS_STATE_VIEW;
                    dosViewMask |= DOS_VIEW_MASK_CURSOR;
                } else {
                    // next page                
                    if ( pagePosition + pageViewSize < pageSize ) {
                        pagePosition += pageViewSize;
                        dosState = DOS_STATE_VIEW;
                        dosViewMask |= DOS_VIEW_MASK_FILES;
                        dosViewMask |= DOS_VIEW_MASK_CURSOR;
                    }                
                }
            }
        } else if ( key == 80 ) { // Left
            pageCursorPosition = pagePosition;
            dosState = DOS_STATE_VIEW;
            dosViewMask |= DOS_VIEW_MASK_CURSOR;
        } else if ( key == 79 ) { // Right
            pageCursorPosition = pagePosition + pageViewSize - 1;
            if ( pageCursorPosition >= pageSize ) pageCursorPosition = pageSize - 1;
            dosState = DOS_STATE_VIEW;
            dosViewMask |= DOS_VIEW_MASK_CURSOR;
        }
    }
}

void dosInterrupt()
{    
    if ( dosDelay > 0 ) dosDelay--;
}
uint8_t posInfo[3] = { 22, 1, 2 };
static char* fnup = "..";

void readDirectory(bool isView)
{
   
    static FILINFO fno;
    FRESULT res;
    DIR dir;
    UINT i;
    UINT j;
    uint8_t pos;
    bool isToRoot = (currentDirectory[0] == '/' && currentDirectory[1] == 0);
    char *fn;
    posInfo[1] = 1;
#if _USE_LFN
    static char fileName[_MAX_LFN + 1];
    fno.lfname = fileName;
    fno.lfsize = sizeof(fileName);
#endif    
    if ( FatFsInited ) {            
        res = f_opendir(&dir, currentDirectory);                       /* Open the directory */
        if (res == FR_OK) {
            i = 0;
            j = 0;
            for (;;) {
                if ( isToRoot ) {
                    res = f_readdir(&dir, &fno);                   /* Read a directory item */
                    if (res != FR_OK || fno.fname[0] == 0) break;  /* Break on error or end of dir */                
                    if (fno.fname[0] == '.' ) continue;                    
#if _USE_LFN
                    fn = *fno.lfname ? fno.lfname : fno.fname;
#else
                    fn = fno.fname;
#endif                     
                } else {
                    fn = fnup;
                }

                if ( isView ) {
                    if ( j >= pagePosition && j < pagePosition + pageViewSize ) {                    
                        posInfo[2] = i + 2;                    
                        dosSendData(&posInfo[0], 3);
                        uint8_t fnlen = strlen(fn);
                        if ( fnlen > 30 ) fnlen = 30;
                        dosSendData(fn, fnlen);
                        i++;
                    }
                } else {
                    if ( pageCursorPosition == j ) {
                        // enter press
                        if ( !isToRoot && pageCursorPosition == 0) {
                            // to up folder
                            char* slashpos = strrchr(currentDirectory, '/');
                            if ( slashpos != NULL) *slashpos = 0;
                            if ( currentDirectory[0] == 0) {
                                currentDirectory[0] = '/';
                                currentDirectory[1] = 0;
                            }
                            dosState = DOS_STATE_VIEW;
                            dosViewMask |= DOS_VIEW_MASK_FILES;
                            dosViewMask |= DOS_VIEW_MASK_CURSOR;    
                        } else if ( fno.fattrib & AM_DIR ) {
                            // into folder                            
                            pos = strlen(currentDirectory);
                            if ( currentDirectory[pos-1] != '/') {
                                currentDirectory[pos] = '/';
                                pos++;
                            }
                            strcpy(&currentDirectory[pos], fno.fname);
                            dosState = DOS_STATE_VIEW;
                            dosViewMask |= DOS_VIEW_MASK_FILES;
                            dosViewMask |= DOS_VIEW_MASK_CURSOR;                            
                            
                        } else {
                            // some file
                            strcpy(fileNameLoad, currentDirectory);
                            pos = strlen(currentDirectory);
                            if ( pos > 1 ) {
                                fileNameLoad[pos] = '/';
                                pos++;
                            }
                            strcpy(&fileNameLoad[pos], fn);
                            SaveConfig();
                            dosState = DOS_STATE_VIEW;
                            dosViewMask |= DOS_VIEW_MASK_INFO;
                        }
                        
                        
                        break;
                    }
                }
                isToRoot = true;
                j++;
            }
            if ( isView ) {
                pageSize = j;
                if ( pageCursorPosition >= pageSize ) pageCursorPosition = pageSize - 1;
            }
            f_closedir(&dir);
        }
    }
   
}

void dosTasks()
{
    
    if ( dosDelay !=  0) return;
    if ( dosState == DOS_STATE_WAIT ) {
        //
        
        
    } else if ( dosState == DOS_STATE_VIEW ) {
        if ( dosState & DOS_VIEW_MASK_ALL > 0 ) {
            dosSendBegin();
            if ( dosViewMask & DOS_VIEW_MASK_TOP ) {
                dosSendData(&strZXStrTop[0], sizeof(strZXStrTop));
                
            }
            if ( dosViewMask & DOS_VIEW_MASK_FILES ) {
                dosSendData(&strZXStrFiles[0], sizeof(strZXStrFiles));
                
                fatInit();
                readDirectory(true);
                fatDone();
            }
            if ( dosViewMask & DOS_VIEW_MASK_INFO ) {
                dosSendData(&strZXStrInfo[0], sizeof(strZXStrInfo));
                dosSendData(&strZXStrInfoLoad[0], sizeof(strZXStrInfoLoad));
                uint8_t p = 0;
                uint8_t l = strlen(fileNameLoad);
                if ( l > 25 ) {
                    p = l - 25;
                    l = 25;
                }
                dosSendData(&fileNameLoad[p], l);
                dosSendData(&strZXStrInfoSave[0], sizeof(strZXStrInfoSave));
                p = 0;
                l = strlen(fileNameLoad); //strlen(fileNameSave);
                if ( l > 25 ) {
                    p = l - 25;
                    l = 25;
                }
                dosSendData(&fileNameLoad[p], 1);//fileNameSave[p], l);
            }
            /*if ( dosViewMask & DOS_VIEW_MASK_BOTTOM ) {
                dosSendData(&strZXStrBottom[0], sizeof(strZXStrBottom));
            }*/
            if ( dosViewMask & DOS_VIEW_MASK_CURSOR ) {
                posInfo[1] = 0;
                if ( pageCursorPositionPrev > 0 ) {
                    posInfo[2] = pageCursorPositionPrev;
                    dosSendData(&posInfo[0], 3);
                    dosSendData(&strZXStrCursorPrev[0], sizeof(strZXStrCursorPrev));
                }
                posInfo[2] = pageCursorPosition - pagePosition + 2;
                dosSendData(&posInfo[0], 3);
                dosSendData(&strZXStrCursor[0], sizeof(strZXStrCursor));
                pageCursorPositionPrev = pageCursorPosition - pagePosition + 2;
            }
            dosViewMask = 0;
            dosState = DOS_STATE_WAIT;
            dosSendEnd();
        }
    }
    //_LATB6 ^= 1;
}


/*******************************************************************************
 *                                                    
 ******************************************************************************/