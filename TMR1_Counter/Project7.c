int cnt = 0;

void Interrupt() {
 if (TMR1IF_bit == 1) {
  TMR1IF_bit = 0;
 }
}

void Count() {
 if (cnt == 1) {
  PORTD = 0b00000110;
 }
 if (cnt == 2) {
  PORTD = 0b01011011;
 }
 if (cnt == 3) {
  PORTD = 0b01001111;
 }
 if (cnt == 4) {
  PORTD = 0b01100110;
 }
 if (cnt == 5) {
  PORTD = 0b01101101;
  cnt = 0;
 }
}

void main() {
 ANSEL = ANSELH = 0;
 TRISD = 0x00;
 PORTD = 0x00;
 GIE_bit = 1;
 PEIE_bit = 1;
 TMR1IE_bit = 1;
 T1OSCEN_bit = 1;
 TMR1CS_bit = 1;
 T1SYNC_bit = 1;
 TMR1ON_bit = 1;
 TMR1L = 1;
 while(1) {
  if (TMR1L == 3) {
   cnt++;
   Count();
   TMR1L = 0;
  }
 }
}