
char f = 0;
char alfa[] = {81,181};

void interrupt(){
       flag = !flag;
       TMR0L = alfa[f];
       PORTC = f;

       INTCON.TMR0IF = 0;
}

void main() {
     TRISC = 0x00;
     T0CON = 0xC2;

     PORTC.B0 = 1;
     INTCON.TMR0IF = 0;
     INTCON.TMR0IE = 1;
     INTCON.GIE = 1;


     while(1){
     }
}