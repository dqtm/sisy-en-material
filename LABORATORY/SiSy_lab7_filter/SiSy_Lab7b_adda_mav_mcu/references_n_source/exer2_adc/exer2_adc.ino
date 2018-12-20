// ============================================================
// SISY HS12 LAB7 Exercise-2 _ biei/dqtm
// Read analog input in ADC and send to parallel output Port-D
// Add command to set or clear prescaler of the ADC clock divider
// ============================================================

int analogPin = 0;     // analog input for ADC
  
// defines for setting and clearing register bits
#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif
  
  
void setup() {
  DDRD = DDRD | B11111111;
  DDRB = DDRB | B00000001;
  
  // set or clear prescale to vary ADC-clock
  //sbi(ADCSRA,ADPS2) ;
  //sbi(ADCSRA,ADPS1) ;
  //sbi(ADCSRA,ADPS0) ;
  cbi(ADCSRA,ADPS2) ;
  cbi(ADCSRA,ADPS1) ;
  cbi(ADCSRA,ADPS0) ;
}

void loop() {
  PORTB = PORTB ^ B00000001;              // toggle Port-B bit0
  PORTD = (analogRead(analogPin) >> 2);   // write all 8 bits of Port-D simultaneously
}
