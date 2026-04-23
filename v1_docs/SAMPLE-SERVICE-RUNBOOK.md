# Sample Service - Runbook

## Overview

Service: sample-service

Purpose: Minimal Flask microservice used as scaffold for CI, monitoring, and deployment testing.

## Quick Actions

- Health check: `curl -f http://<service>/` returns 200 with JSON {"status":"ok"}
- Restart (k8s): `kubectl rollout restart deployment/sample-service`

## Monitoring

- Grafana dashboard: `v1_configs/monitoring/sample-service-grafana-dashboard.json`
- Prometheus rules: `v1_configs/monitoring/sample-service-prometheus-rules.yaml`

## Incident Runbook

1. Confirm service pod status: `kubectl get pods -l app=sample-service -o wide`
2. Check logs: `kubectl logs deployment/sample-service`
3. If pod CrashLoopBackOff: describe pod and inspect events, then check image/tag correctness.
4. Roll back to last working image tag if recent deploy broke: `kubectl set image deployment/sample-service sample-service=<previous-tag>`

## Backup & Restore

This sample service stores no persistent data; no backup required. For stateful services, follow `v1_docs/19-DISASTER-RECOVERY.md`.

## Contacts

- On-call: project team (students-TCP-NINJA)
