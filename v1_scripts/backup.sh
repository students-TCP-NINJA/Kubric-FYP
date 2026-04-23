#!/usr/bin/env bash
set -euo pipefail

# Creates timestamped backups of architecture docs and configuration baselines.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="${ROOT_DIR}/backups"
TS="$(date +%Y%m%d_%H%M%S)"
TARGET="${BACKUP_DIR}/kubric_backup_${TS}"

mkdir -p "${TARGET}"

copy_if_exists() {
  local src="$1"
  if [[ -e "${src}" ]]; then
    cp -r "${src}" "${TARGET}/"
  fi
}

copy_if_exists "${ROOT_DIR}/v1_docs"
copy_if_exists "${ROOT_DIR}/v1_configs"
copy_if_exists "${ROOT_DIR}/v1_scripts"
copy_if_exists "${ROOT_DIR}/diagrams"
copy_if_exists "${ROOT_DIR}/templates"

# Create compressed archive for transport.
tar -czf "${TARGET}.tar.gz" -C "${BACKUP_DIR}" "kubric_backup_${TS}"

echo "Backup completed: ${TARGET}.tar.gz"
