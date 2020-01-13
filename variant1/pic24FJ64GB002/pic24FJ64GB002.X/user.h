
/*******************************************************************************
 * User Function Prototypes                                             
 ******************************************************************************/


// Processor clock frequency selection
//#define CLOCK_FREQ 32000000ULL // Use 32MHz clock ? default for demo board
#define CLOCK_FREQ 16000000ULL // Use 16MHz clock
//#define CLOCK_FREQ 8000000ULL // Use 8MHz clock
//#define CLOCK_FREQ 4000000ULL // Use 4MHz clock

/* TODO User level functions prototypes (i.e. InitApp) go here */
//#define _XTAL_FREQ  4000000
//#define _LFN_UNICODE 0 // I have no need for unicode.
#define FCY CLOCK_FREQ / 2 
//16000000ULL 

#define USE_FRC_CLOCK 1

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

/*******************************************************************************
 *                                             
 ******************************************************************************/