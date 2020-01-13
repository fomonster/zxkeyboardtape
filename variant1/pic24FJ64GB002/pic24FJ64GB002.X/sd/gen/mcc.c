/*******************************************************************************
 * SPI module functions. Needed for diskio module. SD Card hardware layer. 
 ******************************************************************************/

#include <xc.h>
#include <p24FJ64GB002.h>
#include "mcc.h"

/**
  Section: Macro Declarations
 */

#define SPI_RX_IN_PROGRESS 0x0

/**
  Section: Module APIs
 */

void SPI1_Initialize(void) 
{
    SPI1STATbits.SPIEN = 0; // Disable SPI module.
    
    SPI1STAT = 0;
    SPI1STATbits.SPIEN = 0; // Disable SPI module.
    SPI1STATbits.SPISIDL = 0; // Continue in idle mode.
    SPI1STATbits.SPIROV = 0; // No overflow.
    SPI1STATbits.SPITBF = 0; // Transmit started, SPIxTXB is empty.
    SPI1STATbits.SPIRBF = 0; // Receive is not complete, SPIxRXB is empty.
    SPI1STATbits.SPIROV = 0;        //0 = No overflow has occurred
    
    SPI1CON1 = 0; //0x013c;
    SPI1CON1bits.DISSCK = 0; // Internal clock enabled.
    SPI1CON1bits.DISSDO = 0; // SD0 controlled by the module.
    SPI1CON1bits.MODE16 = 0; // 8 bit mode.
    SPI1CON1bits.SMP = 0; // Input data sampled at middle of data output time.
    SPI1CON1bits.CKE = 1; // Serial output data changes on transition from idle.
    SPI1CON1bits.SSEN = 0; // Slave select is not used by the module.
    SPI1CON1bits.CKP = 0; // Idle state for clock is low.
    SPI1CON1bits.MSTEN = 1; // Master mode enabled.
    SPI1CON1bits.SPRE = 0b000; // Secondary prescale 8:1
    SPI1CON1bits.PPRE = 0b01; // Primary prescale 16:1.

    //SPI1CON1 = 0x0;//120; // 0x013B
    //SPI1CON1bits.
    //SPI1CON1bits.MSTEN = 1; // 1 = Master mode   
    
	SPI1CON2 = 0x0000;	
	SPI1STATbits.SPIEN = 1; // Enable SPI module.

}

void SPI1_Open(void) 
{
	SPI1STATbits.SPIEN = 0; // Disable SPI module.
    
    SPI1STAT = 0;
    SPI1STATbits.SPIEN = 0; // Disable SPI module.
    SPI1STATbits.SPISIDL = 0; // Continue in idle mode.
    SPI1STATbits.SPIROV = 0; // No overflow.
    SPI1STATbits.SPITBF = 0; // Transmit started, SPIxTXB is empty.
    SPI1STATbits.SPIRBF = 0; // Receive is not complete, SPIxRXB is empty.
    SPI1STATbits.SPIROV = 0;        //0 = No overflow has occurred
    
    SPI1CON1 = 0; //0x013c;
    SPI1CON1bits.DISSCK = 0; // Internal clock enabled.
    SPI1CON1bits.DISSDO = 0; // SD0 controlled by the module.
    SPI1CON1bits.MODE16 = 0; // 8 bit mode.
    SPI1CON1bits.SMP = 0; // Input data sampled at middle of data output time.
    SPI1CON1bits.CKE = 1; // Serial output data changes on transition from idle.
    SPI1CON1bits.SSEN = 0; // Slave select is not used by the module.
    SPI1CON1bits.CKP = 0; // Idle state for clock is low.
    SPI1CON1bits.MSTEN = 1; // Master mode enabled.
    SPI1CON1bits.SPRE = 0b000; // Secondary prescale 8:1
    SPI1CON1bits.PPRE = 0b01; // Primary prescale 16:1.

    //SPI1CON1 = 0x0;//120; // 0x013B
    //SPI1CON1bits.
    //SPI1CON1bits.MSTEN = 1; // 1 = Master mode   
    
	SPI1CON2 = 0x0000;	
	SPI1STATbits.SPIEN = 1; // Enable SPI module.
}

uint8_t SPI1_Exchange8bit(uint8_t data) {
	SPI1BUF = data;
	while (!_SPIRBF) ;
	return (uint8_t)SPI1BUF;
}

uint8_t SPI1_Exchange8bitBuffer(uint8_t *dataIn, uint8_t bufLen, uint8_t *dataOut) {
	uint8_t bytesWritten = 0;

	if (bufLen != 0) {
		if (dataIn != NULL) {
			while (bytesWritten < bufLen) {
				if (dataOut == NULL) {
					SPI1_Exchange8bit(dataIn[bytesWritten]);
				} else {
					dataOut[bytesWritten] = SPI1_Exchange8bit(dataIn[bytesWritten]);
				}

				bytesWritten++;
			}
		} else {
			if (dataOut != NULL) {
				while (bytesWritten < bufLen) {
					dataOut[bytesWritten] = SPI1_Exchange8bit(DUMMY_DATA);

					bytesWritten++;
				}
			}
		}
	}

	return bytesWritten;
}

bool SPI1_IsBufferFull(void) {
	return _SPIRBF;
}

bool SPI1_HasWriteCollisionOccured(void) {
	return false; //TODO: (SSP1CON1bits.WCOL);
}

void SPI1_ClearWriteCollisionStatus(void) {
	//SSP1CON1bits.WCOL = 0;
}

