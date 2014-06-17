PROGRAM TICTACTOE;
USES GRAPH,CRT, BGIFONT1, BGIFONT2, BGIFONT3, BGIDRIV;
TYPE
 move=ARRAY[1..9]OF INTEGER;
 space=ARRAY[1..9]OF BOOLEAN;
VAR
 fir:boolean;
 choice:move;
 comchoice:move;
 count:integer;
 cplace:char;
 iplace:integer;
 xospace:space;
 usrwinner:boolean;
 comwinner:boolean;
 comwin:space;
 usrwin:space;
 cat:boolean;
 aga:boolean;
 ccharac:char;
 ucharac:char;
 versuscomp:boolean;
{$I BGIDRIV.INC}
{$I BGIFONT.INC}
PROCEDURE XO(box:integer;let:char;color:integer);
VAR
 x:integer;
 y:integer;
BEGIN
  CASE box OF
    1: BEGIN
         x:=110;
         y:=getmaxy DIV 6;
         END;
    2: BEGIN
         x:=320;
         y:=getmaxy DIV 6;
         END;
    3: BEGIN
         x:=510;
         y:=getmaxy DIV 6;
         END;
    4: BEGIN
         x:=110;
         y:=getmaxy DIV 6 + 150;
         END;
    5: BEGIN
         x:=320;
         y:=getmaxy DIV 6 + 150;
        END;
    6: BEGIN
         x:=510;
         y:=getmaxy DIV 6 + 150;
         END;
    7: BEGIN
         x:=115;
         y:=getmaxy DIV 6 + 300;
         END;
    8: BEGIN
         x:=320;
         y:=getmaxy DIV 6 + 300;
         END;
    9: BEGIN
         x:=510;
         y:=getmaxy DIV 6 + 300;
         END;
      END;
    delay(100);
    settextstyle(3,0,7);
    setcolor(white);
    rectangle(x - 25,y - 20,x + 20,y + 45);
    setfillstyle(0,black);
    floodfill(x,y,white);
    setcolor(color);
    outtextxy(x,y,let);
    xospace[box]:=true;
  END;
PROCEDURE NOTVALID;
 BEGIN
   setcolor(white);
  rectangle(100,445,535,475);
  setfillstyle(0,black);
  floodfill(101,446,white);
  settextstyle(0,0,0);
  setcolor(yellow);
  outtextxy(325,460,'NOT A VALID ENTRY!');
  count:=count-1;
  delay(1000);
 END;
PROCEDURE ALREADYPICKED;
 BEGIN
  setcolor(white);
  rectangle(100,445,535,475);
  setfillstyle(0,black);
  floodfill(101,446,white);
  settextstyle(0,0,0);
  setcolor(yellow);
  outtextxy(325,460,'ALREADY PICKED!');
  count:=count-1;
  delay(1000);
 END;
PROCEDURE INTRO;
 VAR
  ch:char;
  count2:integer;
 BEGIN
  clearviewport;
  FOR count:=1 TO getmaxy DO
   BEGIN
    FOR count2:=1 TO getmaxx DO
     BEGIN
      putpixel(count2,count,lightgray);
     END;
    END;
  setcolor(black);
  settextstyle(1,0,7);
  line(getmaxx DIV 3,60, getmaxx DIV 3, 425);
  line(getmaxx DIV 2 + 95, 60, getmaxx DIV 2 + 95 , 425);
  line(20, getmaxy DIV 3, getmaxx DIV 2 + 300, getmaxy DIV 3);
  line(20, getmaxy DIV 2 + 85, getmaxx DIV 2 + 300, getmaxy DIV 2 + 85);
  outtextxy(100, getmaxy DIV 6,'T');
  delay(300);
  outtextxy(305, getmaxy DIV 6,'I');
  delay(300);
  outtextxy(500, getmaxy DIV 6,'C');
  delay(300);
  outtextxy(100, getmaxy DIV 6 + 125,'T');
  delay(300);
  outtextxy(295, getmaxy DIV 6 + 125,'A');
  delay(300);
  outtextxy(500, getmaxy DIV 6 + 125,'C');
  delay(300);
  outtextxy(100, getmaxy DIV 6 + 250,'T');
  delay(300);
  outtextxy(299, getmaxy DIV 6 + 250,'O');
  delay(300);
  outtextxy(500, getmaxy DIV 6 + 250,'E');
  delay(300);
  setcolor(blue);
  settextstyle(7,0,6);
  settextjustify(centertext,centertext);
  outtextxy(getmaxx DIV 2, 20,'Brady Holt''s');
  setcolor(red);
  settextstyle(3,0,2);
  outtextxy(getmaxx DIV 2, 450,'Press Enter');
  REPEAT
   ch:=readkey;
  UNTIL ord(ch)=13;
 END;
PROCEDURE FIRST;
 VAR
  ch:char;
 BEGIN
 REPEAT
 clearviewport;
 settextjustify(centertext,centertext);
 settextstyle(7,0,3);
 setcolor(yellow);
 outtextxy(getmaxx DIV 2, getmaxy DIV 2,' Do You Wish To Go First? (y/n)');
 ch:=readkey;
 ch:=upcase(ch);
 IF ch='N' THEN
 fir:=false;
 IF ch='Y' THEN
 fir:=true;
 UNTIL (ch='Y') OR (ch='N');
END;
PROCEDURE GAMEBOARD;
 BEGIN
  clearviewport;
  setcolor(black);
  setfillstyle(1,lightgray);
  floodfill(1,1,white);
  settextstyle(1,0,7);
  line(getmaxx DIV 3,60, getmaxx DIV 3, 425);
  line(getmaxx DIV 2 + 95, 60, getmaxx DIV 2 + 95 , 425);
  line(20, getmaxy DIV 3, getmaxx DIV 2 + 300, getmaxy DIV 3);
  line(20, getmaxy DIV 2 + 85, getmaxx DIV 2 + 300, getmaxy DIV 2 + 85);
  outtextxy(110, getmaxy DIV 6,'1');
  outtextxy(320, getmaxy DIV 6,'2');
  outtextxy(510, getmaxy DIV 6,'3');
  outtextxy(110, getmaxy DIV 6 + 150,'4');
  outtextxy(320, getmaxy DIV 6 + 150,'5');
  outtextxy(510, getmaxy DIV 6 + 150,'6');
  outtextxy(115, getmaxy DIV 6 + 300,'7');
  outtextxy(320, getmaxy DIV 6 + 300,'8');
  outtextxy(510, getmaxy DIV 6 + 300,'9');
  setcolor(black);
  rectangle(100,445,535,475);
  setfillstyle(0,black);
  floodfill(101,446,black);
 END;
PROCEDURE GOCOMPUTER;
VAR
 ran:integer;
 rtf:boolean;
 ranchar:integer;
 captured:boolean;
BEGIN
 rtf:=false;
 captured:=false;
   IF (usrwin[1]=true) AND (usrwin[2]=true) AND (xospace[3]=false) AND (captured=false) THEN
    BEGIN
    xo(3,ccharac,7);
    comchoice[count]:=3;
    captured:=true;
    END;
   IF (usrwin[2]=true) AND (usrwin[3]=true) AND (xospace[1]=false) AND (captured=false) THEN
    BEGIN
    xo(1,ccharac,7);
    comchoice[count]:=1;
    captured:=true;
    END;
   IF (usrwin[1]=true) AND (usrwin[3]=true) AND (xospace[2]=false) AND (captured=false) THEN
    BEGIN
    xo(2,ccharac,7);
    comchoice[count]:=2;
    captured:=true;
    END;
   IF (usrwin[4]=true) AND (usrwin[5]=true) AND (xospace[6]=false) AND (captured=false) THEN
    BEGIN
    xo(6,ccharac,7);
    comchoice[count]:=6;
    captured:=true;
    END;
   IF (usrwin[5]=true) AND (usrwin[6]=true) AND (xospace[4]=false) AND (captured=false) THEN
    BEGIN
    xo(4,ccharac,7);
    comchoice[count]:=4;
    captured:=true;
    END;
   IF (usrwin[4]=true) AND (usrwin[6]=true) AND (xospace[5]=false) AND (captured=false) THEN
    BEGIN
    xo(5,ccharac,7);
    comchoice[count]:=5;
    captured:=true;
    END;
   IF (usrwin[7]=true) AND (usrwin[8]=true) AND (xospace[9]=false) AND (captured=false) THEN
    BEGIN
    xo(9,ccharac,7);
    comchoice[count]:=9;
    captured:=true;
    END;
   IF (usrwin[8]=true) AND (usrwin[9]=true) AND (xospace[7]=false) AND (captured=false) THEN
    BEGIN
    xo(7,ccharac,7);
    comchoice[count]:=7;
    captured:=true;
    END;
   IF (usrwin[7]=true) AND (usrwin[9]=true) AND (xospace[8]=false) AND (captured=false) THEN
    BEGIN
    xo(8,ccharac,7);
    comchoice[count]:=8;
    captured:=true;
    END;
   IF (usrwin[1]=true) AND (usrwin[4]=true) AND (xospace[7]=false) AND (captured=false) THEN
    BEGIN
    xo(7,ccharac,7);
    comchoice[count]:=7;
    captured:=true;
    END;
   IF (usrwin[4]=true) AND (usrwin[7]=true) AND (xospace[1]=false) AND (captured=false) THEN
    BEGIN
    xo(1,ccharac,7);
    comchoice[count]:=1;
    captured:=true;
    END;
   IF (usrwin[1]=true) AND (usrwin[7]=true) AND (xospace[4]=false) AND (captured=false) THEN
    BEGIN
    xo(4,ccharac,7);
    comchoice[count]:=4;
    captured:=true;
    END;
   IF (usrwin[2]=true) AND (usrwin[5]=true) AND (xospace[8]=false) AND (captured=false) THEN
    BEGIN
    xo(8,ccharac,7);
    comchoice[count]:=8;
    captured:=true;
    END;
   IF (usrwin[5]=true) AND (usrwin[8]=true) AND (xospace[2]=false) AND (captured=false) THEN
    BEGIN
    xo(2,ccharac,7);
    comchoice[count]:=2;
    captured:=true;
    END;
   IF (usrwin[2]=true) AND (usrwin[8]=true) AND (xospace[5]=false) AND (captured=false) THEN
    BEGIN
    xo(5,ccharac,7);
    comchoice[count]:=5;
    captured:=true;
    END;
   IF (usrwin[3]=true) AND (usrwin[6]=true) AND (xospace[9]=false) AND (captured=false) THEN
    BEGIN
    xo(9,ccharac,7);
    comchoice[count]:=9;
    captured:=true;
    END;
   IF (usrwin[6]=true) AND (usrwin[9]=true) AND (xospace[3]=false) AND (captured=false) THEN
    BEGIN
    xo(3,ccharac,7);
    comchoice[count]:=3;
    captured:=true;
    END;
   IF (usrwin[3]=true) AND (usrwin[9]=true) AND (xospace[6]=false) AND (captured=false) THEN
    BEGIN
    xo(6,ccharac,7);
    comchoice[count]:=6;
    captured:=true;
    END;
   IF (usrwin[1]=true) AND (usrwin[5]=true) AND (xospace[9]=false) AND (captured=false) THEN
    BEGIN
    xo(9,ccharac,7);
    comchoice[count]:=9;
    captured:=true;
    END;
   IF (usrwin[5]=true) AND (usrwin[9]=true) AND (xospace[1]=false) AND (captured=false) THEN
    BEGIN
    xo(1,ccharac,7);
    comchoice[count]:=1;
    captured:=true;
    END;
   IF (usrwin[1]=true) AND (usrwin[9]=true) AND (xospace[5]=false) AND (captured=false) THEN
    BEGIN
    xo(5,ccharac,7);
    comchoice[count]:=5;
    captured:=true;
    END;
   IF (usrwin[3]=true) AND (usrwin[5]=true) AND (xospace[7]=false) AND (captured=false) THEN
    BEGIN
    xo(7,ccharac,7);
    comchoice[count]:=7;
    captured:=true;
    END;
   IF (usrwin[5]=true) AND (usrwin[7]=true) AND (xospace[3]=false) AND (captured=false) THEN
    BEGIN
    xo(3,ccharac,7);
    comchoice[count]:=3;
    captured:=true;
    END;
   IF (usrwin[3]=true) AND (usrwin[7]=true) AND (xospace[5]=false) AND (captured=false) THEN
    BEGIN
    xo(5,ccharac,7);
    comchoice[count]:=5;
    captured:=true;
    END;
   IF captured=false THEN
   BEGIN
   REPEAT
     randomize;
     ran:=random(9);
     CASE ran OF
     0: comchoice[count]:=1;
     1: comchoice[count]:=2;
     2: comchoice[count]:=3;
     3: comchoice[count]:=4;
     4: comchoice[count]:=5;
     5: comchoice[count]:=6;
     6: comchoice[count]:=7;
     7: comchoice[count]:=8;
     8: comchoice[count]:=9;
     END;
    IF (count=1) AND (comchoice[count]=5) THEN
     BEGIN
      REPEAT
      comchoice[count]:=random(8) + 1;
      UNTIL comchoice[count]<>5;
     END;
    IF xospace[comchoice[count]]=false THEN
      BEGIN
      xo(comchoice[count],ccharac,7);
      rtf:=true;
      END;
   UNTIL rtf=true;
  END;
  END;
PROCEDURE VERSUSWHO;
VAR
 ch:char;
BEGIN
 clearviewport;
 settextjustify(centertext,centertext);
 settextstyle(7,0,3);
 setcolor(yellow);
 outtextxy(getmaxx DIV 2, getmaxy DIV 2,'Do You Want To Play The Computer? (y/n)');
 REPEAT
 ch:=readkey;
 case upcase(ch) OF
 'Y': versuscomp:=true;
 'N': versuscomp:=false;
 END;
UNTIL (upcase(ch)='Y') OR (upcase(ch)='N');
END;
PROCEDURE CHARACTER;
VAR
 ch:char;
BEGIN
 REPEAT
 clearviewport;
 settextjustify(centertext,centertext);
 settextstyle(7,0,3);
 setcolor(yellow);
 outtextxy(getmaxx DIV 2, getmaxy DIV 2,'Which Letter Do You Want? (X/O)');
 ch:=readkey;
 ch:=upcase(ch);
 IF ch='X' THEN
  BEGIN
  ucharac:='X';
  ccharac:='O';
  END;
 IF ch='O' THEN
  BEGIN
  ucharac:='O';
  ccharac:='X';
  END;
 UNTIL (ch='X') OR (ch='O');
END;
PROCEDURE CHECKSPACES;
VAR
 scount:integer;
BEGIN
 FOR scount:=1 to 9 DO
  BEGIN
   comwin[scount]:=false;
   usrwin[scount]:=false;
  END;
 FOR scount:=1 to 9 DO
  BEGIN
   IF (xospace[1]=true) AND (comchoice[scount]=1) THEN
    comwin[1]:=true;
   IF (xospace[1]=true) AND (choice[scount]=1) THEN
    usrwin[1]:=true;
   IF (xospace[2]=true) AND (comchoice[scount]=2) THEN
    comwin[2]:=true;
   IF (xospace[2]=true) AND (choice[scount]=2) THEN
    usrwin[2]:=true;
   IF (xospace[3]=true) AND (comchoice[scount]=3) THEN
    comwin[3]:=true;
   IF (xospace[3]=true) AND (choice[scount]=3) THEN
    usrwin[3]:=true;
   IF (xospace[4]=true) AND (comchoice[scount]=4) THEN
    comwin[4]:=true;
   IF (xospace[4]=true) AND (choice[scount]=4) THEN
    usrwin[4]:=true;
   IF (xospace[5]=true) AND (comchoice[scount]=5) THEN
    comwin[5]:=true;
   IF (xospace[5]=true) AND (choice[scount]=5) THEN
    usrwin[5]:=true;
   IF (xospace[6]=true) AND (comchoice[scount]=6) THEN
    comwin[6]:=true;
   IF (xospace[6]=true) AND (choice[scount]=6) THEN
    usrwin[6]:=true;
   IF (xospace[7]=true) AND (comchoice[scount]=7) THEN
    comwin[7]:=true;
   IF (xospace[7]=true) AND (choice[scount]=7) THEN
    usrwin[7]:=true;
   IF (xospace[8]=true) AND (comchoice[scount]=8) THEN
    comwin[8]:=true;
   IF (xospace[8]=true) AND (choice[scount]=8) THEN
    usrwin[8]:=true;
   IF (xospace[9]=true) AND (comchoice[scount]=9) THEN
    comwin[9]:=true;
   IF (xospace[9]=true) AND (choice[scount]=9) THEN
    usrwin[9]:=true;
 END;
END;
PROCEDURE WIN;
VAR
 ht:boolean;
 ht2:boolean;
BEGIN
  IF (comwin[1]=true) AND (comwin[2]=true) AND (comwin[3]=true) THEN
   comwinner:=true;
  IF (comwin[4]=true) AND (comwin[5]=true) AND (comwin[6]=true) THEN
   comwinner:=true;
  IF (comwin[7]=true) AND (comwin[8]=true) AND (comwin[9]=true) THEN
   comwinner:=true;
  IF (comwin[1]=true) AND (comwin[4]=true) AND (comwin[7]=true) THEN
   comwinner:=true;
  IF (comwin[2]=true) AND (comwin[5]=true) AND (comwin[8]=true) THEN
   comwinner:=true;
  IF (comwin[3]=true) AND (comwin[6]=true) AND (comwin[9]=true) THEN
   comwinner:=true;
  IF (comwin[1]=true) AND (comwin[5]=true) AND (comwin[9]=true) THEN
   comwinner:=true;
  IF (comwin[3]=true) AND (comwin[5]=true) AND (comwin[7]=true) THEN
   comwinner:=true;
  IF (usrwin[1]=true) AND (usrwin[2]=true) AND (usrwin[3]=true) THEN
   usrwinner:=true;
  IF (usrwin[4]=true) AND (usrwin[5]=true) AND (usrwin[6]=true) THEN
   usrwinner:=true;
  IF (usrwin[7]=true) AND (usrwin[8]=true) AND (usrwin[9]=true) THEN
   usrwinner:=true;
  IF (usrwin[1]=true) AND (usrwin[4]=true) AND (usrwin[7]=true) THEN
   usrwinner:=true;
  IF (usrwin[2]=true) AND (usrwin[5]=true) AND (usrwin[8]=true) THEN
   usrwinner:=true;
  IF (usrwin[3]=true) AND (usrwin[6]=true) AND (usrwin[9]=true) THEN
   usrwinner:=true;
  IF (usrwin[1]=true) AND (usrwin[5]=true) AND (usrwin[9]=true) THEN
   usrwinner:=true;
  IF (usrwin[3]=true) AND (usrwin[5]=true) AND (usrwin[7]=true) THEN
   usrwinner:=true;
  ht:=false;
  ht:=false;
  IF (xospace[1]=true) AND (xospace[2]=true) AND (xospace[3]=true) AND (xospace[4]=true) AND (xospace[5]=true) THEN
   ht:=true;
  IF (ht=true) AND (xospace[6]=true) AND (xospace[7]=true) AND (xospace[8]=true) AND (xospace[9]=true) THEN
   ht2:=true;
  IF (ht2=true) AND (usrwinner=false) AND (comwinner=false) THEN
    cat:=true;
 END;
PROCEDURE WINSCREEN(whichone:char);
VAR
 scount:integer;
BEGIN
  delay(500);
  IF (comwin[1]=true) AND (comwin[2]=true) AND (comwin[3]=true) THEN
   BEGIN
   xo(1,ccharac,12);
   xo(2,ccharac,12);
   xo(3,ccharac,12);
   END;
  IF (comwin[4]=true) AND (comwin[5]=true) AND (comwin[6]=true) THEN
   BEGIN
   xo(4,ccharac,12);
   xo(5,ccharac,12);
   xo(6,ccharac,12);
   END;
  IF (comwin[7]=true) AND (comwin[8]=true) AND (comwin[9]=true) THEN
   BEGIN
   xo(7,ccharac,12);
   xo(8,ccharac,12);
   xo(9,ccharac,12);
   END;
  IF (comwin[1]=true) AND (comwin[4]=true) AND (comwin[7]=true) THEN
   BEGIN
   xo(1,ccharac,12);
   xo(4,ccharac,12);
   xo(7,ccharac,12);
   END;
  IF (comwin[2]=true) AND (comwin[5]=true) AND (comwin[8]=true) THEN
   BEGIN
   xo(2,ccharac,12);
   xo(5,ccharac,12);
   xo(8,ccharac,12);
   END;
  IF (comwin[3]=true) AND (comwin[6]=true) AND (comwin[9]=true) THEN
   BEGIN
   xo(3,ccharac,12);
   xo(6,ccharac,12);
   xo(9,ccharac,12);
   END;
  IF (comwin[1]=true) AND (comwin[5]=true) AND (comwin[9]=true) THEN
   BEGIN
   xo(1,ccharac,12);
   xo(5,ccharac,12);
   xo(9,ccharac,12);
   END;
  IF (comwin[3]=true) AND (comwin[5]=true) AND (comwin[7]=true) THEN
   BEGIN
   xo(3,ccharac,12);
   xo(5,ccharac,12);
   xo(7,ccharac,12);
   END;
  IF (usrwin[1]=true) AND (usrwin[2]=true) AND (usrwin[3]=true) THEN
   BEGIN
   xo(1,ucharac,12);
   xo(2,ucharac,12);
   xo(3,ucharac,12);
   END;
  IF (usrwin[4]=true) AND (usrwin[5]=true) AND (usrwin[6]=true) THEN
   BEGIN
   xo(4,ucharac,12);
   xo(5,ucharac,12);
   xo(6,ucharac,12);
   END;
  IF (usrwin[7]=true) AND (usrwin[8]=true) AND (usrwin[9]=true) THEN
   BEGIN
   xo(7,ucharac,12);
   xo(8,ucharac,12);
   xo(9,ucharac,12);
   END;
  IF (usrwin[1]=true) AND (usrwin[4]=true) AND (usrwin[7]=true) THEN
   BEGIN
   xo(1,ucharac,12);
   xo(4,ucharac,12);
   xo(7,ucharac,12);
   END;
  IF (usrwin[2]=true) AND (usrwin[5]=true) AND (usrwin[8]=true) THEN
   BEGIN
   xo(2,ucharac,12);
   xo(5,ucharac,12);
   xo(8,ucharac,12);
   END;
  IF (usrwin[3]=true) AND (usrwin[6]=true) AND (usrwin[9]=true) THEN
   BEGIN
   xo(3,ucharac,12);
   xo(6,ucharac,12);
   xo(9,ucharac,12);
   END;
  IF (usrwin[1]=true) AND (usrwin[5]=true) AND (usrwin[9]=true) THEN
   BEGIN
   xo(1,ucharac,12);
   xo(5,ucharac,12);
   xo(9,ucharac,12);
   END;
  IF (usrwin[3]=true) AND (usrwin[5]=true) AND (usrwin[7]=true) THEN
   BEGIN
   xo(3,ucharac,12);
   xo(5,ucharac,12);
   xo(7,ucharac,12);
   END;
  delay(1000);
  clearviewport;
  IF whichone='u' THEN
   BEGIN
   REPEAT
   BEGIN
   FOR scount:=1 to 15 DO
    BEGIN
    setcolor(scount);
    outtextxy(getmaxx DIV 2,getmaxy DIV 2,'You Win!');
    delay(100);
    END;
    END;
   UNTIL keypressed;
   END;
  IF whichone='1' THEN
   BEGIN
   REPEAT
   BEGIN
   FOR scount:=1 to 15 DO
    BEGIN
    setcolor(scount);
    outtextxy(getmaxx DIV 2,getmaxy DIV 2,'Player 1 Wins!');
    delay(100);
    END;
    END;
   UNTIL keypressed;
   END;
  IF whichone='2' THEN
   BEGIN
   REPEAT
   BEGIN
   FOR scount:=1 to 15 DO
    BEGIN
    setcolor(scount);
    outtextxy(getmaxx DIV 2,getmaxy DIV 2,'Player 2 Wins!');
    delay(100);
    END;
    END;
   UNTIL keypressed;
   END;
  IF whichone='c' THEN
   BEGIN
   setcolor(lightred);
   outtextxy(getmaxx DIV 2,getmaxy DIV 2,'You Lose');
   END;
  IF whichone='n' THEN
   BEGIN
   setcolor(lightgray);
   outtextxy(getmaxx DIV 2,getmaxy DIV 2,'The Cat Won');
   END;
  readln;
 END;
PROCEDURE GAME;
VAR
 scount:integer;
 quit:boolean;
 valid:boolean;
BEGIN
  comwinner:=false;
  usrwinner:=false;
  valid:=true;
  FOR scount:=1 TO 9 DO
   BEGIN
    choice[scount]:=0;
    comchoice[scount]:=0;
    xospace[scount]:=false;
   END;
 count:=0;
 iplace:=0;
 quit:=false;
 cat:=false;
 IF versuscomp=false THEN
 BEGIN
  REPEAT
  ucharac:='X';
  ccharac:='O';
  count:=count+1;
  setcolor(white);
  settextstyle(0,0,0);
  rectangle(100,445,535,475);
  setfillstyle(0,black);
  floodfill(101,446,white);
  setcolor(yellow);
  outtextxy(getmaxx DIV 2,460,'PLAYER 1''s TURN (q - quit)');
  valid:=true;
  cplace:=readkey;
  CASE upcase(cplace) OF
  '1':iplace:=1;
  '2':iplace:=2;
  '3':iplace:=3;
  '4':iplace:=4;
  '5':iplace:=5;
  '6':iplace:=6;
  '7':iplace:=7;
  '8':iplace:=8;
  '9':iplace:=9;
  'Q':iplace:=0;
  ELSE
   valid:=false;
  END;
  IF (valid=false) THEN
   notvalid;
  IF (xospace[iplace]=true) AND (iplace>0) AND (valid=true) THEN
   alreadypicked;
  IF (xospace[iplace]=false) AND (iplace>0) AND (valid=true) THEN
   BEGIN
    xo(iplace,'X',7);
    choice[count]:=iplace;
    checkspaces;
    win;
     IF (usrwinner=false) AND (comwinner=false) AND (cat=false) THEN
      BEGIN
      setfillstyle(0,black);
      floodfill(101,446,white);
      settextstyle(0,0,0);
      setcolor(yellow);
      outtextxy(getmaxx DIV 2,460,'PLAYER 2''s TURN (q - quit)');
      valid:=true;
      cplace:=readkey;
      CASE upcase(cplace) OF
      '1':iplace:=1;
      '2':iplace:=2;
      '3':iplace:=3;
      '4':iplace:=4;
      '5':iplace:=5;
      '6':iplace:=6;
      '7':iplace:=7;
      '8':iplace:=8;
      '9':iplace:=9;
      'Q':iplace:=0;
      ELSE
       valid:=false;
      END;
   IF valid=false THEN
    notvalid;
   IF (xospace[iplace]=true) AND (iplace>0) AND (valid=true) THEN
    alreadypicked;
   IF (xospace[iplace]=false) AND (iplace>0) THEN
   BEGIN
   xo(iplace,'O',7);
   comchoice[count]:=iplace;
   checkspaces;
   win;
   END;
   END;
   END;
  UNTIL (comwinner=true) OR (usrwinner=true) OR (upcase(cplace)='Q') OR (cat=true);
 END;
IF versuscomp=true THEN
 BEGIN
 IF fir=true THEN
   BEGIN
    REPEAT
     BEGIN
      count:=count+1;
      setcolor(white);
      settextstyle(0,0,0);
      rectangle(100,445,535,475);
      setfillstyle(0,black);
      floodfill(101,446,white);
      setcolor(yellow);
      outtextxy(getmaxx DIV 2,460,'TYPE NUMBER TO PLACE A MOVE ON (q - quit)');
      valid:=true;
      cplace:=readkey;
      CASE upcase(cplace) OF
      '1': iplace:=1;
      '2': iplace:=2;
      '3': iplace:=3;
      '4': iplace:=4;
      '5': iplace:=5;
      '6': iplace:=6;
      '7': iplace:=7;
      '8': iplace:=8;
      '9': iplace:=9;
      'Q': iplace:=0;
      ELSE
       valid:=false;
      END;
     IF valid=false THEN
      notvalid;
     IF (xospace[iplace]=true) AND (iplace>0) AND (valid=true) THEN
      alreadypicked;
     IF (xospace[iplace]=false) AND (iplace>0) THEN
      BEGIN
       xo(iplace,ucharac,7);
       choice[count]:=iplace;
       checkspaces;
       win;
       IF (usrwinner=false) AND (comwinner=false) AND (cat=false)THEN
       BEGIN
       checkspaces;
       gocomputer;
       END;
     checkspaces;
     win;
     END;
     END;
    UNTIL (usrwinner=true) OR (upcase(cplace)='Q') OR (comwinner=true) OR (cat=true);
   END;
  IF fir=false THEN
   BEGIN
    REPEAT
     BEGIN
      count:=count+1;
      setcolor(white);
      rectangle(100,445,535,475);
      setfillstyle(0,black);
      floodfill(101,446,white);
      IF (usrwinner=false) AND (comwinner=false) AND (cat=false) AND (valid=true) THEN
       BEGIN
       checkspaces;
       gocomputer;
       END;
      checkspaces;
      win;
      IF (usrwinner=false) AND (comwinner=false) AND (cat=false) THEN
       BEGIN
       settextstyle(0,0,0);
       setcolor(yellow);
       outtextxy(getmaxx DIV 2,460,'TYPE NUMBER TO PLACE A MOVE ON (q - quit)');
       valid:=true;
       cplace:=readkey;
       CASE upcase(cplace) OF
       '1': iplace:=1;
       '2': iplace:=2;
       '3': iplace:=3;
       '4': iplace:=4;
       '5': iplace:=5;
       '6': iplace:=6;
       '7': iplace:=7;
       '8': iplace:=8;
       '9': iplace:=9;
       'Q': iplace:=0;
       ELSE
        valid:=false;
       END;
     IF valid=false THEN
      notvalid;
     IF (xospace[iplace]=true) AND (iplace>0) AND (valid=true) THEN
      alreadypicked;
     IF (xospace[iplace]=false) AND (iplace>0) AND (usrwinner=false) AND (comwinner=false) AND (cat=false) THEN IF
     valid=true THEN
      BEGIN
       xo(iplace,ucharac,7);
       choice[count]:=iplace;
      END;
     END;
     checkspaces;
     win;
     END;
    UNTIL (usrwinner=true) OR (upcase(cplace)='Q') OR (comwinner=true) OR (cat=true);
   END;
   END;
   IF (usrwinner=true) AND (versuscomp=true) THEN
    winscreen('u');
   IF (usrwinner=true) AND (versuscomp=false) THEN
    winscreen('1');
   IF (comwinner=true) AND (versuscomp=true) THEN
    winscreen('c');
   IF (comwinner=true) AND (versuscomp=false) THEN
    winscreen('2');
   IF cat=true THEN
    winscreen('n');
 END;
PROCEDURE AGAIN;
VAR
 a:char;
BEGIN
 REPEAT
 clearviewport;
 settextjustify(centertext,centertext);
 settextstyle(7,0,3);
 setcolor(yellow);
 outtextxy(getmaxx DIV 2, getmaxy DIV 2,'Want to Play Again?(y/n)');
 a:=readkey;
 IF upcase(a)='Y' THEN
  BEGIN
  aga:=true;
  END;
 IF upcase(a)='N' THEN
  BEGIN
  aga:=false;
  END;
 UNTIL (upcase(a)='Y') OR (upcase(a)='N');
END;
BEGIN
 registergraph;
 registerfonts;
 initgraphmode;
 intro;
 REPEAT
  BEGIN
   versuswho;
   IF versuscomp=true THEN
   BEGIN
   first;
   character;
   END;
   gameboard;
   game;
   again;
  END;
 UNTIL aga=false;
 restorecrtmode;
 clrscr;
END.