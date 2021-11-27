
_main:

;Project11.c,1 :: 		void main() {
;Project11.c,2 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project11.c,3 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;Project11.c,4 :: 		C2R_bit = 0;
	BCF        C2R_bit+0, BitPos(C2R_bit+0)
;Project11.c,5 :: 		C2CH0_bit = 1;
	BSF        C2CH0_bit+0, BitPos(C2CH0_bit+0)
;Project11.c,6 :: 		C2CH1_bit = 0;
	BCF        C2CH1_bit+0, BitPos(C2CH1_bit+0)
;Project11.c,7 :: 		C2POL_bit = 0;
	BCF        C2POL_bit+0, BitPos(C2POL_bit+0)
;Project11.c,8 :: 		C2ON_bit = 1;
	BSF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Project11.c,9 :: 		while(1) {
L_main0:
;Project11.c,10 :: 		PORTA.B5 = C2OUT_bit;
	BTFSC      C2OUT_bit+0, BitPos(C2OUT_bit+0)
	GOTO       L__main3
	BCF        PORTA+0, 5
	GOTO       L__main4
L__main3:
	BSF        PORTA+0, 5
L__main4:
;Project11.c,11 :: 		}
	GOTO       L_main0
;Project11.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
