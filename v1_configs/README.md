# Kubric Configs (Batch 5)

This folder contains detailed starter configuration baselines for:

- Kubernetes (`configs/kubernetes`)
- Security (`configs/security`)
- Monitoring (`configs/monitoring`)
- Database (`configs/database`)

## Usage Notes

1. Replace placeholder secrets/passwords before deployment.
2. Validate all configs in staging before production.
3. Tune replica counts, limits, and thresholds per actual capacity.
4. Keep all config changes under change management and PR review.

## Recommended rollout order

1. `kubernetes/namespace-and-rbac.yaml`
2. `kubernetes/network-policies.yaml`
3. `kubernetes/api-gateway-deployment.yaml`
4. `kubernetes/hpa-and-pdb.yaml`
5. Database init scripts/templates
6. Monitoring + alerting rules
7. Security policies/rules

## Security reminder
Never commit real credentials or production private keys.
Use Kubernetes secrets manager / vault integration.