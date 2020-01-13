/*******************************************************************************
 * 
 * 
 * 
 ******************************************************************************/
#include <stdint.h>
#include <stdbool.h>
#include "system.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "user.h"
#include "app_host_hid_keyboard.h"

/*******************************************************************************
 * Type definitions
 ******************************************************************************/

typedef enum _APP_STATE
{
    DEVICE_NOT_CONNECTED,
    WAITING_FOR_DEVICE,
    DEVICE_CONNECTED, /* Device Enumerated  - Report Descriptor Parsed */
    GET_INPUT_REPORT, /* perform operation on received report */
    INPUT_REPORT_PENDING,
    SEND_OUTPUT_REPORT, /* Not needed in case of mouse */
    OUTPUT_REPORT_PENDING,
    ERROR_REPORTED
} KEYBOARD_STATE;


typedef struct
{
    uint8_t address;
    KEYBOARD_STATE state;
    bool inUse;

    struct
    {
        uint16_t id;
        uint16_t size;
        uint16_t pollRate;
        uint8_t *buffer;

        struct
        {           
            struct
            {
                HID_DATA_DETAILS details;
                HID_USER_DATA_SIZE newData[6];
                HID_USER_DATA_SIZE oldData[6];
            } parsed;
        } normal;

        struct
        {
            struct{
                HID_USER_DATA_SIZE data[8];
                HID_DATA_DETAILS details;
            } parsed;
        } modifier;
    } keys;

    struct
    {
        bool updated;
        
        union
        {
            uint8_t value;
            struct
            {
                uint8_t  numLock       : 1;
                uint8_t  capsLock      : 1;
                uint8_t  scrollLock    : 1;
                uint8_t                : 5;
            } bits;
        } report;
        struct
        {
            HID_DATA_DETAILS details;
        } parsed;
    } leds;
} KEYBOARD;

typedef struct
{
    USB_HID_KEYBOARD_KEYPAD key;
    char unmodified;
    char modified;
} HID_KEY_TRANSLATION_TABLE_ENTRY;

#define MAX_ERROR_COUNTER               (10)

/*******************************************************************************
 * Local Variables
 ******************************************************************************/

static KEYBOARD keyboard;
/*static const HID_KEY_TRANSLATION_TABLE_ENTRY keyTranslationTable[] = 
{
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_A,                                         'a', 'A' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_B,                                         'b', 'B' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_C,                                         'c', 'C' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_D,                                         'd', 'D' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_E,                                         'e', 'E' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_F,                                         'f', 'F' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_G,                                         'g', 'G' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_H,                                         'h', 'H' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_I,                                         'i', 'I' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_J,                                         'j', 'J' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_K,                                         'k', 'K' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_L,                                         'l', 'L' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_M,                                         'm', 'M' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_N,                                         'n', 'N' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_O,                                         'o', 'O' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_P,                                         'p', 'P' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Q,                                         'q', 'Q' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_R,                                         'r', 'R' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_S,                                         's', 'S' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_T,                                         't', 'T' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_U,                                         'u', 'U' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_V,                                         'v', 'V' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_W,                                         'w', 'W' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_X,                                         'x', 'X' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Y,                                         'y', 'Y' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_Z,                                         'z', 'Z' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_1_AND_EXCLAMATION_POINT,                   '1', '!' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_2_AND_AT,                                  '2', '@' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_3_AND_HASH,                                '3', '#' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_4_AND_DOLLAR,                              '4', '$' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_5_AND_PERCENT,                             '5', '%' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_6_AND_CARROT,                              '6', '^' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_7_AND_AMPERSAND,                           '7', '&' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_8_AND_ASTERISK,                            '8', '*' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_9_AND_OPEN_PARENTHESIS,                    '9', '(' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_0_AND_CLOSE_PARENTHESIS,                   '0', ')' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_MINUS_AND_UNDERSCORE,                      '-', '_' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_EQUAL_AND_PLUS,                            '=', '+' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_OPEN_BRACKET_AND_OPEN_CURLY_BRACE,         ']', '}' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CLOSE_BRACKET_AND_CLOSE_CURLY_BRACE,       '[', '{' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_BACK_SLASH_AND_PIPE,                       '\\', '|' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_NON_US_HASH_AND_TILDE,                     '`', '~' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_SEMICOLON_AND_COLON,                       ';', ':' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_APOSTROPHE_AND_QUOTE,                      '\'', '\"' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_GRAVE_ACCENT_AND_TILDE,                    '`', '~' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_COMMA_AND_LESS_THAN,                       ',', '<' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_PERIOD_AND_GREATER_THAN,                   '.', '>' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_FORWARD_SLASH_AND_QUESTION_MARK,           '/', '?' },
    { USB_HID_KEYBOARD_KEYPAD_KEYBOARD_SPACEBAR,                                  ' ', ' ' }
};
*/

static void App_ProcessInputReport(void);



/*******************************************************************************
 *
 ******************************************************************************/
void APP_HostHIDKeyboardInitialize()
{
    keyboard.state = DEVICE_NOT_CONNECTED;
    keyboard.inUse = false;
    keyboard.keys.buffer = NULL;
    keyboard.address = 0;
}

/*******************************************************************************
 *
 ******************************************************************************/
void APP_HostHIDKeyboardTasks()
{
    if(keyboard.state == DEVICE_CONNECTED)
    {
        keyboard.state = GET_INPUT_REPORT;
    }
    
    uint8_t error;
    uint8_t count;
    
    if(keyboard.address == 0)
    {
        keyboard.address = USBHostHIDDeviceDetect();
    }
    else
    {
        if(USBHostHIDDeviceStatus(keyboard.address) == USB_HID_DEVICE_NOT_FOUND)
        {
            keyboard.state = DEVICE_NOT_CONNECTED;
            keyboard.address = 0;
            keyboard.inUse = false;

            if(keyboard.keys.buffer != NULL)
            {
                free(keyboard.keys.buffer);
                keyboard.keys.buffer = NULL;
            }
        }      
    }

    switch(keyboard.state)
    {
        case DEVICE_NOT_CONNECTED:
            memset(&keyboard.keys, 0x00, sizeof(keyboard.keys));
            memset(&keyboard.leds, 0x00, sizeof(keyboard.leds));
            keyboard.state = WAITING_FOR_DEVICE;
            break;
            
        case WAITING_FOR_DEVICE:
            if( (keyboard.address != 0) &&
                (USBHostHIDDeviceStatus(keyboard.address) == USB_HID_NORMAL_RUNNING)
              ) /* True if report descriptor is parsed with no error */
            {
                keyboard.state = DEVICE_CONNECTED;
                //TIMER_RequestTick(&APP_HostHIDTimerHandler, 10);
            }
            break;
            
        case DEVICE_CONNECTED:
            break;

        case GET_INPUT_REPORT:
            if(USBHostHIDRead(
                                keyboard.address,
                                keyboard.keys.id,
                                keyboard.keys.normal.parsed.details.interfaceNum,
                                keyboard.keys.size,
                                keyboard.keys.buffer
                             )
              )
            {
                /* Host may be busy/error -- keep trying */
            }
            else
            {
                keyboard.state = INPUT_REPORT_PENDING;
            }
            break;

        case INPUT_REPORT_PENDING:
            if(USBHostHIDReadIsComplete(keyboard.address, &error, &count))
            {
                if(error || (count == 0))
                {
                    keyboard.state = DEVICE_CONNECTED;
                }
                else
                {
                    keyboard.state = DEVICE_CONNECTED;

                    App_ProcessInputReport();
                    if(keyboard.leds.updated == true)
                    {
                        keyboard.state = SEND_OUTPUT_REPORT;
                    }
                }
            }
            break;

        case SEND_OUTPUT_REPORT: /* Will be done while implementing Keyboard */
            if(USBHostHIDWrite(    
                                keyboard.address,
                                keyboard.leds.parsed.details.reportID,
                                keyboard.leds.parsed.details.interfaceNum,
                                keyboard.leds.parsed.details.reportLength,
                                (uint8_t*)&keyboard.leds.report
                               )
              )
            {
                /* Host may be busy/error -- keep trying */
            }
            else
            {
                keyboard.state = OUTPUT_REPORT_PENDING;
            }
            break;

        case OUTPUT_REPORT_PENDING:
            if(USBHostHIDWriteIsComplete(keyboard.address, &error, &count))
            {
                keyboard.leds.updated = false;
                keyboard.state = DEVICE_CONNECTED;
            }
            break;

        case ERROR_REPORTED:
            break;

        default:
            break;

    }
}

/*******************************************************************************
 *
 ******************************************************************************/
bool APP_HostHIDKeyboardReportParser(void)
{
    uint8_t NumOfReportItem = 0;
    uint8_t i;
    USB_HID_ITEM_LIST* pitemListPtrs;
    USB_HID_DEVICE_RPT_INFO* pDeviceRptinfo;
    HID_REPORTITEM *reportItem;
    HID_USAGEITEM *hidUsageItem;
    uint8_t usageIndex;
    uint8_t reportIndex;
    bool foundLEDIndicator = false;
    bool foundModifierKey = false;
    bool foundNormalKey = false;

    /* The keyboard is already in use. */
    if(keyboard.inUse == true)
    {
        return false;
    }

    pDeviceRptinfo = USBHostHID_GetCurrentReportInfo(); // Get current Report Info pointer
    pitemListPtrs = USBHostHID_GetItemListPointers();   // Get pointer to list of item pointers

    /* Find Report Item Index for Modifier Keys */
    /* Once report Item is located , extract information from data structures provided by the parser */
    NumOfReportItem = pDeviceRptinfo->reportItems;
    for(i=0;i<NumOfReportItem;i++)
    {
        reportItem = &pitemListPtrs->reportItemList[i];
        if((reportItem->reportType==hidReportInput) && (reportItem->dataModes == HIDData_Variable)&&
           (reportItem->globals.usagePage==USB_HID_USAGE_PAGE_KEYBOARD_KEYPAD))
        {
            /* We now know report item points to modifier keys */
            /* Now make sure usage Min & Max are as per application */
            usageIndex = reportItem->firstUsageItem;
            hidUsageItem = &pitemListPtrs->usageItemList[usageIndex];
            if((hidUsageItem->usageMinimum == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL)
                &&(hidUsageItem->usageMaximum == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_GUI)) //else application cannot suuport
            {
               reportIndex = reportItem->globals.reportIndex;
               keyboard.keys.modifier.parsed.details.reportLength = (pitemListPtrs->reportList[reportIndex].inputBits + 7)/8;
               keyboard.keys.modifier.parsed.details.reportID = (uint8_t)reportItem->globals.reportID;
               keyboard.keys.modifier.parsed.details.bitOffset = (uint8_t)reportItem->startBit;
               keyboard.keys.modifier.parsed.details.bitLength = (uint8_t)reportItem->globals.reportsize;
               keyboard.keys.modifier.parsed.details.count=(uint8_t)reportItem->globals.reportCount;
               keyboard.keys.modifier.parsed.details.interfaceNum= USBHostHID_ApiGetCurrentInterfaceNum();
               foundModifierKey = true;
               
              
            }

        }
        else if((reportItem->reportType==hidReportInput) && (reportItem->dataModes == HIDData_Array)&&
           (reportItem->globals.usagePage==USB_HID_USAGE_PAGE_KEYBOARD_KEYPAD))
        {
            /* We now know report item points to modifier keys */
            /* Now make sure usage Min & Max are as per application */
            usageIndex = reportItem->firstUsageItem;
            hidUsageItem = &pitemListPtrs->usageItemList[usageIndex];
            reportIndex = reportItem->globals.reportIndex;
            keyboard.keys.normal.parsed.details.reportLength = (pitemListPtrs->reportList[reportIndex].inputBits + 7)/8;
            keyboard.keys.normal.parsed.details.reportID = (uint8_t)reportItem->globals.reportID;
            keyboard.keys.normal.parsed.details.bitOffset = (uint8_t)reportItem->startBit;
            keyboard.keys.normal.parsed.details.bitLength = (uint8_t)reportItem->globals.reportsize;
            keyboard.keys.normal.parsed.details.count = (uint8_t)reportItem->globals.reportCount;
            keyboard.keys.normal.parsed.details.interfaceNum = USBHostHID_ApiGetCurrentInterfaceNum();
            foundNormalKey = true;
            
           
        }
        else if((reportItem->reportType==hidReportOutput) &&
                (reportItem->globals.usagePage==USB_HID_USAGE_PAGE_LEDS))
        {
            usageIndex = reportItem->firstUsageItem;
            hidUsageItem = &pitemListPtrs->usageItemList[usageIndex];

            reportIndex = reportItem->globals.reportIndex;
            keyboard.leds.parsed.details.reportLength = (pitemListPtrs->reportList[reportIndex].outputBits + 7)/8;
            keyboard.leds.parsed.details.reportID = (uint8_t)reportItem->globals.reportID;
            keyboard.leds.parsed.details.bitOffset = (uint8_t)reportItem->startBit;
            keyboard.leds.parsed.details.bitLength = (uint8_t)reportItem->globals.reportsize;
            keyboard.leds.parsed.details.count = (uint8_t)reportItem->globals.reportCount;
            keyboard.leds.parsed.details.interfaceNum = USBHostHID_ApiGetCurrentInterfaceNum();
            foundLEDIndicator = true;
        }
    }

    if(pDeviceRptinfo->reports == 1)
    {
        keyboard.keys.id = 0;
        keyboard.keys.size = keyboard.keys.normal.parsed.details.reportLength;
        keyboard.keys.buffer = (uint8_t*)malloc(keyboard.keys.size);
        keyboard.keys.pollRate = pDeviceRptinfo->reportPollingRate;

        if( (foundNormalKey == true) &&
            (foundModifierKey == true) &&
            (keyboard.keys.buffer != NULL)
        )
        {
            keyboard.inUse = true;
        }
    }

    return(keyboard.inUse);
}

/*******************************************************************************
 *
 ******************************************************************************/

static uint8_t shift_ctrl_alt = 0;
static uint8_t ctrlShiftAltOld = 0;
static void App_ProcessInputReport(void)
{

    HID_USER_DATA_SIZE keyCode, keyCodeA;
    
    /* process input report received from device */
    USBHostHID_ApiImportData(   keyboard.keys.buffer,
                                keyboard.keys.size,
                                keyboard.keys.modifier.parsed.data,
                                &keyboard.keys.modifier.parsed.details
                            );
    
    USBHostHID_ApiImportData(   keyboard.keys.buffer,
                                keyboard.keys.size,
                                keyboard.keys.normal.parsed.newData,
                                &keyboard.keys.normal.parsed.details
                            );

    // Ctrl, Shift, Alt 
    ctrlShiftAltOld = shift_ctrl_alt;
    shift_ctrl_alt = 0;
    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
        shift_ctrl_alt |= 4;
    }
    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_SHIFT - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
        shift_ctrl_alt |= 1;
    }
    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_ALT - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
        shift_ctrl_alt |= 16;
    }
    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_CONTROL - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
         shift_ctrl_alt |= 8;
    }
    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_SHIFT - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
         shift_ctrl_alt |= 2;
    }
    if(keyboard.keys.modifier.parsed.data[USB_HID_KEYBOARD_KEYPAD_KEYBOARD_RIGHT_ALT - USB_HID_KEYBOARD_KEYPAD_KEYBOARD_LEFT_CONTROL] == 1)
    {
         shift_ctrl_alt |= 32;
    }
    
    bool needSaveOldData = false;
    
    uint8_t i;
    uint8_t j;
    // Check press
    for ( i = 0; i < keyboard.keys.normal.parsed.details.count; i++ )
    {
        keyCode = keyboard.keys.normal.parsed.newData[i];
        if ( keyCode == 0 ) break;
        if ( keyCode >= 1 && keyCode <= 3) {
            return; // bad data, errors etc
        }
        bool isFounded = false;
        for( j = 0; j < keyboard.keys.normal.parsed.details.count; j++ )
        {
            keyCodeA = keyboard.keys.normal.parsed.oldData[j];
            if ( keyCodeA == 0 ) break;
            if ( keyCode == keyCodeA ) {
                isFounded = true;
                break;
            }
        }
        if ( isFounded ) continue;
        needSaveOldData = true;
        processKeyCode((uint8_t)keyCode, true, shift_ctrl_alt);
    }
    
    // Check unpress
    for ( i = 0; i < keyboard.keys.normal.parsed.details.count; i++ )
    {
        keyCode = keyboard.keys.normal.parsed.oldData[i];
        if ( keyCode == 0 ) break;
        bool isFounded = false;
        for( j = 0; j < keyboard.keys.normal.parsed.details.count; j++)
        {
            keyCodeA = keyboard.keys.normal.parsed.newData[j];
            if ( keyCode == keyCodeA ) {
                isFounded = true;
                break;
            }
        }
        if ( isFounded ) continue;
        needSaveOldData = true;
        processKeyCode((uint8_t)keyCode, false, shift_ctrl_alt);
    }
    
    if ( !needSaveOldData && ctrlShiftAltOld != shift_ctrl_alt ) {        
        needSaveOldData = true;
        processKeyCode(0, true, shift_ctrl_alt);
    }
    
    /*uint8_t isPressed = ( keyboard.keys.normal.parsed.newData[i] != 0 );

    uint8_t keyCode = (uint8_t)keyboard.keys.normal.parsed.newData[i];
    if ( keyCode == 0 ) {
        keyCode = keyboard.keys.normal.parsed.oldData[i];
    }

    ///if ( keyCode != 0 ) {
    //    processKeyCode(keyCode, isPressed);
    //}

    if ( isPressed ) {
         isPressedA = true;
        if(keyCode == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CAPS_LOCK)
        {
            keyboard.leds.report.bits.capsLock = 1;
            keyboard.leds.updated = true;
        }
        else if( keyCode == USB_HID_KEYBOARD_KEYPAD_KEYPAD_NUM_LOCK_AND_CLEAR)
        {
            keyboard.leds.report.bits.numLock = 1;
            keyboard.leds.updated = true;
        }

    } else {
        if(keyCode == USB_HID_KEYBOARD_KEYPAD_KEYBOARD_CAPS_LOCK)
        {
            keyboard.leds.report.bits.capsLock = 0;
            keyboard.leds.updated = true;
        }
        else if( keyCode == USB_HID_KEYBOARD_KEYPAD_KEYPAD_NUM_LOCK_AND_CLEAR)
        {
            keyboard.leds.report.bits.numLock = 0;
            keyboard.leds.updated = true;
        }

    }*/

    //keyboard.leds.report.bits.scrollLock = isPressedA;
    //keyboard.leds.updated = true;
    if ( needSaveOldData ) {
        memcpy(keyboard.keys.normal.parsed.oldData, keyboard.keys.normal.parsed.newData, sizeof(keyboard.keys.normal.parsed.newData));
        memset(keyboard.keys.normal.parsed.newData, 0x00, sizeof(keyboard.keys.normal.parsed.newData));
    }
    
}

/*******************************************************************************
 *
 ******************************************************************************/
