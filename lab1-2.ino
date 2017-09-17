int switchState = 0;
void setup() { //Виконується один раз при запуску мікроконтролера. 
//Зазвичай використовується для конфігурації портів. 
  pinMode(3,OUTPUT);//Вхід
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(2,INPUT);//Вихід
}
void loop() {
switchState = digitalRead(2);
//digitalRead(2)зчитує показання з цифрового виводу 2. 
//Повертається HIGH (1) або LOW (0)і присвоює це значення switchStatе:

if (switchState == LOW){
// якщо не натиснули на кнопку 
digitalWrite(3, HIGH); //зелений LED горить
digitalWrite(4, LOW); //червоний LED не горить
digitalWrite(5, LOW); //червоний LED не горить
}
else { //якщо натиснули на кнопку
digitalWrite(3, LOW); //не горить
digitalWrite(4, LOW); //не горить
digitalWrite(5, HIGH);//горить

delay(250); //затримка 250 мс,через 250 мс загорить LED 4 а LED 5 потухне
digitalWrite(4, HIGH);
digitalWrite(5, LOW);
delay(250); //через 250 мс загорить LED 5 а LED 3-4 потухне.
//Це буде повторюватись циклічно,поки не натиснуть кнопку,
}
}
