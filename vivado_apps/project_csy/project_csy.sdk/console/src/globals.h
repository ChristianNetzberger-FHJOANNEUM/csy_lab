/*
 * globals.h
 *
 *  Created on: 10.11.2013
 *      Author: Net
 */
#include "xparameters.h"
#include "ff.h"

#define DEBUG_MODE 0
#define ON 1
#define OFF 0

#ifndef GLOBALS_H_
#define GLOBALS_H_


//--- defines for the MIO pins -----
    //  INFO:  ug585-zynq-7000-TRM.pdf (Zynq-7000 All Programmable SoC Technical Reference Manual)
    //         use Xilinx Documentation Navigator docnav.exe
#define DIRM_0 0x204
#define OEN_0 0x208
#define DATA_0 0x40
#define MIO_0 0x1
#define MIO_1 0x2
#define MIO_2 0x4
#define MIO_3 0x8
#define MIO_4 0x10
#define MIO_5 0x20
#define MIO_6 0x40
#define MIO_7 0x80
#define MIO_8 0x100
#define MIO_9 0x200
#define MIO_10 0x400
#define MIO_11 0x800
#define MIO_12 0x1000
#define MIO_13 0x2000
#define MIO_14 0x4000
#define MIO_15 0x8000


#define DIRM_1 0x244
#define OEN_1 0x248
#define DATA_1 0x44

#define MIO_51 0x80000
#define MIO_47 0x08000
#define XGPIO_BASE 0xE000A000


typedef struct {
	char name[32];
	int type;
	char val_str[32];
	unsigned val_int;
	char *nextptr;
} cmd_struct;


struct bmpHdr_struct {
	short unsigned empty;
	short unsigned bfType;
	unsigned bfSize;
	unsigned bfReserved;
	unsigned bfOffBits;
	unsigned biSize;
	int biWidth;
	int biHeight;
	short unsigned biPlanes;
	short unsigned biBitCount;
	unsigned biCompression;
	unsigned biSizeImage;
	int biXPelsPerMeter;
	int biYPelsPerMeter;
	unsigned biClrUsed;
	unsigned biClrImportant;
}*bmpHdr;

struct fileStream_struct {
	int type;  // read/write
	int size;
	int ticker;
	int position;
	int channel;
	int kill;
	int state;
	int rate;
    int ID;
    FIL fileID;
};




#endif /* GLOBALS_H_ */
