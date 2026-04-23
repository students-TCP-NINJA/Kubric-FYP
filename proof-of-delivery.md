# Proof of Delivery Matrix

This document maps high-level claims from the Copilot export to actual files in the repository.

- 7-Tier architecture document: `v1_docs/01-MAIN-ARCHITECTURE.md`
- Per-tier docs: `v1_docs/02-TIER1-INFRASTRUCTURE.md` .. `v1_docs/12-SERVICE-OPERATIONS.md`
- Monitoring configs: `v1_configs/monitoring/*` (alertmanager, prometheus rules, grafana baseline, sample-service files)
- Kubernetes manifests: `v1_configs/kubernetes/*` (namespace, api-gateway, hpa/pdb, sample-service)
- Terraform starters: `v1_configs/terraform/*` (main.tf, variables.tf, outputs.tf)
- Ansible starters: `v1_configs/ansible/*`
- Diagrams (drawio, mermaid, plantuml): `diagrams/drawio/*`, `diagrams/mermaid/*`, `diagrams/plantuml/*`
- Sample microservice + Dockerfile: `services/sample-service/*`
- CI workflow for sample service: `.github/workflows/ci-cd-sample-service.yml`
- Runbook (sample service): `v1_docs/SAMPLE-SERVICE-RUNBOOK.md`

Missing/To-be-created (requires expansion): per-component codebases, 200+ detailed diagrams, full Terraform modules for all providers, secrets management integration examples (Vault), expanded CI for all services.
