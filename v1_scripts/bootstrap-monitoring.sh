#!/usr/bin/env bash
set -euo pipefail

MON_NS="${1:-kubric-monitoring}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MONITOR_DIR="${ROOT_DIR}/v1_configs/monitoring"

echo "==> Ensuring monitoring namespace exists"
kubectl get ns "${MON_NS}" >/dev/null 2>&1 || kubectl create ns "${MON_NS}"

echo "==> Applying monitoring ConfigMaps"
kubectl -n "${MON_NS}" create configmap kubric-prometheus-alert-rules \
  --from-file="${MONITOR_DIR}/prometheus-alert-rules.yaml" \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl -n "${MON_NS}" create configmap kubric-alertmanager-config \
  --from-file="${MONITOR_DIR}/alertmanager-config.yaml" \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl -n "${MON_NS}" create configmap kubric-grafana-baseline \
  --from-file="${MONITOR_DIR}/grafana-dashboard-baseline.yaml" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "Monitoring bootstrap complete."