       IDENTIFICATION DIVISION.
       PROGRAM-ID. Bisxtil.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 WS-ANEE        PIC 9(4).
       01 WS-RESULTAT    PIC 9(3).
       01 WS-REST        PIC 9(4).
       01 WS-REST2       PIC 9(4).
       01 WS-REST3       PIC 9(4).
         

       PROCEDURE DIVISION.
           DISPLAY "Entrer une année". 
           ACCEPT WS-ANEE.

           DIVIDE WS-ANEE BY 4 GIVING WS-RESULTAT REMAINDER WS-REST.
           DIVIDE WS-ANEE BY 100 GIVING WS-RESULTAT REMAINDER WS-REST2.
           DIVIDE WS-ANEE BY 400 GIVING WS-RESULTAT REMAINDER WS-REST3.

           IF WS-REST EQUAL 0
           AND WS-REST2 NOT EQUAL 0
           OR WS-REST3 EQUAL 0

           DISPLAY "C EST UNE ANNEE BISEXTILE"

           ELSE 
           DISPLAY "CE N EST PAS UNE ANNEE BISEXTILE"

           
           END-IF.

           STOP RUN.
           
