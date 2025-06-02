/******************************************************************************/
/* Main Program                                                                */
/******************************************************************************/

#include "user.h"          
#include "system.h"       
#include "usb\usb.h"
#include "usb\usb_host.h"
#include "usb\usb_host_hid.h"
#include "app_host_hid_keyboard.h"
/*******************************************************************************
 *                                                         
 ******************************************************************************/

int16_t main(void)
{
    /* Initialize IO ports and peripherals and oscillator*/    
    hardwareConfig();

    /* Initialize USB host libraryes */
    
    SYSTEM_Initialize(SYSTEM_STATE_USB_HOST);
    
    SYSTEM_Initialize(SYSTEM_STATE_USB_HOST_HID_KEYBOARD);
    
    USBHostInit(0); 
    
    keyboardInitialize();
    
    /* Initialize USB HID Keyboard */
    APP_HostHIDKeyboardInitialize(); 

    /* Initialize SD Card */
    SDInitialize();
    
    /* Initialize Tape */
    tapeInitialize();
    
    //
    while(1)
    {
        USBHostTasks();
        USBHostHIDTasks();         
        APP_HostHIDKeyboardTasks();
        SDTasks();
        tapeTasks();
        keyboardTasks();
    }

}

/*******************************************************************************
 *                                                    
 ******************************************************************************/