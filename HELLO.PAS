USES CRT, GRAPH, BGIDRIV, BGIFONT1, BGIFONT2, BGIFONT3;
VAR
 color:integer;
 soun:integer;
 del:integer;
{$I bgidriv.inc}
{$I bgifont.inc}
BEGIN
 color:=0;
 soun:=10;
 clrscr;
 del:=300;
 REPEAT
  color:=color+1;
  soun:=soun+10;
  del:=del - 2;
  textbackground(color);
  clrscr;
  sound(soun);
  delay(del);
  nosound;
 UNTIL del<10;
  registergraph;
  registerfonts;
  initgraphmode;
  settextstyle(8,0,5);
  outtextxy(getmaxx DIV 2-50,getmaxy DIV 2,'Hello!');
  readln
END.