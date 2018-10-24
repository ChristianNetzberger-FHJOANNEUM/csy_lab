/*
 * sdcard.c
 *
 *  Created on: 20.04.2018
 *      Author: net
 */
#include <stdlib.h>

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "math.h"  // do not forget to enable the linker -lm option in C/C++ build settings under
                   // >Project Properties>C/C++ Build Settings>Arm linker>Libraries
                   // see also https://www.xilinx.com/support/answers/52971.html
#include "ff.h"    // you must add the xilfss generic fat file system library in board support package !!!


#include "xparameters.h"
#include "globals.h"     // user defined global variables and definitions

#define PRINT_HDR 1

//-----File System-----------------
FATFS FS_Inst;
FIL fileWAV;
FRESULT res,result;
int Fsize,bytes_read;
TCHAR *Path = "0:/";
DIR dir;         /* Directory search object */
FILINFO fno;     /* File information */

unsigned n_files=0;

struct file_list_struct {
  char fname[16];
}file_list[20];

unsigned fileID; // used to select a file from the file list

char hdrBuffer[100];
unsigned nbytes;

extern int axi_cnt;
//extern struct fileStream_struct fileStream;
extern unsigned profiler_timestamp[8];

struct ringBuffer_struct{
char mem[400000];
unsigned wrptr;
unsigned rdptr;
unsigned size;
unsigned length;
}ringBuf;

int doubleBuffer = 1;
//---Hardware Profiler-------------------
extern unsigned *profiler_reg;

char tmpBuffer[0x10000];


//------- MOUNT THE SD-CARD

int ringBuffer_init(struct ringBuffer_struct *ringBuffer,unsigned length)
{
  ringBuffer->size = length;
  ringBuffer->length = length;
  ringBuffer->wrptr = 0;
  ringBuffer->rdptr = 0;
}

int ringBuffer_getSize(struct ringBuffer_struct *ringBuffer)
{
   return (ringBuffer->size);
}

int ringBuffer_read(struct ringBuffer_struct *ringBuffer,int num, char *buffer)
{
 int i;
 for (i=0; i < num; i++) {
	buffer[i]= ringBuffer->mem[ringBuffer->rdptr];
	(ringBuffer->rdptr)++;
	ringBuffer->rdptr %= ringBuffer->length;
	(ringBuffer->size)++;
 }

}

int ringBuffer_write(struct ringBuffer_struct *ringBuffer,int num, char *buffer)
{
	 int i;
	 for (i=0; i < num; i++) {
		ringBuffer->mem[ringBuffer->wrptr] = buffer[i];
		(ringBuffer->wrptr)++;
		ringBuffer->wrptr %= ringBuffer->length;
		(ringBuffer->size)--;
	 }
}

int SD_Mount(void)
{
	xil_printf("Mounting SD Card.....\n\r");
	result = f_mount(&FS_Inst, Path, 1);
	if (result != 0) {
		xil_printf("---ERROR--- : f_mount returned %d\r\n", result);
		return result;
	}

	//---scan the root directory and create a file list------------
	result = f_opendir(&dir, Path);  /* Start to search files */
	xil_printf("Scan Directory %s  result=%d\r\n",Path, result);

	if (result==FR_OK) {
		for (;;) {
			res = f_readdir(&dir, &fno);
			if (res != FR_OK || fno.fname[0] == 0) break;  /* Break on error or end of dir */
			if (fno.fattrib & AM_DIR) {                /* It is a directory */
		} else {                                       /* It is a file. */
			xil_printf("%s/%s\r\n", Path, fno.fname);
			strcpy(file_list[n_files].fname,fno.fname);
			file_list[n_files].fname[12]=0;
			n_files++;
				}
			}
	 xil_printf("Number of Files on SD Card: %d\r\n", n_files);
	 f_closedir(&dir);
	 return 0;
	 }
	else
		return result;
}

int Bitmap2Buffer(int fileID, char *fname, short unsigned *FrameBuffer)
{
  short pixval16, pixval_red,pixval_green,pixval_blue;
  int i,j,k;
  char lineBuffer[4096];
  unsigned nlines, nbytes;
  FIL fileBMP;

//--ID for the file----
  if (fileID < 0)
	  result = f_open(&fileBMP,fname, FA_READ);
  else
      result = f_open(&fileBMP,file_list[fileID].fname, FA_READ);
  if (result != 0) {
		xil_printf("ERROR: f_open returned %d\r\n", result);
		return -1;
  }
  else {
		xil_printf("OPEN file %s size= %d\r\n", file_list[fileID].fname, fileBMP.fsize);
	}
 nbytes = fileBMP.fsize;

 // --get header of bitmp file, assume header leangth 54bytes
 result = f_read(&fileBMP,hdrBuffer+2,54,&bytes_read);
 bmpHdr = (struct bmpHdr_struct *)hdrBuffer;

 if (PRINT_HDR) {
	 xil_printf("%02X   bfType\r\n",bmpHdr->bfType) ;
	 xil_printf("%6d bfSize\r\n",bmpHdr->bfSize) ;
	 xil_printf("%6d biSize\r\n",bmpHdr->biSize) ;
	 xil_printf("%6d bfOffBits\r\n",bmpHdr->bfOffBits) ;
	 xil_printf("%6d biSize\r\n",bmpHdr->biSize) ;
   	 xil_printf("%6d biWidth\r\n",bmpHdr->biWidth) ;
   	 xil_printf("%6d biHeight\r\n",bmpHdr->biHeight) ;
   	 xil_printf("%6d biBitCount\r\n",bmpHdr->biBitCount) ;
     }

 //---- read image contents line by line -----------------
 nbytes = bmpHdr->biWidth*3;
 xil_printf("nbytes=%d ",nbytes);
 nbytes = (nbytes+3) & 0xFFFFFFFC; //padding of bytenumber to multiple of 4
 nlines = bmpHdr->biHeight;
 xil_printf("nbytes=%d \r\n",nbytes);

 for (k=0; k < nlines; k++) {
	// get a line from SD-Card
    result = f_read(&fileBMP,lineBuffer,nbytes,&bytes_read);
    //--convert 24 bit RGB to 16-bit RGB  5-6-5 format
    for (i=0; i < bmpHdr->biWidth; i++) {
    	pixval_red = (lineBuffer[3*i] >> 3) & 0x1F;
    	pixval_green = (lineBuffer[3*i+1] >> 2) & 0x3F;
    	pixval_blue = (lineBuffer[3*i+2] >> 3) & 0x1F;
    	pixval16 = (pixval_blue << 11) | (pixval_green << 5) | pixval_red;
    	*(FrameBuffer+k*1280+i)=pixval16;
        }
    }
	 result = f_close(&fileBMP);
	 if (result != 0)
		xil_printf("---ERROR--- : f_close returned %d\r\n", result);
	 return(result);
	}


void StreamFile(struct fileStream_struct *fileStream, int debug)
{
	int NSAMPLES = 40; // number of 2*16-bit samples
	int result;
	int i;
	short tmpBuffer[512];
	unsigned ringBuffer_size;

	switch(fileStream->state){
	case 1:  result = f_open(&fileStream->fileID,file_list[fileStream->ID].fname, FA_READ);
	         if (result)
	        	 fileStream->state = 0; // stop streaming if no file could be opened
	         else
	        	 fileStream->state = 2;
	         fileStream->size = fileStream->fileID.fsize;
	         fileStream->position = 0;
	         fileStream->ticker = 0;
	         xil_printf("stream file %d %s  size=%d\r\n",fileStream->ID,file_list[fileStream->ID].fname,fileStream->size);
	         axi_cnt = 0;
	         Config_RtcFifo(0,1, fileStream->rate);  //enable FIFO
	         ringBuffer_init(&ringBuf, 200000);
	         break;
	case 2:
		if (doubleBuffer) {
				if ((ringBuffer_size = ringBuffer_getSize(&ringBuf)) > 512) {
					result = f_read(&fileStream->fileID,tmpBuffer,512,&bytes_read);
					ringBuffer_write(&ringBuf,512,tmpBuffer);
				}
			}

		if (Get_RtcFifo_TxSize(fileStream->channel) < 100) {
			if (debug) SetPMOD(3);
			fileStream->position += NSAMPLES*4;
			fileStream->ticker ++;
			if ((fileStream->position >= fileStream->size) || (fileStream->kill /= 0)) {
				result = f_close(&fileStream->fileID);
				fileStream->state = 0; // close the stream
				xil_printf("..close stream %d %s\r\n",fileStream->ID,file_list[fileStream->ID].fname);
			}
			else {
				if (debug) SetPMOD(4);
				if (doubleBuffer == 0)
				   result = f_read(&fileStream->fileID,tmpBuffer,4*NSAMPLES,&bytes_read);
				else {
					ringBuffer_size = ringBuffer_getSize(&ringBuf);
					ringBuffer_read(&ringBuf,4*NSAMPLES,tmpBuffer);
					ringBuffer_size = ringBuffer_getSize(&ringBuf);
				}
				if (debug) ClearPMOD(4);
				 Put_RtcFifo_Samples(fileStream->channel,NSAMPLES, tmpBuffer);
				}
			if (debug) ClearPMOD(3);
		 }
         break;
	}
}

void StreamFileFIFO(char *fname, FIL *fileID, int *state, int rate, int fifo_nr)
{
	int NSAMPLES = 40; // number of 2*16-bit samples
	int NBYTES;
	int i,result,file_position;
	short tmpBuffer[512];
    NBYTES = 4*NSAMPLES; // 2 16-bit samples contain 4 Bytes

    switch(*state){
	case 1:  result = f_open(fileID,fname, FA_READ);
	         if (result)
	        	 *state = 0; // stop streaming if no file could be opened
	         else
	        	 *state = 2;

	         Config_RtcFifo(fifo_nr,1, rate);  //enable FIFO
	         break;
	case 2:
		if (Get_RtcFifo_TxSize(0) < 100) {
			file_position += NBYTES;
			if (file_position >= fileID->fsize) {
				result = f_close(fileID);
				*state = 0; // close the stream
			}
			else {
				 result = f_read(fileID,tmpBuffer,4*NSAMPLES,&bytes_read);
				 Put_RtcFifo_Samples(fifo_nr,NSAMPLES, tmpBuffer);
				}
		 }
         break;
	}
}

void SDReadPerf(int fileID, int blocksize,char *fname)
{
	  FIL fileBMP;
	  int k;
	  int nbytes,blocknum;
      unsigned time_elapsed;
      unsigned throughput;
      unsigned nclocks;
      unsigned timestamp_start, timestamp_stop,timestamp_delta;

	  xil_printf("Running SD Card Read Performance Test ... \r\n");

	//--ID for the file----
	  if (fileID < 0)
		  result = f_open(&fileBMP,fname, FA_READ);
	  else
	      result = f_open(&fileBMP,file_list[fileID].fname, FA_READ);
	  if (result != 0) {
			xil_printf("ERROR: f_open returned %d\r\n", result);
			return -1;
	  }
	  else {
			xil_printf("OPEN file %s size= %d\r\n", file_list[fileID].fname, fileBMP.fsize);
		}
	  nbytes = fileBMP.fsize;
      blocknum = nbytes/blocksize;

      xil_printf("reading %d bytes in %d blocks of %d\r\n",nbytes,blocknum, blocksize);

      timestamp_start = Get_SystemTime();
      for (k=0; k < blocknum; k++) {
    	  TogglePMOD(0);
	      result = f_read(&fileBMP,tmpBuffer,blocksize,&bytes_read);
	    }
      timestamp_stop = Get_SystemTime();
      time_elapsed = timestamp_stop - timestamp_start;

	 result = f_close(&fileBMP);
	 if (result != 0)
		xil_printf("---ERROR--- : f_close returned %d\r\n", result);

	 throughput = nbytes/time_elapsed;
	 xil_printf("...%d Bytes took %d msec  throughput = %d KB/s\r\n", nbytes,time_elapsed,throughput);

	 return(result);
}

void SDWritePerf(int fileID, int blocksize,int nbytes,char *fname)
{
	  FIL fileBMP;
	  int i,k;
	  int blocknum;
      unsigned time_elapsed;
      unsigned throughput;
      unsigned nclocks;
      unsigned bytes_written;
      unsigned nbytes_written;
      unsigned timestamp_start, timestamp_stop,timestamp_delta;

	  xil_printf("Running SD Card Write Performance Test to %s... \r\n",fname);

	//--ID for the file----
      result = f_open(&fileBMP,fname, FA_CREATE_ALWAYS | FA_WRITE);
	  if (result != 0) {
			xil_printf("ERROR: f_open returned %d\r\n", result);
			return -1;
	  }
	  else {
			xil_printf("OPEN file %s for writing ...size= %d Byte\r\n", fname, nbytes);
		}
      blocknum = nbytes/blocksize;
      nbytes_written = blocknum*blocksize;
      xil_printf("start writing %d bytes in %d blocks...\r\n",nbytes_written,blocknum);

      for (i=0; i < blocksize; i++)
    	  tmpBuffer[i] = 0x20+(i%0x40);

      timestamp_start = Get_SystemTime();
      for (k=0; k < blocknum; k++) {
    	  TogglePMOD(0);
	      result = f_write(&fileBMP,tmpBuffer,blocksize,&bytes_written);
	    }
      timestamp_stop = Get_SystemTime();
      time_elapsed = timestamp_stop - timestamp_start;

	 result = f_close(&fileBMP);
	 if (result != 0)
		xil_printf("---ERROR--- : f_close returned %d\r\n", result);

	 throughput = nbytes/time_elapsed;
	 xil_printf("...%d Bytes took %d msec  throughput = %d KB/s\r\n", nbytes,time_elapsed,throughput);

	 return(result);
}
