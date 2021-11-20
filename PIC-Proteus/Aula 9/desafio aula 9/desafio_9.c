int i = 0;
int contador = 0;

#define B2 RB2_bit
#define B1 RB1_bit

// Selecionando pinos utilizados para comunica��o com display LCD
sbit LCD_RS at RD2_bit;// PINO 2 DO PORTD INTERLIGADO AO RS DO DISPLAY
sbit LCD_EN at RD3_bit;// PINO 3 DO PORTD INTERLIGADO AO EN DO DISPLAY
sbit LCD_D7 at RD7_bit;// PINO 7 DO PORTD INTERLIGADO AO D7 DO DISPLAY
sbit LCD_D6 at RD6_bit;// PINO 6 DO PORTD INTERLIGADO AO D6 DO DISPLAY
sbit LCD_D5 at RD5_bit;// PINO 5 DO PORTD INTERLIGADO AO D5 DO DISPLAY
sbit LCD_D4 at RD4_bit;// PINO 4 DO PORTD INTERLIGADO AO D4 DO DISPLAY

// Selecionando dire��o de fluxo de dados dos pinos utilizados para a comunica��o com display LCD
sbit LCD_RS_Direction at TRISD2_bit;// SETA DIRE��O DO FLUXO DE DADOS DO PINO 2 DO PORTD
sbit LCD_EN_Direction at TRISD3_bit;// SETA DIRE��O DO FLUXO DE DADOS DO PINO 3 DO PORTD
sbit LCD_D7_Direction at TRISD7_bit;// SETA DIRE��O DO FLUXO DE DADOS DO PINO 7 DO PORTD
sbit LCD_D6_Direction at TRISD6_bit;// SETA DIRE��O DO FLUXO DE DADOS DO PINO 6 DO PORTD
sbit LCD_D5_Direction at TRISD5_bit;// SETA DIRE��O DO FLUXO DE DADOS DO PINO 5 DO PORTD
sbit LCD_D4_Direction at TRISD4_bit;// SETA DIRE��O DO FLUXO DE DADOS DO PINO 4 DO PORTD

char pot1_string [8];// STRING PARA RECEBER O VALOR CONVERTIDO DA LEITURA DO POTENCI�METRO 1
char pot2_string [8];// STRING PARA RECEBER O VALOR CONVERTIDO DA LEITURA DO POTENCI�METRO 2
char pot3_string [8];// STRING PARA RECEBER O VALOR CONVERTIDO DA LEITURA DO POTENCI�METRO 3
char apagar [] = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '};//STRING PARA APAGAR O CONTE�DO DAS RESPECTIVAS LINHAS
unsigned int pot1 = 0;// VARIAVEL PARA ARMAZENAR O VALOR OBTIDO PELO AN0
unsigned int pot2 = 0;// VARIAVEL PARA ARMAZENAR O VALOR OBTIDO PELO AN1
unsigned int pot3 = 0;// VARIAVEL PARA ARMAZENAR O VALOR OBTIDO PELO AN2

void interrupt() //0008h   vetor de alta
{
 if(INT1IF_bit == 1) //INTCON3.INT1IF
 {
  INT1IF_bit = 0;
  contador++;
 }
}

void interrupt_low() //0018h  vetor baixa
{
  if(INT2IF_bit == 1)
 {
   INT2IF_bit = 0;
   contador = 0;
  }
}

void setup () {

  TRISA0_bit = 1;  // CONFIGURA O PINO EM QUE SE ENCONTRA A PORTA ANAL�GICA AN0 COMO ENTRADA
  TRISA1_bit = 1;  // CONFIGURA O PINO EM QUE SE ENCONTRA A PORTA ANAL�GICA AN1 COMO ENTRADA
  TRISA2_bit = 1;  // CONFIGURA O PINO EM QUE SE ENCONTRA A PORTA ANAL�GICA AN2 COMO ENTRADA

  ADCON1 = 0b00001100;//SELECIONA OS PINOS 2, 3, 4 DO PORTA COMO ENTRADAS ANAL�GICAS (AN0, AN1, AN2)
  ADC_Init();//INICIALIZA M�DULO ANALG�GICO
  CMCON = 0b00000111;//DESABILITA COMPARADORES INTERNOS

  Lcd_Init();//INICIALIZA DISPLAY LCD
  Lcd_Cmd(_LCD_CLEAR);//ENVIA O COMANDO DE LIMPAR TELA PARA O DISPLAY LCD
  Lcd_Cmd(_LCD_CURSOR_OFF);// ENVIA O COMANDO DE DESLIGAR CURSOR PARA O DISPLAY LCD

  GIEH_bit = 1;// chave geral e alta prioridade
  PEIE_bit = 1;// Perif�ricos e baixa prioridade
  IPEN_bit = 1;// familia PIC18

  INT1IE_bit = 1;// habilita interrup��o B1 INTCON3.INT1IE
  INT1IP_bit = 1;// alta prioridade
  INTEDG1_bit = 1;// borda de subida
  INT1IF_bit = 0;// reset flag interrup��o

  INT2IE_bit = 1;// habilita interrup��o B2 INTCON3.INT2IE
  INT2IP_bit = 0;// baixa prioridade
  INTEDG2_bit = 1;// borda de subida
  INT2IF_bit = 0;// reset flag interrup��o

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

//Lcd_Cmd(_LCD_CLEAR);
//  pot1 = ADC_Get_Sample(0);//RECEBE O VALOR DE TENS�O DO POTENCIOMETRO NA PORTA AN0
//    pot2 = ADC_Get_Sample(1);//RECEBE O VALOR DE TENS�O DO POTENCIOMETRO NA PORTA AN1
//    pot3 = ADC_Get_Sample(2);//RECEBE O VALOR DE TENS�O DO POTENCIOMETRO NA PORTA AN2
// IntToStr(pot1,pot1_string);//CONVERTE O VALOR DO TIPO INTEIRO OBTIDO PELO CONVERSOR AD NA PORTA AN0 PARA UMA STRING
//    IntToStr(pot2,pot2_string);//CONVERTE O VALOR DO TIPO INTEIRO OBTIDO PELO CONVERSOR AD NA PORTA AN1 PARA UMA STRING
//    IntToStr(pot3,pot3_string);//CONVERTE O VALOR DO TIPO INTEIRO OBTIDO PELO CONVERSOR AD NA PORTA AN2 PARA UMA STRING
//    Ltrim(pot1_string);//REMOVE TODOS OS ESPA�OS EM BRANCO LOCALIZADOS A ESQUERDA DO PRIMEIRO CHAR DA STRING COM O VALOR DE AN0
//    Ltrim(pot2_string);//REMOVE TODOS OS ESPA�OS EM BRANCO LOCALIZADOS A ESQUERDA DO PRIMEIRO CHAR DA STRING COM O VALOR DE AN1
//    Ltrim(pot3_string);//REMOVE TODOS OS ESPA�OS EM BRANCO LOCALIZADOS A ESQUERDA DO PRIMEIRO CHAR DA STRING COM O VALOR DE AN2�������
    //Lcd_Cmd(_LCD_CLEAR); // LIMPA A TELA PARA ATUALIZAR OS VALORES
    //Lcd_Out(1,1,"S1:");//ESCREVE A MENSAGEM POT1 NA PRIMEIRA LINHA E PRIMEIRA COLUNA DO DISPLAY LCD
    //Lcd_Out_Cp(pot1_string);//ESCREVE O VALOR OBTIDO DO CONVERSOR A/D NA POSI��O EM QUE SE ENCONTRA O CURSOR DO DISPLAY���
    //Lcd_Out(1,9,"S2:");//ESCREVE A MENSAGEM POT2 NA PRIMEIRA LINHA E DECIMA PRIMEIRA COLUNA DO DISPLAY LCD
    //Lcd_Out_Cp(pot2_string);//ESCREVE O VALOR OBTIDO DO CONVERSOR A/D NA POSI��O EM QUE SE ENCONTRA O CURSOR DO DISPLAY
    //Lcd_Out(2,1,"S3:");//ESCREVE A MENSAGEM POT3 NA SEGUNDA LINHA E PRIMEIRA COLUNA DO DISPLAY LCD
    //Lcd_Out_Cp(pot3_string);//ESCREVE O VALOR OBTIDO DO CONVERSOR A/D NA POSI��O EM QUE SE ENCONTRA O CURSOR DO DISPLAY�