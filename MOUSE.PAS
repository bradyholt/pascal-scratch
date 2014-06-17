PROGRAM MOUSEDEMO;
USES CRT,DRIVERS;
VAR
event:tevent;
BEGIN
initevents;
textbackground(black);
clrscr;
REPEAT
 IF mouseevents=true THEN
 BEGIN
 getmouseevent(event);
 IF (event.where.x=2) AND (event.where.y=2) AND (event.buttons=mbleftbutton) THEN
 BEGIN
 textcolor(yellow);
 gotoxy(1,1);
 writeln('blue');
 END;
 END;
UNTIL keypressed;
END.