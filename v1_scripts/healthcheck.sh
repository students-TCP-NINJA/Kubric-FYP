#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${1:-kubric-prod}"

echo "==> Checking namespace: ${NAMESPACE}"
kubectl get ns "${NAMESPACE}" >/dev/null

echo "==> Deployment health"
kubectl -n "${NAMESPACE}" get deploy
kubectl -n "${NAMESPACE}" get pods

echo "==> Service health"
kubectl -n "${NAMESPACE}" get svc

echo "==> API gateway rollout"
kubectl -n "${NAMESPACE}" rollout status deploy/kubric-api-gateway --timeout=120s

echo "==> HPA/PDB"
kubectl -n "${NAMESPACE}" get hpa || true
kubectl -n "${NAMESPACE}" get pdb || true

echo "==> Network policies"
kubectl -n "${NAMESPACE}" get networkpolicy || true

echo "Health checks completed."