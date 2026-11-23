       10 SANKTION-ID      PIC X(5).
       10 NAVN             PIC X(20).
       10 ALIAS-TABLE.
           11 ALIAS-LIST OCCURS 5 TIMES.
               12 ALIAS    PIC X(20).
       10 FØDSELSDATO.
           COPY "DataStruktur/dato/SanktionList.cpy".
       10 LAND             PIC XX.
