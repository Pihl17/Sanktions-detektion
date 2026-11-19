       IDENTIFICATION DIVISION.
       PROGRAM-ID. READKUNDEINFO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT KUNDEFIL ASSIGN TO "KundeOplysninger.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD KUNDEFIL.
       01 KUNDE-RECORD.
           COPY "DataStruktur/KundeOplysning.cpy".
       
       WORKING-STORAGE SECTION.
       01 FILE-OPENED      PIC X   VALUE "N".

       LINKAGE SECTION.
       01 KUNDEOPLYSNINGER.
           COPY "DataStruktur/KundeOplysning.cpy".
       01 END-OF-FILE      PIC X   VALUE "N".

       PROCEDURE DIVISION USING KUNDEOPLYSNINGER END-OF-FILE.
       OPEN-FIL.
       IF FILE-OPENED = "N"
           DISPLAY "ReadKundeInfo: Lukker op for kunde-fil"
           OPEN INPUT KUNDEFIL
           MOVE "Y" TO FILE-OPENED
           MOVE "N" TO END-OF-FILE
       END-IF.
       
       READ-KUNDE.
       MOVE SPACES TO KUNDEOPLYSNINGER
       READ KUNDEFIL INTO KUNDE-RECORD
           AT END
               DISPLAY "ReadKundeInfo: Kommet til slutning af filen"
               MOVE "Y" TO END-OF-FILE
           NOT AT END
               MOVE KUNDE-RECORD TO KUNDEOPLYSNINGER
       END-READ.
       
       LUK-FIL.
       IF END-OF-FILE = "Y" AND FILE-OPENED = "Y"
           DISPLAY "ReadKundeInfo: Lukker for kunde-fil"
           CLOSE KUNDEFIL
           MOVE "N" TO FILE-OPENED
       END-IF.
       EXIT PROGRAM.
