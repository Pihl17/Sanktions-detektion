       02 SANKTION-ID      PIC X(5).
       02 NAVN             PIC X(20).
       02 ALIAS-TABLE.
           03 ALIAS-LIST OCCURS 5 TIMES.
               04 ALIAS    PIC X(20).
       02 FØDSELSDATO.
           03 ÅR           PIC 9999.
           03 FILLER       PIC X.
           03 MÅNED        PIC 99.
           03 FILLER       PIC X.
           03 DAG          PIC 99.
       02 LAND             PIC XX.
