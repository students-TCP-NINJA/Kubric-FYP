#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./scripts/bootstrap-db.sh <postgres-host> <postgres-user> <postgres-db>
# Example:
#   ./scripts/bootstrap-db.sh localhost postgres kubric

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <postgres-host> <postgres-user> <postgres-db>"
  exit 1
fi

PGHOST="$1"
PGUSER="$2"
PGDATABASE="$3"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DB_DIR="${ROOT_DIR}/v1_configs/database"

echo "==> Applying PostgreSQL schema"
psql "host=${PGHOST} user=${PGUSER} dbname=${PGDATABASE}" -f "${DB_DIR}/postgresql-init.sql"

echo "==> Applying TimescaleDB schema"
psql "host=${PGHOST} user=${PGUSER} dbname=${PGDATABASE}" -f "${DB_DIR}/timescaledb-init.sql"

echo "Database bootstrap complete."