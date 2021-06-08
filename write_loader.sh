#!/bin/bash

cat "CommonDataModel-5.2.2/PostgreSQL/OMOP CDM ddl - PostgreSQL.sql"

bash cpt.sh $UMLS_API_KEY
for table in care_site cdm_source condition_era condition_occurrence cost death device_exposure drug_era drug_exposure location measurement observation observation_period payer_plan_period person procedure_occurrence provider visit_occurrence
do
	echo \\"copy $table FROM '$table.csv' DELIMITER E'\t' CSV ENCODING 'UTF8';"
done
cat "CommonDataModel-5.2.2/PostgreSQL/VocabImport/OMOP CDM vocabulary load - PostgreSQL.sql" | sed "s|C:\\\\CDMV5VOCAB\\\\||g;s|^COPY|\\\\copy|"
cat "CommonDataModel-5.2.2/PostgreSQL/OMOP CDM constraints - PostgreSQL.sql"
cat "CommonDataModel-5.2.2/PostgreSQL/OMOP CDM indexes required - PostgreSQL.sql"
