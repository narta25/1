const int sensorPin = A0;
const float baselineTemp = 25.0;//початкова температура
void setup(){
  Serial.begin(9600); // open a serial port
 for(int pinNumber = 2; pinNumber<5; pinNumber++){
   pinMode(pinNumber,OUTPUT);
   digitalWrite(pinNumber, LOW);
  }
} 
  void loop(){
    int sensorVal = analogRead(sensorPin);
    Serial.print("Sensor Value: ");
    Serial.print(sensorVal);
    // convert the ADC reading to voltage
    float voltage = (sensorVal/1024.0) * 5.0;
    Serial.print(", Volts: ");
    Serial.print(voltage);
    Serial.print(",degrees C: ");
    //перетворення напруги в температуру в грауси
    float temperature = (voltage - .5) * 100;
    Serial.println(temperature);
    if(temperature < baselineTemp){
    //температура<заданої температури,всі три 
    //світлодіода не горять 
      digitalWrite(2, LOW);//жовтий
      digitalWrite(3, LOW);//зелений
      digitalWrite(4, LOW);//червоний
    }else if (temperature >= baselineTemp+2 &&
    temperature < baselineTemp+4){
    //температура >= заданої температури на 2-4 градуси(до 4) 
    //горить жовтий світлодіод 
      digitalWrite(2, HIGH);
      digitalWrite(3, LOW);
      digitalWrite(4, LOW);
    }else if (temperature >= baselineTemp+4 &&
    temperature < baselineTemp+6){
    //температура >= заданої температури на 4-6 градуси(до 6) 
    //горить жовтий і зелений світлодіод 
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      digitalWrite(4, LOW);  
    }else if (temperature >= baselineTemp+6){
    //температура >= заданої температури на 6 і більше градусів 
    //горить жовтий,зелений,червоний світлодіод  
      digitalWrite(2, HIGH);
      digitalWrite(3, HIGH);
      digitalWrite(4, HIGH);  
    }
    delay(10);
    //затримка 10 мс
  }


