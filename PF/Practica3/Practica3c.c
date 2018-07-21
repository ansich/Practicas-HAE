   char un = 0;
   char de = 0;

void interrupt() {
     if( INTCON.INT0IE && INTCON.INT0IF ){
         PORTB.B1 = !PORTB.B1;
         INTCON.INT0IF = 0;
          if(un == 9)
           {
             if (de == 9)
             {
              de = 0;
             }
             else
             {
              de++;
             }
             un = 0;
           }
           else
           {
             un++;
           }
       }
}

void main() {
     char numeros[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
     INTCON2.B7 = 0;
     INTCON2.B6 = 0;
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;

     TRISB.B0 = 1;
     TRISB.B1 = 0;
     TRISC = 0x00;
     TRISD = 0x00;
     
     while(1)
     {
     PORTC= numeros[un];
       PORTD = 0x01;
       delay_ms(20);
       PORTD = 0x03;

       PORTC= numeros[de];
       PORTD = 0x02;
       delay_ms(20);
       PORTD = 0x03;
     }
}
