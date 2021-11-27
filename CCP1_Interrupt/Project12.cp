#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/CCP1_Interrupt/Project12.c"
int cnt = 0;

void Interrupt() {
 if (CCP1IF_bit == 1) {
 cnt++;
 CCP1IF_bit = 0;
 }
}

void INVERT() {
 RD0_bit = ~RD0_bit;
}

void main() {
 ANSEL = ANSELH = 0;
 TRISD = 0x00;
 PORTD = 0x00;
 GIE_bit = 1;
 PEIE_bit = 1;
 CCP1IE_bit = 1;
 CCP1M0_bit = 0;
 CCP1M1_bit = 1;
 CCP1M2_bit = 1;
 CCP1M3_bit = 0;
 while(1) {
 if (cnt == 1) {
 INVERT();
 cnt = 0;
 }
 }
}
