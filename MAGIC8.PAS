PROGRAM MAGIC8BALL;
USES GRAPH, CRT, BGIFONT1, BGIFONT2, BGIFONT3, BGIDRIV;
CONST
 gd:integer=detect;
VAR
 gm : integer;
 lowmode:integer;
 highmode:integer;
 ques:string;
 good:boolean;
 aga:boolean;
{$I BGIDRIV.INC}
{$I BGIFONT.INC}
PROCEDURE INTRO;
 VAR
  counter:integer;
  ch:char;
 BEGIN
  randomize;
  for counter:=1 to 5 do
   BEGIN
    setfillstyle(1,counter);
    floodfill(0,0,counter);
    delay(250);
   END;
  setfillstyle(1,2);
  floodfill(0,0,1);
  setcolor(black);
  circle(getmaxx div 2 ,getmaxy div 2, getmaxx div 4);
  setfillstyle(1,0);
  floodfill(getmaxx div 2, getmaxy div 2, 0);
  setcolor(white);
  circle(getmaxx div 2, getmaxy div 2, getmaxx div 12);
  setfillstyle(1,15);
  floodfill(getmaxx div 2, getmaxy div 2, 15);
  setcolor(black);
  settextstyle(10,0,4);
  settextjustify(1,1);
  outtextxy(getmaxx div 2, getmaxy div 11,'The Magic 8 Ball');
  settextstyle(3,0,5);
  outtextxy(getmaxx div 2 ,getmaxy div 2,'8');
  settextstyle(3,0,2);
  settextjustify(1,1);
  setcolor(blue);
  outtextxy(getmaxx div 2, getmaxy-15,'Programmed By: Brady Michael Holt');
  setcolor(yellow);
  outtextxy(getmaxx div 2, getmaxy-45,'Press Enter');
  REPEAT
   ch:=readkey;
  UNTIL ord(ch)=13;
 END;
PROCEDURE QUESTION;
 VAR
  xpos:integer;
  ch:char;
  uch:char;
  typed:integer;
 BEGIN
  xpos:=10;
  ques:='';
  typed:=0;
  clearviewport;
  settextjustify(1,1);
  settextstyle(3,0,3);
  setcolor(lightred);
  outtextxy(getmaxx div 2, 10,'Please Enter A Question For The Ball To Answer');
  setcolor(blue);
  rectangle(0,getmaxy div 2 - 10,getmaxx - 5, getmaxy div 2 + 17);
  settextjustify(1,1);
  setcolor(yellow);
  outtextxy(getmaxx div 2, getmaxy - 30,'Press Ctrl-Q To Quit');
  REPEAT
   ch:=readkey;
   IF ord(ch)=17 THEN
    halt(1);
   IF ord(ch) <> 13 THEN
    BEGIN
     IF ord(ch)=8 THEN
      BEGIN
        IF typed <= 0 THEN
         BEGIN
          typed:= 0;
         END
       ELSE
        BEGIN
         setcolor(black);
         typed:=typed-1;
         xpos:=xpos-13;
         ques:=copy(ques,1,typed-1);
         outtextxy(xpos, getmaxy div 2 + 3,'лл');
       END;
       END
     ELSE
      BEGIN
       IF typed >= 48 THEN
        BEGIN
         typed:=48;
        END
       ELSE
        BEGIN
         typed:=typed+1;
         uch:=upcase(ch);
         ques:=ques+uch;
         setcolor(white);
         settextstyle(3,0,2);
         outtextxy(xpos, getmaxy div 2 + 3, uch);
         xpos:=xpos+13;
        END;
       END;
     END;
  UNTIL ord(ch)=13;
 END;
PROCEDURE CONFIRM;
 VAR
  is:string[3];
  am:string[3];
  will:string[5];
  can:string[4];
  could:string[6];
  has:string[4];
  does:string[5];
  are:string[4];
  did:string[4];
  d:string[3];
  should:string[7];
 BEGIN
  good:=false;
  is:=copy(ques,1,3);
  am:=copy(ques,1,3);
  will:=copy(ques,1,5);
  can:=copy(ques,1,4);
  could:=copy(ques,1,6);
  has:=copy(ques,1,4);
  does:=copy(ques,1,5);
  are:=copy(ques,1,4);
  did:=copy(ques,1,4);
  d:=copy(ques,1,3);
  should:=copy(ques,1,7);
  IF (is='IS ') OR (am='AM ') OR (will='WILL ') OR (can='CAN ') OR (could='COULD ') THEN
  good:=true;
  IF (has='HAS ') OR (does='DOES ') OR (are='ARE ') OR (did='DID ') OR (d='DO ') OR (should='SHOULD ') THEN
  good:=true;
 END;
PROCEDURE DOAGAIN;
 BEGIN
  clearviewport;
  setcolor(white);
  settextstyle(3,0,4);
  settextjustify(centertext,centertext);
  outtextxy(getmaxx div 2, getmaxy div 2,'Please Enter A Yes Or No Question');
  delay(1500);
 END;
PROCEDURE ANSWER;
 VAR
  f:TEXT;
  ran: integer;
  counter: integer;
  ans:char;
  answ:string;
 BEGIN
  {$I-}
  assign(f, 'answers.txt');
  reset(f);
  {$I+}
  IF IOResult<>0 THEN
   BEGIN
    rewrite(f);
    writeln(f,'Maybe');
    writeln(f,'No');
    writeln(f,'No Way');
    writeln(f,'Of Course!');
    writeln(f,'Absolutely');
    writeln(f,'No Doubt');
    writeln(f,'Absolutely Not');
    writeln(f,'I''m Not Sure');
    writeln(f,'Yes');
    writeln(f,'I Have No Idea');
    writeln(f,'');
    writeln(f,'(The Above Comments Are The Ones Used By The Magic 8 Ball.');
    writeln(f,'Feel Free To Change Any Or All Of Them To Your Preference.)');
    reset(f);
   END;
  randomize;
  ran:=random(10);
  FOR counter:=1 TO ran + 1 DO
   readln(f,answ);
  clearviewport;
  randomize;
  for counter:=1 to 5 do
   BEGIN
    setfillstyle(1,counter);
    floodfill(0,0,counter);
    delay(250);
   END;
  setfillstyle(1,2);
  floodfill(0,0,1);
  setcolor(black);
  circle(getmaxx div 2 ,getmaxy div 2, getmaxx div 4);
  setfillstyle(1,0);
  floodfill(getmaxx div 2, getmaxy div 2, 0);
  setcolor(white);
  circle(getmaxx div 2, getmaxy div 2, getmaxx div 12);
  setfillstyle(1,15);
  floodfill(getmaxx div 2, getmaxy div 2, 15);
  setcolor(black);
  settextstyle(10,0,4);
  settextjustify(1,1);
  outtextxy(getmaxx div 2, getmaxy div 11,'The Magic 8 Ball Says:');
  settextstyle(2,0,5);
  outtextxy(getmaxx div 2, getmaxy div 2, answ);
  settextstyle(3,0,2);
  setcolor(yellow);
  outtextxy(getmaxx div 2, getmaxy -30,'Press Any Key');
  REPEAT UNTIL keypressed;
 END;
PROCEDURE AGAIN;
 VAR
  ch:char;
 BEGIN
  REPEAT
   aga:=false;
   clearviewport;
   settextjustify(1,1);
   settextstyle(6,0,4);
   setcolor(lightred);
   outtextxy(getmaxx div 2, getmaxy div 2,'Ask Another Question? (y/n)');
   ch:=readkey;
   ch:=upcase(ch);
   IF ch='Y' THEN
    aga:=true;
  UNTIL (ch='Y') OR (ch='N');
 END;
BEGIN
 registergraph;
 registerfonts;
 initgraphmode;
 IF graphresult <> grOk THEN
  halt(1);
 intro;
 REPEAT
  question;
  confirm;
  IF good=false THEN
   BEGIN
    REPEAT
     BEGIN
      doagain;
      question;
      confirm;
     END;
    UNTIL good=true;
   END;
  answer;
  again;
  UNTIL aga=false;
 closegraph;
 restorecrtmode;
 clrscr;
 textcolor(yellow);
  writeln('"The Magic 8 Ball" - By: Brady Holt');
 textcolor(white);
 writeln('Questions Or Comments? --> E-Mail:jwholt@airmail.net');
 textcolor(lightgray);
END.