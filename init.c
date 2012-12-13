#include "p33Fxxxx.h"
#include "init.h"
#include "uart.h"
#include "timer.h"



void SetupInterrupts(void)
{
    //ConfigIntTimer1(T1_INT_PRIOR_4 & T1_INT_OFF); 
    //ConfigIntTimer2(T2_INT_PRIOR_4 & T2_INT_OFF); 
    ConfigIntUART1(UART_TX_INT_EN & UART_TX_INT_PR4 & UART_RX_INT_EN &
            UART_RX_INT_PR4); //UART TX/RX 
}

void SetupTimer1(void)
{
    unsigned int T1CON1value, T1PERvalue;
    T1CON1value = T1_ON & T1_SOURCE_INT & T1_PS_1_8 & T1_GATE_OFF &
                  T1_SYNC_EXT_OFF;
    T1PERvalue = 0x01F4; //clock period = 0.0001s = ((T1PERvalue * prescaler)/FCY) (100Hz)
    OpenTimer1(T1CON1value, T1PERvalue);	
}

void SetupTimer2(void)
{
    unsigned int T2CON1value, T2PERvalue;
    T2CON1value = T2_ON & T2_SOURCE_INT & T2_PS_1_8 & T2_GATE_OFF;
    T2PERvalue = 0xC350; // clock period = 0.01s = ((T1PERvalue * prescaler)/FCY) (100Hz)
    OpenTimer2(T2CON1value, T2PERvalue);	
}

void SetupUART1(void)
{
    /// UART1 for RS-232 w/PC @ 230400, 8bit, No parity, 1 stop bit
    unsigned int U1MODEvalue, U1STAvalue, U1BRGvalue;
    U1MODEvalue = UART_EN & UART_IDLE_CON & UART_IrDA_DISABLE &
                  UART_MODE_FLOW & UART_UEN_10 & UART_DIS_WAKE &
                  UART_DIS_LOOPBACK & UART_DIS_ABAUD & UART_UXRX_IDLE_ONE &
                  UART_BRGH_FOUR & UART_NO_PAR_8BIT & UART_1STOPBIT;
    U1STAvalue  = UART_INT_TX & UART_INT_RX_CHAR &UART_SYNC_BREAK_DISABLED &
                  UART_TX_ENABLE & UART_ADR_DETECT_DIS & 
                  UART_IrDA_POL_INV_ZERO; // If not, whole output inverted.
    U1BRGvalue  = 43; // (Fcy / ({16|4} * baudrate)) - 1
    OpenUART1(U1MODEvalue, U1STAvalue, U1BRGvalue);
}
