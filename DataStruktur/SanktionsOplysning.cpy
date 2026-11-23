       10 SANKTION-ID      PIC X(5).
       10 NAVN             PIC X(20).
       10 ALIAS-TABLE.
           11 ALIAS-LIST OCCURS 5 TIMES.
               12 ALIAS    PIC X(20).
       10 FØDSELSDATO.
           11 ÅR           PIC 9999.
           11 FILLER       PIC X.
           11 MÅNED        PIC 99.
           11 FILLER       PIC X.
           11 DAG          PIC 99.
       10 LAND             PIC XX.
