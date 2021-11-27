int cnt = 0;

void interrupt() {
 if (INTF_bit == 1) {
  cnt++;
  INTF_bit = 0;
 }
}

void Invert() {
 RD3_bit = ~RD3_bit;
 cnt = 0;
}

void main() {
 ANSEL = ANSELH = 0;
 TRISD = 0x00;
 TRISB = 0xFF;
 PORTD = 0x00;
 GIE_bit = 1;
 INTE_bit = 1;
 while(1) {
  if (cnt == 1) {
   Invert();
  }
 }
}