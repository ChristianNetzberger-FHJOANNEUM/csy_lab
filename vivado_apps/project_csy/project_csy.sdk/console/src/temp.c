/*
 * temp.c
 *
 *  Created on: 24.05.2018
 *      Author: net
 */
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

#define DEBUG 0  // used to enable/disable debug messages on stdout

extern unsigned *rtc_reg;

//---event flags from interrupt handlers-------
extern  int Interrupt_AxiBridge_Flag;
extern  int Interrupt_Rtc0_Flag;
extern  int Interrupt_Rtc1_Flag;
extern  int Interrupt_Core0_Flag;
extern  int Interrupt_Core1_Flag;
extern  int Interrupt_Vesa_Flag;

// event flags from console------------------
extern int Go_Flag;

//--global counters--------------------------
extern unsigned intr_rtc_cnt;
extern unsigned intr_core1_cnt;
extern unsigned intr_vesa_cnt;

extern unsigned axi_cnt;
extern unsigned buzzer_toggle;

//----DMA Buffer for Streaming Devices---------
extern char *DMABUFFER;
extern unsigned short *FRAMEBUFFER;

//---HW profiler register ----------------------
extern unsigned profiler_timestamp[8];

extern unsigned irq1_latency;


void App_InterruptLatency(void);

void App_InterruptLatency(void)
{
	int i,j;
    char cmdString[64];

    xil_printf("Enter APP Interrupt Latency...\n\r");
	//---map pmods 0,1 to FPGA CORE
	MapPMOD(0,1);
	MapPMOD(1,1);

 	InterruptEnable_Core(1,0);  // Intr num 1, int source = 0
 	InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(2);

   	    SetPMOD(3);
        for (i=0; i < 10000; i++)
        	*(rtc_reg) = (short)(sin(i*0x11));
		 ClearPMOD(3);

        //---check Flags from Interrupt Handler-----------------
        if (Interrupt_Core1_Flag){
    		 Interrupt_Core1_Flag = FALSE;
       		 if ((intr_core1_cnt % 100)==0)
         	     // xil_printf("CORE1 interrupt intr_core1_cnt=%d\n\r",intr_core1_cnt);
 			 intr_core1_cnt++;
         	}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
			SetDisplay(irq1_latency,0);
   	        //xil_printf("CORE1  latency = %d cycles\n\r",irq1_latency);

			profiler_timestamp[0] = GetProfiler(0);
			profiler_timestamp[0] = GetProfiler(0);


			}

		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
     }

}


