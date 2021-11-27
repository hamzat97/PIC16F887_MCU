int cnt = 0;
int var = 0;

void Interrupt() {
 if (TMR0IF_bit == 1) {
  cnt++;
  TMR0 = 175;
  TMR0IF_bit = 0;
 }
}

void Count() {
 if (var == 1) {
  PORTD = 0b00000110;
 }
 if (var == 2) {
  PORTD = 0b01011011;
 }
 if (var == 3) {
  PORTD = 0b01001111;
 }
 if (var == 4) {
  PORTD = 0b01100110;
 }
 if (var == 5) {
  PORTD = 0b01101101;
  var = 0;
 }
}

void main() {
 ANSEL = ANSELH = 0;
 TRISD = 0x00;
 PORTD = 0x00;
 GIE_bit = 1;
 TMR0IE_bit = 1;
 T0CS_bit = 0;
 PSA_bit = 0;
 PS0_bit = 1;
 PS1_bit = 1;
 PS2_bit = 1;
 TMR0 = 175;
 while(1) {
  if (cnt == 15) {
   Count();
   cnt = 0;
   var++;
  }
 }
}