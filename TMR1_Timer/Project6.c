int cnt = 0;
int var = 0;

void Interrupt() {
 if (TMR1IF_bit == 1) {
  cnt++;
  TMR1L = 150;
  TMR1H = 150;
  TMR1IF_bit = 0;
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
 PEIE_bit = 1;
 TMR1IE_bit = 1;
 TMR1CS_bit = 0;
 T1CKPS0_bit = 1;
 T1CKPS1_bit = 1;
 T1SYNC_bit = 1;
 TMR1ON_bit = 1;
 TMR1L = 150;
 TMR1H = 150;
 while(1) {
  if (cnt == 5) {
   var++;
   Count();
   cnt = 0;
  }
 }
}
