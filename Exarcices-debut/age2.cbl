              IDENTIFICATION DIVISION.
       PROGRAM-ID. age.
       AUTHOR. DEBUTANT.
       DATE-WRITTEN. 24-04-2025.

       ENVIRONMENT DIVISION.
           
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AGE         PIC 99       VALUE 0.
       01 WS-REMAINDER   PIC 99       VALUE 0. 
       01 WS-QUOTIENT    PIC 99       VALUE 0. 


       PROCEDURE DIVISION.
       DISPLAY "Entrez votre âge".
       ACCEPT WS-AGE. 

      * Déterminer la catégorie de l'àage
       EVALUATE WS-AGE 
           WHEN < 0
           DISPLAY "L'âge ne peut pas être négatif"
           WHEN < 12
           DISPLAY "Vous ête anfant"
            WHEN < 18
           DISPLAY "Vous ête adolescent"
            WHEN > 18 AND < 65
           DISPLAY "Vous ête adulte"
           WHEN  OTHER
           DISPLAY "Vous ête senieur"
       END-EVALUATE.

      * Vérification de la parité pair et impair
       DIVIDE WS-AGE BY 2 GIVING WS-QUOTIENT REMAINDER WS-REMAINDER.
       IF WS-REMAINDER = 0
           DISPLAY "Numero est pair"
       else
           DISPLAY "Numero est impair"  
       END-IF.

       STOP RUN.


