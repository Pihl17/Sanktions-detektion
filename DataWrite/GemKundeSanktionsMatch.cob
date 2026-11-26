       IDENTIFICATION DIVISION.
       PROGRAM-ID. GEMKUNDESANKTIONSMATCH.
       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT MATCHFIL ASSIGN TO "Output/KundeSanktionsMatches.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD MATCHFIL.
       01 KS-MATCH.
           COPY "DataStruktur/KundeSanktionMatch.cpy".
       
       WORKING-STORAGE SECTION.
       01 FILE-OPENED  PIC X   VALUE "N".

       LINKAGE SECTION.
       01 KUNDE.
           COPY "DataStruktur/KundeOplysning.cpy".
       01 SANKTION.
           COPY "DataStruktur/SanktionsMatch.cpy".
       01 CLOSE-FILE   PIC X.
       
       PROCEDURE DIVISION USING KUNDE SANKTION CLOSE-FILE.
       
       OPEN-FIL.
       IF FILE-OPENED = "N" AND CLOSE-FILE NOT = "Y"
           DISPLAY "GemKundeSanktionsMatch: Lukker op for output-fil"
           OPEN OUTPUT MATCHFIL
           MOVE "Y" TO FILE-OPENED
       END-IF.
       
       UDSKRIV-KUNDE-SANKTION-MATCH.
       IF CLOSE-FILE NOT = "Y"
           STRING KUNDE SANKTION INTO KS-MATCH
           WRITE KS-MATCH
       END-IF.

       LUK-FIL.
       IF CLOSE-FILE = "Y" AND FILE-OPENED = "Y"
           DISPLAY "GemKundeSanktionsMatch: Lukker for output-fil"
           CLOSE MATCHFIL
           MOVE "N" TO FILE-OPENED
       END-IF.

       EXIT PROGRAM.
