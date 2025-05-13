       IDENTIFICATION DIVISION.
       PROGRAM-ID. Todo.

       DATA DIVISION.
       WORKING-STORAGE SECTION.                 *> Déclaration des Variables
       01 WS-CHOIX               PIC 9.         *> 4 Choix du menu
       01 WS-NUMERO-TACHES       PIC 9 VALUE 0. *> Taches enregostrées
       01 WS-NT-SUPRIME          PIC 9.         *> Numér de la tache à suprimé
       01 WS-FINAL               PIC 9.         *> Pour continuer, "0" pour quitter

       *> Les variable pour stoker les tâches
       01 WS-TACHE-1             PIC X(20) VALUE SPACES.
       01 WS-TACHE-2             PIC X(20) VALUE SPACES.
       01 WS-TACHE-3             PIC X(20) VALUE SPACES.
       01 WS-TACHE-4             PIC X(20) VALUE SPACES.
       01 WS-TACHE-5             PIC X(20) VALUE SPACES.
          
       PROCEDURE DIVISION.
       DEBUT.
           PERFORM UNTIL WS-CHOIX = 4           *> Boucle principal debut ou fin
               DISPLAY "----- MENU -----"
               DISPLAY "1. Ajouter une tâche"
               DISPLAY "2. Afficher les tâches"
               DISPLAY "3. Supprimer une tâche"
               DISPLAY "4. Quitter"
               DISPLAY "Votre choix du menu: "
               ACCEPT WS-CHOIX

               EVALUATE WS-CHOIX
                   WHEN 1
                       PERFORM AJOUTER
                   WHEN 2
                       PERFORM AFFICHER
                   WHEN 3
                       PERFORM SUPPRIMER
                   WHEN 4
                       DISPLAY "Au revoir."
                   WHEN OTHER
                       DISPLAY "Choix invalide."
               END-EVALUATE
           END-PERFORM.
           STOP RUN.


       AJOUTER.
           IF WS-NUMERO-TACHES = 5
              DISPLAY "La liste est pleine."
            ELSE
             ADD 1 TO WS-NUMERO-TACHES
             DISPLAY "Entrez la tâche : "
                  *> Enregistement la tâche dans la bonne variable
                  EVALUATE WS-NUMERO-TACHES
                   WHEN 1
                    ACCEPT WS-TACHE-1
                   WHEN 2
                    ACCEPT WS-TACHE-2
                   WHEN 3
                    ACCEPT WS-TACHE-3
                   WHEN 4
                    ACCEPT WS-TACHE-4
                   WHEN 5
                    ACCEPT WS-TACHE-5
                  END-EVALUATE
              DISPLAY "Tâche ajoutée."
           END-IF.


       AFFICHER.
           IF WS-NUMERO-TACHES = 0
               DISPLAY "Aucune tâche à afficher."
           ELSE
              IF WS-NUMERO-TACHES >= 1 DISPLAY "1- " WS-TACHE-1
              IF WS-NUMERO-TACHES >= 2 DISPLAY "2- " WS-TACHE-2
              IF WS-NUMERO-TACHES >= 3 DISPLAY "3- " WS-TACHE-3
              IF WS-NUMERO-TACHES >= 4 DISPLAY "4- " WS-TACHE-4
              IF WS-NUMERO-TACHES >= 5 DISPLAY "5- " WS-TACHE-5
           END-IF.

       SUPPRIMER.
           DISPLAY "Numero tache à suprimer"
           ACCEPT WS-NT-SUPRIME   
           IF WS-NUMERO-TACHES = 0
                 DISPLAY "Rien à supprimer"
           ELSE
             EVALUATE WS-NT-SUPRIME 
              WHEN 1
               MOVE SPACES TO WS-TACHE-1 
                 DISPLAY "Tâche suprimée"
              WHEN 2
               MOVE SPACES TO WS-TACHE-2 
                 DISPLAY "Tâche suprimée"
              WHEN 3
               MOVE SPACES TO WS-TACHE-3 
                 DISPLAY "Tâche suprimée"
              WHEN 4
               MOVE SPACES TO WS-TACHE-4
                 DISPLAY "Tâche suprimée"
              WHEN 5
               MOVE SPACES TO WS-TACHE-5
                 DISPLAY "Tâche suprimée"   
              WHEN OTHER
                 DISPLAY "Numéro invalid"
             END-EVALUATE
           END-IF.



          


       
