const int greenLEDin = 9;
const int redLEDin = 11;
const int blueLEDin = 10;

const int redSensorPin = A0;
//фоторезистор із червоним фільтром
const int greenSensorPin = A1;
//фоторезистор із зеленим фільтром
const int blueSensorPin = A2;
//фоторезистор із синім фільтром
int redValue = 0;
int greenValue = 0;
int blueValue = 0;

int redSensorValue = 0;
int greenSensorValue = 0;
int blueSensorValue = 0;

void setup() {
 Serial.begin(9600);

 pinMode(greenLEDin,OUTPUT);
 pinMode(redLEDin,OUTPUT);
 pinMode(blueLEDin,OUTPUT);
}

void loop() {
  redSensorValue = analogRead(redSensorPin);
  delay(5);
  greenSensorValue = analogRead(greenSensorPin);
  delay(5);
  blueSensorValue = analogRead(blueSensorPin);

  Serial.print("Raw Sensor Values \t Red: ");
  Serial.print(redSensorValue);
  Serial.print(" \t Green: ");
  Serial.print(greenSensorValue);
  Serial.print("Raw Sensor Values \t Blue: ");
  Serial.print(blueSensorValue);
  redValue = redSensorValue/4;
  greenValue = greenSensorValue/4;
  blueValue = blueSensorValue/4;

  Serial.print("Mapped Sensor \t Red: ");
  Serial.print(redValue);
  Serial.print(" \t Green: ");
  Serial.print(greenValue);
  Serial.print(" \t Blue: ");
  Serial.println(blueValue);

  analogWrite(redLEDin, redValue);
  analogWrite(greenLEDin, greenValue);
  analogWrite(blueLEDin, blueValue);
}
