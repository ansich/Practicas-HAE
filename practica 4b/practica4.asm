
_interrupt:

;practica4.c,1 :: 		void interrupt(){
;practica4.c,3 :: 		portc=0x05;
	MOVLW       5
	MOVWF       PORTC+0 
;practica4.c,4 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;practica4.c,6 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica4.c,8 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;practica4.c,10 :: 		void main() {
;practica4.c,12 :: 		trisb.b0=1;
	BSF         TRISB+0, 0 
;practica4.c,13 :: 		trisc=0;
	CLRF        TRISC+0 
;practica4.c,14 :: 		portc=0x09;
	MOVLW       9
	MOVWF       PORTC+0 
;practica4.c,15 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;practica4.c,16 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;practica4.c,17 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica4.c,18 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;practica4.c,21 :: 		while(1){
L_main1:
;practica4.c,24 :: 		}
	GOTO        L_main1
;practica4.c,25 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
