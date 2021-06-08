from postgres:12.0-alpine
ENV POSTGRES_USER=cdm
ENV POSTGRES_DB=cdm

run mkdir /tmp/loading
workdir /tmp/loading
add https://github.com/OHDSI/CommonDataModel/archive/v5.2.2.zip ddl.zip
run unzip ddl.zip
run wget http://www.ltscomputingllc.com/wp-content/uploads/2018/08/synpuf1k_omop_cdm_5.2.2.zip -O data.zip
run unzip data.zip

# User needs to download vocab from https://athena.ohdsi.org/vocabulary/list
add vocab.zip vocab.zip
run unzip vocab.zip
add write_loader.sh ./
run apk add openjdk8~=8.275   # for getting CPT data from UMLS
ARG UMLS_API_KEY
run docker-entrypoint.sh --version && su postgres -c 'pg_ctl start && bash write_loader.sh '${UMLS_API_KEY}' | psql -v ON_ERROR_STOP=1 -U '${POSTGRES_USER}' '${POSTGRES_DB}' && pg_ctl stop'
workdir /
run rm -rf /tmp/loading
