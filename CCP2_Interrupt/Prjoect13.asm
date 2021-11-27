
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Prjoect13.c,3 :: 		void Interrupt() {
;Prjoect13.c,4 :: 		if (CCP2IF_bit == 1) {
	BTFSS      CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
	GOTO       L_Interrupt0
;Prjoect13.c,5 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;Prjoect13.c,6 :: 		CCP2IF_bit = 0;
	BCF        CCP2IF_bit+0, BitPos(CCP2IF_bit+0)
;Prjoect13.c,7 :: 		}
L_Interrupt0:
;Prjoect13.c,8 :: 		}
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

;Prjoect13.c,10 :: 		void INVERT() {
;Prjoect13.c,11 :: 		RD0_bit = ~RD0_bit;
	MOVLW
	XORWF      RD0_bit+0, 1
;Prjoect13.c,12 :: 		}
L_end_INVERT:
	RETURN
; end of _INVERT

_main:

;Prjoect13.c,14 :: 		void main() {
;Prjoect13.c,15 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;Prjoect13.c,16 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;Prjoect13.c,17 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Prjoect13.c,18 :: 		PEIE_bit = 1;
	BSF        PEIE_bit+0, BitPos(PEIE_bit+0)
;Prjoect13.c,19 :: 		CCP2IE_bit = 1;
	BSF        CCP2IE_bit+0, BitPos(CCP2IE_bit+0)
;Prjoect13.c,20 :: 		CCP2M0_bit = 1;
	BSF        CCP2M0_bit+0, BitPos(CCP2M0_bit+0)
;Prjoect13.c,21 :: 		CCP2M1_bit = 0;
	BCF        CCP2M1_bit+0, BitPos(CCP2M1_bit+0)
;Prjoect13.c,22 :: 		CCP2M2_bit = 1;
	BSF        CCP2M2_bit+0, BitPos(CCP2M2_bit+0)
;Prjoect13.c,23 :: 		CCP2M3_bit = 0;
	BCF        CCP2M3_bit+0, BitPos(CCP2M3_bit+0)
;Prjoect13.c,24 :: 		while(1) {
L_main1:
;Prjoect13.c,25 :: 		if (cnt == 1) {
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      1
	XORWF      _cnt+0, 0
L__main8:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Prjoect13.c,26 :: 		INVERT();
	CALL       _INVERT+0
;Prjoect13.c,27 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;Prjoect13.c,28 :: 		}
L_main3:
;Prjoect13.c,29 :: 		}
	GOTO       L_main1
;Prjoect13.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
