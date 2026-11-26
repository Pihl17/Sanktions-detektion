       IDENTIFICATION DIVISION.
       PROGRAM-ID. SANKTIONSDETEKTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 KUNDE.
           COPY "DataStruktur/KundeOplysning.cpy".
       01 END-OF-KUNDER        PIC X   VALUE "N".

       01 SANKTIONS-MATCH.
           COPY "DataStruktur/SanktionsMatch.cpy".

       PROCEDURE DIVISION.
       PERFORM UNTIL END-OF-KUNDER = "Y"
           CALL 'READKUNDEINFO' USING REFERENCE KUNDE END-OF-KUNDER
           IF END-OF-KUNDER NOT = "Y"
               CALL 'FINDBESTEMATCH' USING CONTENT KUNDE 
                   REFERENCE SANKTIONS-MATCH
               DISPLAY KUNDE-ID SPACE NAVN OF KUNDE " | "
                   SANKTION-ID SPACE NAVN OF SANKTIONS-MATCH 
                   " (" NAVN-MATCH-PROCENT "%)" " | "
                   FØDSELSDATO OF KUNDE " | " 
                   FØDSELSDATO OF SANKTIONS-MATCH
                   " ( " FØDSELSDATO-MATCH-PROCENT " %)"
                   " | " LAND OF KUNDE " | " LAND OF SANKTIONS-MATCH 
                   " ( " LAND-MATCH-PROCENT " %)" 
                   " | " SAMLET-MATCH-PROCENT " % "
           END-IF
           CALL 'GEMKUNDESANKTIONSMATCH' USING
               CONTENT KUNDE SANKTIONS-MATCH END-OF-KUNDER
       END-PERFORM

       STOP RUN.
