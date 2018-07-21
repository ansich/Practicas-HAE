char[] letras = {0x01, 0x02, 0x04, 0x08};
char estado = 1;

void interrupt(){

     if(estado){
         portc= 0x0C;
         delay_ms(3000);
         portc= 0x06;
         delay_ms(3000);
         portc= 0x03;
         delay_ms(3000);

     }
     
     INTCON.INT0IF=0;
     
}

void main() {

      trisb.b0=1;
      trisc=0;
      delay_ms(5000);
      portc=0x0C;
      INTCON.GIE=1;
      INTCON.INT0IE=1;
      INTCON.INT0IF=0;
      INTCON2.INTEDG0=1;
      
      
      while(1){


      }
}