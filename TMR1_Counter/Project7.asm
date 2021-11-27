
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project7.c,3 :: 		void Interrupt() {
;Project7.c,4 :: 		if (TMR1IF_bit == 1) {
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;Project7.c,5 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Project7.c,6 :: 		}
L_Interrupt0:
;Project7.c,7 :: 		}
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

;Project7.c,9 :: 		void Count() {
;Project7.c,10 :: 		if (cnt == 1) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count12
	MOVLW      1
	XORWF      _cnt+0, 0
L__Count12:
	BTFSS      STATUS+0, 2
	GOTO       L_Count1
;Project7.c,11 :: 		PORTD = 0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Project7.c,12 :: 		}
L_Count1:
;Project7.c,13 :: 		if (cnt == 2) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count13
	MOVLW      2
	XORWF      _cnt+0, 0
L__Count13:
	BTFSS      STATUS+0, 2
	GOTO       L_Count2
;Project7.c,14 :: 		PORTD = 0b01011011;
	MOVLW      91
	MOVWF      PORTD+0
;Project7.c,15 :: 		}
L_Count2:
;Project7.c,16 :: 		if (cnt == 3) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count14
	MOVLW      3
	XORWF      _cnt+0, 0
L__Count14:
	BTFSS      STATUS+0, 2
	GOTO       L_Count3
;Project7.c,17 :: 		PORTD = 0b01001111;
	MOVLW      79
	MOVWF      PORTD+0
;Project7.c,18 :: 		}
L_Count3:
;Project7.c,19 :: 		if (cnt == 4) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count15
	MOVLW      4
	XORWF      _cnt+0, 0
L__Count15:
	BTFSS      STATUS+0, 2
	GOTO       L_Count4
;Project7.c,20 :: 		PORTD = 0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Project7.c,21 :: 		}
L_Count4:
;Project7.c,22 :: 		if (cnt == 5) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count16
	MOVLW      5
	XORWF      _cnt+0, 0
L__Count16:
	BTFSS      STATUS+0, 2
	GOTO       L_Count5
;Project7.c,23 :: 		PORTD = 0b01101101;
	MOVLW      109
	MOVWF      PORTD+0
;Project7.c,24 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Project7.c,25 :: 		}
L_Count5:
;Project7.c,26 :: 		}
L_end_Count:
	RETURN
; end of _Count

_main:

;Project7.c,28 :: 		void main() {
;Project7.c,29 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project7.c,30 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project7.c,31 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project7.c,32 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Project7.c,33 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;Project7.c,34 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;Project7.c,35 :: 		T1OSCEN_bit = 1;
	BSF        T1OSCEN_bit+0, BitPos(T1OSCEN_bit+0)
;Project7.c,36 :: 		TMR1CS_bit = 1;
	BSF        TMR1CS_bit+0, BitPos(TMR1CS_bit+0)
;Project7.c,37 :: 		T1SYNC_bit = 1;
	BSF        T1SYNC_bit+0, BitPos(T1SYNC_bit+0)
;Project7.c,38 :: 		TMR1ON_bit = 1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Project7.c,39 :: 		TMR1L = 1;
	MOVLW      1
	MOVWF      TMR1L+0
;Project7.c,40 :: 		while(1) {
L_main6:
;Project7.c,41 :: 		if (TMR1L == 3) {
	MOVF       TMR1L+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Project7.c,42 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Project7.c,43 :: 		Count();
	CALL       _Count+0
;Project7.c,44 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Project7.c,45 :: 		}
L_main8:
;Project7.c,46 :: 		}
	GOTO       L_main6
;Project7.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
