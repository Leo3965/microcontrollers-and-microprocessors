#line 1 "D:/Workspace/Projeto A3- Micontroladores e Microprocessadores/Proteus/Aula 9/desafio aula 9/desafio_9.c"
int i = 0;
int contador = 0;





sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

char pot1_string [8];
char pot2_string [8];
char pot3_string [8];
char apagar [] = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '};
unsigned int pot1 = 0;
unsigned int pot2 = 0;
unsigned int pot3 = 0;

void interrupt()
{
 if(INT1IF_bit == 1)
 {
 INT1IF_bit = 0;
 contador++;
 }
}

void interrupt_low()
{
 if(INT2IF_bit == 1)
 {
 INT2IF_bit = 0;
 contador = 0;
 }
}

void setup () {

 TRISA0_bit = 1;
 TRISA1_bit = 1;
 TRISA2_bit = 1;

 ADCON1 = 0b00001100;
 ADC_Init();
 CMCON = 0b00000111;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 GIEH_bit = 1;
 PEIE_bit = 1;
 IPEN_bit = 1;

 INT1IE_bit = 1;
 INT1IP_bit = 1;
 INTEDG1_bit = 1;
 INT1IF_bit = 0;

 INT2IE_bit = 1;
 INT2IP_bit = 0;
 INTEDG2_bit = 1;
 INT2IF_bit = 0;

}

void main() {
 setup();

 while(1) {
 Lcd_Out(1,2,"Contagem: ");
 IntToStr(contador, pot1_string);
 Lcd_Out(2, 2,pot1_string);
 delay_ms(100);
 }
}
