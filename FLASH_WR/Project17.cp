#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/FLASH_WR/Project17.c"
void main() {
 ANSEL = ANSELH = 0;
 PORTC = 0;
 PORTD = 0;
 TRISC = 0x00;
 TRISD = 0x00;
 EEADR = 0x13;
 EEPGD_bit = 0;
 WREN_bit = 0;
 RD_bit = 1;
 PORTC = EEADR;
 PORTD = EEDAT;
 delay_ms(2000);
 EEPGD_bit = 0;
 RD_bit = 0;
 WREN_bit = 1;
 EEADR = 0x13;
 EEDAT = 0xAA;
 PORTC = EEADR;
 PORTD = EEDAT;
}
