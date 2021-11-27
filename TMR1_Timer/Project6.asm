
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project6.c,4 :: 		void Interrupt() {
;Project6.c,5 :: 		if (TMR1IF_bit == 1) {
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt0
;Project6.c,6 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Project6.c,7 :: 		TMR1L = 150;
	MOVLW      150
	MOVWF      TMR1L+0
;Project6.c,8 :: 		TMR1H = 150;
	MOVLW      150
	MOVWF      TMR1H+0
;Project6.c,9 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;Project6.c,10 :: 		}
L_Interrupt0:
;Project6.c,11 :: 		}
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

;Project6.c,13 :: 		void Count() {
;Project6.c,14 :: 		if (var == 1) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count12
	MOVLW      1
	XORWF      _var+0, 0
L__Count12:
	BTFSS      STATUS+0, 2
	GOTO       L_Count1
;Project6.c,15 :: 		PORTD = 0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Project6.c,16 :: 		}
L_Count1:
;Project6.c,17 :: 		if (var == 2) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count13
	MOVLW      2
	XORWF      _var+0, 0
L__Count13:
	BTFSS      STATUS+0, 2
	GOTO       L_Count2
;Project6.c,18 :: 		PORTD = 0b01011011;
	MOVLW      91
	MOVWF      PORTD+0
;Project6.c,19 :: 		}
L_Count2:
;Project6.c,20 :: 		if (var == 3) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count14
	MOVLW      3
	XORWF      _var+0, 0
L__Count14:
	BTFSS      STATUS+0, 2
	GOTO       L_Count3
;Project6.c,21 :: 		PORTD = 0b01001111;
	MOVLW      79
	MOVWF      PORTD+0
;Project6.c,22 :: 		}
L_Count3:
;Project6.c,23 :: 		if (var == 4) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count15
	MOVLW      4
	XORWF      _var+0, 0
L__Count15:
	BTFSS      STATUS+0, 2
	GOTO       L_Count4
;Project6.c,24 :: 		PORTD = 0b01100110;
	MOVLW      102
	MOVWF      PORTD+0
;Project6.c,25 :: 		}
L_Count4:
;Project6.c,26 :: 		if (var == 5) {
	MOVLW      0
	XORWF      _var+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Count16
	MOVLW      5
	XORWF      _var+0, 0
L__Count16:
	BTFSS      STATUS+0, 2
	GOTO       L_Count5
;Project6.c,27 :: 		PORTD = 0b01101101;
	MOVLW      109
	MOVWF      PORTD+0
;Project6.c,28 :: 		var = 0;
	CLRF       _var+0
	CLRF       _var+1
;Project6.c,29 :: 		}
L_Count5:
;Project6.c,30 :: 		}
L_end_Count:
	RETURN
; end of _Count

_main:

;Project6.c,32 :: 		void main() {
;Project6.c,33 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project6.c,34 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project6.c,35 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project6.c,36 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Project6.c,37 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;Project6.c,38 :: 		TMR1IE_bit = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;Project6.c,39 :: 		TMR1CS_bit = 0;
	BCF        TMR1CS_bit+0, BitPos(TMR1CS_bit+0)
;Project6.c,40 :: 		T1CKPS0_bit = 1;
	BSF        T1CKPS0_bit+0, BitPos(T1CKPS0_bit+0)
;Project6.c,41 :: 		T1CKPS1_bit = 1;
	BSF        T1CKPS1_bit+0, BitPos(T1CKPS1_bit+0)
;Project6.c,42 :: 		T1SYNC_bit = 1;
	BSF        T1SYNC_bit+0, BitPos(T1SYNC_bit+0)
;Project6.c,43 :: 		TMR1ON_bit = 1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Project6.c,44 :: 		TMR1L = 150;
	MOVLW      150
	MOVWF      TMR1L+0
;Project6.c,45 :: 		TMR1H = 150;
	MOVLW      150
	MOVWF      TMR1H+0
;Project6.c,46 :: 		while(1) {
L_main6:
;Project6.c,47 :: 		if (cnt == 5) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      5
	XORWF      _cnt+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Project6.c,48 :: 		var++;
	INCF       _var+0, 1
	BTFSC      STATUS+0, 2
	INCF       _var+1, 1
;Project6.c,49 :: 		Count();
	CALL       _Count+0
;Project6.c,50 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Project6.c,51 :: 		}
L_main8:
;Project6.c,52 :: 		}
	GOTO       L_main6
;Project6.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
