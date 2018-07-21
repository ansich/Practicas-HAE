#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/Practica5PabloFran/Practica5b.c"
 char x;
 char cont;
 char txt [4];
 char doInterr = 0;


sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

void interrupt() {
 if( INTCON.RBIE && INTCON.RBIF ){
 doInterr = !doInterr;
 x=PORTB;
 INTCON.RBIF = 0;
 if(!doInterr){
 return;
 }
 cont = (cont + 1)%100;
 ByteToStr (cont, txt);
 Lcd_out(1,1, txt);
 }
}

void main() {
 INTCON2.RBPU=0;

 x=PORTB;
 INTCON.RBIF=0;
 INTCON.RBIE=1;
 INTCON.GIE=1;

 TRISB.B4 = 1;

 cont = 0;
 Lcd_Init();

 while(1)
 {
 }
}
