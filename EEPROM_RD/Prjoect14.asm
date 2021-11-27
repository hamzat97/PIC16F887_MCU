
_main:

;Prjoect14.c,1 :: 		void main() {
;Prjoect14.c,2 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Prjoect14.c,3 :: 		PORTC = 0;
	CLRF       PORTC+0
;Prjoect14.c,4 :: 		PORTD = 0;
	CLRF       PORTD+0
;Prjoect14.c,5 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Prjoect14.c,6 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Prjoect14.c,7 :: 		EEADR = 0x00;
	CLRF       EEADR+0
;Prjoect14.c,8 :: 		while(1) {
L_main0:
;Prjoect14.c,9 :: 		EEPGD_bit = 1;
	BSF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;Prjoect14.c,10 :: 		RD_bit = 1;
	BSF        RD_bit+0, BitPos(RD_bit+0)
;Prjoect14.c,11 :: 		PORTC = EEADR;
	MOVF       EEADR+0, 0
	MOVWF      PORTC+0
;Prjoect14.c,12 :: 		PORTD = EEDAT;
	MOVF       EEDAT+0, 0
	MOVWF      PORTD+0
;Prjoect14.c,13 :: 		delay_ms(1000);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Prjoect14.c,14 :: 		EEADR++;
	INCF       EEADR+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      EEADR+0
;Prjoect14.c,15 :: 		}
	GOTO       L_main0
;Prjoect14.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
