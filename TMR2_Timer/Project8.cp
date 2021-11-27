#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/TMR2_Timer/Project8.c"
int cnt = 0;
int var = 0;

void Interrupt() {
 if (TMR2IF_bit == 1) {
 cnt++;
 TMR2 = 100;
 TMR2IF_bit = 0;
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
 TMR2IE_bit = 1;
 T2CKPS0_bit = 1;
 T2CKPS0_bit = 1;
 TOUTPS0_bit = 1;
 TOUTPS1_bit = 1;
 TOUTPS2_bit = 1;
 TOUTPS3_bit = 1;
 TMR2ON_bit = 1;
 TMR2 = 100;
 while(1) {
 if (cnt == 40) {
 Count();
 cnt = 0;
 var++;
 }
 }
}
