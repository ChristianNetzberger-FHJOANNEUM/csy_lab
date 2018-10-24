/*
 * cmd.c
 *
 *  Created on: 08.04.2018
 *      Author: net
 */
/******************************************************************************
 *
 *   Real-Time Computing    FH JOANNEUM Kapfenberg
 *
 *
 *
 *   Bare-Metal Command Console
 *
 *   April 2018
 *
******************************************************************************/

/***************************** Include Files *******************************/
#include "xparameters.h"
#include "xuartps.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"
#include "ff.h"
#include "globals.h"

//----register space--------------
extern unsigned *rtc_base ;
extern unsigned *vesa_base;
extern unsigned *rtc_reg ;
extern unsigned *vesa_reg;

//----SD Card-----------------------
extern SD_Status;
extern unsigned n_files;
extern struct file_list_struct {
  char fname[16];
}file_list[20];

extern struct fileStream_struct fileStream;

extern int N_DELAY;  // length of audio delay buffer in samples

static int NextToken(char *cmdString,int *index,int *tokenNumber,char *token);
unsigned convHex(char *str);

extern int Go_Flag;

//-----------------------------------------------------------
//  poll the console input buffer
//  and process ASCII commands
//  from the host computer
//-----------------------------------------------------------
int CmdConsole(char *cmdString)
{
	u32 NumBytes;
	static char cmd[64];
	static u32 index= 0;
	u32 length;
	static int state = 0;
	unsigned ReceivedCount;
	char buf[32];
	int k;
	int wait;
	do {
		NumBytes = UART0_Receive(buf, 1);
		// echo
		if (NumBytes) {
			for (k=0; k < NumBytes; k++)
			{
			if (buf[k] == 0x0D) {
			   cmdString[index]=0;
			   length = index;
			   index = 0;
			   return length;
			  }
			else if (buf[k] >= ' ')
				cmdString[index++] = buf[k];
			else
				index = 0;
			}
		  }
		} while (NumBytes);
	return 0;
}

//-----------------------------------------------------------
//  command parser for the console input
//  get tokens (ASCII command strings) from
//  console input buffer and decode the commands
//-----------------------------------------------------------
int CmdParser(char *cmdString)
{
	char token[32];
	int tokenNumber = 0;
	int index = 0;
	int result;
    unsigned reg_address,reg_data,reg_num,interleave;
    char message[64];
    char respString[64];
    int i;

	do {
		if ((result = NextToken(cmdString,&index,&tokenNumber,token))) {
			if (!(strncmp(token,"?",1))) {
				    // print list of available commands
			        xil_printf("\n\r   go                --start application");
				    xil_printf("\n\r   dir               --list directory on SD Card");
				    xil_printf("\n\r   stream [hnum]     --stream file #num from SD Card");
				    xil_printf("\n\r   stream kill       --stop stream immediately");
					xil_printf("\n\r   wr [addr] [data]  --write register");
					xil_printf("\n\r   rr [addr]         --read  vga register");
					xil_printf("\n\r   wv [addr] [data]  --write vga register");
					xil_printf("\n\r   rv [addr]         --read  register");
					xil_printf("\n\r   ?                 --list  commands");
					}
			//----list directory on SD Card-----------------------------------------------------------
					else if (!(strncmp(token,"go",2))) {
								xil_printf("  go...\n\r");
								Go_Flag = TRUE;

				    }
					else if (!(strncmp(token,"dir",3))) {
						if (SD_Status)
							xil_printf("No SD Card mounted");
						else {
							xil_printf("List of Files:\n\r");
							for (i=0; i < n_files;i++)
								xil_printf("  (%2d) %s\n\r",i,file_list[i].fname);
						    }
						}
			//----stream file-----------------------------------------------------------
					else if (!(strncmp(token,"stream",6))) {
						if (SD_Status)
							xil_printf("No SD Card mounted");
						else {
							xil_printf("Stream File...:\n\r");
							if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
								if (!(strncmp(token,"kill",4))) {
									fileStream.kill = 1;
									xil_printf("kill %d\n\r",fileStream.ID);
								}
								else if (!(strncmp(token,"rate",4))) {
									if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
										fileStream.rate = atoi(token);
										xil_printf("stream rate %d\n\r",fileStream.rate);
								         Config_RtcFifo(0,1, fileStream.rate);  //enable FIFO
									}
								}
								else {
									fileStream.ID = atoi(token);
									fileStream.state = 1;
									fileStream.type = 0;
									fileStream.channel = 0;
									fileStream.kill = 0;
									fileStream.rate = 44100;
									xil_printf(" %d\n\r",fileStream.ID);
								   }
								}
						    }
						}
			//----audio delay-----------------------------------------------------------
					else if (!(strncmp(token,"delay",5))) {
						if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
							N_DELAY = convHex(token);
							//	xil_printf("%08X %s",reg_data,token);

							}
						}
			//----write value to register-----------------------------------------------------------
					else if (!(strncmp(token,"wr",2))) {
						if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
							reg_address = convHex(token);
							if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
								reg_data = convHex(token);
								 *(rtc_base+reg_address)= reg_data;
								// xil_printf("write %X to %X",reg_data,reg_address);
								//sprintf(respString,"%08X %s",reg_data,token);
								xil_printf("%08X %s",reg_data,token);
								}
							}
						}
			//----read value from register--------------------------------------------------------------
					else if (!(strncmp(token,"rr",2))) {
						if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
							reg_address = convHex(token);
							reg_data =  *(rtc_base+reg_address);
							//sprintf(respString,"%08X",reg_data);
							xil_printf("%08X",reg_data);
							}
						}
/*
			//----write value to vesa register-----------------------------------------------------------
					else if (!(strncmp(token,"wv",2))) {
						if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
							reg_address = convHex(token);
							if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
								reg_data = convHex(token);
								 *(vesa_base+reg_address)= reg_data;
								// xil_printf("write %X to %X",reg_data,reg_address);
								//sprintf(respString,"%08X %s",reg_data,token);
								xil_printf("%08X %s",reg_data,token);
								}
							}
						}
			//----read value from vesa register--------------------------------------------------------------
					else if (!(strncmp(token,"rv",2))) {
						if ((result = NextToken(cmdString,&index,&tokenNumber,token))){
							reg_address = convHex(token);
							reg_data =  *(vesa_base+reg_address);
							//sprintf(respString,"%08X",reg_data);
							xil_printf("%08X",reg_data);
							}
						}
*/
					break;

			}

			//xil_printf("<%s %d> ",token,tokenNumber);
	} while (result);
	CmdPrompt();
	return 0;
}

//-----------------------------------------------------------
//  get next token from UART receive buffer for command parser
//-----------------------------------------------------------
static int NextToken(char *cmdString,int *index,int *tokenNumber,char *token)
{
	int n=0;
	int state = 0;

	do {
		switch(state) {
		case 0: if (cmdString[*index] == ' ')  // ignore leading blanks
			       (*index)++;
				else if (cmdString[*index] == 0)  // end of string found -->empty string
					state = 10;
				else {
					token[n++] = cmdString[(*index)++];	//valid ascii char found
					state = 1; //valid char found
				}
		        break;
		case 1: if ((cmdString[*(index)] == ' ') || (cmdString[*index] == 0)){ //end of token found
			        state = 20;
			        token[n] = 0;
			        (*tokenNumber)++;
		            }
				else
					token[n++] = cmdString[(*index)++]; // next valid char

		        break;
		}
	} while (state < 10);

    if (state == 10) return 0; //empty string
    else return 1;             //valid string

}


//----------------------------------------------------
//  print the command prompt-message(hostname) to console
//----------------------------------------------------
void CmdPrompt(void)
{
	char message[64];
 xil_printf("\n\r>");
}

unsigned convHex(char *str)
{
unsigned val = 0;
unsigned hex;
unsigned i;

	for (i=0; i < strlen(str); i++) {
	   hex = str[i]-0x30;
	   if (hex > 9) hex-=7;
	   val <<= 4;
	   val += hex;
	}
   return val;
}


