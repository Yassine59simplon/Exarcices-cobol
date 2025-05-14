       IDENTIFICATION DIVISION.
       PROGRAM-ID. RUPTURE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FICHIER-INVENTAIRE ASSIGN TO "inventaire.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

           SELECT FICHIER-RUPTURE ASSIGN TO "rupture.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  FICHIER-INVENTAIRE.
       01  F-LIGNE-INVENTAIRE.
           05  F-NOM-ARTICLE                  PIC X(10).
           05  F-STOCK-ARTICLE                PIC 9(02).

       FD  FICHIER-RUPTURE.
       01  LIGNE-RUPTURE.
           05  NOM-RUPTURE                     PIC X(10).
           05  STOCK-RUPTURE                   PIC 9(02).
           

       WORKING-STORAGE SECTION.
       01 WS-FIN                               PIC X VALUE "C". 
       01 WS-NDX-ARTICLE                       PIC 9(02) VALUE 1.
       01 WS-IDX-RUPTURE                       PIC 9(02) VALUE 0.

       01 WS-TABLE.    
           05 WS-ARTICLE OCCURS 15 TIMES.
              10 WS-NOM-ARTICLE                PIC X(10).
              10 WS-STOCK-ARTICLE              PIC 9(02).

       PROCEDURE DIVISION.
       OPEN INPUT FICHIER-INVENTAIRE
           PERFORM UNTIL WS-FIN = "F"
             READ FICHIER-INVENTAIRE
             AT END 
              MOVE "F" TO WS-FIN
             NOT AT END
              MOVE F-NOM-ARTICLE    TO WS-NOM-ARTICLE(WS-IDX-ARTICLE)
              MOVE F-STOCK-ARTICLE  TO WS-STOCK-ARTICLE(WS-IDX-ARTICLE)
              ADD 1 TO WS-NOM-ARTICLE
           END-PERFORM
       CLOSE FICHIER-INVENTAIRE.

       OPEN OUTPUT FICHIER-RUPTURE 
           PERFORM VARYING WS-NDX-ARTICLE FROM 1 BY 1 
               UNTIL WS-NDX-ARTICLE > 15
               IF WS-STOCK-ARTICLE(WS-NDX-ARTICLE) = 0
                MOVE WS-NOM-ARTICLE(WS-NDX-ARTICLE) TO NOM-RUPTURE
                MOVE WS-STOCK-ARTICLE(WS-NDX-ARTICLE) TO STOCK-RUPTURE 
                WRITE LIGNE-RUPTURE
                ADD 1 TO WS-IDX-RUPTURE 
               END-IF
           END-PERFORM
       CLOSE FICHIER-RUPTURE. 
       STOP RUN. 
           