# FYP Defense Q&A (Panel Preparation)

## 1) Why did you choose this project?

We selected Kubric to solve a practical enterprise problem: operations are often split across SOC, NOC, and service teams with poor integration.  
Our project unifies them in one architecture with clear governance, observability, and automation pathways.

---

## 2) What is your main contribution?

Our main contribution is a **complete implementation-oriented architecture package**:
- 7-tier enterprise design
- 20 technical documentation files
- Professional diagram sources
- Baseline configs (Kubernetes/security/monitoring/database)
- Bootstrap scripts for reproducible setup

This is beyond theoretical design and moves toward practical deployment readiness.

---

## 3) Why 7 tiers?

The 7-tier model provides separation of concerns and scalability:
- Infra and data remain stable foundations
- Security is centralized and cross-cutting
- Integration decouples components
- AI/ML can evolve independently
- Services and presentation remain agile for user needs

---

## 4) How is ITIL 4 used in your project?

ITIL 4 is embedded in:
- Service value orientation
- Incident/problem/change/request processes
- Continuous improvement cycle
- Operational governance and transparency

Kubric aligns architecture decisions with service management outcomes, not just technical implementation.

---

## 5) What makes your SOC design strong?

Our SOC model uses multi-domain coverage:
- EDR, ITDR, NDR, CDR, SDR
- XDR for correlation across domains
- Structured incident response lifecycle
- Auditability and control improvement loop

This reduces blind spots and improves response quality.

---

## 6) How does AI fit into your architecture?

AI supports operations through:
- Agent-driven triage and summarization
- Predictive analytics (capacity/SLA risks)
- Anomaly detection and prioritization
- Human-in-the-loop guardrails for high-risk actions

AI is used as an accelerator, not an uncontrolled replacement for human decision-making.

---

## 7) How is security handled end-to-end?

Security is designed at every tier:
- IAM + MFA + RBAC
- Segmented network design
- SIEM-driven monitoring
- TLS/mTLS + at-rest encryption
- Policy-driven access and logging
- Incident response and forensic traceability

---

## 8) How is reliability ensured?

Reliability is supported by:
- Health checks and autoscaling
- Redundancy and failover concepts
- Monitoring and alerting baselines
- DR objectives (RTO/RPO)
- Controlled change and rollback strategy

---

## 9) What are your measurable KPIs?

Examples:
- MTTD / MTTR for SOC incidents
- Network uptime and restoration time for NOC
- API p95 latency and error rates
- SLA compliance for service operations
- Alert noise reduction and automation success rate

---

## 10) What is implemented vs. proposed?

Implemented in repository:
- Full architecture documentation
- Diagram source artifacts
- Config baselines
- Validation/bootstrap scripts

Proposed for production adaptation:
- Environment-specific hardening
- Full SIEM tuning with live telemetry
- Native enterprise integrations per organization

---

## 11) What are project limitations?

- This repository is an implementation starter, not a fully deployed production environment.
- Some components require organization-specific credentials, compliance controls, and infrastructure constraints.
- Diagram conversion to proprietary formats (e.g., full Visio enterprise templates) may need external tooling.

---

## 12) What future work do you recommend?

- Full IaC stack (Terraform + Ansible)
- Advanced AI-assisted root cause analytics
- Automated compliance evidence generation
- Cost optimization model for hybrid cloud
- Expanded SRE/FinOps integration

---

## 13) If panel asks: “What is novel here?”

Novelty is in **integration depth + implementation readiness**:
- Combined SOC/NOC/ServiceOps/AI architecture in one coherent model
- ITIL 4 alignment with security and engineering execution
- Ready-to-use baseline configs and scripts for practical adoption

---

## 14) If panel asks: “How would this be deployed in real org?”

Deployment approach:
1. Foundation rollout (infra/security/monitoring)
2. Core service and integration onboarding
3. SOC/NOC operationalization
4. AI-assisted automation with governance controls
5. Continuous KPI review and improvement

---

## 15) Final defense closing statement

“Our project provides a practical enterprise blueprint that connects security, network, service operations, and AI orchestration in one architecture.  
We focused on both academic rigor and real-world applicability by delivering documentation, diagrams, configs, and automation scripts.  
Kubric can serve as a strong foundation for scalable, secure, and intelligent operations.”
