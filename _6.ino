int sensorValue;
int sensorLow = 1023;
int sensorHigh = 0;
//переменные фоторезистор
const int ledPin = 13;
//встроенный светлодиод-индикатор калибровки
void setup() {
pinMode(ledPin, OUTPUT);
digitalWrite(ledPin, HIGH);
while (millis() < 5000){
//цикл работает до 5с  
  sensorValue = analogRead(A0);
  if (sensorValue > sensorHigh){
    sensorHigh = sensorValue;
    }
  if (sensorValue < sensorLow){
    sensorLow = sensorValue;
    }
 }
digitalWrite(ledPin, LOW);
}
void loop() {
  sensorValue = analogRead(A0);
  int pitch = map(sensorValue,sensorLow,sensorHigh, 50, 4000);
//sensorLow,sensorHigh-границы входящих знчений,
//50-4000 диапазон частот генерируемый Arduino
  tone(8,pitch,20);
//воспроизведение звука(вывод для воспроизведения,частота,время проигрыша в мс)
  delay(10);
}
