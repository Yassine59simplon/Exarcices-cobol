       IDENTIFICATION DIVISION.
       PROGRAM-ID. IsogramChecker.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INDEX1                       PIC 9(2) VALUE 1.
       01 WS-INDEX2                       PIC 9(2) VALUE 2.
       01 WS-Isogram                      PIC X VALUE 'Y'.

      * Tableau contenant les lettres du mot
       01 WS-LETTRES.
          05 WS-LETTRE OCCURS 20.
             10 CARACTERE                 PIC X.

       PROCEDURE DIVISION.
       DISPLAY "Entrez un mot (max 20 lettres) : ".
       ACCEPT WS-LETTRES.

      *Boucle principale jusqu’à la fin du mot ou du tableau
       PERFORM UNTIL WS-INDEX1 > 19 OR WS-LETTRE(WS-INDEX1) = SPACE
      *Boucle secondaire pour comparer chaque lettre avec les suivantes
            PERFORM UNTIL WS-INDEX2 > 20 OR WS-LETTRE(WS-INDEX2) = SPACE
                   IF WS-LETTRE(WS-INDEX1) = WS-LETTRE(WS-INDEX2)
                       MOVE 'N' TO WS-Isogram
      *Passe à l'instruction suivante sans terminer la boucle
                       NEXT SENTENCE
                   END-IF
                   ADD 1 TO WS-INDEX2
               END-PERFORM
            ADD 1 TO WS-INDEX1
            COMPUTE WS-INDEX2 = WS-INDEX1 + 1
       END-PERFORM.

           IF WS-Isogram = "N"
             DISPLAY WS-LETTRES ": N'est pas isogram"
            ELSE
             DISPLAY WS-LETTRES ": est isogram"
           END-IF.

       STOP RUN. 
