# KUBRICXE + KUBRICAI  
## Complete Production Architecture Diagram Guide  
### Final Year Project (FYP)

> Repository: `students-TCP-NINJA/Kubric-FYP`  
> Focus: **SOC | NOC | AI Orchestration | Service Operations | ITIL 4**

---

## 1) Project Overview

Kubric is a full enterprise architecture blueprint that unifies:

- **Security Operations Center (SOC)** for threat detection and response  
- **Network Operations Center (NOC)** for performance and availability  
- **AI Orchestration Layer** for intelligent automation and predictive analytics  
- **Service Operations Layer** aligned with **ITIL 4** practices  

This repository contains architecture documentation, professional diagram sources, operational configuration baselines, and bootstrap scripts required to set up a structured implementation reference.

---

## 2) Architecture at a Glance

Kubric follows a **7-tier layered architecture**:

1. **Infrastructure Layer**  
2. **Data Layer**  
3. **Security Layer**  
4. **Integration Layer**  
5. **AI/ML Layer**  
6. **Service Layer**  
7. **Presentation Layer**

See full details in [`v1_docs/01-MAIN-ARCHITECTURE.md`](v1_docs/01-MAIN-ARCHITECTURE.md).

---

## 3) Repository Structure

```text
Kubric-FYP/
├─ README.md
├─ v1_docs/
│  ├─ 00-INDEX.md
│  ├─ 01-MAIN-ARCHITECTURE.md
│  ├─ 02-TIER1-INFRASTRUCTURE.md
│  ├─ 03-TIER2-DATA.md
│  ├─ 04-TIER3-SECURITY.md
│  ├─ 05-TIER4-INTEGRATION.md
│  ├─ 06-TIER5-AI-ML.md
│  ├─ 07-TIER6-SERVICE.md
│  ├─ 08-TIER7-PRESENTATION.md
│  ├─ 09-SOC-OPERATIONS.md
│  ├─ 10-NOC-OPERATIONS.md
│  ├─ 11-AI-ORCHESTRATION.md
│  ├─ 12-SERVICE-OPERATIONS.md
│  ├─ 13-DATA-FLOWS.md
│  ├─ 14-SECURITY-ARCHITECTURE.md
│  ├─ 15-INTEGRATION-PATTERNS.md
│  ├─ 16-IMPLEMENTATION-ROADMAP.md
│  ├─ 17-COMPONENT-SPECS.md
│  ├─ 18-NETWORK-TOPOLOGY.md
│  ├─ 19-DISASTER-RECOVERY.md
│  └─ 20-MONITORING-ALERTING.md
├─ diagrams/
│  ├─ mermaid/
│  │  ├─ kubric-7-tier.mmd
│  │  ├─ soc-flow.mmd
│  │  ├─ noc-flow.mmd
│  │  └─ data-flow.mmd
│  └─ plantuml/
│     ├─ kubric-7-tier.puml
│     ├─ soc-architecture.puml
│     └─ noc-architecture.puml
├─ templates/
│  ├─ lucidchart-import-notes.md
│  └─ visio-import-notes.md
├─ v1_configs/
│  ├─ README.md
│  ├─ kubernetes/
│  │  ├─ namespace-and-rbac.yaml
│  │  ├─ api-gateway-deployment.yaml
│  │  ├─ network-policies.yaml
│  │  └─ hpa-and-pdb.yaml
│  ├─ security/
│  │  ├─ wazuh-rule-pack.yaml
│  │  ├─ pfsense-rule-template.conf
│  │  └─ iam-policy-baseline.yaml
│  ├─ monitoring/
│  │  ├─ prometheus-alert-rules.yaml
│  │  ├─ alertmanager-config.yaml
│  │  └─ grafana-dashboard-baseline.yaml
│  └─ database/
│     ├─ postgresql-init.sql
│     ├─ timescaledb-init.sql
│     ├─ opensearch-index-template.json
│     └─ redis-baseline.conf
└─ v1_scripts/
   ├─ README.md
   ├─ bootstrap.sh
   ├─ healthcheck.sh
   ├─ validate-configs.sh
   ├─ bootstrap-db.sh
   ├─ bootstrap-monitoring.sh
   └─ bootstrap-security.sh
```

---

## 4) Documentation Index

Start here: [`v1_docs/00-INDEX.md`](v1_docs/00-INDEX.md)

### Core Architecture
- [`01-MAIN-ARCHITECTURE.md`](v1_docs/01-MAIN-ARCHITECTURE.md)
- [`02-TIER1-INFRASTRUCTURE.md`](v1_docs/02-TIER1-INFRASTRUCTURE.md)
- [`03-TIER2-DATA.md`](v1_docs/03-TIER2-DATA.md)
- [`04-TIER3-SECURITY.md`](v1_docs/04-TIER3-SECURITY.md)
- [`05-TIER4-INTEGRATION.md`](v1_docs/05-TIER4-INTEGRATION.md)
- [`06-TIER5-AI-ML.md`](v1_docs/06-TIER5-AI-ML.md)
- [`07-TIER6-SERVICE.md`](v1_docs/07-TIER6-SERVICE.md)
- [`08-TIER7-PRESENTATION.md`](v1_docs/08-TIER7-PRESENTATION.md)

### Operations
- [`09-SOC-OPERATIONS.md`](v1_docs/09-SOC-OPERATIONS.md)
- [`10-NOC-OPERATIONS.md`](v1_docs/10-NOC-OPERATIONS.md)
- [`11-AI-ORCHESTRATION.md`](v1_docs/11-AI-ORCHESTRATION.md)
- [`12-SERVICE-OPERATIONS.md`](v1_docs/12-SERVICE-OPERATIONS.md)

### Implementation & Governance
- [`13-DATA-FLOWS.md`](v1_docs/13-DATA-FLOWS.md)
- [`14-SECURITY-ARCHITECTURE.md`](v1_docs/14-SECURITY-ARCHITECTURE.md)
- [`15-INTEGRATION-PATTERNS.md`](v1_docs/15-INTEGRATION-PATTERNS.md)
- [`16-IMPLEMENTATION-ROADMAP.md`](v1_docs/16-IMPLEMENTATION-ROADMAP.md)
- [`17-COMPONENT-SPECS.md`](v1_docs/17-COMPONENT-SPECS.md)
- [`18-NETWORK-TOPOLOGY.md`](v1_docs/18-NETWORK-TOPOLOGY.md)
- [`19-DISASTER-RECOVERY.md`](v1_docs/19-DISASTER-RECOVERY.md)
- [`20-MONITORING-ALERTING.md`](v1_docs/20-MONITORING-ALERTING.md)

---

## 5) Diagram Assets

### Mermaid
Stored in `diagrams/mermaid/`  
Can be rendered in GitHub Markdown previews and Mermaid-compatible editors.

### PlantUML
Stored in `diagrams/plantuml/`  
Use PlantUML CLI or server renderers for PNG/SVG export.

### Lucidchart / Visio Notes
- [`templates/lucidchart-import-notes.md`](templates/lucidchart-import-notes.md)
- [`templates/visio-import-notes.md`](templates/visio-import-notes.md)

---

## 6) Quick Start (Local Setup)

## 6.1 Prerequisites

- `kubectl` (configured for target cluster)
- PostgreSQL client (`psql`) for DB bootstrap
- Bash shell environment
- Access to Kubernetes cluster namespaces

Optional:
- Prometheus/Alertmanager/Grafana stack
- Wazuh + pfSense management access

---

## 6.2 Validation + Bootstrap

Run from repository root:

```bash
chmod +x v1_scripts/*.sh

./v1_scripts/validate-configs.sh
./v1_scripts/bootstrap.sh
./v1_scripts/healthcheck.sh
```

Optional:

```bash
./v1_scripts/bootstrap-monitoring.sh kubric-monitoring
./v1_scripts/bootstrap-security.sh
./v1_scripts/bootstrap-db.sh <postgres-host> <postgres-user> <postgres-db>
```

---

## 7) Security Notes (Important)

- Replace all placeholder secrets and passwords.
- Do **not** commit real credentials or private keys.
- Integrate with a secret manager (Vault/KMS/K8s secrets strategy).
- Apply least privilege for service accounts and users.
- Enforce MFA for administrative and production actions.

---

## 8) Suggested Working Model (FYP Team)

## Branch Strategy
- `main`: stable reviewed content
- `feature/*`: documentation/config enhancements
- `diagram/*`: diagram-specific updates

## Pull Request Requirements
- Clear summary of changes
- Updated doc links if new files added
- Config validation output attached
- Reviewer sign-off (at least one teammate)

---

## 9) ITIL 4 Alignment Summary

Kubric architecture and operations align with:

- Guiding principles (value, simplicity, automation, collaboration)
- Service value chain (plan, engage, design/transition, obtain/build, deliver/support, improve)
- Core practices (incident, problem, change, request, service desk, continual improvement)

---

## 10) Project Deliverable Scope

This repository delivers:

- Complete architecture documentation (20 docs)
- Professional diagram sources (Mermaid + PlantUML)
- Security, monitoring, and database baseline configs
- Operational bootstrap scripts
- Structured implementation roadmap

---

## 11) Disclaimer

This repository is a **reference architecture and implementation starter kit** for academic and controlled lab use.  
Before production rollout, perform organization-specific security, compliance, and capacity validation.

---

## 12) Acknowledgment

Developed as part of Final Year Project under **students-TCP-NINJA** with focus on enterprise architecture and AI-augmented operations.
