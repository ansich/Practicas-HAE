
_main:

;Practica1.c,1 :: 		void main() {
;Practica1.c,2 :: 		char led = 0x01;
	MOVLW       1
	MOVWF       main_led_L0+0 
	MOVLW       128
	MOVWF       main_led2_L0+0 
;Practica1.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1.c,18 :: 		while (1)
L_main0:
;Practica1.c,20 :: 		if (led == 0x00)
	MOVF        main_led_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;Practica1.c,21 :: 		led = 0x02;
	MOVLW       2
	MOVWF       main_led_L0+0 
L_main2:
;Practica1.c,22 :: 		if (led2 == 0x00)
	MOVF        main_led2_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Practica1.c,23 :: 		led2 = 0x40;
	MOVLW       64
	MOVWF       main_led2_L0+0 
L_main3:
;Practica1.c,25 :: 		if (led == 0x08)
	MOVF        main_led_L0+0, 0 
	XORLW       8
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Practica1.c,27 :: 		led = (led << 1);
	RLCF        main_led_L0+0, 1 
	BCF         main_led_L0+0, 0 
;Practica1.c,28 :: 		led2 = (led2 >> 1);
	RRCF        main_led2_L0+0, 1 
	BCF         main_led2_L0+0, 7 
;Practica1.c,29 :: 		}
L_main4:
;Practica1.c,30 :: 		PORTC = led+led2;
	MOVF        main_led2_L0+0, 0 
	ADDWF       main_led_L0+0, 0 
	MOVWF       PORTC+0 
;Practica1.c,31 :: 		led = (led << 1);
	RLCF        main_led_L0+0, 1 
	BCF         main_led_L0+0, 0 
;Practica1.c,32 :: 		led2 = (led2 >> 1);
	RRCF        main_led2_L0+0, 1 
	BCF         main_led2_L0+0, 7 
;Practica1.c,33 :: 		DELAY_MS(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;Practica1.c,34 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1.c,35 :: 		DELAY_MS(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
;Practica1.c,36 :: 		}
	GOTO        L_main0
;Practica1.c,37 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
