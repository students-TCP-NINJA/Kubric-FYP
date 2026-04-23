#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Kubric Bootstrap Script
# Applies core Kubernetes, DB, monitoring, and security baselines
# ============================================================

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_DIR="${ROOT_DIR}/v1_configs"
K8S_DIR="${CONFIG_DIR}/kubernetes"
MONITOR_DIR="${CONFIG_DIR}/monitoring"
DB_DIR="${CONFIG_DIR}/database"

NAMESPACE="kubric-prod"
MON_NS="kubric-monitoring"

echo "==> [1/8] Pre-checks"
command -v kubectl >/dev/null 2>&1 || { echo "kubectl not found"; exit 1; }
kubectl version --client >/dev/null 2>&1 || { echo "kubectl unavailable"; exit 1; }

echo "==> [2/8] Applying namespaces and RBAC"
kubectl apply -f "${K8S_DIR}/namespace-and-rbac.yaml"

echo "==> [3/8] Ensuring baseline secret exists (kubric-secrets)"
if ! kubectl -n "${NAMESPACE}" get secret kubric-secrets >/dev/null 2>&1; then
  kubectl -n "${NAMESPACE}" create secret generic kubric-secrets \
    --from-literal=jwt_issuer="https://issuer.kubric.local" \
    --from-literal=jwt_audience="kubric-api" \
    >/dev/null
  echo "    created secret kubric-secrets (replace with real values in prod)"
else
  echo "    kubric-secrets already exists"
fi

echo "==> [4/8] Applying network policies"
kubectl apply -f "${K8S_DIR}/network-policies.yaml"

echo "==> [5/8] Deploying API gateway + service"
kubectl apply -f "${K8S_DIR}/api-gateway-deployment.yaml"

echo "==> [6/8] Applying autoscaling and disruption policy"
kubectl apply -f "${K8S_DIR}/hpa-and-pdb.yaml"

echo "==> [7/8] Applying monitoring configs (ConfigMaps)"
kubectl -n "${MON_NS}" create configmap kubric-prometheus-alert-rules \
  --from-file="${MONITOR_DIR}/prometheus-alert-rules.yaml" \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl -n "${MON_NS}" create configmap kubric-alertmanager-config \
  --from-file="${MONITOR_DIR}/alertmanager-config.yaml" \
  --dry-run=client -o yaml | kubectl apply -f -

kubectl -n "${MON_NS}" create configmap kubric-grafana-baseline \
  --from-file="${MONITOR_DIR}/grafana-dashboard-baseline.yaml" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "==> [8/8] Post-apply checks"
kubectl -n "${NAMESPACE}" rollout status deploy/kubric-api-gateway --timeout=180s
kubectl -n "${NAMESPACE}" get pods -l app=kubric-api-gateway -o wide
kubectl -n "${NAMESPACE}" get svc kubric-api-gateway-svc
kubectl -n "${NAMESPACE}" get hpa kubric-api-gateway-hpa || true
kubectl -n "${NAMESPACE}" get pdb kubric-api-gateway-pdb || true

echo "--------------------------------------------------------"
echo "Bootstrap completed."
echo "Next steps:"
echo "  1) Replace placeholder secrets with production values"
echo "  2) Wire ConfigMaps into actual Prometheus/Alertmanager/Grafana deployments"
echo "  3) Run scripts/healthcheck.sh"
echo "--------------------------------------------------------"