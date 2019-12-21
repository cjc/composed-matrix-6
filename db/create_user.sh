#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database roles: matrix, matrix_secondary"

$POSTGRES <<-EOSQL
CREATE USER matrix WITH CREATEDB PASSWORD '${DB_PASS}';
CREATE USER matrix_secondary WITH CREATEDB PASSWORD '${DB_PASS}';
EOSQL
