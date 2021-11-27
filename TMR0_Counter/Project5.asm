
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project5.c,3 :: 		void Interrupt() {
;Project5.c,4 :: 		if (TMR0IF_bit == 1) {
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;Project5.c,5 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Project5.c,6 :: 		}
L_Interrupt0:
;Project5.c,7 :: 		}
L_end_Interrupt:
L__Interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_COUNT:

;Project5.c,9 :: 		void COUNT() {
;Project5.c,10 :: 		if (cnt == 1) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__COUNT12
	MOVLW      1
	XORWF      _cnt+0, 0
L__COUNT12:
	BTFSS      STATUS+0, 2
	GOTO       L_COUNT1
;Project5.c,11 :: 		PORTD = 0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Project5.c,12 :: 		}
L_COUNT1:
;Project5.c,13 :: 		if (cnt == 2) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__COUNT13
	MOVLW      2
	XORWF      _cnt+0, 0
L__COUNT13:
	BTFSS      STATUS+0, 2
	GOTO       L_COUNT2
;Project5.c,14 :: 		PORTD = 0b01011011;
	MOVLW      91
	MOVWF      PORTD+0
;Project5.c,15 :: 		}
L_COUNT2:
;Project5.c,16 :: 		if (cnt == 3) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__COUNT14
	MOVLW      3
	XORWF      _cnt+0, 0
L__COUNT14:
	BTFSS      STATUS+0, 2
	GOTO       L_COUNT3
;Project5.c,17 :: 		PORTD = 0b01001111;
	MOVLW      79
	MOVWF      PORTD+0
;Project5.c,18 :: 		}
L_COUNT3:
;Project5.c,19 :: 		if (cnt == 4) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__COUNT15
	MOVLW      4
	XORWF      _cnt+0, 0
L__COUNT15:
	BTFSS      STATUS+0, 2
	GOTO       L_COUNT4
;Project5.c,20 :: 		PORTD = 0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Project5.c,21 :: 		}
L_COUNT4:
;Project5.c,22 :: 		if (cnt == 5) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__COUNT16
	MOVLW      5
	XORWF      _cnt+0, 0
L__COUNT16:
	BTFSS      STATUS+0, 2
	GOTO       L_COUNT5
;Project5.c,23 :: 		PORTD = 0b01101101;
	MOVLW      109
	MOVWF      PORTD+0
;Project5.c,24 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Project5.c,25 :: 		}
L_COUNT5:
;Project5.c,26 :: 		}
L_end_COUNT:
	RETURN
; end of _COUNT

_main:

;Project5.c,28 :: 		void main() {
;Project5.c,29 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project5.c,30 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project5.c,31 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project5.c,32 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Project5.c,33 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;Project5.c,34 :: 		T0SE_bit = 1;
	BSF        T0SE_bit+0, BitPos(T0SE_bit+0)
;Project5.c,35 :: 		T0CS_bit = 1;
	BSF        T0CS_bit+0, BitPos(T0CS_bit+0)
;Project5.c,36 :: 		TMR0 = 2;
	MOVLW      2
	MOVWF      TMR0+0
;Project5.c,37 :: 		while(1) {
L_main6:
;Project5.c,38 :: 		if (TMR0 == 2) {
	MOVF       TMR0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Project5.c,39 :: 		COUNT();
	CALL       _COUNT+0
;Project5.c,40 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Project5.c,41 :: 		TMR0 = 0;
	CLRF       TMR0+0
;Project5.c,42 :: 		}
L_main8:
;Project5.c,43 :: 		}
	GOTO       L_main6
;Project5.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
