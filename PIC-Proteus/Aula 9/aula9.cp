#line 1 "D:/Workspace/Projeto A3- Micontroladores e Microprocessadores/Proteus/Aula 9/aula9.c"



void interrupt()
{
 if(INT1IF_bit == 1)
 {
  RD0_bit  = 0;
 INT1IF_bit = 0;
 }
}

void interrupt_low()
{
 if(INT2IF_bit == 1)
 {
  RD0_bit  = 1;
 INT2IF_bit = 0;
 }
}

void ConfigPIC()
{
 TRISD0_bit = 0;
 TRISB0_bit = 1;
 ADCON1 = 0x0F;
 TRISB1_bit = 1;
  RD0_bit  = 0;
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
void ligaMotor1()
{
 if( RB0_bit  == 1)
 {
  RD0_bit  = 1;
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
