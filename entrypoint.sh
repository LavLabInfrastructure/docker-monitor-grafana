#!/bin/bash
# init postgres database if nonexistent, then start
PGPASSWORD=${GF_DATABASE_PASSWORD:-password} psql -w -h "${GF_DATABASE_HOST:-postgres}" \
        -p "${GF_DATABASE_PORT:-5432}" \
        -U "${GF_DATABASE_USER:-root}" \
        "${GF_DATABASE_NAME:-grafana}" 2> /dev/null || \
    PGPASSWORD=${GF_DATABASE_PASSWORD:-password} psql -h "${GF_DATABASE_HOST:-postgres}" \
        -p "${GF_DATABASE_PORT:-5432}" \
        -U "${GF_DATABASE_USER:-root}" \
        -d "${POSTGRES_DB:-root}" \
        -c "create database ${GF_DATABASE_NAME:-grafana};"

/run.sh
