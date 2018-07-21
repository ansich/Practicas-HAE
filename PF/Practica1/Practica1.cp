#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/Practica1PabloFran/Practica1.c"
void main() {
 char led = 0x01;
 char led2 = 0x80;
 TRISC = 0;
 PORTC = 0;
#line 18 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/Practica1PabloFran/Practica1.c"
 while (1)
 {
 if (led == 0x00)
 led = 0x02;
 if (led2 == 0x00)
 led2 = 0x40;

 if (led == 0x08)
 {
 led = (led << 1);
 led2 = (led2 >> 1);
 }
 PORTC = led+led2;
 led = (led << 1);
 led2 = (led2 >> 1);
 DELAY_MS(200);
 PORTC = 0;
 DELAY_MS(100);
 }
}
