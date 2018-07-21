
_interrupt:

;practica3c.c,4 :: 		void interrupt(){
;practica3c.c,6 :: 		unidades++;
	INCF        _unidades+0, 1 
;practica3c.c,7 :: 		if(unidades==10){
	MOVF        _unidades+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;practica3c.c,8 :: 		unidades=0;
	CLRF        _unidades+0 
;practica3c.c,9 :: 		decenas++;
	INCF        _decenas+0, 1 
;practica3c.c,10 :: 		}
L_interrupt0:
;practica3c.c,11 :: 		if(decenas==10){
	MOVF        _decenas+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;practica3c.c,12 :: 		decenas=0;
	CLRF        _decenas+0 
;practica3c.c,13 :: 		}
L_interrupt1:
;practica3c.c,14 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica3c.c,15 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;practica3c.c,17 :: 		void main() {
;practica3c.c,19 :: 		short int digitos[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
	MOVLW       63
	MOVWF       main_digitos_L0+0 
	MOVLW       6
	MOVWF       main_digitos_L0+1 
	MOVLW       91
	MOVWF       main_digitos_L0+2 
	MOVLW       79
	MOVWF       main_digitos_L0+3 
	MOVLW       102
	MOVWF       main_digitos_L0+4 
	MOVLW       109
	MOVWF       main_digitos_L0+5 
	MOVLW       125
	MOVWF       main_digitos_L0+6 
	MOVLW       7
	MOVWF       main_digitos_L0+7 
	MOVLW       127
	MOVWF       main_digitos_L0+8 
	MOVLW       111
	MOVWF       main_digitos_L0+9 
;practica3c.c,20 :: 		trisa = 0x00;
	CLRF        TRISA+0 
;practica3c.c,21 :: 		porta = 0x00;
	CLRF        PORTA+0 
;practica3c.c,22 :: 		trisb = 0x01;
	MOVLW       1
	MOVWF       TRISB+0 
;practica3c.c,23 :: 		trisd = 0x00;
	CLRF        TRISD+0 
;practica3c.c,24 :: 		portd = 0x00;
	CLRF        PORTD+0 
;practica3c.c,25 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;practica3c.c,26 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;practica3c.c,27 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;practica3c.c,28 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;practica3c.c,29 :: 		INTCON2.RBPU=0;
	BCF         INTCON2+0, 7 
;practica3c.c,31 :: 		while(1){
L_main2:
;practica3c.c,33 :: 		porta=0x02;
	MOVLW       2
	MOVWF       PORTA+0 
;practica3c.c,34 :: 		portd=digitos[unidades];
	MOVLW       main_digitos_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_digitos_L0+0)
	MOVWF       FSR0H 
	MOVF        _unidades+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       _unidades+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;practica3c.c,35 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;practica3c.c,36 :: 		porta=0x01;
	MOVLW       1
	MOVWF       PORTA+0 
;practica3c.c,37 :: 		portd=digitos[decenas];
	MOVLW       main_digitos_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_digitos_L0+0)
	MOVWF       FSR0H 
	MOVF        _decenas+0, 0 
	ADDWF       FSR0, 1 
	MOVLW       0
	BTFSC       _decenas+0, 7 
	MOVLW       255
	ADDWFC      FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;practica3c.c,38 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;practica3c.c,39 :: 		}
	GOTO        L_main2
;practica3c.c,41 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
