// ============================================================
// SISY HS12 LAB7 Exercise-1 _ biei/dqtm
// Read analog input in ADC and send to parallel output Port-D
// ============================================================

int analogPin = 0;     // analog input for ADC
  
void setup() {
  DDRD = DDRD | B11111111;
  DDRB = DDRB | B00000001;
}

void loop() {
  PORTB = PORTB ^ B00000001;              // toggle Port-B bit0
  PORTD = (analogRead(analogPin) >> 2);   // write all 8 bits of Port-D simultaneously
}
