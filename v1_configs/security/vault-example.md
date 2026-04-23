# Vault Example (secrets management)

This file shows a simple Vault usage example to store application credentials and a Kubernetes Secret sync manifest.

1. Create a secret in Vault (CLI):

```
vault kv put secret/sample-service DB_USER="sample" DB_PASS="s3cr3t"
```

2. Kubernetes Secret manifest (synced from Vault by external controller):

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: sample-service-credentials
type: Opaque
data:
  username: c2FtcGxl
  password: czNjcjN0
```

Notes: Use Vault Agent Injector or External Secrets Operator to sync Vault secrets to Kubernetes.
