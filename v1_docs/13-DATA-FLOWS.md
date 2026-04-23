# Data Flows

## 1. Purpose

Defines end-to-end data movement across Kubric tiers for operations, security, analytics, and reporting.

---

## 2. Primary Flow Types

1. **User interaction flow** (UI → Services → Data)
2. **Telemetry flow** (agents/sensors → analytics stores)
3. **Security event flow** (detections → SIEM/XDR → response)
4. **Service workflow flow** (requests/incidents/changes)
5. **Reporting flow** (operational stores → warehouse → dashboards)

---

## 3. End-to-End Request Flow

```mermaid
sequenceDiagram
    participant U as User
    participant UI as Presentation
    participant API as API Gateway
    participant SVC as Service Layer
    participant INT as Integration
    participant DATA as Data Layer
    participant SEC as Security Layer

    U->>UI: Action / Request
    UI->>SEC: AuthN/AuthZ check
    SEC-->>UI: Permit
    UI->>API: API call
    API->>SVC: Route request
    SVC->>INT: Trigger orchestration
    INT->>DATA: Query/update
    DATA-->>INT: Data result
    INT-->>SVC: Processed response
    SVC-->>UI: Result
    UI-->>U: Render output
```

---

## 4. Security Event Flow

```mermaid
flowchart LR
    E["Endpoint/Identity/Network/Cloud/SaaS Events"] --> N["Normalization"]
    N --> S["SIEM Ingestion"]
    S --> C["Correlation / XDR"]
    C --> A["Alert + Severity"]
    A --> R["Response Playbook"]
    R --> L["Audit & Lessons Learned"]
```

---

## 5. Data Quality and Control Points

- Schema validation on ingestion
- Deduplication for repeated events
- Timestamp normalization (UTC)
- Critical field completeness checks
- Reconciliation between sources and warehouse

---

## 6. Flow KPIs

- Pipeline latency
- Event ingestion success %
- Data freshness lag
- Correlation delay
- Failed flow retry success rate
