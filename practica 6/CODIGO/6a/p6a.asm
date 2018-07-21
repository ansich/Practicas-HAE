
_interrupt:

;p6a.c,3 :: 		void interrupt(){
;p6a.c,5 :: 		if(flag==0){
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;p6a.c,6 :: 		TMR0L=179;
	MOVLW       179
	MOVWF       TMR0L+0 
;p6a.c,7 :: 		flag++;
	INCF        _flag+0, 1 
;p6a.c,8 :: 		}else{
	GOTO        L_interrupt1
L_interrupt0:
;p6a.c,9 :: 		TMR0L=76;
	MOVLW       76
	MOVWF       TMR0L+0 
;p6a.c,10 :: 		flag=0;
	CLRF        _flag+0 
;p6a.c,11 :: 		}
L_interrupt1:
;p6a.c,12 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;p6a.c,13 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;p6a.c,15 :: 		void main() {
;p6a.c,16 :: 		TRISC.B0=0;
	BCF         TRISC+0, 0 
;p6a.c,17 :: 		T0CON=0x82;;
	MOVLW       130
	MOVWF       T0CON+0 
;p6a.c,18 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;p6a.c,19 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;p6a.c,20 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;p6a.c,21 :: 		while(1){
L_main2:
;p6a.c,22 :: 		if(flag==0){
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;p6a.c,23 :: 		PORTC.B0=1;
	BSF         PORTC+0, 0 
;p6a.c,24 :: 		}else{
	GOTO        L_main5
L_main4:
;p6a.c,25 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;p6a.c,26 :: 		}
L_main5:
;p6a.c,27 :: 		}
	GOTO        L_main2
;p6a.c,28 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
