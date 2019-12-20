#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database: squiz_matrix"

$POSTGRES <<EOSQL
CREATE DATABASE squiz_matrix OWNER matrix;
alter database squiz_matrix SET bytea_output TO 'escape'; 
EOSQL
