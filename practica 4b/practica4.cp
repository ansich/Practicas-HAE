#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/practica4b/practica4.c"
void interrupt(){

 portc=0x05;
 delay_ms(5000);

 INTCON.INT0IF=0;

}

void main() {

 trisb.b0=1;
 trisc=0;
 portc=0x09;
 INTCON.GIE=1;
 INTCON.INT0IE=1;
 INTCON.INT0IF=0;
 INTCON2.INTEDG0=1;


 while(1){


 }
}
