       IDENTIFICATION DIVISION.
       PROGRAM-ID. LIRE-NOMS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    Fichier d'entrée assigné au nom "gens.txt"
           SELECT FICHIER ASSIGN TO 'gens.txt' 
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHIER.
       01  F-LIGNE.
           05 F-NOM     PIC X(12).
           05 F-PRENOM  PIC X(12).

       WORKING-STORAGE SECTION.
       01 WS-IDX       PIC 99 VALUE 1.
           
       01 WS-TABLE. 
      *    Tableau pouvant contenir jusqu'à 10 enregistrements   
           05 WS-GENS OCCURS 10 TIMES.
              10 WS-NOM         PIC x(12).
              10 WS-PRENOM      PIC x(12).


       77 WS-FIN_F   PIC X  VALUE "C".  

       PROCEDURE DIVISION.
      *DEBUT DE FICHIER 
       OPEN INPUT FICHIER.
      * Lecture ligne par ligne jusqu'à la fin du fichier
       PERFORM UNTIL WS-FIN_F = "F"
           READ FICHIER
              AT END MOVE "F" TO WS-FIN_F
              NOT AT END 
              MOVE F-NOM    TO WS-NOM(WS-IDX)
              MOVE F-PRENOM TO WS-PRENOM(WS-IDX)
              ADD 1 TO WS-IDX
           END-READ
       END-PERFORM.
      * Fermeture du fichier 
       CLOSE FICHIER.

           PERFORM VARYING WS-IDX FROM 1 BY 1 UNTIL WS-IDX = 11
                 DISPLAY "Nom        :"WS-NOM(WS-IDX)
                 SPACE WITH NO ADVANCING
                 DISPLAY "Prenom     :"WS-PRENOM(WS-IDX) 
           END-PERFORM.
           

       STOP RUN.   
