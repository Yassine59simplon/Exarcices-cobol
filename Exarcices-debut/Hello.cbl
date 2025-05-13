       IDENTIFICATION DIVISION.
       PROGRAM-ID. Hello.
       AUTHOR. DEBUTANT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-HELOS       PIC X(20)   VALUE "Hello Word".
       01 WS-NUM11       PIC 9(4)    VALUE 0.
       01 WS-NUM22       PIC 9(4)    VALUE 0.
       01 WS-RESULTAT    PIC 9(5)    VALUE 0.
       01 WS-AGE         PIC 99      VALUE 0.
       01 WS-MESSAGE     PIC X(20).
       01 WS-TEXT-VIP    PIC X(20).

       PROCEDURE DIVISION.
       DISPLAY WS-HELOS.
       DISPLAY "Entrez un numero a 4 chifres".
       ACCEPT  WS-NUM11.
       DISPLAY "Entrez un numero a 4 chifres".
       ACCEPT  WS-NUM22.
       COMPUTE WS-RESULTAT = WS-NUM11 + WS-NUM22.
       DISPLAY WS-RESULTAT.

       DISPLAY "Entrez votre âge".
       ACCEPT WS-AGE.

       IF  WS-AGE < 18
           MOVE "Mineur" TO WS-MESSAGE
       ELSE
           IF WS-AGE >= 18 AND WS-AGE < 65
               MOVE "Adulte" TO WS-MESSAGE
           ELSE
               MOVE "Personne âgée" TO WS-MESSAGE
           END-IF
       END-IF
        
       DISPLAY WS-MESSAGE


       DISPLAY "Entrez votre nom".
       ACCEPT WS-TEXT-VIP.
       DISPLAY "VIP " WS-TEXT-VIP.

      


       STOP RUN.

