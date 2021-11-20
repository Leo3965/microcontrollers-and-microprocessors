#define but0 RC0_bit  // botão liago ao pino
#define but1 RC1_bit  // botão liago ao pino
#define but2 RC2_bit  // botão liago ao pino
#define but3 RC3_bit  // botão liago ao pino
#define U0 RD0_bit
#define U1 RD1_bit
#define U2 RD2_bit
#define U3 RD3_bit

#define D0 RD4_bit
#define D1 RD5_bit
#define D2 RD6_bit
#define D3 RD7_bit


short number = 0;
unsigned short num1 = 0;
unsigned short num2 = 0;
unsigned short num3 = 0;
unsigned short num4 = 0;
short contador = 0;
int i = 0;
int j = 0;


void ConfigPIc()
{
 TRISD = 0B00000000;// PORTD SAIDA
 PORTD = 0B00000000;// RESET PORTD
 TRISC0_bit = 1;
 TRISC1_bit = 1;
 
 GIEH_bit = 1;// chave geral e alta prioridade
 PEIE_bit = 1;// Periféricos e baixa prioridade
 IPEN_bit = 1;// familia PIC18
 
 INT1IE_bit = 1;// habilita interrupção B1 INTCON3.INT1IE
 INT1IP_bit = 1;// alta prioridade
 INTEDG1_bit = 1;// borda de decida
 INT1IF_bit = 0;// reset flag interrupção
}

void Unidade(short num1, short num2, short num3, short num4)
{
 U0 = num1;
 U1 = num2;
 U2 = num3;
 U3 = num4;

}

void Dezena(short num1, short num2, short num3, short num4)
{
 D0 = num1;
 D1 = num2;
 D2 = num3;
 D3 = num4;
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
   while(1){ // loop infinito
     //Escrever(91, 63, 91, 6);     ]



     if(!but0 && but1){
     for (i = 0; i <= 9; i++){
              Converter(i);
              Dezena(num1, num2, num3, num4);
              if (!but0) break;
      for (j = 0; j <= 9; j++){
        Converter(j);
        Unidade(num1, num2, num3, num4);
        delay_ms(400);
        if (!but0) break;
      }
      }
     }

     if(!but0 && !but1){
     for (i = 9; i >= 0; i--){
              Converter(i);
              Dezena(num1, num2, num3, num4);
              if (!but0) break;
      for (j = 9; j >= 0; j--){
        Converter(j);
        Unidade(num1, num2, num3, num4);
        delay_ms(400);
        if (!but0) break;
      }
      }
     }


   }

}




/*****************************************************

#define U0 RD0_bit
#define U1 RD1_bit
#define U2 RD2_bit
#define U3 RD3_bit

#define D0 RD4_bit
#define D1 RD5_bit
#define D2 RD6_bit
#define D3 RD7_bit

#define but0 RC0_bit  // botão liago ao pino
#define but1 RC1_bit  // botão liago ao pino

short number = 0;
unsigned short num1 = 0;
unsigned short num2 = 0;
unsigned short num3 = 0;
unsigned short num4 = 0;
short contador = 0;
int i = 0;
int j = 0;

void ConfigPIc()
{
 TRISD = 0B00000000;// PORTD SAIDA
 PORTD = 0B00000000;// RESET PORTD
 TRISC0_bit = 1;
 TRISC1_bit = 1;
}

void Unidade(short num1, short num2, short num3, short num4)
{
 U0 = num1;
 U1 = num2;
 U2 = num3;
 U3 = num4;

}

void Dezena(short num1, short num2, short num3, short num4)
{
 D0 = num1;
 D1 = num2;
 D2 = num3;
 D3 = num4;
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

  ConfigPIc();

  //if(!TRISC0_bit){    delay_ms(900);
    for (i = 0; i <= 9; i++){
    Converter(i);
    Dezena(num1, num2, num3, num4);

      for (j = 0; j <= 9; j++){
        Converter(j);
        Unidade(num1, num2, num3, num4);
        delay_ms(900);
      }
    }
  //



  }

}                 */