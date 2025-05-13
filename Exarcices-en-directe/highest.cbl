      
       IDENTIFICATION DIVISION.
       PROGRAM-ID. highest.
       AUTHOR. Yassine. et Sibory G.
      *    ecrire un programme qui edlande de saisir 5 nombre puis qui 
      *    affiche le plus petit des 5

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    Declaration de la variable nombre saisie
       01 WS-I      PIC 9
      *    Declaration de la variable la plus petite
       01 WS-NUMERO PIC 9(9)
       01 WS-P      PIC 9(9)

 
       PROCEDURE DIVISION.
      *    Boucle PERFORM (5 times) pour effectuer 
      *    le nombre de répétitions
       PERFORM WS-I FROM 1 BY 1 WS-I >5
      *    DISPLAY de la demande de saisie du nombre
           DISPLAY "Entrer numero" WS-I ":"
      *    ACCEPT de la variable saisie
           ACCEPT WS-NUMERO (WS-I)
      *    Condition IF pour savoir si le nombre est plus petit
           IF 
              
           ELSE
              
           END-IF
      *    Si OUI MOVE de la variable saisie dans la variable plus petite

      *    Sinon 
      *    EXIT

      *    Fin de la boucle PERFORM
       END-PERFORM
      *    DISPLAY de la variable la plus petite
       
       

       STOP RUN.