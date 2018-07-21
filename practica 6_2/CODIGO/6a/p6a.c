char flag=0;

void interrupt(){

     if(flag==0){
         TMR0L=179;
         flag++;
     }else{
         TMR0L=76;
         flag=0;
     }
     INTCON.TMR0IF=0;
}

void main() {
     TRISC.B0=0;
     T0CON=0x82;;
     INTCON.TMR0IF=0;
     INTCON.TMR0IE=1;
     INTCON.GIE=1;
     while(1){
         if(flag==0){
             PORTC.B0=1;
         }else{
             PORTC.B0=0;
         }
     }
}