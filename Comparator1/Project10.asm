
_main:

;Project10.c,1 :: 		void main() {
;Project10.c,2 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project10.c,3 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;Project10.c,4 :: 		C1R_bit = 0;
	BCF        C1R_bit+0, BitPos(C1R_bit+0)
;Project10.c,5 :: 		C1CH0_bit = 1;
	BSF        C1CH0_bit+0, BitPos(C1CH0_bit+0)
;Project10.c,6 :: 		C1CH1_bit = 0;
	BCF        C1CH1_bit+0, BitPos(C1CH1_bit+0)
;Project10.c,7 :: 		C1POL_bit = 0;
	BCF        C1POL_bit+0, BitPos(C1POL_bit+0)
;Project10.c,8 :: 		C1ON_bit = 1;
	BSF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Project10.c,9 :: 		while(1) {
L_main0:
;Project10.c,10 :: 		PORTA.B4 = C1OUT_bit;
	BTFSC      C1OUT_bit+0, BitPos(C1OUT_bit+0)
	GOTO       L__main3
	BCF        PORTA+0, 4
	GOTO       L__main4
L__main3:
	BSF        PORTA+0, 4
L__main4:
;Project10.c,11 :: 		}
	GOTO       L_main0
;Project10.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
