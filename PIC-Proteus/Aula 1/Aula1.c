unsigned int num = 0;

void setup() {
    TRISD = 0b00000000;
    PORTD = 0b00000000;
    TRISC = 1;
    PORTC.RC2 = 1;
}

void turnOnLED(unsigned short num) {
     switch(num%8) {
       case 1: PORTD = 0b00000001; break;
       case 2: PORTD = 0b00000010; break;
       case 3: PORTD = 0b00000100; break;
       case 4: PORTD = 0b00001000; break;
       case 5: PORTD = 0b00010000; break;
       case 6: PORTD = 0b00100000; break;
       case 7: PORTD = 0b01000000; break;
       default: PORTD = 0b10000000; break;
     }
}

void main() {
    setup();

    while(1) {
        for (num = 0; num <= 8; num++){
        turnOnLED(num);
        delay_ms(900);
        }
        
        for (num = 8; num > 0; num--){
        turnOnLED(num);
        delay_ms(900);
        }
    }
}