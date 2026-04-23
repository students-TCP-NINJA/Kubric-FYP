# KUBRICXE + KUBRICAI  
## Complete Production Architecture (FYP)

**Repository:** `students-TCP-NINJA/Kubric-FYP`  
**Version:** 1.0  
**Date:** 2026-04-23

---

## 1. Executive Overview

Kubric is a unified enterprise architecture that combines:

- **SOC** (Security Operations Center)
- **NOC** (Network Operations Center)
- **AI Orchestration** (CrewAI + Quantum ML pipeline)
- **Service Operations** (ITIL 4-aligned)

The architecture follows a **7-tier layered model** to ensure scalability, maintainability, resilience, and governance.

---

## 2. 7-Tier Architecture (Logical View)

```mermaid
graph TD
    T7["Tier 7: Presentation Layer<br/>Web, Mobile, Dashboards, Reporting, Notifications"]
    T6["Tier 6: Service Layer<br/>Microservices, Service Mesh, ERPNext, Service Catalog, API Mgmt"]
    T5["Tier 5: AI/ML Layer<br/>CrewAI Agents, Quantum ML Pipeline, NLP, Predictive Analytics, Anomaly Detection"]
    T4["Tier 4: Integration Layer<br/>API Gateway, Message Broker, ETL, n8n, External Connectors"]
    T3["Tier 3: Security Layer<br/>IAM, Access Control, Wazuh SIEM, pfSense, Encryption"]
    T2["Tier 2: Data Layer<br/>OpenSearch, TimescaleDB, PostgreSQL, Warehouse, Cache"]
    T1["Tier 1: Infrastructure Layer<br/>Compute, Storage, Network, Virtualization, Cloud Integration"]

    T7 --> T6
    T6 --> T5
    T5 --> T4
    T4 --> T3
    T3 --> T2
    T2 --> T1
```

---

## 3. Design Principles

1. **Defense in Depth**  
   Security controls exist at every layer.

2. **Separation of Concerns**  
   Each tier has clear responsibilities and interfaces.

3. **Automation-First**  
   n8n, IaC, and AI agents reduce manual operations.

4. **Observability by Design**  
   Logs, metrics, traces, and alerts are built-in.

5. **ITIL 4 Alignment**  
   Value, iteration, collaboration, and continual improvement are embedded.

---

## 4. Core Capability Domains

- **SOC:** EDR, ITDR, NDR, XDR, CDR, SDR
- **NOC:** Device monitoring, traffic analytics, incident response
- **Service Management:** Incident, problem, change, request, service desk
- **AI Operations:** Agent orchestration, predictive analytics, anomaly detection
- **Governance:** Compliance, risk management, auditability

---

## 5. Data and Control Flow (High-Level)

```mermaid
sequenceDiagram
    participant U as User
    participant P as Presentation
    participant S as Service Layer
    participant I as Integration
    participant A as AI/ML
    participant D as Data Layer
    participant Sec as Security Layer

    U->>P: Request (Web/Mobile/API)
    P->>Sec: Authentication + Authorization
    Sec-->>P: Access decision
    P->>S: Business request
    S->>I: Route/Orchestrate
    I->>A: AI-assisted decision (optional)
    I->>D: Read/Write data
    D-->>I: Data response
    I-->>S: Processed response
    S-->>P: Result
    P-->>U: Final output
```

---

## 6. Non-Functional Targets

- **Availability:** 99.9%+ (target)
- **Security:** Zero-trust principles, encrypted in transit and at rest
- **Scalability:** Horizontal scaling for services, brokers, and data tiers
- **Recovery:** Defined RTO/RPO and backup/recovery workflows
- **Performance:** Real-time operations for SOC/NOC monitoring

---

## 7. Document Map

See `docs/00-INDEX.md` for complete documentation navigation.
