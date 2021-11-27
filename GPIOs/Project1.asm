
_main:

;Project1.c,1 :: 		void main() {
;Project1.c,2 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project1.c,3 :: 		TRISC = 0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;Project1.c,4 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project1.c,5 :: 		while(1) {
L_main0:
;Project1.c,6 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;Project1.c,7 :: 		delay_ms(1000);
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
;Project1.c,8 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;Project1.c,9 :: 		delay_ms(1000);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Project1.c,10 :: 		if (RC2_bit == 1) {
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main4
;Project1.c,11 :: 		PORTD = 0b10000001;
	MOVLW      129
	MOVWF      PORTD+0
;Project1.c,12 :: 		}
	GOTO       L_main5
L_main4:
;Project1.c,14 :: 		PORTD = 0b10000000;
	MOVLW      128
	MOVWF      PORTD+0
;Project1.c,15 :: 		}
L_main5:
;Project1.c,16 :: 		}
	GOTO       L_main0
;Project1.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
