#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/CCP2_Interrupt/Prjoect13.c"
int cnt = 0;

void Interrupt() {
 if (CCP2IF_bit == 1) {
 cnt++;
 CCP2IF_bit = 0;
 }
}

void INVERT() {
 RD0_bit = ~RD0_bit;
}

void main() {
 TRISD = 0x00;
 PORTD = 0x00;
 GIE_bit = 1;
 PEIE_bit = 1;
 CCP2IE_bit = 1;
 CCP2M0_bit = 1;
 CCP2M1_bit = 0;
 CCP2M2_bit = 1;
 CCP2M3_bit = 0;
 while(1) {
 if (cnt == 1) {
 INVERT();
 cnt = 0;
 }
 }
}
