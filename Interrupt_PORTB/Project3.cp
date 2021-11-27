#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/Interrupt_PORTB/Project3.c"
int cnt = 0;

void interrupt() {
 if (RBIF_bit == 1) {
 cnt++;
 RBIF_bit = 0;
 }
}

void INVERT() {
 RD3_bit = ~RD3_bit;
 cnt = 0;
}

void main() {
 ANSEL = ANSELH = 0;
 TRISD = 0x00;
 TRISB = 0xFF;
 PORTD = 0x00;
 GIE_bit = 1;
 RBIE_bit = 1;
 IOCB5_bit = 1;
 while(1) {
 if (cnt == 1) {
 INVERT();
 }
 }
}
