/*******************************************************************************
 *   
 ******************************************************************************/

#include <stdint.h>        /* Includes uint16_t definition                    */
#include <stdbool.h>       /* Includes true/false definition                  */

#include "user.h"          /* User funct/params, such as InitApp              */

#include <xc.h>
#include "usb_config.h"
#include "system.h"
#include "usb\usb.h"
#include "usb\usb_host.h"
#include "usb\usb_host_hid.h"
#include "app_host_hid_keyboard.h"
 #include "sd/ff.h"

/*********************************************************************
* Function: void SYSTEM_Initialize( SYSTEM_STATE state )
*
* Overview: Initializes the system.
*
* PreCondition: None
*
* Input:  SYSTEM_STATE - the state to initialize the system into
*
* Output: None
*
********************************************************************/

void SYSTEM_Initialize( SYSTEM_STATE state )
{
    //On the PIC24FJ64GB004 Family of USB microcontrollers, the PLL will not power up and be enabled
    //by default, even if a PLL enabled oscillator configuration is selected (such as HS+PLL).
    //This allows the device to power up at a lower initial operating frequency, which can be
    //advantageous when powered from a source which is not gauranteed to be adequate for 32MHz
    //operation.  On these devices, user firmware needs to manually set the CLKDIV<PLLEN> bit to
    //power up the PLL.
    

    switch(state)
    {
        case SYSTEM_STATE_USB_HOST:
            //PRINT_SetConfiguration(PRINT_CONFIGURATION_LCD);

            break;
            
        case SYSTEM_STATE_USB_HOST_HID_KEYBOARD:
            //TODO: LED_Enable(LED_USB_HOST_HID_KEYBOARD_DEVICE_READY);

            //PRINT_SetConfiguration(PRINT_CONFIGURATION_LCD);
            //LCD_CursorEnable(true);

            //TIMER_SetConfiguration(TIMER_CONFIGURATION_1MS);

            break;
    }
}

/*******************************************************************************
 * USB interrupt                                                            
 ******************************************************************************/

void __attribute__((interrupt,auto_psv)) _USB1Interrupt()
{
   USB_HostInterruptHandler();
}

/*******************************************************************************
 * USB handler                                                            
 ******************************************************************************/

bool USB_HOST_APP_EVENT_HANDLER ( uint8_t address, USB_EVENT event, void *data, uint32_t size )
{
    switch( (int)event )
    {
        /* Standard USB host events ******************************************/
        case EVENT_VBUS_REQUEST_POWER:
        case EVENT_VBUS_RELEASE_POWER:
        case EVENT_HUB_ATTACH:
        case EVENT_UNSUPPORTED_DEVICE:
        case EVENT_CANNOT_ENUMERATE:
        case EVENT_CLIENT_INIT_ERROR:
        case EVENT_OUT_OF_MEMORY:
        case EVENT_UNSPECIFIED_ERROR:
            return true;
            break;

        /* HID Class Specific Events ******************************************/
        case EVENT_HID_RPT_DESC_PARSED:
            if(APP_HostHIDKeyboardReportParser() == true)
            {
                return true;
            }
            break;

        default:
            break;
    }

    return false;

}

/*******************************************************************************
 * Timer1 Interrupt                                                            
 ******************************************************************************/

volatile UINT Timer;        /* 16kHz */
volatile BYTE rtcYear = 2013-1980, rtcMon = 1, rtcMday = 23, rtcHour, rtcMin, rtcSec;

void __attribute__((interrupt, auto_psv)) _T1Interrupt (void)
{
    // 
    tapeInterrupt();
    
    keyboardInterrupt();
    
    dosInterrupt();
    
    Timer++;
    
    IFS0bits.T1IF = 0;  /* Clear Timer1 Interrupt Flag */
    
    
            
	/*static const BYTE samurai[12] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	static UINT div1k;
	BYTE n;

	_T1IF = 0;		
			

	if (++div1k >= 1000) {
		div1k = 0;
		if (++rtcSec >= 60) {
			rtcSec = 0;
			if (++rtcMin >= 60) {
				rtcMin = 0;
				if (++rtcHour >= 24) {
					rtcHour = 0;
					n = samurai[rtcMon - 1];
					if ((n == 28) && !(rtcYear & 3)) n++;
					if (++rtcMday > n) {
						rtcMday = 1;
						if (++rtcMon > 12) {
							rtcMon = 1;
							rtcYear++;
						}
					}
				}
			}
		}
	}*/
}

/*******************************************************************************
 *                                                       
 ******************************************************************************/

DWORD get_fattime (void)
{
    DWORD tmr;

    _DI();
  
    tmr =  (((DWORD)rtcYear - 80) << 25)
                | ((DWORD)rtcMon << 21)
                | ((DWORD)rtcMday << 16)
                | (WORD)(rtcHour << 11)
                | (WORD)(rtcMin << 5)
                | (WORD)(rtcSec >> 1);
    _EI();

    return tmr;
}

/*******************************************************************************
 *                                                     
 ******************************************************************************/
