#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/Practica4PabloFran/Practica4a.c"
 char primero = 1;
 char der[] = { 0x09,0x0C,0x06,0x03,0x09,0x0C,0x06,0x03 };

void interrupt()
{
 char a;

 if(primero)
 {
 primero = 0;

 for(a = 2; a <= 4; a++)
 {
 PORTC = der[7-a];
 delay_ms(100);
 }
 }
 else
 {
 for (a = 0; a <= 7;a++)
 {
 PORTC = der[a];
 delay_ms(100);
 }
 }
 INTCON.INT0IF = 0;
}

void main() {
TRISC = 0;

PORTC = der[7];
delay_ms(100);
PORTC = der[6];
delay_ms(100);

INTCON2.B6 = 1;
INTCON.INT0IF = 0;
INTCON.INT0IE = 1;
INTCON.GIE = 1;
while(1){
}
}
