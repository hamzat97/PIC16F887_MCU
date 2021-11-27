#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/Comparator2/Project11.c"
void main() {
 ANSEL = ANSELH = 0;
 TRISA = 0x00;
 C2R_bit = 0;
 C2CH0_bit = 1;
 C2CH1_bit = 0;
 C2POL_bit = 0;
 C2ON_bit = 1;
 while(1) {
 PORTA.B5 = C2OUT_bit;
 }
}
