       IDENTIFICATION DIVISION.
       PROGRAM-ID. invert.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-MOT         PIC X(50).
       01 WS-LONG-MOT    PIC 9(50).
            


       PROCEDURE DIVISION.
       DISPLAY "Entrez un mot".
       ACCEPT WS-MOT.
       MOVE FUNCTION LENGTH (WS-MOT ) TO WS-LONG-MOT.

       PERFORM VARYING WS-LONG-MOT FROM WS-LONG-MOT BY 1 
           UNTIL WS-LONG-MOT < 1
            DISPLAY 
        
       END-PERFORM.

       stop run.
       
       