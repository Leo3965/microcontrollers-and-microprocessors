#line 1 "D:/Workspace/Projeto A3- Micontroladores e Microprocessadores/Proteus/Aula 7/Projeto.c"
#line 18 "D:/Workspace/Projeto A3- Micontroladores e Microprocessadores/Proteus/Aula 7/Projeto.c"
short number = 0;
unsigned short num1 = 0;
unsigned short num2 = 0;
unsigned short num3 = 0;
unsigned short num4 = 0;
short contador = 0;
int i = 0;
int j = 0;

void Escrever(int disp1, int disp2, int disp3, int disp4){
  PORTB  = 0b1110;
  PORTD  = disp1;
 delay_ms(5);
  PORTB  = 0b1101;
  PORTD  = disp2;
 delay_ms(5);
  PORTB  = 0b1011;
  PORTD  = disp3;
 delay_ms(5);
  PORTB  = 0b0111;
  PORTD  = disp4;
 delay_ms(5);
}

void ConfigPIc()
{
 TRISD = 0B00000000;
 PORTD = 0B00000000;
 TRISC0_bit = 1;
 TRISC1_bit = 1;

 GIEH_bit = 1;
 PEIE_bit = 1;
 IPEN_bit = 1;

 INT1IE_bit = 1;
 INT1IP_bit = 1;
 INTEDG1_bit = 1;
 INT1IF_bit = 0;
}

void Unidade(short num1, short num2, short num3, short num4)
{
  RD0_bit  = num1;
  RD1_bit  = num2;
  RD2_bit  = num3;
  RD3_bit  = num4;

}

void Dezena(short num1, short num2, short num3, short num4)
{
  RD4_bit  = num1;
  RD5_bit  = num2;
  RD6_bit  = num3;
  RD7_bit  = num4;
}

void Converter(short number){
 switch(number) {
 case 1:
 num1 = 1;
 num2 = 0;
 num3 = 0;
 num4 = 0;
 break;
 case 2:
 num1 = 0;
 num2 = 1;
 num3 = 0;
 num4 = 0;
 break;
 case 3:
 num1 = 1;
 num2 = 1;
 num3 = 0;
 num4 = 0;
 break;
 case 4:
 num1 = 0;
 num2 = 0;
 num3 = 1;
 num4 = 0;
 break;
 case 5:
 num1 = 1;
 num2 = 0;
 num3 = 1;
 num4 = 0;
 break;
 case 6:
 num1 = 0;
 num2 = 1;
 num3 = 1;
 num4 = 0;
 break;
 case 7:
 num1 = 1;
 num2 = 1;
 num3 = 1;
 num4 = 0;
 break;
 case 8:
 num1 = 0;
 num2 = 0;
 num3 = 0;
 num4 = 1;
 break;
 case 9:
 num1 = 1;
 num2 = 0;
 num3 = 0;
 num4 = 1;
 break;
 case 0:
 num1 = 0;
 num2 = 0;
 num3 = 0;
 num4 = 0;
 break;
 }
}


void main(){
 ConfigPIC();
 while(1){




 if(! RC0_bit  &&  RC1_bit ){
 for (i = 0; i <= 9; i++){
 Converter(i);
 Dezena(num1, num2, num3, num4);
 if (! RC0_bit ) break;
 for (j = 0; j <= 9; j++){
 Converter(j);
 Unidade(num1, num2, num3, num4);
 delay_ms(400);
 if (! RC0_bit ) break;
 }
 }
 }

 if(! RC0_bit  && ! RC1_bit ){
 for (i = 9; i >= 0; i--){
 Converter(i);
 Dezena(num1, num2, num3, num4);
 if (! RC0_bit ) break;
 for (j = 9; j >= 0; j--){
 Converter(j);
 Unidade(num1, num2, num3, num4);
 delay_ms(400);
 if (! RC0_bit ) break;
 }
 }
 }


 }

}
