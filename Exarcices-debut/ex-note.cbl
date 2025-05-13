       IDENTIFICATION DIVISION.
       PROGRAM-ID. ExerciceNotes.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  WS-NOTES                 PIC 9(2).
       01  WS-JOUR                  PIC 9(2).  
       01  WS-MOIS                  PIC 9(2).
       01  WS-ANNEE                 PIC 9(04).     

       01  WS-TABLE-NOTES.
           05 WS-NOTE-ENTREE OCCURS 100 TIMES.
               10 WS-NOTE-V          PIC 99.
               10 WS-JOUR-V          PIC 99.
               10 WS-MOIS-V          PIC 99.
               10 WS-ANNEE-V         PIC 9(4).

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


       PROCEDURE DIVISION.
       PERFORM UNTIL WS-IDX > 100 OR WS-NOTES = 99
               DISPLAY "Note"
               ACCEPT WS-NOTES
               DISPLAY "Jour"
               ACCEPT WS-NOTES
               DISPLAY "MOIS"
               ACCEPT WS-NOTES
               DISPLAY "Anee"
               ACCEPT WS-NOTES

               MOVE WS-NOTE  TO WS-NOTE-V(WS-IDX)
               MOVE WS-JOUR  TO WS-JOUR-V(WS-IDX)
               MOVE WS-MOIS  TO WS-MOIS-V(WS-IDX)
               MOVE WS-ANNEE TO WS-ANNEE-V(WS-IDX)

               ADD 1 TO WS-IDX
       END-PERFORM

       PERFORM UNTIL WS-IDX >100
               MOVE WS-NOTE-V(WS-IDX)  TO WS-AFFICHAGE-NOTE
               MOVE WS-JOUR-V(WS-IDX)  TO WS-AFFICHAGE-JOUR
               MOVE WS-MOIS-V(WS-IDX)  TO WS-AFFICHAGE-MOIS
               MOVE WS-ANNEE-V(WS-IDX) TO WS-AFFICHAGE-ANNEE
               DISPLAY   WS-AFFICHAGE.

       END-PERFORM
