       IDENTIFICATION DIVISION.
       PROGRAM-ID. StopO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NUMER        PIC 9(3).

       PROCEDURE DIVISION.
       DISPLAY "Entrez un nombre (0 pour arrêter) : ".
       ACCEPT WS-NUMER
           PERFORM 
            UNTIL WS-NUMER = 0
            DISPLAY "Entrez un nombre (0 pour arrêter) : ".
            ACCEPT WS-NUMER
           END-PERFORM.

           DISPLAY "Le programme est terminé.".
       STOP RUN.





