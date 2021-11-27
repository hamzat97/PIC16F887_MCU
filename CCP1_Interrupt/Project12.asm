
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Project12.c,3 :: 		void Interrupt() {
;Project12.c,4 :: 		if (CCP1IF_bit == 1) {
	BTFSS      CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
	GOTO       L_Interrupt0
;Project12.c,5 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Project12.c,6 :: 		CCP1IF_bit = 0;
	BCF        CCP1IF_bit+0, BitPos(CCP1IF_bit+0)
;Project12.c,7 :: 		}
L_Interrupt0:
;Project12.c,8 :: 		}
L_end_Interrupt:
L__Interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_INVERT:

;Project12.c,10 :: 		void INVERT() {
;Project12.c,11 :: 		RD0_bit = ~RD0_bit;
	MOVLW
	XORWF      RD0_bit+0, 1
;Project12.c,12 :: 		}
L_end_INVERT:
	RETURN
; end of _INVERT

_main:

;Project12.c,14 :: 		void main() {
;Project12.c,15 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Project12.c,16 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Project12.c,17 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Project12.c,18 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Project12.c,19 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;Project12.c,20 :: 		CCP1IE_bit = 1;
	BSF        CCP1IE_bit+0, BitPos(CCP1IE_bit+0)
;Project12.c,21 :: 		CCP1M0_bit = 0;
	BCF        CCP1M0_bit+0, BitPos(CCP1M0_bit+0)
;Project12.c,22 :: 		CCP1M1_bit = 1;
	BSF        CCP1M1_bit+0, BitPos(CCP1M1_bit+0)
;Project12.c,23 :: 		CCP1M2_bit = 1;
	BSF        CCP1M2_bit+0, BitPos(CCP1M2_bit+0)
;Project12.c,24 :: 		CCP1M3_bit = 0;
	BCF        CCP1M3_bit+0, BitPos(CCP1M3_bit+0)
;Project12.c,25 :: 		while(1) {
L_main1:
;Project12.c,26 :: 		if (cnt == 1) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      1
	XORWF      _cnt+0, 0
L__main8:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Project12.c,27 :: 		INVERT();
	CALL       _INVERT+0
;Project12.c,28 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Project12.c,29 :: 		}
L_main3:
;Project12.c,30 :: 		}
	GOTO       L_main1
;Project12.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
