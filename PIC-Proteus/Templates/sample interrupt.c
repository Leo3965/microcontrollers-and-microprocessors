#define B0 RB0_bit
#define B2 RB2_bit
#define B1 RB1_bit
#define Motor1 RD0_bit

void interrupt() //0008h   vetor de alta
{
 if(INT1IF_bit == 1) //INTCON3.INT1IF
 {
  Motor1 = 0;
  INT1IF_bit = 0;
 }
}

void interrupt_low() //0018h  vetor baixa
{
  if(INT2IF_bit == 1)
 {
   Motor1 = 1;
   INT2IF_bit = 0;
  }
}
void ConfigPIC()
{
 TRISD0_bit = 0;// rd0 saida (motor1)
 TRISB2_bit = 1;// rb2 entrada (b0)
 TRISB1_bit = 1;// rb1 entrada (int1)
 Motor1 = 0;

 GIEH_bit = 1;// chave geral e alta prioridade
 PEIE_bit = 1;// Periféricos e baixa prioridade
 IPEN_bit = 1;// familia PIC18

 INT1IE_bit = 1;// habilita interrupção B1 INTCON3.INT1IE
 INT1IP_bit = 1;// alta prioridade
 INTEDG1_bit = 1;// borda de subida
 INT1IF_bit = 0;// reset flag interrupção

 INT2IE_bit = 1;// habilita interrupção B2 INTCON3.INT2IE
 INT2IP_bit = 0;// baixa prioridade
 INTEDG2_bit = 1;// borda de subida
 INT2IF_bit = 0;// reset flag interrupção
}




void main()
{
  ConfigPIC();
  
  while(1)
  {

  }
}