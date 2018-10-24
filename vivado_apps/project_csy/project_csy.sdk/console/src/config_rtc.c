/*
 * config_rtc.c
 *
 *  Created on: 26.04.2018
 *      Author: net
 */

//---Addresses for VESA graphics interface
extern unsigned *vesa_base;
extern unsigned *vesa_reg;

//  Addresses for the AXI Bridge in the FPGA  -------------------------------------------
extern unsigned *rtc_base;
extern unsigned *rtc_reg;
extern unsigned *rtc_fifo1;
extern unsigned *rtc_fifo2;

extern unsigned *IRQ_AXIBRIDGE_REG;


//---Hardware Profiler-------------------
extern unsigned *profiler_reg;

//  Addresses for theRTC System in the FPGA  -------------------------------------------
extern unsigned *IRQ_RTC_REG;

extern char *DMABUFFER;

//---FRAMEBUFFER for VESA Interface------------
extern unsigned short *FRAMEBUFFER;

