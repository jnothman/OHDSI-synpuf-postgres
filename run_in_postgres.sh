#!/bin/bash
SCRIPT="$1"
docker-entrypoint.sh --version && su postgres -c 'pg_ctl start && bash '$SCRIPT' | psql -v ON_ERROR_STOP=1 -U '${POSTGRES_USER}' '${POSTGRES_DB}' && pg_ctl stop'
