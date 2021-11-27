#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/TMR0_Counter/Project5.c"
int cnt = 0;

void Interrupt() {
 if (TMR0IF_bit == 1) {
 TMR0IF_bit = 0;
 }
}

void COUNT() {
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
 TMR0IE_bit = 1;
 T0SE_bit = 1;
 T0CS_bit = 1;
 TMR0 = 2;
 while(1) {
 if (TMR0 == 2) {
 COUNT();
 cnt++;
 TMR0 = 0;
 }
 }
}
