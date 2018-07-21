
_interrupt:

;practica3b.c,1 :: 		void interrupt(){
;practica3b.c,3 :: 		if((INTCON.INT0IE==1)&&(INTCON.INT0IF==1)){
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
L__interrupt5:
;practica3b.c,4 :: 		portb.b1=!portb.b1;
	BTG         PORTB+0, 1 
;practica3b.c,5 :: 		}
L_interrupt2:
;practica3b.c,6 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica3b.c,9 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;practica3b.c,11 :: 		void main() {
;practica3b.c,13 :: 		trisb=0x01;
	MOVLW       1
	MOVWF       TRISB+0 
;practica3b.c,14 :: 		portb=0x00;
	CLRF        PORTB+0 
;practica3b.c,15 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;practica3b.c,16 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;practica3b.c,17 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;practica3b.c,18 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;practica3b.c,20 :: 		while(1){
L_main3:
;practica3b.c,22 :: 		}
	GOTO        L_main3
;practica3b.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
