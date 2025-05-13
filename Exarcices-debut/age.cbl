       IDENTIFICATION DIVISION.
       PROGRAM-ID. age.
       AUTHOR. DEBUTANT.
       DATE-WRITTEN. 24-04-2025.

       ENVIRONMENT DIVISION.
           
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AGE         PIC 99       VALUE 0.
       01 WS-MESSAGE     PIC X(20).   


       PROCEDURE DIVISION.
       DISPLAY "Entrez votre âge".
       ACCEPT WS-AGE. 

       IF WS-AGE < 12
          MOVE "Enfant" TO WS-MESSAGE
       ELSE
          IF WS-AGE < 18
             MOVE "Mineur" TO WS-MESSAGE
          ELSE
           IF WS-AGE >= 18 AND WS-AGE < 65
              MOVE "Adulte" TO WS-MESSAGE
           ELSE
            MOVE "Personne âgée" TO WS-MESSAGE
           END-IF
          END-IF
       END-IF.
   
       DISPLAY WS-MESSAGE.

       STOP RUN.



