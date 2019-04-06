void setup()
{
 Serial.begin(9600); 
 pinMode(13, OUTPUT);
}

void loop()
{
  //Serial.print(map(analogRead(1), 0, 1023, 0, 255));
  //Serial.print(map(analogRead(2), 0, 1023, 0, 255));
  Serial.print(map(analogRead(0), 0, 1023, 255, 0));
  Serial.print(",");
  //Serial.write('\t');
  Serial.print(map(analogRead(1), 0, 1023, 255, 0));
    Serial.print(",");
//  Serial.write('\t');
  Serial.print(map(analogRead(2), 0, 1023, 255, 0));
    Serial.print(",");
  //Serial.write('\t');
  delay(60);

}
