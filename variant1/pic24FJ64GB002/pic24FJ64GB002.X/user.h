
/*******************************************************************************
 * User Function Prototypes                                             
 ******************************************************************************/

/* TODO User level functions prototypes (i.e. InitApp) go here */
#define _XTAL_FREQ  8000000
//#define _LFN_UNICODE 0 // I have no need for unicode.
//#define FCY 16000000UL 

#define _DI()		__asm__ volatile("disi #0x3FFF")
#define _EI()		__asm__ volatile("disi #0")

/*******************************************************************************
 * Global Variable Declaration                                                
 ******************************************************************************/


/*******************************************************************************
 *                                             
 ******************************************************************************/

void hardwareConfig(void);         /* I/O and Peripheral Initialization */
void SDInitialize(void);
void SDTasks(void);
void tapeInitialize(void);
void tapeTasks(void);
void tapeInterrupt(void);
void keyboardInitialize(void);
void keyboardInterrupt(void);
void keyboardTasks(void);
void dosInterrupt(void);
void dosInit(void);
void dosTasks(void);
void processKeyCode(uint8_t, uint8_t, uint8_t);

/*******************************************************************************
 *                                             
 ******************************************************************************/