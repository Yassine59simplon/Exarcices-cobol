       IDENTIFICATION DIVISION.
       PROGRAM-ID. test-en-direct.
       AUTHOR.

       ENVIRONMENT DIVISION.
       
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 ClientType       PIC X(10).
       01 ClientBalance    PIC 9(6)V99.
       01 ClientCategory   PIC X(20).

       PROCEDURE DIVISION.

       DISPLAY "Entrez un nombre: ". 
       ACCEPT WS-NUMBER-01.
        

               IF WS-NUMBER-01 < 0
                   DISPLAY "Le numero est negatif".
               ELSE
                 WS-NUMBER-01 > 0
                   DISPLAY "Le numero est psitif".
                  END-IF

       DISPLAY "Entrez le type de client (VIP ou Standard) : ".
       ACCEPT ClientType
       
       DISPLAY "Entrez le solde du client : ".
       ACCEPT ClientBalance

       EVALUATE TRUE
           WHEN ClientType = "VIP" AND ClientBalance > 10000
               MOVE "Premium" TO ClientCategory
           WHEN ClientType = "VIP" AND ClientBalance <= 10000
               MOVE "Privilégié" TO ClientCategory
           WHEN ClientType = "Standard" AND ClientBalance > 5000
               MOVE "Fidèle" TO ClientCategory
           WHEN OTHER
               MOVE "Standard" TO ClientCategory
       END-EVALUATE

       DISPLAY "Le client est de catégorie : " ClientCategory
       

       STOP RUN.

