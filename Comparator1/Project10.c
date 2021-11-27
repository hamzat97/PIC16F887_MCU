void main() {
 ANSEL = ANSELH = 0;
 TRISA = 0x00;
 C1R_bit = 0;
 C1CH0_bit = 1;
 C1CH1_bit = 0;
 C1POL_bit = 0;
 C1ON_bit = 1;
 while(1) {
  PORTA.B4 = C1OUT_bit;
 }
}