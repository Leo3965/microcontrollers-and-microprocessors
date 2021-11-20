# include <Adafruit_NeoPixel.h>
# ifdef __AVR__
# include <avr/power.h>
# endif
# define REDLED1 A1
# define BLUELED1 A2
# define GREENLED1 A3
# define REDLED2 11
# define GREENLED2 12
# define BLUELED2 13
# define LDR A0
# define NEO 12
# define NEOPIN 6
# define MOVE 7
# define BTN 3

bool presence = false;

int time = 0;
int red = 0;
int green = 0;
int blue = 0;

char color = 0;
int colorNumber;
int lrdValue = 0;

Adafruit_NeoPixel strip = Adafruit_NeoPixel(NEO, NEOPIN, NEO_GRB + NEO_KHZ800);

void setup()
{
  pinMode(REDLED1, OUTPUT);
  pinMode(BLUELED1, OUTPUT);
  pinMode(GREENLED1, OUTPUT);
  pinMode(REDLED2, OUTPUT);
  pinMode(BLUELED2, OUTPUT);
  pinMode(GREENLED2, OUTPUT);
  pinMode(NEOPIN, OUTPUT);
  pinMode(LDR, INPUT);
  pinMode(MOVE, INPUT);
  pinMode(BTN, INPUT);
    
  #if defined (__AVR_ATtiny85__)
    if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
  #endif

  strip.begin();
  strip.show(); // Inicializa todos os pixels para "off"
  
  Serial.begin(9600);

  attachInterrupt(digitalPinToInterrupt(BTN), TurnOfalarm, RISING);

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
  // Lendo monitor
    color = Serial.read();
    //Serial.println(color);
  
  //alarme(;
  
  //LDR
  lrdValue = analogRead(LDR);
  //if (lrdValue < 377) sendLux(lrdValue);
  //Serial.println(lrdValue);
  
  if (digitalRead(MOVE))
  {
    presence = true;
  }
  
  while(presence) {
    alarmLeds(100);
    alarmNEO(strip.Color(127, 0, 0), 50);
    sendAlert();

    if (!presence) {
      turnOnLights(0); // Desliga os leds
    } 
  }
  
  
  //Light
  if (color == 'g' || color == 'b' || color == 'r' || color == 'y' ||
   color == 'o' || color == 'p' || color == 't' || color == 's') {

    turnOnLights(getColor(color));

  }
  
}

// Liga todas as luzes
void turnOnLights(uint32_t colorNumber){
  changeLedColor(colorNumber);
  turnOnleds();
  turnOnNEO(strip.Color(red, green, blue), 50);
}


void turnOnleds() {
  analogWrite(REDLED1, red);
  analogWrite(BLUELED1, blue);
  analogWrite(GREENLED1, green);
  analogWrite(REDLED2, red);
  analogWrite(BLUELED2, blue);
  analogWrite(GREENLED2, green);
  delay(100); 
}

// (Green - 1), (Blue - 2), (Red - 3), (Yellow - 4), (Orange - 5), (Purple - 6), (Turn off - 0), (Sun - 7)
int getColor(char color) {
  
  if (color == 'g') {
    return 1;
  } else if (color == 'b') {
    return 2;
  } else if (color == 'r') {
    return 3;
  } else if (color == 'y') {
    return 4;
  } else if (color == 'o') {
    return 5;
  } else if (color == 'p') {
    return 6;
  } else if (color == 't') {
    return 0;
  } else if (color == 's') {
    return 7;
  }
  
}

void changeLedColor(int color) {
  switch (color) {
  case 1: // green
    red = 0;
    blue = 0;
    green = 255;
    break;

  case 2: // blue
    red = 0;
  	blue = 255;
  	green = 0;
    break;

  case 3: // red
    red = 255;
  	blue= 0;
  	green = 0;
    break;
  
  case 4: // yelow
    red= 255;
  	blue = 0;
  	green = 255;
    break;

  case 5: // orange
    red = 255;
  	blue = 0;
  	green = 150;
    break;

  case 6: // purple
    red = 255;
  	blue = 255;
  	green = 0;
    break;
  
  case 7: // sun color
    red = 150;
  	blue = 0;
  	green = 200;
    break;

  case 0: // turn off
    red = 0;
    blue = 0;
    green = 0;
  }
}

// Envia quantidade de lux para o backend
void sendLux(uint32_t lux){
  Serial.print("Luminosidade baixa: ");
  Serial.println(lux);
}

// Envia msg de perigo para o backend
void sendAlert() {
  Serial.println("Casa em perigo!");
}

// Preencher os pontos um após o outro com uma determinada cor
void turnOnNEO(uint32_t c, uint8_t wait) {
  for(uint16_t i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait);
  }
}

// Leds piscando
void alarmLeds(uint8_t wait) {
  changeLedColor(0);
  turnOnleds();
  delay(wait);
  changeLedColor(3);
  turnOnleds();
  delay(wait);
}

// Luzes piscando
void alarmNEO(uint32_t c, uint8_t wait) {
  for (int j=0; j<10; j++) {  //faz 10 ciclos
    for (int q=0; q < 3; q++) {
      for (uint16_t i=0; i < strip.numPixels(); i=i+3) {
        strip.setPixelColor(i+q, c);    //liga a cada 3 pixeis
      }
      strip.show();

      delay(wait);

      for (uint16_t i=0; i < strip.numPixels(); i=i+3) {
        strip.setPixelColor(i+q, 0);        //desativa a cada 3 pixeis
      }
    }
  }
}

void TurnOfalarm() {
  presence = false;
}

ISR(TIMER1_OVF_vect) //interrupção do TIMER1 
{
  TCNT1 = 0xC2F7; // Renicia TIMER
  time++;
  if (time == 30)
  {
    sendLux(lrdValue);
    time = 0;
  }
  
}