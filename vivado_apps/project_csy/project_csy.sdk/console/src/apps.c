/******************************************************************************
 *
 *   Real-Time Computing    FH JOANNEUM Kapfenberg
 *
 *
 *
 *   Bare-Metal Demonstration Applications
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

#define DEBUG 0  // used to enable/disable debug messages on stdout


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
extern unsigned short *IMAGEBUFFER;

extern unsigned *core_reg;

//---HW profiler register ----------------------
extern unsigned profiler_timestamp[8];

extern unsigned irq1_latency;

double pi = 3.14159265;

struct dma_buf_struct {
	short sig0;
	short sig1;
	short sig2;
	short sig3;
};

struct iqsig_buf_struct {
	short re;
	short im;
};

struct int32_matrix_struct {
	int a;
	int b;
};

struct fileStream_struct  fileStream;
int N_DELAY = 15000;  // length of audio delay buffer in samples

//void App_InterruptLatency(void);
void App_StreamFromSD(unsigned channel0, unsigned rate);
void App_SDReadPerf(int fileID, int blocksize, char *fname);
void App_SDWritePerf(int fileID, unsigned blocksize, unsigned filesize, char *fname);
void App_DMA_Read();
void App_DMAMux_SdRead();
void App_DMA_MuxRead();
void App_DmaWriteRead();
void App_DmaSdWrite(unsigned size);
void App_DmaMux_SdWrite(unsigned size);
void App_DmaMux_Sinewave();
void App_Dma_Math1();
void App_Img_Insert();
void App_KT();

void App_KT()
{
    char cmdString[64];
    int i;
    short unsigned *DMA_RDBUFFER16, *DMA_WRBUFFER16;
    char unsigned *DMA_RDBUFFER8, *DMA_WRBUFFER8;
    int NPIXELS,NBYTES;
    int rdptr,wrptr;
    int state;
    int format = 0;


    //InterruptEnable_AxiBridge(100000000); // set intr. timer: divide core clk by 108000000


    MapPMOD(0,0); // PMOD0 mapped to CPU
    MapPMOD(1,0); // PMOD1 mapped to CPU


    xil_printf("App KT running...\n\r");

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	//TogglePMOD(1);

        //---check Flags from Interrupt Handler-----------------
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
		   }
	    if (CmdConsole(cmdString)){
		   CmdParser(cmdString);
	       }
    }



}


void App_Img_Insert()
{
    char cmdString[64];
    int i;
    short unsigned *DMA_RDBUFFER16, *DMA_WRBUFFER16;
    char unsigned *DMA_RDBUFFER8, *DMA_WRBUFFER8;
    int NPIXELS,NBYTES;
    int rdptr,wrptr;
    int state;
    int format = 0;

    NPIXELS = 640*480;
    NBYTES = 2*NPIXELS;

    DMA_RDBUFFER16 = (short unsigned *) IMAGEBUFFER;
    DMA_WRBUFFER16 = (short unsigned *) IMAGEBUFFER;
    DMA_RDBUFFER8  = (char *) IMAGEBUFFER;
    DMA_WRBUFFER8  = (char *) IMAGEBUFFER;

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000

	DMA_RTC_setup(DMA_RDBUFFER8,DMA_WRBUFFER8,NBYTES); //ringbuffersize in bytes
    DMA_RTC_bypass(ON);   // bypass DMA to rtc_core

    format  =1;
    if (format ==0) { // yuv 4:2:2
        *(core_reg+6) = 0x100; // turn image insertion on and 8bit greyscale format
    //--initialize image buffer
		for (i=0; i < NPIXELS; i++){
			if (i%2)
			  *(DMA_RDBUFFER16+i) = ((i%640) % 256);// + (30 << 8);
			else
			  *(DMA_RDBUFFER16+i) = ((i%640) % 256) + (30 << 8);
		 }
    }
    else if (format == 1) {// ((8-bit greyscale))
        *(core_reg+6) = 0x300; // turn image insertion on and 8bit greyscale format
       //--initialize image buffer
        for (i=0; i < NPIXELS; i++){
        	  *(DMA_RDBUFFER8+i) = ((i%640) % 256);// + (30 << 8);
         }
    }
    else {
        *(core_reg+6) = 0x500; // turn image insertion on and 8bit greyscale format
        for (i=0; i < NPIXELS; i++){
        	  *(DMA_RDBUFFER16+i) = (((i%640)*8) % 4096);// + (30 << 8);
         }

    }

    MapPMOD(0,0); // PMOD0 mapped to CPU
    MapPMOD(1,0); // PMOD1 mapped to CPU

    // ---image insertion-----
	//image left upper corner:  x0/y0
	//image right lower corner: x1/y1
    // core_reg has offset of 0x2000*4 bytes to IP core base address
    *(core_reg+9)    = (100 << 16) + ( 640+100); // x0<<16 +  x1
    *(core_reg+0x0A) = (200 << 16) + ( 480+200); // y0<<16 +  y1

    xil_printf("pic in pic\n\r");

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(1);

        //---check Flags from Interrupt Handler-----------------
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==0) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
	    if (CmdConsole(cmdString)){
		   CmdParser(cmdString);
	       }
    }



}

void App_Dma_Math1()
{
    char cmdString[64];
    int i;
    struct int32_matrix_struct *mat_rd, *mat_wr;
    char *DMA_RDBUFFER, *DMA_WRBUFFER;
    int N_ELEMENTS,NBYTES;
    int rdptr,wrptr;
    int state;

    // number of interleaved matrix elements mat[k].a, mat[k].b of type int32
    N_ELEMENTS = 4096;
    NBYTES = N_ELEMENTS*8;

    DMA_RDBUFFER = DMABUFFER;
    DMA_WRBUFFER = DMABUFFER+NBYTES;

    mat_rd = (struct int32_matrix_struct *)DMA_RDBUFFER;
    mat_wr = (struct int32_matrix_struct *)DMA_WRBUFFER;

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000

	DMA_RTC_setup(DMA_RDBUFFER,DMA_WRBUFFER,NBYTES); //ringbuffersize in bytes
    DMA_RTC_bypass(ON);   // bypass DMA to rtc_core
    DMA_RTC_rd_enable(ON);
    DMA_RTC_wr_enable(ON);
    DMA_RTC_mux_enable(OFF);

    //--initialize matrices a and b
    for (i=0; i < N_ELEMENTS; i++){
    	mat_rd[i].a = i;
       	mat_rd[i].b = 2*i;
    }
    //--initialize the result matrices with dummy data
    for (i=0; i < N_ELEMENTS; i++){
    	mat_wr[i].a = 0;
    	mat_wr[i].b = 0;
    }

    MapPMOD(0,0); // PMOD0 mapped to CPU
    MapPMOD(1,0); // PMOD1 mapped to CPU

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
            state = 1;
			xil_printf("..computing matrices...\n\r");

        }
		if (state == 1){
		    SetPMOD(1);
		    DMA_start(30);
			ClearPMOD(1);
			state = 2;
			}
		// load lower part of ringbuffer
		if (state == 2){
			SetPMOD(2);
            if (DMA_status() == 0) {
				state = 0;
				ClearPMOD(2);
				for (i=0; i < 16; i++)
				  xil_printf("%d ",mat_wr[i].a);
				xil_printf("\n\r");
				for (i=16; i < 32; i++)
				  xil_printf("%d ",mat_wr[i].a);
				xil_printf("\n\r");
               }
			}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
	    if (CmdConsole(cmdString)){
		   CmdParser(cmdString);
	       }
    }



}

// Master Device reads DMA buffer and streams for signals to Audio R+L  and DAC0,1
App_DmaWriteRead()
{
    char cmdString[64];
    int i;
    struct dma_buf_struct *dma_rdbuf, *dma_wrbuf;
    int NSAMPLES,NBYTES,RINGBUFSIZE;
    int rdptr,wrptr;
    int state;

    // every beat of the burst transfer contains on sample for 4 channels of int16 (64 bit)
    NSAMPLES = 4096;
    NBYTES = NSAMPLES*8;
    RINGBUFSIZE = NBYTES/128; // ringbuffer size in numbers of 128-byte bursts

    dma_rdbuf = (struct dma_buf_struct *)DMABUFFER;
    dma_wrbuf = (struct dma_buf_struct *)(DMABUFFER+NBYTES);

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000
    RTC_SwitchPort(4,2); // port 4 output connected to port 2 input
    RTC_SwitchPort(5,3); // port 5 output connected to port 3 input
    RTC_SwitchPort(2,4); // port 2 output connected to port 4 input
    RTC_SwitchPort(3,5); // port 3 output connected to port 5 input

	DMA_RTC_setup(DMABUFFER,DMABUFFER+NBYTES,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(16000000);
    DMA_RTC_samplerate(80000);
    DMA_RTC_rd_enable(ON);
    DMA_RTC_wr_enable(ON);
    DMA_RTC_mux_enable(OFF);

    RTC_audioIN_testpattern(ON,ON);  // turn  Audio IN R and L channel testpattern ON

    for (i=0; i < NSAMPLES; i++){
    	dma_rdbuf[i].sig0 = (short)(25000.0*(sin(2.0*pi*i/512.0)));
    	dma_rdbuf[i].sig1 = (short)(20000.0*(cos(2.0*pi*i/512.0)));
    	dma_rdbuf[i].sig2 = (short)(25000.0*(sin(2.0*pi*i/256.0)));
    	dma_rdbuf[i].sig3 = (short)(20000.0*(cos(2.0*pi*i/256.0)));
    }
    for (i=0; i < NSAMPLES; i++){
    	dma_wrbuf[i].sig0 = (short)(25000.0*(sin(2.0*pi*i/1024.0)));
    	dma_wrbuf[i].sig1 = (short)(20000.0*(cos(2.0*pi*i/1024.0)));
    	dma_wrbuf[i].sig2 = (short)(25000.0*(sin(2.0*pi*i/64.0)));
    	dma_wrbuf[i].sig3 = (short)(20000.0*(cos(2.0*pi*i/64.0)));
    }
    state = 1;

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
        }
            if (state == 1){
               SetPMOD(1);
               rdptr = DMA_GetRdRingbuPtr();
                if (rdptr < RINGBUFSIZE/2) {
                    SetPMOD(2);
                    for (i=NSAMPLES/2; i < NSAMPLES; i++){
                    	dma_rdbuf[i].sig0 = dma_wrbuf[i].sig0;
                    	dma_rdbuf[i].sig1 = dma_wrbuf[i].sig1;
                    	dma_rdbuf[i].sig2 = dma_wrbuf[i].sig2;
                    	dma_rdbuf[i].sig3 = dma_wrbuf[i].sig3;
                    }

            	    ClearPMOD(2);
                state = 2;
                //xil_printf("+");
                }
            }
            // load lower part of ringbuffer
            if (state == 2){
                ClearPMOD(1);
                rdptr = DMA_GetRdRingbuPtr();
                if (rdptr > RINGBUFSIZE/2) {
                    SetPMOD(2);
                    for (i=0; i < NSAMPLES/2; i++){
                    	dma_rdbuf[i].sig0 = dma_wrbuf[i].sig0;
                    	dma_rdbuf[i].sig1 = dma_wrbuf[i].sig1;
                    	dma_rdbuf[i].sig2 = dma_wrbuf[i].sig2;
                    	dma_rdbuf[i].sig3 = dma_wrbuf[i].sig3;
                    }

               	    ClearPMOD(2);
               	    state = 1;
                //    xil_printf("-");
                }
          	}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }


}

void App_DmaSdWrite(unsigned size)
{
    char cmdString[64];
    int i;
    struct dma_buf_struct *dma_rdbuf, *dma_wrbuf;
    int NSAMPLES,NBYTES,RINGBUFSIZE;
    int rdptr,wrptr;
    int state;
    char fname[15];
    FIL fp;
    int result;
    int bytes_written;
    char *DMA_RDBUFFER, *DMA_WRBUFFER;
    unsigned current_size = 0;

    // every beat of the burst transfer contains on sample for 4 channels of int16 (64 bit)
    NSAMPLES = 4096;
    NBYTES = NSAMPLES*8;
    RINGBUFSIZE = NBYTES/128; // ringbuffer size in numbers of 128-byte bursts

    dma_rdbuf = (struct dma_buf_struct *)DMABUFFER;
    dma_wrbuf = (struct dma_buf_struct *)(DMABUFFER+NBYTES);

    DMA_RDBUFFER = DMABUFFER;
    DMA_WRBUFFER = DMABUFFER + NBYTES;

    InterruptEnable_AxiBridge(108000000); // set intr. timer 1o 1 second: divide core clk by 108000000
    RTC_SwitchPort(4,2); // port 4 output connected to port 2 input
    RTC_SwitchPort(5,3); // port 5 output connected to port 3 input
    RTC_SwitchPort(2,4); // port 2 output connected to port 4 input
    RTC_SwitchPort(3,5); // port 3 output connected to port 5 input

	DMA_RTC_setup(DMA_RDBUFFER,DMA_WRBUFFER,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(80000);
    DMA_RTC_mux_enable(OFF);

    RTC_audioIN_testpattern(ON,ON);

    for (i=0; i < NSAMPLES; i++){
    	dma_rdbuf[i].sig0 = (short)(25000.0*(sin(2.0*pi*i/512.0)));
    	dma_rdbuf[i].sig1 = (short)(20000.0*(cos(2.0*pi*i/512.0)));
    	dma_rdbuf[i].sig2 = (short)(25000.0*(sin(2.0*pi*i/256.0)));
    	dma_rdbuf[i].sig3 = (short)(20000.0*(cos(2.0*pi*i/256.0)));
    }
    for (i=0; i < NSAMPLES; i++){
    	dma_wrbuf[i].sig0 = (short)(25000.0*(sin(2.0*pi*i/1024.0)));
    	dma_wrbuf[i].sig1 = (short)(20000.0*(cos(2.0*pi*i/1024.0)));
    	dma_wrbuf[i].sig2 = (short)(25000.0*(sin(2.0*pi*i/64.0)));
    	dma_wrbuf[i].sig3 = (short)(20000.0*(cos(2.0*pi*i/64.0)));
    }
    state = 0;

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
        	strcpy(fname,"DMA_REC.BIN");
        	result = f_open(&fp,fname,FA_CREATE_ALWAYS | FA_WRITE);
        	if (result) xil_printf("Error opening %s\n\r",fname);
        	else {
        		state = 2;
      	        DMA_RTC_rd_enable(ON);
      	        DMA_RTC_wr_enable(ON);
      	        current_size = 0;
      	        xil_printf(".start to record %d bytes in %s\n\r", size,fname);
            	}
          	}
            if (state == 1){
               SetPMOD(1);
               wrptr = DMA_GetWrRingbuPtr();
                if (wrptr < RINGBUFSIZE/2) {
                    SetPMOD(2);
                    for (i=NSAMPLES/2; i < NSAMPLES; i++){
                    	dma_rdbuf[i].sig0 = dma_wrbuf[i].sig0;
                    	dma_rdbuf[i].sig1 = dma_wrbuf[i].sig1;
                    	dma_rdbuf[i].sig2 = dma_wrbuf[i].sig2;
                    	dma_rdbuf[i].sig3 = dma_wrbuf[i].sig3;
                        }
         	        result = f_write(&fp,DMA_WRBUFFER+NBYTES/2,NBYTES/2,&bytes_written);
         	        current_size += NBYTES/2;

            	    ClearPMOD(2);
                state = 2;
                xil_printf("+(%8d)\r",current_size);
                }
            }
            // load lower part of ringbuffer
            if (state == 2){
                ClearPMOD(1);
                wrptr = DMA_GetWrRingbuPtr();
                if (wrptr > RINGBUFSIZE/2) {
                    SetPMOD(2);
                    for (i=0; i < NSAMPLES/2; i++){
                    	dma_rdbuf[i].sig0 = dma_wrbuf[i].sig0;
                    	dma_rdbuf[i].sig1 = dma_wrbuf[i].sig1;
                    	dma_rdbuf[i].sig2 = dma_wrbuf[i].sig2;
                    	dma_rdbuf[i].sig3 = dma_wrbuf[i].sig3;
                        }

         	        result = f_write(&fp,DMA_WRBUFFER,NBYTES/2,&bytes_written);
         	        current_size += NBYTES/2;
              	    ClearPMOD(2);
               	    state = 1;
                   xil_printf("-(%8d)\r",current_size);
                }
            }
			if ((state) && (current_size >= size)) {
      	       DMA_RTC_rd_enable(OFF);
      	       DMA_RTC_wr_enable(OFF);
			   f_close(&fp);
			   state = 0;
			   xil_printf("...close file\n\r");
			}

		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
			wrptr = DMA_GetWrRingbuPtr();
 	//		xil_printf("  %8d ",wrptr);
			ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }



}

void App_DmaMux_SdWrite(unsigned size)
{
    char cmdString[64];
    int i;
    int NSAMPLES,NBYTES,RINGBUFSIZE;
    int rdptr,wrptr;
    int state;
    char fname[15];
    FIL fp;
    int result;
    int bytes_written;
    char *DMA_RDBUFFER, *DMA_WRBUFFER;
    unsigned current_size = 0;
    struct iqsig_buf_struct *rd_iqsig, *wr_iqsig;


    // every beat of the burst transfer contains on sample for 4 channels of int16 (64 bit)
    NSAMPLES = 8192;
    NBYTES = NSAMPLES*4;
    RINGBUFSIZE = NBYTES/128; // ringbuffer size in numbers of 128-byte bursts

    DMA_RDBUFFER = DMABUFFER;
    DMA_WRBUFFER = DMABUFFER + NBYTES;
    rd_iqsig = (struct iqsig_buf_struct *)DMABUFFER;
    wr_iqsig = (struct iqsig_buf_struct *)(DMABUFFER+NBYTES);

    InterruptEnable_AxiBridge(108000000); // set intr. timer 1o 1 second: divide core clk by 108000000
    RTC_SwitchPort(4,2); // port 4 output connected to port 2 input
    RTC_SwitchPort(5,3); // port 5 output connected to port 3 input
    RTC_SwitchPort(2,4); // port 2 output connected to port 4 input
    RTC_SwitchPort(3,5); // port 3 output connected to port 5 input

	DMA_RTC_setup(DMA_RDBUFFER,DMA_WRBUFFER,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(44100);
    DMA_RTC_mux_enable(ON);


    for (i=0; i < NSAMPLES; i++){
   	    rd_iqsig[i].im = (short)(25000.0*(sin(2.0*pi*(2*i)/256.0)));
   	    rd_iqsig[i].re = (short)(25000.0*(cos(2.0*pi*(2*i)/256.0)));
    }

    for (i=0; i < NSAMPLES; i++){
   	    wr_iqsig[i].im = (short)(20000.0*(sin(2.0*pi*(2*i)/128.0)));
   	    wr_iqsig[i].re = (short)(20000.0*(cos(2.0*pi*(2*i)/128.0)));
    }

    state = 0;

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
        	strcpy(fname,"DMA_REC.BIN");
        	result = f_open(&fp,fname,FA_CREATE_ALWAYS | FA_WRITE);
        	if (result) xil_printf("Error opening %s\n\r",fname);
        	else {
        		state = 2;
      	        DMA_RTC_rd_enable(ON);
      	        DMA_RTC_wr_enable(ON);
      	        current_size = 0;
      	        xil_printf(".start to record %d bytes in %s in mux mode\n\r", size,fname);
            	}
          	}
            if (state == 1){
               SetPMOD(1);
               wrptr = DMA_GetWrRingbuPtr();
                if (wrptr < RINGBUFSIZE/2) {
                    SetPMOD(2);
                    for (i=NSAMPLES/2; i < NSAMPLES; i++){
                    	rd_iqsig[i].im  = wr_iqsig[i].im;
                    	rd_iqsig[i].re =  wr_iqsig[i].re;
                        }
         	        result = f_write(&fp,DMA_WRBUFFER+NBYTES/2,NBYTES/2,&bytes_written);
         	        current_size += NBYTES/2;

            	    ClearPMOD(2);
                state = 2;
                xil_printf("+(%8d)\r",current_size);
                }
            }
            // load lower part of ringbuffer
            if (state == 2){
                ClearPMOD(1);
                wrptr = DMA_GetWrRingbuPtr();
                if (wrptr > RINGBUFSIZE/2) {
                    SetPMOD(2);
                    for (i=0; i < NSAMPLES/2; i++){
                    	rd_iqsig[i].im  = wr_iqsig[i].im;
                    	rd_iqsig[i].re =  wr_iqsig[i].re;
                        }

         	        result = f_write(&fp,DMA_WRBUFFER,NBYTES/2,&bytes_written);
         	        current_size += NBYTES/2;
              	    ClearPMOD(2);
               	    state = 1;
                   xil_printf("-(%8d)\r",current_size);
                }
            }
			if ((state) && (current_size >= size)) {
      	       DMA_RTC_rd_enable(OFF);
      	       DMA_RTC_wr_enable(OFF);
			   f_close(&fp);
			   state = 0;
			   xil_printf("...close file\n\r");
			}

		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
			wrptr = DMA_GetWrRingbuPtr();
 	//		xil_printf("  %8d ",wrptr);
			ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }



}

void App_DmaMux_SdRead()
{
    char cmdString[64];
    int i;
    struct iqsig_buf_struct *iqsig;
    int NSAMPLES, NBYTES;
    int RINGBUFSIZE;
    unsigned rdptr;
    char fname[15];
    FIL fp;
    int result;
    int state = 0;
    int bytes_read;

    iqsig = (struct iqsig_buf_struct *)DMABUFFER;

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000
    RTC_SwitchPort(4,2);
    RTC_SwitchPort(5,2);

    NSAMPLES = 8192;
    NBYTES = NSAMPLES*4;
    RINGBUFSIZE = NBYTES/128; // ringbuffer size in numbers of 128-byte bursts
	DMA_RTC_setup(DMABUFFER,DMABUFFER+NBYTES,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(44100);
    DMA_RTC_wr_enable(OFF);
    DMA_RTC_mux_enable(ON);

    for (i=0; i < NSAMPLES; i++){
   	    iqsig[i].im = (short)(25000.0*(sin(2.0*pi*(2*i)/256.0)));
   	    iqsig[i].re = (short)(25000.0*(cos(2.0*pi*(2*i)/256.0)));
    }
    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
        	strcpy(fname,"SAMP_07.BIN");
           	strcpy(fname,"DMA_REC.BIN");
            	result = f_open(&fp,fname,FA_READ);
        	if (result) xil_printf("Error opening %s\n\r",fname);
        	else {
        		state = 2;
        	    result = f_read(&fp,DMABUFFER,NBYTES,&bytes_read); // load complete dma buffer
           	    DMA_RTC_rd_enable(ON);  // start DMA read
            	}
          	}
        // load upper part of ringbuffer
        if (state == 1){
           SetPMOD(1);
           rdptr = DMA_GetRdRingbuPtr();
            if (rdptr < RINGBUFSIZE/2) {
                SetPMOD(2);
        	    result = f_read(&fp,DMABUFFER+NBYTES/2,NBYTES/2,&bytes_read);
        	    ClearPMOD(2);
            state = 2;
            xil_printf("+%d\r",f_tell(&fp));
            }
        }
        // load lower part of ringbuffer
        if (state == 2){
            ClearPMOD(1);
            rdptr = DMA_GetRdRingbuPtr();
            if (rdptr > RINGBUFSIZE/2) {
                SetPMOD(2);
          	    result = f_read(&fp,DMABUFFER,NBYTES/2,&bytes_read);
           	    ClearPMOD(2);
           	    state = 1;
                xil_printf("-%d\r",f_tell(&fp));
            }
            // close dma stream if end of file detected
         if ((state) && (f_eof(&fp))) {
            	xil_printf("\n\r end of file..\n\r");
           	    DMA_RTC_rd_enable(OFF);  // start DMA read
           	    state = 0;
            }
       }

		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }

}

void App_DmaMuxRead()
{
    char cmdString[64];
    int i;
    int NSAMPLES,NBYTES;
    unsigned rdptr;
    struct iqsig_buf_struct *iqsig;

    iqsig = (struct iqsig_buf_struct *)DMABUFFER;

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000
    RTC_SwitchPort(4,2);
    RTC_SwitchPort(5,2);

    NSAMPLES = 8192;
    NBYTES = NSAMPLES*4;

	DMA_RTC_setup(DMABUFFER,DMABUFFER+NBYTES,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(100000);
    DMA_RTC_rd_enable(ON);
    DMA_RTC_wr_enable(OFF);
    DMA_RTC_mux_enable(ON);

    for (i=0; i < NSAMPLES; i++){
   	    iqsig[i].im = (short)(25000.0*(sin(2.0*pi*(2*i)/256.0)));
   	    iqsig[i].re = (short)(25000.0*(cos(2.0*pi*(2*i)/256.0)));
    }
    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
          	}
        rdptr = DMA_GetRdRingbuPtr();

		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
 	        rdptr = DMA_GetRdRingbuPtr();
 	        xil_printf(" %d \n\r", rdptr);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }

}

void App_DmaMux_Sinewave()
{
    char cmdString[64];
    int i;
    struct iqsig_buf_struct *iqsig;
    int NSAMPLES, NBYTES;
    int RINGBUFSIZE;
    unsigned rdptr;
    char fname[15];
    FIL fp;
    int result;
    int state = 0;
    int bytes_read;
    double delta_phi;
    double fcarrier;
    unsigned fsample;

    fsample = 500000;
    fcarrier = 20000;

    delta_phi = 2*pi*fcarrier/(double)fsample;

    iqsig = (struct iqsig_buf_struct *)DMABUFFER;

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000
    RTC_SwitchPort(4,2);
    RTC_SwitchPort(5,2);

    NSAMPLES = 8192;
    NBYTES = NSAMPLES*4;
    RINGBUFSIZE = NBYTES/128; // ringbuffer size in numbers of 128-byte bursts
	DMA_RTC_setup(DMABUFFER,DMABUFFER+NBYTES,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(fsample);
    DMA_RTC_wr_enable(OFF);
    DMA_RTC_mux_enable(ON);

    for (i=0; i < NSAMPLES; i++){
   	    iqsig[i].im = (short)(25000.0*(sin(2.0*pi*(2*i)/256.0)));
   	    iqsig[i].re = (short)(25000.0*(cos(2.0*pi*(2*i)/256.0)));
    }
    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
        	Sinewave_Generate(delta_phi,DMABUFFER,NSAMPLES);
       	    DMA_RTC_rd_enable(ON);  // start DMA read
       	    xil_printf("generate sinewave...\n\r");
       	    state = 2;
          	}
        // load upper part of ringbuffer
        if (state == 1){
           SetPMOD(1);
           rdptr = DMA_GetRdRingbuPtr();
            if (rdptr < RINGBUFSIZE/2) {
                SetPMOD(2);
            	Sinewave_Generate(delta_phi,DMABUFFER+NBYTES/2,NSAMPLES/2);
        	    ClearPMOD(2);
            state = 2;
             xil_printf("+");
            }
        }
        // load lower part of ringbuffer
        else if (state == 2){
            ClearPMOD(1);
            rdptr = DMA_GetRdRingbuPtr();
            if (rdptr > RINGBUFSIZE/2) {
                SetPMOD(3);
            	Sinewave_Generate(delta_phi,DMABUFFER,NSAMPLES/2);
           	    ClearPMOD(3);
           	    state = 1;
                xil_printf("-");
              }
        }

            // close dma stream if end of file detected
            /*
         if ((state) && (f_eof(&fp))) {
            	xil_printf("\n\r end of file..\n\r");
           	    DMA_RTC_rd_enable(OFF);  // start DMA read
           	    state = 0;
            }
            */


		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }

}


void App_DmaRead()
{
    char cmdString[64];
    int i;
    struct dma_buf_struct *dmabuf;
    int NSAMPLES,NBYTES;

    // every beat of the burst transfer contains on sample for 4 channels of int16 (64 bit)
    NSAMPLES = 4096;
    NBYTES = NSAMPLES*8;

    dmabuf = (struct dma_buf_struct *)DMABUFFER;

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000
    RTC_SwitchPort(4,2);
    RTC_SwitchPort(5,2);


	DMA_RTC_setup(DMABUFFER,DMABUFFER+NBYTES,NBYTES); //ringbuffersize in bytes
    DMA_RTC_samplerate(100000);
    DMA_RTC_rd_enable(ON);
    DMA_RTC_wr_enable(OFF);
    DMA_RTC_mux_enable(OFF);

    for (i=0; i < 4096; i++){
   	    dmabuf[i].sig0 = (short)(25000.0*(sin(2.0*pi*i/512.0)));
     	dmabuf[i].sig1 = 200*i;
     	dmabuf[i].sig2 = (short)(25000.0*(sin(2.0*pi*i/256.0)));
     	dmabuf[i].sig3 = 200*(i+1);
    }
    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	Go_Flag = FALSE;
          	}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }

}


void App_SDReadPerf(int fileID, int blocksize, char *fname)
{
    char cmdString[64];

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	//TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	SDReadPerf(fileID,blocksize,fname);
        	Go_Flag = FALSE;
          	}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }

}

void App_SDWritePerf(int fileID, unsigned blocksize, unsigned filesize, char *fname)
{
    char cmdString[64];

    InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	//TogglePMOD(0);

        //---check Flags from Interrupt Handler-----------------
        if (Go_Flag){
        	SDWritePerf(fileID,blocksize,filesize,fname);
        	Go_Flag = FALSE;
          	}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
		   }
		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }

}


void App_StreamFromSD(unsigned channel, unsigned rate)
{
   char cmdString[64];
   int debug_mode = 1;

  InterruptEnable_AxiBridge(108000000); // set intr. timer: divide core clk by 108000000
  fileStream.rate = rate;

	//--- turn both FIFOs on, set sample rate
//	*(rtc_reg+9) = 0x76003214; //connect rtc_fifo1 to Audio Codec
	RTC_SwitchPort(0,4); // Fifo 1 to Audio in
	RTC_SwitchPort(4,0); // Audio out to Fifo1

	Config_RtcFifo(channel,0, rate); // fifo mode = off
//	Config_RtcFifo(1,0, 40000);

   while(1) {
     	TogglePMOD(0);
    	if (fileStream.state){
    	   StreamFile(&fileStream,debug_mode);
    	}

     	SetPMOD(1);
	    if (CmdConsole(cmdString)){
		   CmdParser(cmdString);
	       }
    	ClearPMOD(1);

     	SetPMOD(2);

		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
			SetDisplay(axi_cnt++,0);
 		    }
	   	ClearPMOD(2);
        }
}


void App_Default(void)
{
    int button0_state = 0;
	int i,j;
    char cmdString[64];

    int audiomode;

    int x,y;

    while(1) {

    //--- Main Loop to process EVENT flags raised in interrupt handlers--------------
    while(1) {
     	TogglePMOD(0);
    	if (fileStream.state){
    	   StreamFile(&fileStream);
    	}
        if (GetButtons() & 0x01) {
            if (button0_state == 0) {
                TogglePMOD(0);
             	Xil_DCacheFlush();
                TogglePMOD(0);
            }
        	button0_state = 1;
        }
        else button0_state = 0;


        //---check Flags from Interrupt Handler-----------------
       	if (Interrupt_Vesa_Flag){
    		 Interrupt_Vesa_Flag = FALSE;
       		 if ((intr_vesa_cnt % 60)==0){
        	     if (DEBUG==1) print("VESA\n\r");
       		 }
			 intr_vesa_cnt++;
        	}
       //---check Flags from Interrupt Handler-----------------
       	if (Interrupt_Rtc0_Flag){
    		 Interrupt_Rtc0_Flag = FALSE;
       		 if ((intr_rtc_cnt % 48000)==0){
        	     if (DEBUG==1) print("RTC\n\r");
       		 }
			 intr_rtc_cnt++;
			 audiomode = GetSliders();
			 SetLEDs(audiomode);
			 Audio_Process(audiomode);
			 // ----test write into Framebuffer----
			//	 x = intr_rtc_cnt % 200;
			//	 y = (intr_rtc_cnt / 200) % 800;
			//	 VGA_DrawPixel(100+x,100+y);
        	}
        //---check Flags from Interrupt Handler-----------------
        	if (Interrupt_Core1_Flag){
     		 Interrupt_Core1_Flag = FALSE;
       		 if ((intr_core1_cnt % 100)==0){
         	     if (DEBUG==2) print("CORE1\n\r");
        		 }
 			 intr_core1_cnt++;
         	}
		if (Interrupt_AxiBridge_Flag){
			if (DEBUG==1) print("AXIBridge\n\r");
			Interrupt_AxiBridge_Flag = FALSE;
			SetMIO_LED(2);
	    	SetPMOD(0);
			SetDisplay(axi_cnt++,0);
 	    	ClearPMOD(0);
//              	SetBuzzer(buzzer_toggle,1000+(axi_cnt*100)%2000);
			buzzer_toggle = 1-buzzer_toggle;
//			SetLEDs(3,2);

			profiler_timestamp[0] = GetProfiler(0);
			profiler_timestamp[0] = GetProfiler(0);
			for (i=0; i < 100; i++)
				profiler_timestamp[1] = GetProfiler(1);
			}

		   if (CmdConsole(cmdString)){
			   CmdParser(cmdString);
		   }
    }
}
}


void Sinewave_Generate(double delta_phi,struct iqsig_buf_struct *buffer,int nsamples)
{
	static double phase;
	int i;
    double amplitude = 10000;

	for (i=0; i < nsamples;i++){
		buffer[i].re  = (short) (amplitude*cos(phase));
//		buffer[i].im  = (short) (amplitude*sin(phase));
		phase += delta_phi;
	}
}

