int PinCchave = 2;
bool flag_chaveligou = false;

void setup () {
  Serial.begin(9600);
  pinMode(PinCchave, INPUT_PULLUP);
  attachInterrupt (digitalPinToInterrupt(PinCchave), 
            tratarInterrupcaoPinochave, RISING) ;
}

void loop() {
  if (flag_chaveligou) {
    flag_chaveligou = false;
    Serial.print("Chave Ligada");
  }
} 

void tratarInterrupcaoPinochave() {
  flag_chaveligou = true;
}
