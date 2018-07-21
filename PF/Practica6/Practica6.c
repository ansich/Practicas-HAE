    /*
char valor[] = {80,180};

char salida = 1;
                  
void interrupt()
{
  INTCON.TMR0IF = 0;
  salida = !salida;
  TMR0L = valor[salida];
  PORTC = salida;
}

void main() {
  TRISC = 0;

  T0CON.T08BIT  = 1;    // Timer 8 bits
  T0CON.T0CS = 0; // Para que use FOSC
  T0CON.PSA = 0; // Para que use Preescaler
  
  T0CON.T0PS2 = 0; // PRESCALER
  T0CON.T0PS1 = 1; // PRESCALER
  T0CON.T0PS0 = 0; // PRESCALER
  
  TMR0L = valor[salida];    // Valor alfa
  PORTC.B0 = 1;
  


  INTCON.TMR0IF = 0;
  INTCON.TMR0IE = 1;
  INTCON.GIE = 1;
  
  T0CON.TMR0ON = 1; // Arranca timer
  while(1){
  }
}     */