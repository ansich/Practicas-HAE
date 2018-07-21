
_interruptb:

;Practica3b.c,1 :: 		void interruptb() {
;Practica3b.c,2 :: 		if( INTCON.INT0IE && INTCON.INT0IF ){
	BTFSS       INTCON+0, 4 
	GOTO        L_interruptb2
	BTFSS       INTCON+0, 1 
	GOTO        L_interruptb2
L__interruptb5:
;Practica3b.c,3 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3b.c,4 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3b.c,5 :: 		}
L_interruptb2:
;Practica3b.c,6 :: 		}
L_end_interruptb:
	RETURN      0
; end of _interruptb

_mainb:

;Practica3b.c,7 :: 		void mainb() {
;Practica3b.c,8 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;Practica3b.c,9 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3b.c,10 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;Practica3b.c,11 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica3b.c,13 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;Practica3b.c,14 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;Practica3b.c,16 :: 		while(1)
L_mainb3:
;Practica3b.c,18 :: 		}
	GOTO        L_mainb3
;Practica3b.c,19 :: 		}
L_end_mainb:
	RETURN      0
; end of _mainb
