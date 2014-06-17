PROGRAM Divide;

USES Crt;

VAR

  Num1:integer;
  Num2:integer;
  Temp:integer;
  Remainder:integer;
  Quotient:integer;

BEGIN

  clrscr;
  write ('Enter a number- ');
  readln (Num1);
  writeln;
  write ('Enter another number- ');
  readln (Num2);
   IF Num1=Num2 THEN
    BEGIN
      Quotient:= 1;
      Remainder:= 0
    End;
  IF Num1 > Num2 THEN
    BEGIN
      Quotient:= Num1 DIV Num2;
      Remainder:= Num1 MOD Num2
    End;
  IF Num1 < Num2 THEN
    BEGIN
      Temp:= Num1;
      Num1:= Num2;
      Num2:= Temp;
      Quotient:= Num1 DIV Num2;
      Remainder:= Num1 MOD Num2
    End;

  clrscr;
  writeln;
  writeln ('The BIGGER number is: ',Num1);
  writeln;
  writeln ('The smaller number is: ',Num2);
  writeln;
  write ('When ',Num1,' is divided by ',Num2,' the answer is: ',Quotient);
  writeln (' R. ',Remainder,'.');
  writeln;
  writeln
END.