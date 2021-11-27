
_main:

;Project9.c,1 :: 		void main() {
;Project9.c,2 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project9.c,3 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Project9.c,4 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project9.c,5 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Project9.c,6 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project9.c,7 :: 		CHS0_bit = 0;
	BCF        CHS0_bit+0, BitPos(CHS0_bit+0)
;Project9.c,8 :: 		CHS1_bit = 0;
	BCF        CHS1_bit+0, BitPos(CHS1_bit+0)
;Project9.c,9 :: 		CHS2_bit = 0;
	BCF        CHS2_bit+0, BitPos(CHS2_bit+0)
;Project9.c,10 :: 		CHS3_bit = 0;
	BCF        CHS3_bit+0, BitPos(CHS3_bit+0)
;Project9.c,11 :: 		ADFM_bit = 1;
	BSF        ADFM_bit+0, BitPos(ADFM_bit+0)
;Project9.c,12 :: 		ADON_bit = 1;
	BSF        ADON_bit+0, BitPos(ADON_bit+0)
;Project9.c,13 :: 		while(1) {
L_main0:
;Project9.c,14 :: 		GO_bit = 1;
	BSF        GO_bit+0, BitPos(GO_bit+0)
;Project9.c,15 :: 		while(ADIF_bit == 0){};
L_main2:
	BTFSC      ADIF_bit+0, BitPos(ADIF_bit+0)
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Project9.c,16 :: 		PORTC = ADRESH;
	MOVF       ADRESH+0, 0
	MOVWF      PORTC+0
;Project9.c,17 :: 		PORTD = ADRESL;
	MOVF       ADRESL+0, 0
	MOVWF      PORTD+0
;Project9.c,18 :: 		ADIF_bit = 0;
	BCF        ADIF_bit+0, BitPos(ADIF_bit+0)
;Project9.c,19 :: 		}
	GOTO       L_main0
;Project9.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
