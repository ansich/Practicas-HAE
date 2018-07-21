void main() {
     char numeros[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
     char un = 0;
     char delay = 0;
  char de = 0;
  TRISC = 0x00;
  TRISD = 0x00;

  while(1)
  {
  //Unidades
  PORTC= numeros[un];
  PORTD = 0x01;
  delay_ms(20);
  PORTD = 0x03;

  //Decenas
  PORTC= numeros[de];
  PORTD = 0x02;
  delay_ms(20);
  PORTD = 0x03;
  
  delay += 1;
  if (delay == 25)
  {
  delay = 0;
  if(un == 9)
  {
   if (de == 5)
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
}