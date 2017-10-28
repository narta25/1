const int switchPin = 8;
//имя переменной порта на котором установлен переключатель наклона
unsigned long previousTime = 0;
//переменная которая содержит время последнего изменения светлодиода
int switchState = 0;
//состояние переключателя
int prevSwitchState = 0;
//предыдущее состояние переключателяя
int led = 2;
// эту переменную используем для подсчета того,какой светлодиод 
//являеется следующим.Начмнается с вывода 2
long interval = 600000;
//интервал между включением светлодиодаючерез 
void setup() {
  for(int x = 2;x<8;x++){
//светлодиоидные выводы 2-7 в качестве выходов
    pinMode(x, OUTPUT);
  }
  pinMode(switchPin, INPUT);
}
//
void loop() {
  unsigned long currentTime = millis();
//когда нач цикл,мы получаем время работы кторое сохр под назв 
//локальной переменной currentTime
  if(currentTime - previousTime > interval){
    previousTime = currentTime;
//проверяет достаточно ли времени что бы вкл светлодиод
    digitalWrite(led, HIGH);
//когда пройдет время previousTime включится след светлодиод
    led++;
    if(led == 7){
//проверка:включон ли светлодиода на выводе 7       
    }
  }
 switchState = digitalRead(switchPin);
//когда мы проверели время что бы увидить изменение состояния
//переключателя,прочитаем значения с switchState
 if(switchState != prevSwitchState){
  for(int x = 2;x<8;x++){
    digitalWrite(x, LOW);
  }
 led = 2;
 previousTime = currentTime;
}
prevSwitchState = switchState;
//сохр значения switchStateчто бы их сравнить в след цикле
}
