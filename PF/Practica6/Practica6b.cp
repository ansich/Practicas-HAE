#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Prácticas HAE 15-16/Lunes de 12-30 a 14-30/Practica6PabloFran/Practica6b.c"

char vueltas = 1;

void interrupt()
{

 if (INTCON3.INT1IF == 1)
 {
 TMR0L = 0;
 TMR0H = 0;
 PORTC.B0 = 1;
 T0CON.TMR0ON = 1;
 INTCON3.INT1IF = 0;
 }
 else
 {
 INTCON.TMR0IF = 0;
 if (vueltas <=5)
 {
 TMR0L = 0;
 TMR0H = 0;
 T0CON.TMR0ON = 1;
 vueltas++;
 }
 else if (vueltas == 6)
 {
 TMR0L = 0xF1;
 TMR0H = 0xD8;
 T0CON.TMR0ON = 1;
 vueltas++;
 }
 else
 {
 PORTC.B0 = 0;
 vueltas = 1;
 }

 }

}

void main() {
 TRISC = 0;
 PORTC = 0;

 T0CON.T08BIT = 0;
 T0CON.T0CS = 0;
 T0CON.PSA = 0;

 T0CON.T0PS2 = 1;
 T0CON.T0PS1 = 1;
 T0CON.T0PS0 = 1;

 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 1;

 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;



 INTCON.GIE = 1;




 while(1){
 }
}
