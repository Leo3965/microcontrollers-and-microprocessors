#define ledPin 13

void setup()
{
  pinMode(ledPin, OUTPUT);

  // Configuração do timer1 
  TCCR1A = 0;                        //confira timer para operação normal pinos OC1A e OC1B desconectados
  TCCR1B = 0;                        //limpa registrador
  TCCR1B |= (1<<CS10)|(1 << CS12);   // configura prescaler para 1024: CS12 = 1 e CS10 = 1

  TCNT1 = 0xC2F7;                    // incia timer com valor para que estouro ocorra em 1 segundo
                                     // 65536-(16MHz/1024/1Hz) = 49911 = 0xC2F7
  
  TIMSK1 |= (1 << TOIE1);           // habilita a interrupção do TIMER1
}


void loop()
{
  //loop principal. a manipulação do led é feita na ISR
}


ISR(TIMER1_OVF_vect)                              //interrupção do TIMER1 
{
  TCNT1 = 0xC2F7;                                 // Renicia TIMER
  digitalWrite(ledPin, digitalRead(ledPin) ^ 1); //inverte estado do led
}