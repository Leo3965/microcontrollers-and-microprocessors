#include <TimerOne.h>

# define redLed 8
# define blueLed 9
# define greenLed 10

char color = 0;
int colorNumber;


void setup()
{
  pinMode(redLed, OUTPUT);
  pinMode(blueLed, OUTPUT);
  pinMode(greenLed, OUTPUT);
  
  Serial.begin(9600);
}

void loop()
{
  color = Serial.read();
  colorNumber = getColor(color);   
  changeLedColor(colorNumber);
  delay(1000);

}

// (Green - 1), (Blue - 2), (Red - 3), (Yellow - 4), (Orange - 5), (Purple - 6)
int getColor(char color)
{
  
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
  }
  
}

void changeLedColor(int color)
{
  switch (color)
  {
  case 1:
    analogWrite(redLed, 0);
  	analogWrite(blueLed, 0);
  	analogWrite(greenLed, 255);
  	delay(500); 
    break;

  case 2:
    analogWrite(redLed, 0);
  	analogWrite(blueLed, 255);
  	analogWrite(greenLed, 0);
  	delay(500);
    break;

  case 3:
    analogWrite(redLed, 255);
  	analogWrite(blueLed, 0);
  	analogWrite(greenLed, 0);
  	delay(500);
    break;
  
  case 4:
    analogWrite(redLed, 255);
  	analogWrite(blueLed, 0);
  	analogWrite(greenLed, 255);
  	delay(500);
    break;

  case 5:
    analogWrite(redLed, 255);
  	analogWrite(blueLed, 0);
  	analogWrite(greenLed, 90);
  	delay(500);
    break;

  case 6:
    analogWrite(redLed, 255);
  	analogWrite(blueLed, 255);
  	analogWrite(greenLed, 0);
  	delay(500);
    break;
  }
}