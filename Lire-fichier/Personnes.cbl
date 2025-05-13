       IDENTIFICATION DIVISION.
       PROGRAM-ID. Personnes-d.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHIER-P ASSIGN TO 'personnes.txt'     
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHIER-P.
       01  F-LIGNE.
           05 F-NOM     PIC X(15).
           05 F-PRENOM  PIC X(15).
           05 F-DATTE   PIC x(15).

       WORKING-STORAGE SECTION.
       01 WS-IDX       PIC 99 VALUE 1.
           
       01 WS-TABLE.    
           05 WS-GENS OCCURS 10 TIMES.
              10 WS-NOM                PIC x(15).
              10 WS-PRENOM             PIC x(15).
              10 WS-JOUR               PIC 9(2).
              10 WS-MOIS               PIC 9(2). 
              10 WS-ANNEE              PIC 9(4).        


       77 WS-FIN_F   PIC X  VALUE "C".  

       PROCEDURE DIVISION.
      *DEBUT FE FICHIER 
       OPEN INPUT FICHIER-P.
       PERFORM UNTIL WS-FIN_F = "F"
           READ FICHIER-P
              AT END MOVE "F" TO WS-FIN_F
              NOT AT END 
              MOVE F-NOM    TO WS-NOM(WS-IDX)
              MOVE F-PRENOM TO WS-PRENOM(WS-IDX)
              MOVE F-DATTE (1:2) TO WS-MOIS(WS-IDX)
              MOVE F-DATTE (3:2) TO WS-JOUR(WS-IDX)
              MOVE F-DATTE (5:4) TO WS-ANNEE(WS-IDX)

              ADD 1 TO WS-IDX
           END-READ
       END-PERFORM.
       
       CLOSE FICHIER-P.

           PERFORM VARYING WS-IDX FROM 1 BY 1 UNTIL WS-IDX =11
                 DISPLAY "Nom     : "    WS-NOM(WS-IDX)
                 SPACE WITH NO ADVANCING
                 DISPLAY "Prenom  : "    WS-PRENOM(WS-IDX) 
                 SPACE WITH NO ADVANCING
                 DISPLAY "Date    : "    WS-JOUR(WS-IDX)
                                     "/" WS-MOIS(WS-IDX)
                                     "/" WS-ANNEE(WS-IDX) 
                 

           END-PERFORM.
           

       STOP RUN.   
