short int decenas=0;
short int unidades=0;

void interrupt(){

     unidades++;
     if(unidades==10){
         unidades=0;
         decenas++;
     }
     if(decenas==10){
         decenas=0;
     }
     INTCON.INT0IF=0;
}

void main() {

     short int digitos[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
     trisa = 0x00;
     porta = 0x00;
     trisb = 0x01;
     trisd = 0x00;
     portd = 0x00;
     INTCON.GIE=1;
     INTCON.INT0IE=1;
     INTCON.INT0IF=0;
     INTCON2.INTEDG0=1;
     INTCON2.RBPU=0;

     while(1){
     
         porta=0x02;
         portd=digitos[unidades];
         delay_ms(20);
         porta=0x01;
         portd=digitos[decenas];
         delay_ms(20);
     }
     
}