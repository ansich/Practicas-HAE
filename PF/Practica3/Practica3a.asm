
_maina:

;Practica3a.c,1 :: 		void maina() {
;Practica3a.c,2 :: 		char pulsado = 0;
	CLRF        maina_pulsado_L0+0 
;Practica3a.c,4 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;Practica3a.c,5 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;Practica3a.c,6 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;Practica3a.c,8 :: 		while(1)
L_maina0:
;Practica3a.c,10 :: 		if (!PORTB.B0 && !pulsado)
	BTFSC       PORTB+0, 0 
	GOTO        L_maina4
	MOVF        maina_pulsado_L0+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_maina4
L__maina9:
;Practica3a.c,12 :: 		pulsado = 1;
	MOVLW       1
	MOVWF       maina_pulsado_L0+0 
;Practica3a.c,13 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3a.c,14 :: 		}
L_maina4:
;Practica3a.c,15 :: 		if (PORTB.B0 && pulsado)
	BTFSS       PORTB+0, 0 
	GOTO        L_maina7
	MOVF        maina_pulsado_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_maina7
L__maina8:
;Practica3a.c,17 :: 		pulsado = 0;
	CLRF        maina_pulsado_L0+0 
;Practica3a.c,18 :: 		}
L_maina7:
;Practica3a.c,19 :: 		}
	GOTO        L_maina0
;Practica3a.c,20 :: 		}
L_end_maina:
	RETURN      0
; end of _maina
