
_main:

;practica3a.c,1 :: 		void main() {
;practica3a.c,3 :: 		char aux=0;
	CLRF        main_aux_L0+0 
;practica3a.c,4 :: 		trisb=0x01;
	MOVLW       1
	MOVWF       TRISB+0 
;practica3a.c,5 :: 		portb=0x00;
	CLRF        PORTB+0 
;practica3a.c,6 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;practica3a.c,8 :: 		while(1){
L_main0:
;practica3a.c,10 :: 		if((portb.b0==1)&&(aux==0)){
	BTFSS       PORTB+0, 0 
	GOTO        L_main4
	MOVF        main_aux_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
L__main10:
;practica3a.c,11 :: 		aux=1;
	MOVLW       1
	MOVWF       main_aux_L0+0 
;practica3a.c,12 :: 		}
L_main4:
;practica3a.c,13 :: 		if((portb.b0==0)&&(aux==1)){
	BTFSC       PORTB+0, 0 
	GOTO        L_main7
	MOVF        main_aux_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
L__main9:
;practica3a.c,14 :: 		portb.b1=!portb.b1;
	BTG         PORTB+0, 1 
;practica3a.c,15 :: 		aux=0;
	CLRF        main_aux_L0+0 
;practica3a.c,16 :: 		}
L_main7:
;practica3a.c,18 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;practica3a.c,19 :: 		}
	GOTO        L_main0
;practica3a.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
