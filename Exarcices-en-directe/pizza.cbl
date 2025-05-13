       IDENTIFICATION DIVISION.
       PROGRAM-ID. pizza.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *le tableau qui contiendra les noms des convives, ainsi que les pizzas commandés par les convives
       01 WS-GROUP.
          05 WS-COMMAND OCCURS 50 TIMES.
             10 WS-NAME           PIC A(20).
             10 WS-PIZZA1         PIC A(10).
             10 WS-PIZZA2         PIC A(10).
      *un index pour parcourir le tableau
       77 WS-IDX1                PIC 99.
      *le nombre de convive
       01 WS-NB-INV              PIC 99.
      *le nombre de pizza a commander 
       01 WS-NB-PIZ              PIC 999V99.
      *01 WS-NB-PIZ-ARONDIR      PIC 999V99.
      *les parts restantes de pizza
       01 WS-REST                PIC 999V99.

       PROCEDURE DIVISION.
       
       DISPLAY 'FAITE VOTRE COMMANDE'.
      *on récupère les noms des convives et les pizza qu'ils souhaitent
       PERFORM VARYING WS-IDX1 FROM 1 BY 1 UNTIL WS-NAME(WS-IDX1 - 1) = 
                     'FIN' OR WS-IDX1 = 51
         DISPLAY 'Sasir Nom du convive: ' SPACE WITH NO ADVANCING
                 ACCEPT WS-NAME(WS-IDX1)
         DISPLAY 'Sasir pizza pour ' WS-NAME(WS-IDX1) ': ' SPACE WITH
                 NO ADVANCING ACCEPT WS-PIZZA1(WS-IDX1)
         DISPLAY 'Saisir pizza pour ' WS-NAME(WS-IDX1) ': ' SPACE WITH
                NO ADVANCING ACCEPT WS-PIZZA2(WS-IDX1)
       END-PERFORM.

      *on affiche toutes les pizzas que veulent les convives
       PERFORM VARYING WS-IDX1 FROM 1 BY 1 UNTIL WS-NAME(WS-IDX1 - 1) = 
                     'FIN' OR WS-IDX1 = 51
           DISPLAY WS-PIZZA1(WS-IDX1) '  '   WS-PIZZA2(WS-IDX1)    
       END-PERFORM.
      *on calcule le nombre de convive
       COMPUTE WS-NB-INV = WS-IDX1 - 2.
      *on calcule le nombre de pizza
       COMPUTE WS-NB-PIZ = WS-NB-INV * 1.1.
      *on calcule les pizza qui resteront à la fin de la soirée pizza
       COMPUTE WS-REST = WS-NB-INV * 2 - WS-NB-PIZ.
      *on affiche le nombre d'inviter, le nombre de pizza commander et les pizza restantes
       DISPLAY "Vous avez inviter : " WS-NB-INV.
       DISPLAY "Vous douvez comender : " WS-NB-PIZ.
       DISPLAY "il vous resteura : " WS-REST.

       STOP RUN.

