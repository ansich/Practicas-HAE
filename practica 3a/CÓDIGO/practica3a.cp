#line 1 "D:/Archivos de programa/Proteus7.9Pro/PRÁCTICAS HAE/practica3a/CÓDIGO/practica3a.c"
void main() {

 char aux=0;
 trisb=0x01;
 portb=0x00;
 INTCON2.RBPU=0;

 while(1){

 if((portb.b0==1)&&(aux==0)){
 aux=1;
 }
 if((portb.b0==0)&&(aux==1)){
 portb.b1=!portb.b1;
 aux=0;
 }

 delay_ms(100);
 }

}
