PROGRAM MATRICES;

USES
  CRT,DOS;
(*                  Unit Dict.
  Crt=used for clearing the screen and colors
  Dos=used to call the date from the computer *)

CONST
  LENGTHA=3;
  LENGTHB=3;
(*              Const. Dict.
  LENGTHA=the length down the matrix
  LENGTHB=the length accross the matrix *)

TYPE
  FIRSTMATRIX=ARRAY[1..LENGTHA,1..LENGTHB]OF REAL;
  SECONDMATRIX=ARRAY[1..LENGTHA,1..LENGTHB]OF REAL;
  THIRDMATRIX=ARRAY[1..LENGTHA,1..LENGTHB]OF REAL;
(*                          Type Dict.
  FIRSTMATRIX=a matrix of real numbers
  SECONDMATRIX=a matrix of real numbers
  THIRDMATRIX=the matrix resulting when FIRSTMATRIX and SECONDMATRIX are
              added together *)

VAR
  MATRIXA:FIRSTMATRIX;
  MATRIXB:SECONDMATRIX;
  MATRIXC:THIRDMATRIX;
  NUMRUNS,RUNS:INTEGER;
  OUT:TEXT;
(*                              Var Dict.
  MATRIXA=FIRSTMATRIX declared in the type section
  MATRIXB=SECONDMATRIX declared in the type section
  MATRIXC=THIRDMATRIX declared in the type section
  NUMRUNS=the number of times the program will run
  RUNS=integer used in a for..to..do loop to run the program NUMRUNS times *)

PROCEDURE HEADER;
(* Procedure Header is a program that prints a header in order that the
   teacher can determine easily the student who a paper belongs to, the
   date it is due, the assignment number, and the period of the class.
   The program features the getdate procedure to automatically put the
   date in the header. The assignment number is prompted to the user *)
  CONST
    SKIP=' ';
  (*                            Const. Dict.
     Skip=a constant used to indent in write and writeln procedures *)
  VAR
    ASSGN,STARS:INTEGER;
    DATE,DAYOFWEEK,MONTH,YEAR:WORD;
  (*                            Var. Dict.
     Assgn=the assignment number read by the user to be placed in the header
     Date=the date returned from the getdate procedure
     Dayofweek=the day of week returned from the getdate procedure
     Month=the month returned from the getdate procedure
     Stars=integer used in for..to..do loops to print "*"s
     Year=the year returned from the getdate procedure *)
  BEGIN (* procedure HEADER *)
    CLRSCR;
    TEXTCOLOR(WHITE);
    WRITE ('WHAT IS THE ASSIGNMENT # ??? ');
    READLN(ASSGN); (* gets the assignment number from the user *)
    CLRSCR;
    GETDATE(YEAR,MONTH,DATE,DAYOFWEEK); (* gets the date from the computer's
                                           internal clock(the year,month,
                                           date,and day of week) *)
    GOTOXY(1,5); (* puts the cursor position at the coordinates 1,5 *)
    WRITE (OUT,SKIP:10);
    FOR STARS:=1 TO 60 DO
      WRITE (OUT,'*'); (* for..to..do loop that writes 60 "*"s on a line *)
    WRITELN(OUT);
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:23,'TRAVIS BELL',SKIP:24,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:26,'CSA4S7',SKIP:26,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:24,'PERIOD A-2',SKIP:24,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:19,'COMPUTER SCIENCE II H',SKIP:18,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITE (OUT,SKIP:10,'*',SKIP:22,'ASSIGNMENT # ',ASSGN); (* writes the
                                                           assign.# *)
    IF ASSGN<10 THEN (* if..then statement checks if the assign. # is
                        1 character long *)
      WRITELN(OUT,SKIP:22,'*')
    ELSE (* else statement checks if the assign. # is 2 characters long *)
      WRITELN(OUT,SKIP:21,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    IF (MONTH>9)AND(DATE>9) THEN (* if..then statement checks to see if the
                                    date is 10 characters long *)
      WRITELN(OUT,SKIP:10,'*',SKIP:20,'DUE DATE:',MONTH,'/',DATE,'/',
              YEAR,SKIP:19,'*');
    IF ((MONTH<10)AND(DATE>9))OR((MONTH>9)AND(DATE<10)) THEN
      (* if..then statement checks to see if the date is 9 characters long *)
      WRITELN(OUT,SKIP:10,'*',SKIP:20,'DUE DATE:',MONTH,'/',DATE,'/',
              YEAR,SKIP:20,'*');
    IF (MONTH<10)AND(DATE<10) THEN
      (* if..then statement checks to see if the date is 8 characters long *)
      WRITELN(OUT,SKIP:10,'*',SKIP:20,'DUE DATE:',MONTH,'/',DATE,'/',
              YEAR,SKIP:21,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITELN(OUT,SKIP:10,'*',SKIP:58,'*');
    WRITE(OUT,SKIP:10);
    FOR STARS:=1 TO 60 DO
      WRITE (OUT,'*'); (* for..to..do loop that writes 60 "*"s on a line *)
    WRITELN(OUT);
    WRITELN(OUT);
  END; (* procedure HEADER *)

PROCEDURE INITIALIZE(VAR MATRXA:FIRSTMATRIX;VAR MATRXB:SECONDMATRIX;
                     VAR MATRXC:THIRDMATRIX);
(* Given =The first matrix, the second matrix, the third matrix
   Task  =Set all of the reals in each of the matrices to 0.0
   Return=The 3 matrices *)

  VAR
    INDEXA,INDEXB:INTEGER;
  (*                        Var Dict.
    INDEXA=the first portion of the array cell being used
    INDEXB=the second portion of the array cell being used *)
  BEGIN (* procedure initialize *)
    FOR INDEXA:=1 TO LENGTHA DO (* for the length of the matrix down *)
      FOR INDEXB:=1 TO LENGTHB DO (* for the length of the matrix across *)
        BEGIN (* for..to..do loop *)
          MATRXA[INDEXA,INDEXB]:=0.0; (* sets the array cell to 0.0 on the
                                         first matrix *)
          MATRXB[INDEXA,INDEXB]:=0.0; (* sets the array cell to 0.0 on the
                                         second matrix *)
          MATRXC[INDEXA,INDEXB]:=0.0; (* sets the array cell to 0.0 on the
                                         third matrix *)
        END; (* for..to..do loop *)
  END; (* procedure initialize *)

PROCEDURE GETMATRIXA(VAR MATRXA:FIRSTMATRIX);
(* Given =The first matrix
   Task  =Get the numbers to put into the matrix
   Return=The first matrix *)
  VAR
    INDEXA,INDEXB:INTEGER;
  (* Var. Dict.
    INDEXA=the index of the cells down the array
    INDEXB=the index of the cells accross the array *)
  BEGIN (* procedure GETMATRIXA *)
    CLRSCR;
    TEXTCOLOR(LIGHTRED);
    WRITELN; WRITELN;
    WRITELN('MATRIX A':15);
    GOTOXY(1,5);
    (* for..to..do loop puts letters and numbers on the screen in the
       pattern of the matrix to identify each section *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          WRITE(CHR(64+INDEXA):5,INDEXB);
          IF INDEXB=LENGTHB THEN (* checks to see if the length accross is
                                    finished *)
            WRITELN;
        END;
    WRITELN;
    (* for..to..do loop prompts the user for the value of each real in the
       matrix *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          WRITE ('WHAT IS THE VALUE OF ',CHR(64+INDEXA),INDEXB,' ???  ');
          READLN(MATRXA[INDEXA,INDEXB]);
        END; (* for..to..do loop *)
    CLRSCR;
    WRITELN; WRITELN;
    WRITELN('MATRIX A':15);
    GOTOXY(1,5);
    (* for..to..do loop shows the user the matrix that they typed in *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          WRITE(MATRXA[INDEXA,INDEXB]:7:2);
          IF INDEXB=LENGTHB THEN (* checks to see if the length accross is
                                    finished *)
            WRITELN;
        END; (* for..to..do loop *)
    WRITELN;
    WRITELN('PRESS ENTER TO CONTINUE');
    TEXTCOLOR(BLACK);
    READLN;
  END; (* procedure GETMATRIXA *)

PROCEDURE GETMATRIXB(VAR MATRXB:SECONDMATRIX);
(* Given =The second matrix
   Task  =Get the numbers to put into the matrix
   Return=The second matrix *)
  VAR
    INDEXA,INDEXB:INTEGER;
  (* Var. Dict.
    INDEXA=the index of the cells down the array
    INDEXB=the index of the cells accross the array *)
  BEGIN (* procedure GETMATRIXB *)
    CLRSCR;
    TEXTCOLOR(LIGHTBLUE);
    WRITELN; WRITELN;
    WRITELN('MATRIX B':15);
    GOTOXY(1,5);
    (* for..to..do loop puts letters and numbers on the screen in the
       pattern of the matrix to identify each section *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          WRITE(CHR(64+INDEXA):5,INDEXB);
          IF INDEXB=LENGTHB THEN (* checks to see if the length accross is
                                    finished *)
            WRITELN;
        END;
    WRITELN;
    (* for..to..do loop prompts the user for the value of each real in the
       matrix *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          WRITE ('WHAT IS THE VALUE OF ',CHR(64+INDEXA),INDEXB,' ???  ');
          READLN(MATRXB[INDEXA,INDEXB]);
        END; (* for..to..do loop *)
    CLRSCR;
    WRITELN; WRITELN;
    WRITELN('MATRIX B':15);
    GOTOXY(1,5);
    (* for..to..do loop shows the user the matrix that they typed in *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          WRITE(MATRXB[INDEXA,INDEXB]:7:2);
          IF INDEXB=LENGTHB THEN (* checks to see if the length accross is
                                    finished *)
            WRITELN;
        END; (* for..to..do loop *)
    WRITELN;
    WRITELN('PRESS ENTER TO CONTINUE');
    TEXTCOLOR(BLACK);
    READLN;
  END; (* procedure GETMATRIXB *)

PROCEDURE CALCULATE(VAR MATRXA:FIRSTMATRIX;VAR MATRXB:SECONDMATRIX;
                    VAR MATRXC:THIRDMATRIX);
(* Given =first matrix,second matrix,third matrix
   Task  =add first matrix to the second matrix
   Return=first matrix,second matrix,third matrix *)
  VAR
    INDEXA,INDEXB:INTEGER;
  (* Var. Dict.
    INDEXA=the index of the cells down the array
    INDEXB=the index of the cells accross the array *)
  BEGIN (* procedure CALCULATE *)
    (* for..to..do loop adds each section of the first matrix to the
       corresponding section of the second matrix and puts the result in
       the corresponding section of the third matrix *)
    FOR INDEXA:=1 TO LENGTHA DO (* down the matrix array *)
      FOR INDEXB:=1 TO LENGTHB DO (* accross the matrix array *)
        BEGIN (* for..to..do loop *)
          MATRXC[INDEXA,INDEXB]:=MATRXA[INDEXA,INDEXB]+MATRXB[INDEXA,INDEXB];
        END; (* for..to..do loop *)
  END; (* procedure CALCULATE *)

PROCEDURE SHOWRESULT(VAR MATRXC:THIRDMATRIX);
(* Given =the third matrix
   Task  =put output
   Return= *)
  VAR
    INDEXA,INDEXB:INTEGER;
  BEGIN
    CLRSCR;
    TEXTCOLOR(MAGENTA);
    WRITELN; WRITELN;
    WRITELN('RESULT':16);
    GOTOXY(1,5);
    FOR INDEXA:=1 TO LENGTHA DO
      FOR INDEXB:=1 TO LENGTHB DO
        BEGIN
          WRITE(MATRXC[INDEXA,INDEXB]:7:2);
          WRITE(OUT,MATRXC[INDEXA,INDEXB]:7:2);
          IF INDEXB=LENGTHB THEN
            BEGIN
              WRITELN;
              WRITELN(OUT);
            END;
        END;
    WRITELN(OUT);
    WRITELN;
    WRITELN('PRESS ENTER TO CONTINUE');
    TEXTCOLOR(BLACK);
    READLN;
  END;

BEGIN (* main program *)
  ASSIGN(OUT,'MATRICES.OUT'); (* assigns the text variable to a output file
                                 name *)
  REWRITE(OUT); (* rewrites the output file *)
  HEADER; (* calls procedure HEADER to print the header to the output file *)
  CLRSCR;
  TEXTCOLOR(GREEN);
  GOTOXY(10,5);
  WRITE ('HOW MANY TIMES DO YOU WISH TO RUN THE PROGRAM ??? ');
  READLN(NUMRUNS); (* gets the number of times to run the program from the
                      user *)
  WRITELN;
  WRITELN('PRESS ENTER TO CONTINUE.':20);
  READLN;
  (* for..to..do loop runs the program the specified number of times *)
  FOR RUNS:=1 TO NUMRUNS DO
    BEGIN (* for..to..do loop *)
      INITIALIZE(MATRIXA,MATRIXB,MATRIXC); (* calls procedure INITIALIZE
                                              to initialize the 3 matrices *)
      GETMATRIXA(MATRIXA); (* calls procedure GETMATRIXA
                              to get information for the first matrix *)
      GETMATRIXB(MATRIXB); (* calls procedure GETMATRIXB
                              to get information for the second matrix *)
      CALCULATE(MATRIXA,MATRIXB,MATRIXC); (* calls procedure CALCULATE
                                             to add the matrices *)
      SHOWRESULT(MATRIXC); (* calls procedure SHOWRESULT to print results
                              to the moniter and output file *)
    END; (* for..to..do loop *)
  CLOSE(OUT); (* closes the output file *)
END. (* main program *
