
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project3.c,3 :: 		void interrupt() {
;Project3.c,4 :: 		if (RBIF_bit == 1) {
	BTFSS      RBIF_bit+0, BitPos(RBIF_bit+0)
	GOTO       L_interrupt0
;Project3.c,5 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Project3.c,6 :: 		RBIF_bit = 0;
	BCF        RBIF_bit+0, BitPos(RBIF_bit+0)
;Project3.c,7 :: 		}
L_interrupt0:
;Project3.c,8 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_INVERT:

;Project3.c,10 :: 		void INVERT() {
;Project3.c,11 :: 		RD3_bit = ~RD3_bit;
	MOVLW
	XORWF      RD3_bit+0, 1
;Project3.c,12 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Project3.c,13 :: 		}
L_end_INVERT:
	RETURN
; end of _INVERT

_main:

;Project3.c,15 :: 		void main() {
;Project3.c,16 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project3.c,17 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project3.c,18 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;Project3.c,19 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project3.c,20 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Project3.c,21 :: 		RBIE_bit = 1;
	BSF        RBIE_bit+0, BitPos(RBIE_bit+0)
;Project3.c,22 :: 		IOCB5_bit = 1;
	BSF        IOCB5_bit+0, BitPos(IOCB5_bit+0)
;Project3.c,23 :: 		while(1) {
L_main1:
;Project3.c,24 :: 		if (cnt == 1) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      1
	XORWF      _cnt+0, 0
L__main8:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Project3.c,25 :: 		INVERT();
	CALL       _INVERT+0
;Project3.c,26 :: 		}
L_main3:
;Project3.c,27 :: 		}
	GOTO       L_main1
;Project3.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
