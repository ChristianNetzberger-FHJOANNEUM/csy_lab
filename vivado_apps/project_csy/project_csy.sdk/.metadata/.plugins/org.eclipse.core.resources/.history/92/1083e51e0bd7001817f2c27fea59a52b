/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/******************************************************************************
 *
 *   Real-Time Computing    FH JOANNEUM Kapfenberg
 *
 *
 *
 *   Bare-Metal Application
 *
 *   May 2018
 *
******************************************************************************/

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xscugic.h"
#include "xgpiops.h"   //needed for the MIO 7 LED
#include "xil_printf.h"
#include "math.h"  // do not forget to enable the linker -lm option in C/C++ build settings under
                   // >Project Properties>C/C++ Build Settings>Arm linker>Libraries
                   // see also https://www.xilinx.com/support/answers/52971.html
#include "ff.h"    // you must add the xilfss generic fat file system library in board support package !!!
#include "xparameters.h"
#include "globals.h"     // user defined global variables and definitions
#include "xil_cache.h"   // needed to disable cache for particular memory regions

//  Addresses for the AXI Bridge in the FPGA  -------------------------------------------
#define XPAR_RTC_BRIDGE_BASEADDR XPAR_AXI_MST_SBUS_BRIDGE_0_BASEADDR

unsigned *rtc_base = XPAR_RTC_BRIDGE_BASEADDR ;
unsigned *rtc_reg  = XPAR_RTC_BRIDGE_BASEADDR + 0x1000*4; // this is a byte address
unsigned *rtc_fifo1 = XPAR_RTC_BRIDGE_BASEADDR + 0x1000*4 + 3*4;
unsigned *rtc_fifo2 = XPAR_RTC_BRIDGE_BASEADDR + 0x1000*4 + 6*4;
unsigned *IRQ_AXIBRIDGE_REG = XPAR_RTC_BRIDGE_BASEADDR + 4*2;
unsigned *IRQ_RTC_REG  = XPAR_RTC_BRIDGE_BASEADDR + 0x1000*4 + 4*2; // dword reg 0x2

//---Hardware Profiler-------------------
unsigned *profiler_reg       = XPAR_RTC_BRIDGE_BASEADDR + 4*0x200;

//---RTC Core--------------------------
unsigned *core_reg      = XPAR_RTC_BRIDGE_BASEADDR + 0x2000*4; // this is a byte address
unsigned *IRQ_CORE_REG  =XPAR_RTC_BRIDGE_BASEADDR + 0x2000*4 + 4*2; // dword reg 0x2
unsigned *IRQ_CORE_LATENCY  = XPAR_RTC_BRIDGE_BASEADDR + 0x2000*4 + 4*3; // dword reg 0x3

//------ Function Prototypes---------------


//---event flags from interrupt handlers-------
int Interrupt_AxiBridge_Flag = FALSE;
int Interrupt_Rtc0_Flag = FALSE;
int Interrupt_Rtc1_Flag = FALSE;
int Interrupt_Core0_Flag = FALSE;
int Interrupt_Core1_Flag = FALSE;
int Interrupt_Vesa_Flag = FALSE;

// event flags from console------------------
int Go_Flag = FALSE;

//--global counters--------------------------
unsigned intr_rtc_cnt = 0;
unsigned intr_core1_cnt = 0;
unsigned intr_vesa_cnt = 0;

unsigned axi_cnt = 0;
unsigned buzzer_toggle = 0;

unsigned irq1_latency = 0;
unsigned irq1_status;

//----DMA Buffer for Streaming Devices---------
char *DMABUFFER = 0x2000000;
extern unsigned short *FRAMEBUFFER;

//---HW profiler register ----------------------
unsigned profiler_timestamp[8];


//----SD Card Utilities------------------------------------------
int SD_Status = -1;  // status must be zero if SD Card is successfully mounted

extern unsigned n_files;
extern struct file_list_struct {
  char fname[16];
}file_list[20];
extern unsigned fileID; // used to select a file from the file list
extern int Bitmap2Buffer(unsigned fileID, char *fname, short unsigned *FrameBuffer);


unsigned APP_ID;
#define  APP_INT_LATENCY 1
#define  APP_STREAM_FROM_SD 2
#define  APP_SD_READ_PERF 3
#define  APP_SD_WRITE_PERF 4
#define  APP_DMA_READ 5
#define  APP_DMA_MUX_SD_READ 6
#define  APP_DMA_MUX_READ 7
#define  APP_DMA_WRITE_READ 8
#define  APP_DMA_SD_WRITE 9
#define  APP_DMA_MUX_SD_WRITE 10
#define  APP_DMA_MUX_SINEWAVE 11
#define  APP_DMA_MATH1 12
#define  APP_IMG_INSERT 13
#define  APP_KT 14


extern void App_InterruptLatency(void);
extern void App_StreamFromSD(unsigned channel0, unsigned rate);
extern void App_SDReadPerf(int fileID, int blocksize, char *fname);
extern void App_SDWritePerf(int fileID, unsigned blocksize, unsigned filesize, char *fname);
extern void App_DMA_Read();
extern void App_DMAMux_SdRead();
extern void App_DMA_MuxRead();
extern void App_DmaWriteRead();
extern void App_DmaSdWrite(unsigned size);
extern void App_DmaMux_SdWrite(unsigned size);
extern void App_DmaMux_Sinewave();
extern void App_Dma_Math1();
extern void App_Img_Insert();
extern void App_KT();

int main()
{
	int Status1,Status2,Status3;

    //---initialize ZYNQ processing system---
    init_platform();

    //---set FPGA registers to defaults
    SetToDefaults(); // peripheral RTC to defaults

    //--enable UART -------
    Status1 = UART_initialize();
    xil_printf("UART init status = %d\n\r",Status1);

    //------- MOUNT THE SD-CARD
    //  read directory and create a list of files in file_list[20]
    //SD_Status = SD_Mount(); //SD status = 0 if mount was successful
/*
    //-------  FrameBuffer Allocation---------
   // VGA_Config_Framebuffer();
   // VGA_Testpattern(0);

    // load Bitmap from SD Card into Framebuffer
    // use fileID (entry number in directory) or filename (in this case, set fileID to -1
    if (SD_Status == 0) {
       fileID = 9; // change to your needs
 //	   Bitmap2Buffer(fileID,file_list[fileID].fname, FRAMEBUFFER);
	   Bitmap2Buffer(-1,"NEPAL.BMP", FRAMEBUFFER); // if file_ID < 0 then use filename
   }
*/
    // do initialization jobs, e.g. enable MIO Led
 	Initialize_RTC();


    //---Welcome Message and Command Prompt------------
	xil_printf("ZYBO KT-RTC System V2.0 successfully launched!\n\r");
    CmdPrompt();

    // Disable L1 & L2 cache for framebuffer addr block
    Xil_SetTlbAttributes(0x01000000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0
    Xil_SetTlbAttributes(0x01100000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0
    Xil_SetTlbAttributes(0x01200000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0

    Xil_SetTlbAttributes(0x01800000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0
    Xil_SetTlbAttributes(0x01900000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0
    Xil_SetTlbAttributes(0x01A00000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0

    // Disable L1 & L2 cache for dmabuffer addr block
    Xil_SetTlbAttributes(0x02000000,0x04de2);           // S=b0 TEX=b100 AP=b11, Domain=b1111, C=b0, B=b0

    //=============================================================================
    //
    //    Dispatch to  Example Main Loops
    //
    //=============================================================================

    /*-------- choose any APP ID ---------
    APP_ID = APP_INT_LATENCY;
    APP_ID = APP_STREAM_FROM_SD;
    APP_ID = APP_SD_READ_PERF;
    APP_ID = APP_SD_WRITE_PERF;
    APP_ID = APP_DMA_READ;
    APP_ID = APP_DMA_MUX_READ;
    APP_ID = APP_DMA_MUX_SD_READ;
    APP_ID = APP_DMA_WRITE_READ;
    APP_ID = APP_DMA_SD_WRITE;
    APP_ID = APP_DMA_MUX_SD_WRITE;
    APP_ID = APP_DMA_MUX_SINEWAVE;
    APP_ID = APP_DMA_MATH1;
--------------------------------------------*/
    APP_ID = APP_INT_LATENCY;
    APP_ID = APP_IMG_INSERT;
    APP_ID = APP_KT;

    //---dispatcher to Single Execution Loop Applications---------
    switch(APP_ID) {
    	case APP_INT_LATENCY: App_InterruptLatency();
    	                  break;
       	case APP_STREAM_FROM_SD: App_StreamFromSD(0,40000); //stream to FIFO1, sample rate 40000
        	              break;
       	case APP_SD_READ_PERF: App_SDReadPerf(-1,0x1000,"SAMP_07.BIN");
        	              break;
       	case APP_SD_WRITE_PERF: App_SDWritePerf(-1,0x10000,100000000,"WRITE.TXT");
        	              break;
       	case APP_DMA_READ: App_DmaRead();
        	              break;
       	case APP_DMA_MUX_READ: App_DmaMuxRead();
        	              break;
       	case APP_DMA_MUX_SD_READ: App_DmaMux_SdRead();
        	              break;
       	case APP_DMA_WRITE_READ: App_DmaWriteRead();
        	              break;
       	case APP_DMA_SD_WRITE: App_DmaSdWrite(10000000);
        	              break;
       	case APP_DMA_MUX_SD_WRITE: App_DmaMux_SdWrite(20000000);
        	              break;
      	case APP_DMA_MUX_SINEWAVE: App_DmaMux_Sinewave();
        	              break;
      	case APP_DMA_MATH1: App_Dma_Math1();
        	              break;
      	case APP_IMG_INSERT: App_Img_Insert();
        	              break;
      	case APP_KT: App_KT();
        	              break;

    }
    cleanup_platform();
    return 0;
}  // ---that's it -- don't worry :-)


