#line 1 "D:/Archivos de programa/Proteus7.9Pro/PRÁCTICAS HAE/practica3b/CÓDIGO/practica3b.c"
void interrupt(){

 if((INTCON.INT0IE==1)&&(INTCON.INT0IF==1)){
 portb.b1=!portb.b1;
 }
 INTCON.INT0IF=0;


}

void main() {

 trisb=0x01;
 portb=0x00;
 INTCON.GIE=1;
 INTCON.INT0IE=1;
 INTCON2.RBPU=0;
 INTCON2.INTEDG0=0;

 while(1){

 }

}
