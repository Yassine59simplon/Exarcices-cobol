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
           05 F-NOM             PIC X(15).
           05 F-PRENOM          PIC X(15).
           05 F-DATTE           PIC X(15).

       WORKING-STORAGE SECTION.
       01 WS-IDX                PIC 99 VALUE 1.
       01 WS-NOM-RECHERCHE      PIC X(15).
       01 WS-TROUVE             PIC X VALUE "N".

       01 WS-TABLE.    
           05 WS-GENS OCCURS 10 TIMES.
              10 WS-NOM         PIC X(15).
              10 WS-PRENOM      PIC X(15).
              10 WS-JOUR        PIC 9(2).
              10 WS-MOIS        PIC 9(2). 
              10 WS-ANNEE       PIC 9(4).

       01 WS-AGE                PIC 9(3).
       77 WS-FIN_F              PIC X  VALUE "C".  
       77 WS-ANNEE-ACT          PIC 9(4) VALUE 2025.


       PROCEDURE DIVISION.
      * Demande à l'utilisateur de saisir un nom
       DISPLAY "Entrez le nom à rechercher : ".
       ACCEPT WS-NOM-RECHERCHE.
       MOVE FUNCTION UPPER-CASE(WS-NOM-RECHERCHE) 
       TO WS-NOM-RECHERCHE.

      * Début du traitement du fichier
       OPEN INPUT FICHIER-P.
       PERFORM UNTIL WS-FIN_F = "F"
           READ FICHIER-P
              AT END MOVE "F"    TO WS-FIN_F
              NOT AT END 
              MOVE F-NOM         TO WS-NOM(WS-IDX)
              MOVE F-PRENOM      TO WS-PRENOM(WS-IDX)
              MOVE F-DATTE (1:2) TO WS-MOIS(WS-IDX)
              MOVE F-DATTE (3:2) TO WS-JOUR(WS-IDX)
              MOVE F-DATTE (5:4) TO WS-ANNEE(WS-IDX)

      * Vérifier si le nom correspond à celui recherché
              IF WS-NOM(WS-IDX) = WS-NOM-RECHERCHE
                 MOVE "O" TO WS-TROUVE
      * Calcul de l'âge à partir de 2025
                 COMPUTE WS-AGE = WS-ANNEE-ACT - WS-ANNEE(WS-IDX)
                 DISPLAY "Nom     : " WS-NOM(WS-IDX)
                 DISPLAY "Prénom  : " WS-PRENOM(WS-IDX)
                 DISPLAY "Age     : " WS-AGE
                 EXIT PERFORM
              END-IF
              ADD 1 TO WS-IDX
           END-READ
       END-PERFORM.
       CLOSE FICHIER-P.

      * Si aucune personne n'a été trouvée
       IF WS-TROUVE = "N"
           DISPLAY "Aucune personne trouvée avec le nom : " 
           WS-NOM-RECHERCHE
       END-IF.

       STOP RUN.
