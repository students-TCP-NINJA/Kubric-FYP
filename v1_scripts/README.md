# Scripts

Operational bootstrap scripts for Kubric repo setup.

## Scripts

- `bootstrap.sh`  
  Main end-to-end baseline apply for Kubernetes + monitoring configmaps.

- `healthcheck.sh [namespace]`  
  Verifies deployment/service/hpa/pdb/networkpolicy health.

- `validate-configs.sh`  
  Dry-run validates Kubernetes manifests and required file presence.

- `bootstrap-db.sh <host> <user> <db>`  
  Applies PostgreSQL and TimescaleDB SQL initialization scripts.

- `bootstrap-monitoring.sh [namespace]`  
  Creates/updates monitoring ConfigMaps.

- `bootstrap-security.sh`  
  Checks and guides security baseline application.

- `deploy.sh [namespace]`
  Applies Kubernetes manifests in deployment-safe order and waits for rollout.

- `monitor.sh [namespace] [monitoring-namespace]`
  Captures workload status, events, and optional top metrics into a timestamped snapshot folder.

- `backup.sh`
  Creates a compressed backup archive of docs, configs, scripts, diagrams, and templates.

## Recommended order

1. `./v1_scripts/validate-configs.sh`
2. `./v1_scripts/bootstrap.sh`
3. `./v1_scripts/healthcheck.sh`
4. `./v1_scripts/bootstrap-monitoring.sh`
5. `./v1_scripts/bootstrap-security.sh`
6. `./v1_scripts/bootstrap-db.sh <host> <user> <db>`
7. `./v1_scripts/deploy.sh`
8. `./v1_scripts/monitor.sh`
9. `./v1_scripts/backup.sh`

## Notes

- Replace placeholder values (secrets/passwords/issuer/audience).
- Integrate with your secret manager for production.
- Keep all script changes under PR review + change management.