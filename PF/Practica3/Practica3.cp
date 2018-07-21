#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/Practica3PabloFran/Practica3.c"
void main() {
 char pulsado = 0;

 TRISB.B0 = 1;
 TRISB.B1 = 0;
 INTCON2.B7 = 0;

 while(1)
 {
 if (!PORTB.B0 && !pulsado)
 {
 pulsado = 1;
 PORTB.B1 = !PORTB.B1;
 }
 if (PORTB.B0 && pulsado)
 {
 pulsado = 0;
 }
 }
}
void interrupt() {
 if( INTCON.INT0IE && INTCON.INT0IF ){
 PORTB.B1 = !PORTB.B1;
 INTCON.INT0IF = 0;
 }
}
void main2() {
 INTCON2.B7 = 0;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;

 TRISB.B0 = 1;
 TRISB.B1 = 0;
 INTCON2.B7 = 0;

 while(1)
 {
 }
}
