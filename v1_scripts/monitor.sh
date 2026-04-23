#!/usr/bin/env bash
set -euo pipefail

# Captures a lightweight operational snapshot for troubleshooting.
NAMESPACE="${1:-kubric-prod}"
MON_NS="${2:-kubric-monitoring}"
TS="$(date +%Y%m%d_%H%M%S)"
OUT_DIR="monitoring_snapshot_${TS}"

mkdir -p "${OUT_DIR}"

command -v kubectl >/dev/null 2>&1 || { echo "kubectl not found"; exit 1; }

echo "==> Collecting workload status"
kubectl -n "${NAMESPACE}" get deploy,pods,svc,hpa,pdb,networkpolicy -o wide > "${OUT_DIR}/workloads.txt"

echo "==> Collecting recent events"
kubectl -n "${NAMESPACE}" get events --sort-by=.metadata.creationTimestamp > "${OUT_DIR}/events.txt"

echo "==> Collecting monitoring configmaps"
kubectl -n "${MON_NS}" get configmap > "${OUT_DIR}/monitoring-configmaps.txt" || true

echo "==> Collecting top node and pod usage (if metrics server exists)"
kubectl top nodes > "${OUT_DIR}/top-nodes.txt" 2>/dev/null || echo "metrics server not available" > "${OUT_DIR}/top-nodes.txt"
kubectl -n "${NAMESPACE}" top pods > "${OUT_DIR}/top-pods.txt" 2>/dev/null || echo "metrics server not available" > "${OUT_DIR}/top-pods.txt"

echo "Snapshot saved to ${OUT_DIR}"
