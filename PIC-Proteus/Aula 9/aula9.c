#define B0 RB0_bit
#define Motor1 RD0_bit

void interrupt() //0008h
{
 if(INT1IF_bit == 1)
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
 TRISB0_bit = 1;// rb0 entrada (b0)
 ADCON1 = 0x0F;// configura os pinos do PORTB como digitais
 TRISB1_bit = 1;// rb1 entrada (int1)
 Motor1 = 0;
 GIEH_bit = 1;// chave geral e alta prioridade
 PEIE_bit = 1;// Periféricos e baixa prioridade
 IPEN_bit = 1;// familia PIC18
 
 INT1IE_bit = 1;// habilita interrupção int1
 INT1IP_bit = 1;// alta prioridade
 INTEDG1_bit = 1;// borda de subida
 INT1IF_bit = 0;// reset flag interrupção
 
 INT2IE_bit = 1;// habilita interrupção B2 INTCON3.INT2IE
 INT2IP_bit = 0;// baixa prioridade
 INTEDG2_bit = 1;// borda de subida
 INT2IF_bit = 0;// reset flag interrupção
 
 }
void ligaMotor1()
{
 if(B0 == 1)
 {
 Motor1 = 1;
 }
}
void main()
{
 ConfigPIC();
 while(1)
 {
 ligaMotor1();
 }
}