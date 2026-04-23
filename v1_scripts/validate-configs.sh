#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="${ROOT_DIR}/v1_configs"

echo "==> Validating Kubernetes manifests"
find "${CONFIG_DIR}/kubernetes" -type f \( -name "*.yaml" -o -name "*.yml" \) | while read -r file; do
  echo "  - ${file}"
  kubectl apply --dry-run=client -f "${file}" >/dev/null
done

echo "==> Basic file presence checks"
required_files=(
  "${CONFIG_DIR}/security/wazuh-rule-pack.yaml"
  "${CONFIG_DIR}/security/iam-policy-baseline.yaml"
  "${CONFIG_DIR}/monitoring/prometheus-alert-rules.yaml"
  "${CONFIG_DIR}/monitoring/alertmanager-config.yaml"
  "${CONFIG_DIR}/database/postgresql-init.sql"
  "${CONFIG_DIR}/database/timescaledb-init.sql"
  "${CONFIG_DIR}/database/opensearch-index-template.json"
)

for f in "${required_files[@]}"; do
  [[ -f "${f}" ]] || { echo "Missing file: ${f}"; exit 1; }
done

echo "All validations passed."