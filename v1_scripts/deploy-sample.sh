#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
K8S_DIR="${ROOT_DIR}/v1_configs/kubernetes"

echo "Applying Kubernetes manifests for sample-service"
kubectl apply -f "${K8S_DIR}/sample-service-deployment.yaml"
