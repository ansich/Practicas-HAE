void interruptb() {
     if( INTCON.INT0IE && INTCON.INT0IF ){
     PORTB.B1 = !PORTB.B1;
     INTCON.INT0IF = 0;
     }
}
void mainb() {
     INTCON2.B7 = 0;
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;

     TRISB.B0 = 1;
     TRISB.B1 = 0;

     while(1)
     {
     }
}