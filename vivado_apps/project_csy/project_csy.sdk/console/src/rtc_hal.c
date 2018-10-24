/*
 * peripherals.c
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

//--- shadow registers -------------
static unsigned REG01 = 0;
static unsigned REG02 = 0;
static unsigned REG09 = 0;
static unsigned REG0A = 0;
static unsigned REG0C = 0;
static unsigned REG0D = 0;
static unsigned REG0E = 0;

//---variable declarations for GPIO connected to MIO7, MIO9----
unsigned BaseAddr = 0xE000A000;
unsigned RegOffset = 0x64;
unsigned reg;

//---Addresses for VESA graphics interface
extern unsigned *vesa_base;
extern unsigned *vesa_reg;

//  Addresses for the AXI Bridge in the FPGA  -------------------------------------------
extern unsigned *rtc_base;
extern unsigned *rtc_reg;
extern unsigned *rtc_fifo1;
extern unsigned *rtc_fifo2;

extern unsigned *IRQ_AXIBRIDGE_REG;
extern unsigned *IRQ_VESA_REG;
extern unsigned *IRQ_CORE_REG;
extern unsigned *IRQ_RTC_REG;

//---Hardware Profiler-------------------
extern unsigned *profiler_reg;

//---RTC Core--------------------------
extern unsigned *core_reg;
extern unsigned *IRQ_CORE_REG;

//  Addresses for theRTC System in the FPGA  -------------------------------------------

extern char *DMABUFFER;

//---FRAMEBUFFER for VESA Interface------------
extern unsigned short *FRAMEBUFFER;

//----------------------------------------------------
//  control the ZYBO onboard LED connected to MIO 7
//----------------------------------------------------
//--DMA driver functions---------------
void DMA_RTC_setup(char *DMA_RDBUFFER,char *DMA_WRBUFFER,unsigned ringbufSize);
void DMA_RTC_samplerate(unsigned samplerate);
void DMA_RTC_bypass(unsigned enable);
void DMA_RTC_mux_enable(unsigned enable);
void DMA_RTC_rd_enable(unsigned enable);
void DMA_RTC_wr_enable(unsigned enable);
unsigned DMA_GetRdRingbuPtr(void);
unsigned DMA_GetWrRingbuPtr(void);
void DMA_start(unsigned n_beats);
int DMA_status(void);



void Enable_MIO_LED(void)
{
    //---------------------------------------------------------------------------
    // Configure the LED output  LED is connected to MIO7 on the ZYBO board
    //---------------------------------------------------------------------------
    //  INFO:  ug585-zynq-7000-TRM.pdf (Zynq-7000 All Programmable SoC Technical Reference Manual)
    //         use Xilinx Documentation Navigator docnav.exe
	// -- to enable LED, set the MIO_7 pin to doutput direction----

	//---variable declarations for GPIO connected to MIO7, MIO9----
	// use definitions in "global.h"

	unsigned reg;

	reg=XGpioPs_ReadReg(XGPIO_BASE, DIRM_0);
	reg |= MIO_7;
	XGpioPs_WriteReg(XGPIO_BASE, DIRM_0,reg);

	// --- and enable the MIO_7 pin
	reg=XGpioPs_ReadReg(XGPIO_BASE, OEN_0);
	reg |= MIO_7;
	XGpioPs_WriteReg(XGPIO_BASE, OEN_0,reg);
}

void SetMIO_LED(int val)
{
	unsigned reg;

	reg=XGpioPs_ReadReg(XGPIO_BASE, DATA_0);

	if (val==0)
        XGpioPs_WriteReg(XGPIO_BASE, DATA_0,reg & ~MIO_7);
	else if (val == 1)
        XGpioPs_WriteReg(XGPIO_BASE, DATA_0,reg | MIO_7);
	else if (val == 2)
        XGpioPs_WriteReg(XGPIO_BASE, DATA_0,reg ^ MIO_7);

}


void SetPMODs(unsigned int val)
{
	unsigned tmp;
	REG0C |=  (val << 24);
	*(rtc_reg+0x0C) = REG0C;
}

void TogglePMOD(unsigned int bit)
{
	unsigned tmp;
	REG0C ^= (0x1000000 << bit);
	*(rtc_reg+0x0C) = REG0C;
}

void SetPMOD(unsigned int bit)
{
	unsigned tmp;
	REG0C |= (0x1000000 << bit);
	*(rtc_reg+0x0C) = REG0C;
}

void ClearPMOD(unsigned int bit)
{
	unsigned tmp;
	REG0C &= ~(0x1000000 << bit);
	*(rtc_reg+0x0C) = REG0C;
}

void SetDisplay(int value, int dpoint)
{
	*(rtc_reg+0x0B) = (dpoint << 16) | value;
}

void SetBuzzer(int state, int frequency)
{
	unsigned tmp;
	tmp = *(rtc_reg+0x0C) & 0xFFFE0000;
	*(rtc_reg+0x0C) = tmp | (state << 16) | (frequency & 0xFFFF);
}

void SetLED(int led, int state)
{
	unsigned tmp;
	unsigned mask;
	mask = 1 << (20+(led % 4));
	if (state == 0)
		REG0C = REG0C & ~mask;
	else if (state == 1)
		REG0C = REG0C | mask;
	else
		REG0C = REG0C ^ mask;
	*(rtc_reg+0x0C) = REG0C;
}
void SetLEDs( int value)
{
	unsigned tmp;
	unsigned mask;
	mask = 0xF << 20;
	REG0C =REG0C & ~mask;
	REG0C |= ((value & 0xF)<<20);
	*(rtc_reg+0x0C) = REG0C;
}
unsigned GetButtons(void)
{
   unsigned value;

   value = *(rtc_reg+0x0D) & 0xF;
   return(value);
}

unsigned GetSliders(void)
{
   unsigned value;
   value = (*(rtc_reg+0x0D) >> 4) & 0xF;
   return(value);
}

void GetPMOD_IN(unsigned *value)
{
   *value = (*(rtc_reg+0x0D) >> 8) & 0xFF;
}

//  fifo_mode = 0   fifo is disabled
//  fifo_mode /= 0  fifo is enabled
//  sample_rate     fifo read/write sample rate in Hz

void Config_RtcFifo(int channel,unsigned fifo_mode, unsigned sample_rate)
{
	unsigned tmp;
	unsigned mask,offs;
	if (channel==0) {
		offs=0;
		mask = 1;
	}
	else {
		offs = 3;
		mask = 2;
	}
	//--specify the sample rate
	*(rtc_reg+offs+5) = sample_rate;
	tmp = *(rtc_reg+0x0A);
	//--enable/disable FIFO
	if (fifo_mode)
		*(rtc_reg+0x0A) = tmp | mask;
	else
		*(rtc_reg+0x0A) = tmp & ~mask;
}

unsigned Get_RtcFifo_RxSize(int channel)
{
	unsigned tmp,offs;
	if (channel==0)
		offs = 0;
	else
		offs = 3;
	tmp = (*(rtc_reg+offs+4) >> 16) & 0xFFFF;
	return(tmp);
}

void Set_RtcFifo_RxFullThreshold(unsigned channel,unsigned rx_threshold)
{
	unsigned tmp,offs;
	if (channel==0)
		offs = 0;
	else
		offs = 3;
	tmp = *(rtc_reg+offs+4) & 0xFFFF;
	*(rtc_reg+offs+4) = tmp | (rx_threshold << 16);
	return(tmp);
}

unsigned Get_RtcFifo_TxSize(unsigned channel)
{
	unsigned tmp,offs;
	if (channel==0)
		offs = 0;
	else
		offs = 3;
	tmp = *(rtc_reg+offs+4) & 0xFFFF;
	return(tmp);
}

void Set_RtcFifo_TxEmptyThreshold(unsigned channel,unsigned tx_threshold)
{
	unsigned tmp,offs;
	if (channel==0)
		offs = 0;
	else
		offs = 3;
	tmp = *(rtc_reg+offs+4) & 0xFFFF0000;
	*(rtc_reg+offs+4) = tmp | (tx_threshold & 0xFFFF);
	return(tmp);
}

unsigned Get_RtcFifo_Samples(unsigned channel,unsigned nsamples_requested, unsigned *buffer)
{
	int i;
	unsigned n,offs;
	if (channel==0)
		offs = 0;
	else
		offs = 3;
	for (i=0; i < nsamples_requested; i++)
		*(buffer+i)= *(rtc_reg+offs+0x03);
	return(n);
}

unsigned Put_RtcFifo_Samples(unsigned channel,unsigned nsamples_requested, unsigned *buffer)
{
	int i;
	unsigned n,offs;
	if (channel==0)
		offs = 0;
	else
		offs = 3;
	for (i=0; i < nsamples_requested; i++)
		*(rtc_reg+offs+0x03) = *(buffer+i);
	return(n);
}

void MapPMOD(int pmod_num, int state)
{
	int mask;
	mask = (1 << (pmod_num+8));
	if (state)
		REG0A |= mask;
	else
		REG0A &= ~mask;
	*(rtc_reg+0x0A) = REG0A;

}

Initialize_RTC(void)
{
	int i;

    Enable_MIO_LED();
}

void InterruptEnable_AxiBridge(int period)
{
	//---enable the interrupt in the FPGA (Register 0x02, Bit0 = 1
	 *(rtc_base+3) = period;   // 1 second timer interrupt
	 *IRQ_AXIBRIDGE_REG= 1 + (0xFF<<8); // enable interrupt in axi_sbus_bridge

}

void InterruptEnable_Core(int irq_num,int irq_source)
{
	unsigned tmp;

	tmp = *IRQ_CORE_REG;

	if (irq_num==0) {
		tmp &= 0xFFFFFF00;
		tmp |=  1 ;
		tmp |= (irq_source << 2);
		*IRQ_CORE_REG  = tmp; // Enable interrupt 1 in the rtc core
	}
	else {
		tmp &= 0xFFFF00FF;
		tmp |= ( 1 << 8);
		tmp |= (irq_source << 10);
		*IRQ_CORE_REG  = tmp; // Enable interrupt 1 in the rtc core
	}

}

void SetToDefaults()
{
 *(rtc_base+2)= 0;  // no interrupts on axi bridge
 *(rtc_reg+1) = 0;
 *(rtc_reg+2) = 0;  // no interrupts in zybo rtc
 *(rtc_reg+4) = 0;
 *(rtc_reg+5) = 0;
 *(rtc_reg+7) = 0;
 *(rtc_reg+8) = 0;
 *(rtc_reg+9) = 0x76543210;  // loopback on all switch ports
 *(rtc_reg+0xA) = 0; // fifos disable, map peripherals to CPU
 *(rtc_reg+0xB) = 0; //display to 0
 *(rtc_reg+0xC) = 0;
  REG01 = 0;
  REG02 = 0;
  REG0A = 0;
  REG0C = 0;
  REG0D = 0;
  REG0E = 0;
}
unsigned Get_SystemTime(void)
{
	return(*(rtc_base+1));
}

unsigned DMA_GetRdRingbuPtr(void)
{
	return(*(rtc_base+9));
}

unsigned DMA_GetWrRingbuPtr(void)
{
	return(*(rtc_base+0x0A));
}

void DMA_RTC_bypass(unsigned enable){
	unsigned mask = (1 << 30);
	if (enable)
      REG0E |= mask;
	else
      REG0E &= ~mask;
	*(rtc_reg+0x0E) = REG0E;
}
void DMA_RTC_mux_enable(unsigned enable){
	unsigned mask = (1 << 31);
	if (enable)
      REG0E |= mask;
	else
      REG0E &= ~mask;
	*(rtc_reg+0x0E) = REG0E;
}
void DMA_RTC_rd_enable(unsigned enable){
	unsigned mask = (1 << 29);
	if (enable)
      REG0E |= mask;
	else
      REG0E &= ~mask;
	*(rtc_reg+0x0E) = REG0E;
}
void DMA_RTC_wr_enable(unsigned enable){
	unsigned mask = (1 << 28);
	if (enable)
      REG0E |= mask;
	else
      REG0E &= ~mask;
	*(rtc_reg+0x0E) = REG0E;
}

void DMA_RTC_samplerate(unsigned samplerate){
	double coreclk_f = 108000000.0;
	double fsamp;
	fsamp = (double)samplerate;
	unsigned fcw = (unsigned) (samplerate / coreclk_f*65536.0*65536.0);
	unsigned mask = 0xF0000000;
    REG0E &= mask;
    REG0E |= (fcw & 0x0FFFFFFF);
	*(rtc_reg+0x0E) = REG0E;
}

void DMA_RTC_setup(char *DMA_RDBUFFER,char *DMA_WRBUFFER,unsigned ringbufSize)
{
	*(rtc_base+5) = DMA_RDBUFFER;   // target slave address for master read transfer
	*(rtc_base+4) = DMA_WRBUFFER;   // target slave address for master write transfer
	*(rtc_base+7) = 0x00000002;     // dma scheduled by fifos
	*(rtc_base+8) = ringbufSize/128-1;           // ring buffer size
	*(rtc_base+6) = 0x00010300;     // enable read and write transfers, continuous mode
}

void DMA_start(unsigned n_beats)
{
    *(core_reg+4)= n_beats;

}

int DMA_status(void)
{
	return *(core_reg+4);
}

void RTC_SwitchPort(unsigned portOut, unsigned portIn)
{
	unsigned mask;
	mask = 0xF << (4*portOut);
	REG09 &= ~mask;
	REG09 |= ((portIn & 0xF)<< (4*portOut));
	*(rtc_reg+9) = REG09;
}


//---- enable/disable Audio IN testpattern-----
void RTC_audioIN_testpattern(int R, int L)
{
  if (R)
	  REG01 |= 0x10;
  else
	  REG01 &= ~0x10;
  if (L)
	  REG01 |= 0x20;
  else
	  REG01 &= ~0x20;
*(rtc_reg+1)= REG01;
}

//---- enable/disable Audio OUT testpattern-----
void RTC_audioOUT_testpattern(int R, int L)
{
  if (R)
	  REG01 |= 0x40;
  else
	  REG01 &= ~0x40;
  if (L)
	  REG01 |= 0x80;
  else
	  REG01 &= ~0x80;
*(rtc_reg+1)= REG01;
}

void GetProfiler(int num)
{
	return *(profiler_reg+num);
}
