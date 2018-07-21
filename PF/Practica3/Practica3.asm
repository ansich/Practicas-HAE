
_main:

;Practica3.c,1 :: 		void main() {
;Practica3.c,2 :: 		char pulsado = 0;
	CLRF        main_pulsado_L0+0 
;Practica3.c,4 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;Practica3.c,5 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;Practica3.c,6 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;Practica3.c,8 :: 		while(1)
L_main0:
;Practica3.c,10 :: 		if (!PORTB.B0 && !pulsado)
	BTFSC       PORTB+0, 0 
	GOTO        L_main4
	MOVF        main_pulsado_L0+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main14:
;Practica3.c,12 :: 		pulsado = 1;
	MOVLW       1
	MOVWF       main_pulsado_L0+0 
;Practica3.c,13 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3.c,14 :: 		}
L_main4:
;Practica3.c,15 :: 		if (PORTB.B0 && pulsado)
	BTFSS       PORTB+0, 0 
	GOTO        L_main7
	MOVF        main_pulsado_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
L__main13:
;Practica3.c,17 :: 		pulsado = 0;
	CLRF        main_pulsado_L0+0 
;Practica3.c,18 :: 		}
L_main7:
;Practica3.c,19 :: 		}
	GOTO        L_main0
;Practica3.c,20 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;Practica3.c,21 :: 		void interrupt() {
;Practica3.c,22 :: 		if( INTCON.INT0IE && INTCON.INT0IF ){
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt10
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt10
L__interrupt15:
;Practica3.c,23 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3.c,24 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3.c,25 :: 		}
L_interrupt10:
;Practica3.c,26 :: 		}
L_end_interrupt:
L__interrupt18:
	RETFIE      1
; end of _interrupt

_main2:

;Practica3.c,27 :: 		void main2() {
;Practica3.c,28 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;Practica3.c,29 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3.c,30 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;Practica3.c,31 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica3.c,33 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;Practica3.c,34 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;Practica3.c,35 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;Practica3.c,37 :: 		while(1)
L_main211:
;Practica3.c,39 :: 		}
	GOTO        L_main211
;Practica3.c,40 :: 		}
L_end_main2:
	RETURN      0
; end of _main2
