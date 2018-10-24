/*
 * audio.c
 *
 *  Created on: 26.04.2018
 *      Author: net
 */
#include <stdio.h>
#include "xil_printf.h"
#include "xil_printf.h"
#include "math.h"  // do not forget to enable the linker -lm option in C/C++ build settings under
                   // >Project Properties>C/C++ Build Settings>Arm linker>Libraries
                   // see also https://www.xilinx.com/support/answers/52971.html

#include "globals.h"     // user defined global variables and definitions

//------variables for the Audio loop---------------
int samplebuffer[200000]; //audio sample buffer
int ptr = 0;
int cnt = 0;
union samples_struct {
	unsigned regval;
	short val[2];
} sample_in,sample_out,sample_delayed;

extern unsigned *rtc_fifo1;
extern unsigned *rtc_fifo2;
extern int N_DELAY;  // length of audio delay buffer in samples


static audio_state = 0;

void Audio_Process(int mode)
{
	switch (mode) {
	case 1:  if (audio_state == 0) {
		        Config_RtcFifo(0,1, 40000);
	         }
			 Audio_SamplesAverage(10,&audio_state);
	         break;
	case 2:  if (audio_state ==0){
				Config_RtcFifo(0,1, 40000);
     	 	 }
	         Audio_AddEcho(N_DELAY,&audio_state);
	         break;
	case 3:  if (audio_state == 0) {
				Config_RtcFifo(0,1, 40000);
     	 	 }
	         Audio_FIFO_Test1(&audio_state);
	case 4:  // do  not reset audio fifo
		     break;
	default: Config_RtcFifo(0,0, 40000);
	         audio_state = 0;

	         break;
	}
}

void Audio_AddEcho(unsigned delay, int *state)
{
   //---add echo to audio signals-------
   //--save current sample-------
	int fifo_size;
	union samples_struct sample_in;

   Get_RtcFifo_Samples(0,1, &sample_in.regval);

   if (*state==0) {//send sample to load tx fifo
	   Put_RtcFifo_Samples(0,1, &sample_in.regval);
	   Put_RtcFifo_Samples(0,1, &sample_in.regval);
	   Put_RtcFifo_Samples(0,1, &sample_in.regval);
   }
   *state = 2;

   // ---output delayed + current sample to FPGA
   sample_delayed.regval  = samplebuffer[ptr];
   sample_out.val[0]  = sample_in.val[0] + 0.4*sample_delayed.val[0];
   sample_out.val[1]  = sample_in.val[1] + 0.4*sample_delayed.val[1];

   Put_RtcFifo_Samples(0,1, &sample_out.regval);
   Put_RtcFifo_Samples(1,1, &sample_out.regval);
   //---replace delayed sample by current sample
   samplebuffer[ptr] = sample_in.regval;

   //--advance pointer to delay buffer
   ptr++;
   //--reset pointer to delay buffer after N_DELAY samples
    ptr %= delay;
}


void Audio_FIFO_Test1(int *state)
{
   int nsamples = 10;
   int fifosize_rx;
   int fifosize_tx;
   unsigned buffer[1000];
   int threshold;

   if (*state==0)
	   threshold = 2*nsamples;
   else
	   threshold = nsamples;
   fifosize_rx = Get_RtcFifo_RxSize(0);
   if (fifosize_rx  > threshold) {
	   Get_RtcFifo_Samples(0,threshold, buffer);
	   Put_RtcFifo_Samples(0,threshold, buffer);
	   *state=3;
   }

}


void Audio_SamplesAverage(int nsamples,int *state)
{
	union samples_struct buffer[200];
	int i;
	union samples_struct average= {0,0};
    int delta;
    int av[2]= {0,0}; // use int32 to accumulate samples
	int threshold;

	if (nsamples > 200) nsamples = 200; //limit to avoid buffer overflow

    if (*state==0)
	   threshold = 2*nsamples;
    else
	   threshold = nsamples;

	if (Get_RtcFifo_RxSize(0) < threshold)
	return;
    *state = 1;
	Get_RtcFifo_Samples(0,threshold, buffer);

	for (i=0; i < threshold;i++) {
		av[0] += buffer[i].val[0];
		av[1] += buffer[i].val[1];
	}

    average.val[0] = av[0]/threshold;
    average.val[1] = av[1]/threshold;

	for (i=0; i < threshold;i++) {
  	    Put_RtcFifo_Samples(0,1, &average.regval);
	}
}
