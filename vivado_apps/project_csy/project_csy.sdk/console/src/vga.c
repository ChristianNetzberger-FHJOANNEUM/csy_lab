/*
 * vga.c
 *
 *  Created on: 26.04.2018
 *      Author: net
 */

/*******************************************************
 *
 *    Hardware Abstraction Layer for the RTC Peripherals
 *
 ********************************************************/
#include <stdio.h>
#include "xil_printf.h"
#include "xgpiops.h"

#include "xparameters.h"
#include "globals.h"

//---FRAMEBUFFER for VESA Interface------------
unsigned short *FRAMEBUFFER = 0x1000000;
unsigned frame_x = 1280;
unsigned frame_y = 1024;

//---IMAGEBUFFER for Image Insertion------------
unsigned short *IMAGEBUFFER = 0x1800000;
unsigned img_x = 640;
unsigned img_y = 480;

//---Addresses for VESA graphics interface
extern unsigned *vesa_base;
extern unsigned *vesa_reg;

unsigned int *mem;

unsigned short VGA_GetFramebuffer(void)
{
	return(FRAMEBUFFER);
}
/*
VGA_Config_Framebuffer(void)
{
//	mem = *sds_alloc_non_cacheable(1000*sizeof(unsigned int));

	*(vesa_base+5) = FRAMEBUFFER;
	*(vesa_base+7) = 2;  // use internal fifos to trigger xfer
	*(vesa_base+8) = 20480;
	*(vesa_base+6) = 0x10300;  // turn vesa master xfer on

}
*/
void VGA_Testpattern(int pattern)
{
int i,j;

for (i=0; i < frame_x;i++)
	   for (j=0; j < 2*frame_y; j++){
		   if ((j >= frame_y))
				*(FRAMEBUFFER+i+j*frame_x)=0x1F;
		   else if ((i < 32))
				*(FRAMEBUFFER+i+j*frame_x)=0x3E00+i;
		   else
				*(FRAMEBUFFER+i+j*frame_x)=0;

	   }
for (i=0; i < 64;i++)
  *(FRAMEBUFFER+i)= 0xAAAA;
for (i=0; i < 64;i++)
  *(FRAMEBUFFER+i+64)= 0x5555;
for (i=0; i < 64;i++)
  *(FRAMEBUFFER+i+128)= 0xFFFF;
*(FRAMEBUFFER)= 0xBEEF;
*(FRAMEBUFFER+frame_x*frame_y-1)= 0xDEAD;
*(FRAMEBUFFER+frame_x*frame_y)  = 0x4711;

}

void VGA_DrawPixel(int x, int y)
{
	*(FRAMEBUFFER+x+frame_x*y)= 0xFFFF;
}
