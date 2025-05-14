       IDENTIFICATION DIVISION.
       PROGRAM-ID. LIRE-NOMS.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *    Fichier d'entrée assigné au nom "gens.txt"
           SELECT FICHIER ASSIGN TO 'gens.txt' 
               ORGANIZATION IS LINE SEQUENTIAL.

      *    Fichier de sortie avec les noms dans l'ordre original
           SELECT ORDRE-FICHIER ASSIGN TO 'ordre.txt' 
               ORGANIZATION IS LINE SEQUENTIAL. 

      *    Fichier de sortie avec les noms en ordre inverse
           SELECT INVERSE-FICHIER ASSIGN TO 'inferse.txt'
               ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
      * Définition de la structure du fichier d'entrée
       FD  FICHIER.
       01  F-LIGNE.
           05 F-NOM               PIC X(12).
           05 F-PRENOM            PIC X(12).

      * Définition de la structure du fichier de sortie en ordre  
       FD  ORDRE-FICHIER.
       01  F-ORDRE-LIGNE.
           05 F-ORDRE-NOM         PIC X(12).
           05 F-ORDRE-PRENOM      PIC X(12).

      * Définition de la structure du fichier de sortie en ordre inverse
       FD  INVERSE-FICHIER.
       01  F-INVERSE-LIGNE.
           05 F-INVERSE-NOM       PIC X(12).
           05 F-INVERSE-PRENOM    PIC X(12).

       WORKING-STORAGE SECTION.
      * Compteurs d'index pour boucles
       01 WS-IDX                  PIC 99 VALUE 1.
       01 WS-IDX-ORDRE            PIC 99 VALUE 1.
       01 WS-IDX-INVERSE          PIC 99 VALUE 0.
           
       01 WS-TABLE. 
      *    Tableau pouvant contenir jusqu'à 10 enregistrements   
           05 WS-GENS OCCURS 10 TIMES.
              10 WS-NOM          PIC x(12).
              10 WS-PRENOM       PIC x(12).

       77 WS-FIN_F   PIC X  VALUE "C".  

       PROCEDURE DIVISION.
      *DEBUT DE FICHIER 
       OPEN INPUT FICHIER.
      *    Lecture ligne par ligne jusqu'à la fin du fichier
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

       OPEN OUTPUT ORDRE-FICHIER.
      *    Écriture des noms dans l'ordre original
           PERFORM VARYING WS-IDX-ORDRE FROM 1 BY 1 UNTIL WS-IDX-ORDRE
                   >= WS-IDX
                   MOVE WS-NOM(WS-IDX-ORDRE) TO F-ORDRE-NOM
                   MOVE WS-PRENOM(WS-IDX-ORDRE) TO F-ORDRE-PRENOM
                   WRITE F-ORDRE-LIGNE
           END-PERFORM.
       CLOSE ORDRE-FICHIER. 
 
       OPEN OUTPUT INVERSE-FICHIER.
      *    Écriture des noms dans l'ordre inverse
           PERFORM VARYING WS-IDX-INVERSE FROM 10 BY -1 
                   UNTIL WS-IDX-INVERSE < 1
                   MOVE WS-NOM(WS-IDX-INVERSE) TO F-INVERSE-NOM
                   MOVE WS-PRENOM(WS-IDX-INVERSE) TO F-INVERSE-PRENOM
                   WRITE F-INVERSE-LIGNE
           END-PERFORM.
       CLOSE INVERSE-FICHIER.
       
       STOP RUN.   
