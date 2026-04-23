#!/usr/bin/env bash
set -euo pipefail

# Deploys Kubric baseline manifests in a safe order.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
K8S_DIR="${ROOT_DIR}/v1_configs/kubernetes"
NAMESPACE="${1:-kubric-prod}"

command -v kubectl >/dev/null 2>&1 || { echo "kubectl not found"; exit 1; }

echo "==> Applying namespace and RBAC"
kubectl apply -f "${K8S_DIR}/namespace-and-rbac.yaml"

echo "==> Applying network policies"
kubectl apply -f "${K8S_DIR}/network-policies.yaml"

echo "==> Deploying API gateway"
kubectl apply -f "${K8S_DIR}/api-gateway-deployment.yaml"

echo "==> Applying autoscaling and disruption policies"
kubectl apply -f "${K8S_DIR}/hpa-and-pdb.yaml"

echo "==> Waiting for deployment rollout"
kubectl -n "${NAMESPACE}" rollout status deploy/kubric-api-gateway --timeout=180s

echo "Deployment completed successfully."
