#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/ADC/Project9.c"
void main() {
 ANSEL = ANSELH = 0;
 TRISC = 0x00;
 TRISD = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;
 CHS0_bit = 0;
 CHS1_bit = 0;
 CHS2_bit = 0;
 CHS3_bit = 0;
 ADFM_bit = 1;
 ADON_bit = 1;
 while(1) {
 GO_bit = 1;
 while(ADIF_bit == 0){};
 PORTC = ADRESH;
 PORTD = ADRESL;
 ADIF_bit = 0;
 }
}
