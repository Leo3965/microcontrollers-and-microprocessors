void setup()
{
  pinMode(ledPin, OUTPUT);
  
  // Configuração do TIMER1
  TCCR1A = 0;                //confira timer para operação normal
  TCCR1B = 0;                //limpa registrador
  TCNT1  = 0;                //zera temporizado
 
  OCR1A = 0x3D09;            // carrega registrador de comparação: 16MHz/1024/1Hz = 15625 = 0X3D09
  TCCR1B |= (1 << WGM12)|(1<<CS10)|(1 << CS12);   // modo CTC, prescaler de 1024: CS12 = 1 e CS10 = 1  
  TIMSK1 |= (1 << OCIE1A);  // habilita interrupção por igualdade de comparação
}
 
 
void loop()
{
  //loop principal. a manipulação do led é feita na ISR
}
 
ISR(TIMER1_COMPA_vect)          // interrupção por igualdade de comparação no TIMER1
{
  digitalWrite(ledPin, digitalRead(ledPin) ^ 1);   //inverte estado do LED
} https://www.embarcados.com.br/timers-do-atmega328-no-arduino/