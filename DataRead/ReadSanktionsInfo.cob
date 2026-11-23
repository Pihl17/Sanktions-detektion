       IDENTIFICATION DIVISION.
       PROGRAM-ID. READSANKTIONSINFO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SANKTIONSFIL ASSIGN TO "SanctionList.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD SANKTIONSFIL.
       01 SANKTION-RECORD.
           COPY "DataStruktur/SanktionsPerson.cpy".
       
       WORKING-STORAGE SECTION.
       01 FILE-OPENED      PIC X   VALUE "N".

       LINKAGE SECTION.
       01 SANKTIONSOPLYSNING.
           COPY "DataStruktur/SanktionsPerson.cpy".
       01 END-OF-FILE      PIC X   VALUE "N".

       PROCEDURE DIVISION USING SANKTIONSOPLYSNING END-OF-FILE.
       OPEN-FIL.
       IF FILE-OPENED = "N"
           DISPLAY "ReadSanktionsListe: Lukker op for Sanktions-fil"
           OPEN INPUT SANKTIONSFIL
           MOVE "Y" TO FILE-OPENED
           MOVE "N" TO END-OF-FILE
       END-IF.
       
       READ-SANKTION-OPLYSNING.
       MOVE SPACES TO SANKTIONSOPLYSNING
       READ SANKTIONSFIL INTO SANKTION-RECORD
           AT END
               DISPLAY 
                   "ReadSanktionsListe: Kommet til slutning af filen"
               MOVE "Y" TO END-OF-FILE
           NOT AT END
               MOVE SANKTION-RECORD TO SANKTIONSOPLYSNING
       END-READ.
       
       LUK-FIL.
       IF END-OF-FILE = "Y" AND FILE-OPENED = "Y"
           DISPLAY "ReadSanktionsListe: Lukker for Sanktions-fil"
           CLOSE SANKTIONSFIL
           MOVE "N" TO FILE-OPENED
       END-IF.
       EXIT PROGRAM.
