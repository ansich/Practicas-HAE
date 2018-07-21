void maina() {
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
