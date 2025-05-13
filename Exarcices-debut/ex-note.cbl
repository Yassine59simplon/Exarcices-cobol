       IDENTIFICATION DIVISION.
       PROGRAM-ID. ExerciceNotes.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

      *    Variables pour stocker temporairement les données saisies
       01  WS-NOTES                 PIC 9(2).
       01  WS-JOUR                  PIC 9(2).  
       01  WS-MOIS                  PIC 9(2).
       01  WS-ANNEE                 PIC 9(04).     
      *    Tableau pour enregistrer jusqu'à 100 notes avec leurs dates
       01  WS-TABLE-NOTES.
           05 WS-NOTE-ENTREE OCCURS 100 TIMES.
               10 WS-NOTE-V          PIC 99.
               10 WS-JOUR-V          PIC 99.
               10 WS-MOIS-V          PIC 99.
               10 WS-ANNEE-V         PIC 9(4).
      *    Structure d'affichage formatée pour les notes
       01  WS-AFFICHAGE.
           05 FILLER                PIC X(7)  VALUE "Note : ".
           05 WS-AFFICHAGE-NOTE     PIC 99.
           05 FILLER                PIC X(4)  VALUE " le ".
           05 WS-AFFICHAGE-JOUR     PIC 99.
           05 FILLER                PIC X     VALUE "/".
           05 WS-AFFICHAGE-MOIS     PIC 99.
           05 FILLER                PIC X     VALUE "/".
           05 WS-AFFICHAGE-ANNEE    PIC 9(4).   

       01 WS-IDX                    PIC 9(3)  VALUE 1.
       01 WS-MAX                    PIC 9(3)  VALUE 0.

       PROCEDURE DIVISION.

       DISPLAY "Saisie des notes". 
      *  Boucle de saisie des notes jusqu'à 100 ou entrée de 99  
       PERFORM UNTIL WS-IDX > 100
               DISPLAY "Entrez la note (99 pour terminer) : "
               ACCEPT WS-NOTES
               IF WS-NOTES = 99  
                   EXIT PERFORM *> Sort de la boucle si l'utilisateur entre 99
               END-IF

               DISPLAY "Jour : "
               ACCEPT WS-JOUR

               DISPLAY "Mois : "
               ACCEPT WS-MOIS

               DISPLAY "Annee : "
               ACCEPT WS-ANNEE

      *        Stockage des valeurs saisies dans le tableau
               MOVE WS-NOTES TO WS-NOTE-V(WS-IDX)
               MOVE WS-JOUR  TO WS-JOUR-V(WS-IDX)
               MOVE WS-MOIS  TO WS-MOIS-V(WS-IDX)
               MOVE WS-ANNEE TO WS-ANNEE-V(WS-IDX)

               ADD 1 TO WS-IDX
       END-PERFORM.

      *    Calcul du nombre de notes effectivement saisies
           COMPUTE WS-MAX = WS-IDX - 1
           MOVE 1 TO WS-IDX

           DISPLAY "Affichage des notes"
      *    Boucle d'affichage des notes enregistrées
           PERFORM UNTIL WS-IDX > WS-MAX
               MOVE WS-NOTE-V(WS-IDX)  TO WS-AFFICHAGE-NOTE
               MOVE WS-JOUR-V(WS-IDX)  TO WS-AFFICHAGE-JOUR
               MOVE WS-MOIS-V(WS-IDX)  TO WS-AFFICHAGE-MOIS
               MOVE WS-ANNEE-V(WS-IDX) TO WS-AFFICHAGE-ANNEE
               DISPLAY WS-AFFICHAGE
               ADD 1 TO WS-IDX
           END-PERFORM

           STOP RUN.
