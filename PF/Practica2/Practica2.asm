
_main:

;Practica2.c,1 :: 		void main() {
;Practica2.c,2 :: 		char numeros[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
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
	CLRF        main_un_L0+0 
	CLRF        main_delay_L0+0 
	CLRF        main_de_L0+0 
;Practica2.c,6 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;Practica2.c,7 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;Practica2.c,9 :: 		while(1)
L_main0:
;Practica2.c,12 :: 		PORTC= numeros[un];
	MOVLW       main_numeros_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_numeros_L0+0)
	MOVWF       FSR0H 
	MOVF        main_un_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica2.c,13 :: 		PORTD = 0x01;
	MOVLW       1
	MOVWF       PORTD+0 
;Practica2.c,14 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;Practica2.c,15 :: 		PORTD = 0x03;
	MOVLW       3
	MOVWF       PORTD+0 
;Practica2.c,18 :: 		PORTC= numeros[de];
	MOVLW       main_numeros_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_numeros_L0+0)
	MOVWF       FSR0H 
	MOVF        main_de_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTC+0 
;Practica2.c,19 :: 		PORTD = 0x02;
	MOVLW       2
	MOVWF       PORTD+0 
;Practica2.c,20 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
	NOP
;Practica2.c,21 :: 		PORTD = 0x03;
	MOVLW       3
	MOVWF       PORTD+0 
;Practica2.c,23 :: 		delay += 1;
	INCF        main_delay_L0+0, 1 
;Practica2.c,24 :: 		if (delay == 25)
	MOVF        main_delay_L0+0, 0 
	XORLW       25
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Practica2.c,26 :: 		delay = 0;
	CLRF        main_delay_L0+0 
;Practica2.c,27 :: 		if(un == 9)
	MOVF        main_un_L0+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Practica2.c,29 :: 		if (de == 5)
	MOVF        main_de_L0+0, 0 
	XORLW       5
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Practica2.c,31 :: 		de = 0;
	CLRF        main_de_L0+0 
;Practica2.c,32 :: 		}
	GOTO        L_main7
L_main6:
;Practica2.c,35 :: 		de++;
	INCF        main_de_L0+0, 1 
;Practica2.c,36 :: 		}
L_main7:
;Practica2.c,37 :: 		un = 0;
	CLRF        main_un_L0+0 
;Practica2.c,38 :: 		}
	GOTO        L_main8
L_main5:
;Practica2.c,41 :: 		un++;
	INCF        main_un_L0+0, 1 
;Practica2.c,42 :: 		}
L_main8:
;Practica2.c,43 :: 		}
L_main4:
;Practica2.c,44 :: 		}
	GOTO        L_main0
;Practica2.c,45 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
