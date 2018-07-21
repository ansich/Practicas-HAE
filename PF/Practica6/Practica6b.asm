
_interrupt:

;Practica6b.c,4 :: 		void interrupt()
;Practica6b.c,7 :: 		if (INTCON3.INT1IF == 1)
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt0
;Practica6b.c,9 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;Practica6b.c,10 :: 		TMR0H = 0;
	CLRF        TMR0H+0 
;Practica6b.c,11 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;Practica6b.c,12 :: 		T0CON.TMR0ON = 1; // Aranca el timer
	BSF         T0CON+0, 7 
;Practica6b.c,13 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;Practica6b.c,14 :: 		}
	GOTO        L_interrupt1
L_interrupt0:
;Practica6b.c,17 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Practica6b.c,18 :: 		if (vueltas <=5)
	MOVF        _vueltas+0, 0 
	SUBLW       5
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt2
;Practica6b.c,20 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;Practica6b.c,21 :: 		TMR0H = 0;
	CLRF        TMR0H+0 
;Practica6b.c,22 :: 		T0CON.TMR0ON = 1; // Aranca el timer
	BSF         T0CON+0, 7 
;Practica6b.c,23 :: 		vueltas++;
	INCF        _vueltas+0, 1 
;Practica6b.c,24 :: 		}
	GOTO        L_interrupt3
L_interrupt2:
;Practica6b.c,25 :: 		else if (vueltas == 6)
	MOVF        _vueltas+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt4
;Practica6b.c,27 :: 		TMR0L = 0xF1;
	MOVLW       241
	MOVWF       TMR0L+0 
;Practica6b.c,28 :: 		TMR0H = 0xD8;
	MOVLW       216
	MOVWF       TMR0H+0 
;Practica6b.c,29 :: 		T0CON.TMR0ON = 1; // Aranca el timer
	BSF         T0CON+0, 7 
;Practica6b.c,30 :: 		vueltas++;
	INCF        _vueltas+0, 1 
;Practica6b.c,31 :: 		}
	GOTO        L_interrupt5
L_interrupt4:
;Practica6b.c,34 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;Practica6b.c,35 :: 		vueltas = 1;
	MOVLW       1
	MOVWF       _vueltas+0 
;Practica6b.c,36 :: 		}
L_interrupt5:
L_interrupt3:
;Practica6b.c,38 :: 		}
L_interrupt1:
;Practica6b.c,40 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt

_main:

;Practica6b.c,42 :: 		void main() {
;Practica6b.c,43 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica6b.c,44 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica6b.c,46 :: 		T0CON.T08BIT  = 0; // Timer 16 bits
	BCF         T0CON+0, 6 
;Practica6b.c,47 :: 		T0CON.T0CS = 0; // Para que use FOSC
	BCF         T0CON+0, 5 
;Practica6b.c,48 :: 		T0CON.PSA = 0; // Para que use Preescaler
	BCF         T0CON+0, 3 
;Practica6b.c,50 :: 		T0CON.T0PS2 = 1; // PRESCALER
	BSF         T0CON+0, 2 
;Practica6b.c,51 :: 		T0CON.T0PS1 = 1; // PRESCALER
	BSF         T0CON+0, 1 
;Practica6b.c,52 :: 		T0CON.T0PS0 = 1; // PRESCALER
	BSF         T0CON+0, 0 
;Practica6b.c,54 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;Practica6b.c,55 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;Practica6b.c,57 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Practica6b.c,58 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;Practica6b.c,62 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Practica6b.c,67 :: 		while(1){
L_main6:
;Practica6b.c,68 :: 		}
	GOTO        L_main6
;Practica6b.c,69 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
