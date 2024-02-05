

/***************************** Include Files *******************************/
#include <stdio.h>
#include "platform.h"
#include "xgpio.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_types.h"
#include "xil_assert.h"
#include "xuartps_hw.h"
#include "xil_printf.h"
#include "sleep.h"

/************************** Constant Definitions ***************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define UART_BASEADDR		XPAR_XUARTPS_0_BASEADDR
#define UART_CLOCK_HZ		XPAR_XUARTPS_0_CLOCK_HZ
/*
 * The following constant controls the length of the buffers to be sent
 * and received with the device. This constant must be 32 bytes or less so the
 * entire buffer will fit into the TX and RX FIFOs of the device.
 */
#define TEST_BUFFER_SIZE	16

#define CHAR_ESC		0x1b	/* 'ESC' character is used as terminator */

/**************************** Type Definitions *****************************/

/***************** Macros (Inline Functions) Definitions *******************/

/************************** Function Prototypes ****************************/

int UartPscontrollingpattern(u32 UartBaseAddress);

/************************** Variable Definitions ***************************/

/*
 * The following buffers are used in this example to send and receive data
 * with the UART.
 */
u8 SendBuffer[TEST_BUFFER_SIZE];	/* Buffer for Transmitting Data */


/***************************************************************************/
/**
*
* Main function to call the Uart Echo example.
*
* @param	None
*
* @return	XST_SUCCESS if successful, XST_FAILURE if unsuccessful
*
* @note		None
*
****************************************************************************/
int main(void)
{
//	int Status;

	 XGpio Opticsout, RFout;

	     XGpio_Initialize(&RFout,XPAR_AXI_GPIO_0_DEVICE_ID);
	     XGpio_Initialize(&Opticsout,XPAR_AXI_GPIO_1_DEVICE_ID);

	     XGpio_SetDataDirection(&RFout, 1, 0);
	     XGpio_SetDataDirection(&Opticsout, 1, 0);



	/*
	 * Run the UART Echo example , specify the Base Address that is
	 * generated in xparameters.h
//	 */
//	Status = UartPscontrollingpattern(UART_BASEADDR);
//	if (Status != XST_SUCCESS) {
//		xil_printf("Uartps Failed\r\n");
//		return XST_FAILURE;
//	}
//
//	xil_printf("Successfully ran Uartps\r\n");
//	return XST_SUCCESS;
//	  int I;
//	 	u32 CntrlRegister;
//
//	 	CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);
//
//	 	/* Enable TX and RX for the device */
//	 	XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
//	 			  ((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
//	 			   XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));
//	 	/*
//	 	 * Initialize the send buffer bytes with a pattern to send and the
//	 	 * the receive buffer bytes to zero
//	 	 */
//	 	for (I = 0; I < TEST_BUFFER_SIZE; I++) {
//	 		SendBuffer[I] = I + '0';
//	 	}
//
//	 	/* Send the entire transmit buffer. */
//	 	for (I = 0; I < TEST_BUFFER_SIZE; I++) {
//	 		/* Wait until there is space in TX FIFO */
//	 		 while (XUartPs_IsTransmitFull(UART_BASEADDR));
//
//	 		/* Write the byte into the TX FIFO */
//	 		XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET,
//	 				  SendBuffer[I]);
	     		int Index;
	     		u32 CntrlRegister;



	     		CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

	     		/* Enable TX and RX for the device */
	     		XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
	     				  ((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
	     				   XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));
	     		/*
	     		 * Initialize the send buffer bytes with a pattern to send and the
	     		 * the receive buffer bytes to zero
	     		 */
	     		for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
	     			SendBuffer[Index] = Index + '0';
	     		}

	     		/* Send the entire transmit buffer. */
	     		for (Index = 0; Index < TEST_BUFFER_SIZE; Index++) {
	     			/* Wait until there is space in TX FIFO */
	     			 while (XUartPs_IsTransmitFull(UART_BASEADDR));

	     			/* Write the byte into the TX FIFO */
	     			XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET,
	     					  SendBuffer[Index]);
	     		}

 u32 Case = 0;
 u8 opt_parts[4] = {0};
 u32 opt_pat;
 u8 rf_parts[4] = {0};
 u32 rf_pat;


while(1)
{
 while (!XUartPs_IsReceiveData(UART_BASEADDR));

 		Case = XUartPs_ReadReg(UART_BASEADDR,XUARTPS_FIFO_OFFSET);
// 		xil_printf(Case);
			switch (Case)
			{
			case '2':
				// set RF pattern
				xil_printf("insert RF pattern\r\n");
				rf_parts[3] = XUartPs_RecvByte(UART_BASEADDR);
				rf_parts[2] = XUartPs_RecvByte(UART_BASEADDR);
				rf_parts[1] = XUartPs_RecvByte(UART_BASEADDR);
				rf_parts[0] = XUartPs_RecvByte(UART_BASEADDR);
				rf_pat = ((u32)rf_parts[3]<<24)+((u32)rf_parts[2]<<16)+((u32)rf_parts[1]<<8)+((u32)rf_parts[0]);
				XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET, rf_pat);

				XGpio_DiscreteWrite(&RFout, 1, rf_pat);
				xil_printf("successfully inserted RF pattern\r\n");
				xil_printf("->");
				break;

			case '1':
				// set optical pattern
				xil_printf("insert Optical pattern\r\n");
				opt_parts[3] = XUartPs_RecvByte(UART_BASEADDR);
				opt_parts[2] = XUartPs_RecvByte(UART_BASEADDR);
				opt_parts[1] = XUartPs_RecvByte(UART_BASEADDR);
				opt_parts[0] = XUartPs_RecvByte(UART_BASEADDR);
				opt_pat = ((u32)opt_parts[3]<<24)+((u32)opt_parts[2]<<16)+((u32)opt_parts[1]<<8)+((u32)opt_parts[0]);

				XGpio_DiscreteWrite(&Opticsout, 1, opt_pat);
				xil_printf("successfully inserted Optical pattern\r\n");
				xil_printf("->");
				break;

			case '3':
				xil_printf("RF pattern\r\n");
				rf_parts[3] = 0x80000000;
				rf_parts[2] = 0x00000000;
				rf_parts[1] = 0x00000000;
				rf_parts[0] = 0x00000000;
				rf_pat = ((u32)rf_parts[3]<<24)+((u32)rf_parts[2]<<16)+((u32)rf_parts[1]<<8)+((u32)rf_parts[0]);
				XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET, rf_pat);

				XGpio_DiscreteWrite(&RFout, 1, rf_pat);
				xil_printf("successfully inserted RF pattern\r\n");
				xil_printf("->");
				break;

			case '4':
				xil_printf("RF pattern2\r\n");
				rf_parts[3] = 0x08000000;
				rf_parts[2] = 0x00000000;
				rf_parts[1] = 0x00000000;
				rf_parts[0] = 0x00000000;
				rf_pat = ((u32)rf_parts[3]<<24)+((u32)rf_parts[2]<<16)+((u32)rf_parts[1]<<8)+((u32)rf_parts[0]);
				XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET, rf_pat);

				XGpio_DiscreteWrite(&RFout, 1, rf_pat);
				xil_printf("successfully inserted RF pattern\r\n");
				xil_printf("->");
				break;

			case '5':
				xil_printf("RF pattern5\r\n");
				rf_parts[3] = 0x00800000;
				rf_parts[2] = 0x00000000;
				rf_parts[1] = 0x00000000;
				rf_parts[0] = 0x00000000;
				rf_pat = ((u32)rf_parts[3]<<24)+((u32)rf_parts[2]<<16)+((u32)rf_parts[1]<<8)+((u32)rf_parts[0]);
				XUartPs_WriteReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET, rf_pat);

				XGpio_DiscreteWrite(&RFout, 1, rf_pat);
				xil_printf("successfully inserted RF pattern\r\n");
				xil_printf("->");
				break;

			case '6':
				// set optical pattern
				xil_printf("Optical pattern\r\n");
				opt_parts[3] = 0xe0000000;
				opt_parts[2] = 0x00000000;
				opt_parts[1] = 0x00000000;
				opt_parts[0] = 0x00000000;
				opt_pat = ((u32)opt_parts[3]<<24)+((u32)opt_parts[2]<<16)+((u32)opt_parts[1]<<8)+((u32)opt_parts[0]);

				XGpio_DiscreteWrite(&Opticsout, 1, opt_pat);
				xil_printf("successfully inserted Optical pattern\r\n");
				xil_printf("->");
				break;

			default:
				xil_printf("Not workin :') \r\n");
			}
// 		if (Case == 3)
//			XUartPs_WriteReg(UART_BASEADDR,  XUARTPS_FIFO_OFFSET,
//							 Case);
}
return 0;
	 	}
