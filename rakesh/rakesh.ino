
int flow = A1;
int valve_pos = 9;
int data;
int flowrate;
void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(valve_pos, OUTPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
flowrate= analogRead(flow);
Serial.println(flowrate);

while (Serial.available() > 0) 
{
  data = Serial.read();//parseInt();
  }
analogWrite(valve_pos, data);
//Serial.println(data);
delay(500);
}
