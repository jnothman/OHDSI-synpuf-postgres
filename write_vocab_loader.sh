#!/bin/bash

cat "CommonDataModel-5.2.2/PostgreSQL/OMOP CDM ddl - PostgreSQL.sql"
cat "CommonDataModel-5.2.2/PostgreSQL/VocabImport/OMOP CDM vocabulary load - PostgreSQL.sql" | sed "s|C:\\\\CDMV5VOCAB\\\\||g;s|^COPY|\\\\copy|"
