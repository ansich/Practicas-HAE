
_interrupt:

;Practica5b.c,21 :: 		void interrupt() {
;Practica5b.c,22 :: 		if( INTCON.RBIE && INTCON.RBIF ){
	BTFSS       INTCON+0, 3 
	GOTO        L_interrupt2
	BTFSS       INTCON+0, 0 
	GOTO        L_interrupt2
L__interrupt6:
;Practica5b.c,23 :: 		doInterr = !doInterr;
	MOVF        _doInterr+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _doInterr+0 
;Practica5b.c,24 :: 		x=PORTB;
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica5b.c,25 :: 		INTCON.RBIF = 0;
	BCF         INTCON+0, 0 
;Practica5b.c,26 :: 		if(!doInterr){
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt3
;Practica5b.c,27 :: 		return;
	GOTO        L__interrupt8
;Practica5b.c,28 :: 		}
L_interrupt3:
;Practica5b.c,29 :: 		cont = (cont + 1)%100;
	MOVF        _cont+0, 0 
	ADDLW       1
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _cont+0 
;Practica5b.c,30 :: 		ByteToStr (cont, txt);
	MOVF        R0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;Practica5b.c,31 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Practica5b.c,32 :: 		}
L_interrupt2:
;Practica5b.c,33 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_main:

;Practica5b.c,35 :: 		void main() {
;Practica5b.c,36 :: 		INTCON2.RBPU=0; //se habilitan las resistncias de pullup de los terminales del
	BCF         INTCON2+0, 7 
;Practica5b.c,38 :: 		x=PORTB;//para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;Practica5b.c,39 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;Practica5b.c,40 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;Practica5b.c,41 :: 		INTCON.GIE=1;
	BSF         INTCON+0, 7 
;Practica5b.c,43 :: 		TRISB.B4 = 1;
	BSF         TRISB+0, 4 
;Practica5b.c,45 :: 		cont = 0;
	CLRF        _cont+0 
;Practica5b.c,46 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Practica5b.c,48 :: 		while(1)
L_main4:
;Practica5b.c,50 :: 		}
	GOTO        L_main4
;Practica5b.c,51 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
