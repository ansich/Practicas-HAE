
_interrupt:

;Practica4a.c,4 :: 		void interrupt()
;Practica4a.c,8 :: 		if(primero)
	MOVF        _primero+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt0
;Practica4a.c,10 :: 		primero = 0;
	CLRF        _primero+0 
;Practica4a.c,12 :: 		for(a = 2; a <= 4; a++)
	MOVLW       2
	MOVWF       R2 
L_interrupt1:
	MOVF        R2, 0 
	SUBLW       4
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt2
;Practica4a.c,14 :: 		PORTC = der[7-a];
	MOVF        R2, 0 
	SUBLW       7
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _der+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_der+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica4a.c,15 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	DECFSZ      R11, 1, 1
	BRA         L_interrupt4
	NOP
;Practica4a.c,12 :: 		for(a = 2; a <= 4; a++)
	INCF        R2, 1 
;Practica4a.c,16 :: 		}
	GOTO        L_interrupt1
L_interrupt2:
;Practica4a.c,17 :: 		}
	GOTO        L_interrupt5
L_interrupt0:
;Practica4a.c,20 :: 		for (a = 0; a <= 7;a++)
	CLRF        R2 
L_interrupt6:
	MOVF        R2, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt7
;Practica4a.c,22 :: 		PORTC = der[a];
	MOVLW       _der+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_der+0)
	MOVWF       FSR0H 
	MOVF        R2, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica4a.c,23 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	DECFSZ      R11, 1, 1
	BRA         L_interrupt9
	NOP
;Practica4a.c,20 :: 		for (a = 0; a <= 7;a++)
	INCF        R2, 1 
;Practica4a.c,24 :: 		}
	GOTO        L_interrupt6
L_interrupt7:
;Practica4a.c,25 :: 		}
L_interrupt5:
;Practica4a.c,26 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica4a.c,27 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE      1
; end of _interrupt

_main:

;Practica4a.c,29 :: 		void main() {
;Practica4a.c,30 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica4a.c,32 :: 		PORTC = der[7];
	MOVF        _der+7, 0 
	MOVWF       PORTC+0 
;Practica4a.c,33 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
	NOP
;Practica4a.c,34 :: 		PORTC = der[6];
	MOVF        _der+6, 0 
	MOVWF       PORTC+0 
;Practica4a.c,35 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;Practica4a.c,37 :: 		INTCON2.B6 = 1;
	BSF         INTCON2+0, 6 
;Practica4a.c,38 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica4a.c,39 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;Practica4a.c,40 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica4a.c,41 :: 		while(1){
L_main12:
;Practica4a.c,42 :: 		}
	GOTO        L_main12
;Practica4a.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
