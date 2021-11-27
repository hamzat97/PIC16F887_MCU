
_main:

;Project17.c,1 :: 		void main() {
;Project17.c,2 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project17.c,3 :: 		PORTC = 0;
	CLRF       PORTC+0
;Project17.c,4 :: 		PORTD = 0;
	CLRF       PORTD+0
;Project17.c,5 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Project17.c,6 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project17.c,7 :: 		EEADR = 0x13;
	MOVLW      19
	MOVWF      EEADR+0
;Project17.c,8 :: 		EEPGD_bit = 0;
	BCF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;Project17.c,9 :: 		WREN_bit = 0;
	BCF        WREN_bit+0, BitPos(WREN_bit+0)
;Project17.c,10 :: 		RD_bit = 1;
	BSF        RD_bit+0, BitPos(RD_bit+0)
;Project17.c,11 :: 		PORTC = EEADR;
	MOVF       EEADR+0, 0
	MOVWF      PORTC+0
;Project17.c,12 :: 		PORTD = EEDAT;
	MOVF       EEDAT+0, 0
	MOVWF      PORTD+0
;Project17.c,13 :: 		delay_ms(2000);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;Project17.c,14 :: 		EEPGD_bit = 0;
	BCF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;Project17.c,15 :: 		RD_bit = 0;
	BCF        RD_bit+0, BitPos(RD_bit+0)
;Project17.c,16 :: 		WREN_bit = 1;
	BSF        WREN_bit+0, BitPos(WREN_bit+0)
;Project17.c,17 :: 		EEADR = 0x13;
	MOVLW      19
	MOVWF      EEADR+0
;Project17.c,18 :: 		EEDAT = 0xAA;
	MOVLW      170
	MOVWF      EEDAT+0
;Project17.c,19 :: 		PORTC = EEADR;
	MOVF       EEADR+0, 0
	MOVWF      PORTC+0
;Project17.c,20 :: 		PORTD = EEDAT;
	MOVF       EEDAT+0, 0
	MOVWF      PORTD+0
;Project17.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
