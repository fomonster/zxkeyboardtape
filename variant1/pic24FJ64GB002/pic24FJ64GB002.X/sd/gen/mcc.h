
#ifndef MCC_H
#define	MCC_H

#include "../../user.h"          /* User funct/params, such as InitApp              */

#include <xc.h>
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>


#define DUMMY_DATA 0x0

#define SD_CS_SetHigh()	do { _LATB9 = 1; /*__delay_ms(10);*/ } while(0) 
#define SD_CS_SetLow()	do { _LATB9 = 0; /*__delay_ms(10);*/ } while(0) 

void SPI1_Initialize(void);
void SPI1_Open(void);
uint8_t SPI1_Exchange8bit(uint8_t data);
uint8_t SPI1_Exchange8bitBuffer(uint8_t *dataIn, uint8_t bufLen, uint8_t *dataOut);
bool SPI1_IsBufferFull(void);
bool SPI1_HasWriteCollisionOccured(void);
void SPI1_ClearWriteCollisionStatus(void);


#endif
