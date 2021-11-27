#line 1 "C:/Users/TAOUS/Desktop/PIC16F887/EEPROM_RD/Prjoect14.c"
void main() {
 ANSEL = ANSELH = 0;
 PORTC = 0;
 PORTD = 0;
 TRISC = 0x00;
 TRISD = 0x00;
 EEADR = 0x00;
 while(1) {
 EEPGD_bit = 1;
 RD_bit = 1;
 PORTC = EEADR;
 PORTD = EEDAT;
 delay_ms(1000);
 EEADR++;
 }
}
