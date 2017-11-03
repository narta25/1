const int controlPin1 = 2;
const int controlPin2 = 3;
const int enablePin = 9;
const int directionSwitchPin = 4;
const int onOffSwitchStateSwitchPin = 5;
const int potPin = A0;
//константы для вывода входа и выхода
int onOffSwitchState = 0;
int previousOnOffSwitchState = 0;
int directionSwitchState = 0;
int previosDirectionSwitchState = 0;
//эти переменные используют для хранения значений с входов.
//определяем изменения состояния,сравнивая состояния из цикла с другим
int motorEnabled = 0;
int motorSpeed = 0;
int motorDirection = 1;
//motorDirection отслеживает направление врщения двигателя
//motorPower-работает двигатель или нет
void setup() {
  pinMode(directionSwitchPin, INPUT);
  pinMode(onOffSwitchStateSwitchPin, INPUT);
  pinMode(controlPin1, OUTPUT);
  pinMode(controlPin2, OUTPUT);
  pinMode(enablePin, OUTPUT);
//направление каждого входного и выходного вывода
  digitalWrite(enablePin, LOW);
//выключаем двигатель 
}
void loop() {
  onOffSwitchState =
   digitalRead(onOffSwitchStateSwitchPin);
  delay(1);
  directionSwitchState =
   digitalRead(directionSwitchPin);
  motorSpeed = analogRead(potPin)/4;
//сохр состояние переключателя вкл/выкл в переменной onOffSwitchState
 if (onOffSwitchState != previosDirectionSwitchState){
  if (previosDirectionSwitchState == HIGH){
    motorEnabled = !motorEnabled;
//проверка изменения дотчика вкл\выкл    
//если есть разница между состочнием HIGH то motorPower=1
//если LOW то motorPower=0
  }
 }
 if (directionSwitchState !=
  previosDirectionSwitchState){
 if (directionSwitchState == HIGH){
  motorDirection = !motorDirection;
 }
//проверка изменения направления
  }
 if (motorDirection == 1){
   digitalWrite(controlPin1, HIGH);
   digitalWrite(controlPin2, LOW);
 }
 else {
  digitalWrite(controlPin1, LOW);
  digitalWrite(controlPin2, HIGH);
 //motorDirection определяет направление вращения двигателя.их задали 
 //значением HIGH и LOW.изменения выводов для нужного направдения вращения
 }
if (motorEnabled == 1){
   analogWrite(enablePin, motorSpeed);
}
//устанавливаем скорость вращения 
else {
  analogWrite(enablePin, 0);
  
}
previosDirectionSwitchState =
 directionSwitchState;
previousOnOffSwitchState = onOffSwitchState;
//сохр текущее состояние переклюателя в качестве предыдущего для следущего запуска
}

