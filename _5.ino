
#include <Servo.h>
//стандартная библиотека управления сервомашинками
Servo myServo;
//создание объекта сервопривода
int const potPin = A0;
int potVal;
int angle;
//константы(потенциометр)
void setup() {
  myServo.attach(9);
  Serial.begin(9600);
}
void loop() {
potVal = analogRead(potPin);
Serial.print("potVal: ");
Serial.print(potVal);
//чтение значений потенциометра
angle = map(potVal, 0, 1023, 0, 179);
//Функция пропорционально переносит значение 
//(potVal) из текущего диапазона значений (0 .. 1023) 
//в новый диапазон (0 .. 179), заданный параметрами.
//мин значение входа-0,макс знач входа-1023,
//мин знач выхода-0,макс знач выхода-179
Serial.print(", angle: ");
Serial.println(angle);
myServo.write(angle);
//поворачивает двигатель на указаный угол
delay(15);
//задержка
}
