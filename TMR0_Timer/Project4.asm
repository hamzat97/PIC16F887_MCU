
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project4.c,4 :: 		void Interrupt() {
;Project4.c,5 :: 		if (TMR0IF_bit == 1) {
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;Project4.c,6 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Project4.c,7 :: 		TMR0 = 175;
	MOVLW      175
	MOVWF      TMR0+0
;Project4.c,8 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Project4.c,9 :: 		}
L_Interrupt0:
;Project4.c,10 :: 		}
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

_Count:

;Project4.c,12 :: 		void Count() {
;Project4.c,13 :: 		if (var == 1) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count12
	MOVLW      1
	XORWF      _var+0, 0
L__Count12:
	BTFSS      STATUS+0, 2
	GOTO       L_Count1
;Project4.c,14 :: 		PORTD = 0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Project4.c,15 :: 		}
L_Count1:
;Project4.c,16 :: 		if (var == 2) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count13
	MOVLW      2
	XORWF      _var+0, 0
L__Count13:
	BTFSS      STATUS+0, 2
	GOTO       L_Count2
;Project4.c,17 :: 		PORTD = 0b01011011;
	MOVLW      91
	MOVWF      PORTD+0
;Project4.c,18 :: 		}
L_Count2:
;Project4.c,19 :: 		if (var == 3) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count14
	MOVLW      3
	XORWF      _var+0, 0
L__Count14:
	BTFSS      STATUS+0, 2
	GOTO       L_Count3
;Project4.c,20 :: 		PORTD = 0b01001111;
	MOVLW      79
	MOVWF      PORTD+0
;Project4.c,21 :: 		}
L_Count3:
;Project4.c,22 :: 		if (var == 4) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count15
	MOVLW      4
	XORWF      _var+0, 0
L__Count15:
	BTFSS      STATUS+0, 2
	GOTO       L_Count4
;Project4.c,23 :: 		PORTD = 0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Project4.c,24 :: 		}
L_Count4:
;Project4.c,25 :: 		if (var == 5) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count16
	MOVLW      5
	XORWF      _var+0, 0
L__Count16:
	BTFSS      STATUS+0, 2
	GOTO       L_Count5
;Project4.c,26 :: 		PORTD = 0b01101101;
	MOVLW      109
	MOVWF      PORTD+0
;Project4.c,27 :: 		var = 0;
	CLRF       _var+0
	CLRF       _var+1
;Project4.c,28 :: 		}
L_Count5:
;Project4.c,29 :: 		}
L_end_Count:
	RETURN
; end of _Count

_main:

;Project4.c,31 :: 		void main() {
;Project4.c,32 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project4.c,33 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project4.c,34 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project4.c,35 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Project4.c,36 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;Project4.c,37 :: 		T0CS_bit = 0;
	BCF        T0CS_bit+0, BitPos(T0CS_bit+0)
;Project4.c,38 :: 		PSA_bit = 0;
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;Project4.c,39 :: 		PS0_bit = 1;
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;Project4.c,40 :: 		PS1_bit = 1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;Project4.c,41 :: 		PS2_bit = 1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;Project4.c,42 :: 		TMR0 = 175;
	MOVLW      175
	MOVWF      TMR0+0
;Project4.c,43 :: 		while(1) {
L_main6:
;Project4.c,44 :: 		if (cnt == 15) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      15
	XORWF      _cnt+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Project4.c,45 :: 		Count();
	CALL       _Count+0
;Project4.c,46 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Project4.c,47 :: 		var++;
	INCF       _var+0, 1
	BTFSC      STATUS+0, 2
	INCF       _var+1, 1
;Project4.c,48 :: 		}
L_main8:
;Project4.c,49 :: 		}
	GOTO       L_main6
;Project4.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
