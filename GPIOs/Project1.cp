#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/GPIOs/Project1.c"
void main() {
 ANSEL = ANSELH = 0;
 TRISC = 0xFF;
 TRISD = 0x00;
 while(1) {
 PORTD = 0b10000000;
 delay_ms(1000);
 PORTD = 0b00000000;
 delay_ms(1000);
 if (RC2_bit == 1) {
 PORTD = 0b10000001;
 }
 else {
 PORTD = 0b10000000;
 }
 }
}
