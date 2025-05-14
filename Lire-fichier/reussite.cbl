       IDENTIFICATION DIVISION.
       PROGRAM-ID. REUSSITE.
      * Programme qui lit une liste d'élèves et leurs notes depuis un fichier
      * et écrit ceux ayant une note >= 10 dans un autre fichier.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    Fichier d'entrée contenant les noms et les notes des élèves.
           SELECT ELEVE-FILE ASSIGN TO "eleves.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

      * Fichier de sortie contenant les élèves ayant réussi (note >= 10).
           SELECT REUSSITE-FILE ASSIGN TO "REUSSITE.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  ELEVE-FILE.
       01  F-ELEVE-LAGNE.
           05  F-NOM-ELEVE             PIC X(10).
           05  F-NOTE-ELEVE            PIC 9(02).

      * Structure de l’enregistrement écrit dans le fichier REUSSITE.txt.
       FD  REUSSITE-FILE.
       01  REUSSITE-NOTE.
           05  R-NOM-ELEVE             PIC X(10).
           05  R-NOTE-ELEVE            PIC 99.

       WORKING-STORAGE SECTION.
       01 WS-FIN                       PIC X VALUE "C". 
       01 WS-IDX-ELEV                  PIC 9(02) VALUE 1.
       01 WS-IDX-REUSSITE              PIC 9(02) VALUE 0.

       01 WS-TABLE. 
      *    Tableau pouvant contenir jusqu'à 15 enregistrements   
           05 WS-ELEVE OCCURS 15 TIMES.
              10 WS-NOM               PIC X(10).
              10 WS-NOTE              PIC 9(02).
  
       PROCEDURE DIVISION.
      * Ouverture du fichier des élèves pour lecture.
       OPEN INPUT ELEVE-FILE
           PERFORM UNTIL WS-FIN = "F"
               READ ELEVE-FILE
                  AT END 
                      MOVE "F" TO WS-FIN
                  NOT AT END 
                      MOVE F-NOM-ELEVE  TO WS-NOM(WS-IDX-ELEV)
                      MOVE F-NOTE-ELEVE TO WS-NOTE(WS-IDX-ELEV)
                      ADD 1 TO WS-IDX-ELEV
               END-READ
           END-PERFORM.
       CLOSE ELEVE-FILE.

      * Ouverture du fichier de sortie.
       OPEN OUTPUT REUSSITE-FILE 
           PERFORM VARYING WS-IDX-ELEV FROM 1 BY 1 
                   UNTIL WS-IDX-ELEV > 15
               IF WS-NOTE(WS-IDX-ELEV) >= 10
                   MOVE WS-NOM(WS-IDX-ELEV)  TO R-NOM-ELEVE
                   MOVE WS-NOTE(WS-IDX-ELEV) TO R-NOTE-ELEVE
                   WRITE REUSSITE-NOTE
                   ADD 1 TO WS-IDX-REUSSITE 
               END-IF
           END-PERFORM.
       CLOSE REUSSITE-FILE.
   
       STOP RUN.
