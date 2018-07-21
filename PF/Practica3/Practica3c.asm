
_interrupt:

;Practica3c.c,4 :: 		void interrupt() {
;Practica3c.c,5 :: 		if( INTCON.INT0IE && INTCON.INT0IF ){
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
L__interrupt11:
;Practica3c.c,6 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;Practica3c.c,7 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3c.c,8 :: 		if(un == 9)
	MOVF        _un+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt3
;Practica3c.c,10 :: 		if (de == 9)
	MOVF        _de+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;Practica3c.c,12 :: 		de = 0;
	CLRF        _de+0 
;Practica3c.c,13 :: 		}
	GOTO        L_interrupt5
L_interrupt4:
;Practica3c.c,16 :: 		de++;
	INCF        _de+0, 1 
;Practica3c.c,17 :: 		}
L_interrupt5:
;Practica3c.c,18 :: 		un = 0;
	CLRF        _un+0 
;Practica3c.c,19 :: 		}
	GOTO        L_interrupt6
L_interrupt3:
;Practica3c.c,22 :: 		un++;
	INCF        _un+0, 1 
;Practica3c.c,23 :: 		}
L_interrupt6:
;Practica3c.c,24 :: 		}
L_interrupt2:
;Practica3c.c,25 :: 		}
L_end_interrupt:
L__interrupt13:
	RETFIE      1
; end of _interrupt

_main:

;Practica3c.c,27 :: 		void main() {
;Practica3c.c,28 :: 		char numeros[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
	MOVLW       63
	MOVWF       main_numeros_L0+0 
	MOVLW       6
	MOVWF       main_numeros_L0+1 
	MOVLW       91
	MOVWF       main_numeros_L0+2 
	MOVLW       79
	MOVWF       main_numeros_L0+3 
	MOVLW       102
	MOVWF       main_numeros_L0+4 
	MOVLW       109
	MOVWF       main_numeros_L0+5 
	MOVLW       125
	MOVWF       main_numeros_L0+6 
	MOVLW       7
	MOVWF       main_numeros_L0+7 
	MOVLW       127
	MOVWF       main_numeros_L0+8 
	MOVLW       103
	MOVWF       main_numeros_L0+9 
;Practica3c.c,29 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;Practica3c.c,30 :: 		INTCON2.B6 = 0;
	BCF         INTCON2+0, 6 
;Practica3c.c,31 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Practica3c.c,32 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;Practica3c.c,33 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica3c.c,35 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;Practica3c.c,36 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;Practica3c.c,37 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;Practica3c.c,38 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;Practica3c.c,40 :: 		while(1)
L_main7:
;Practica3c.c,42 :: 		PORTC= numeros[un];
	MOVLW       main_numeros_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_numeros_L0+0)
	MOVWF       FSR0H 
	MOVF        _un+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica3c.c,43 :: 		PORTD = 0x01;
	MOVLW       1
	MOVWF       PORTD+0 
;Practica3c.c,44 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;Practica3c.c,45 :: 		PORTD = 0x03;
	MOVLW       3
	MOVWF       PORTD+0 
;Practica3c.c,47 :: 		PORTC= numeros[de];
	MOVLW       main_numeros_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_numeros_L0+0)
	MOVWF       FSR0H 
	MOVF        _de+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica3c.c,48 :: 		PORTD = 0x02;
	MOVLW       2
	MOVWF       PORTD+0 
;Practica3c.c,49 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;Practica3c.c,50 :: 		PORTD = 0x03;
	MOVLW       3
	MOVWF       PORTD+0 
;Practica3c.c,51 :: 		}
	GOTO        L_main7
;Practica3c.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
