# Integration Patterns

## 1. Purpose

Standardizes integration methods between Kubric internal services and external enterprise/cloud systems.

---

## 2. Supported Patterns

## 2.1 Synchronous API Pattern
- REST/gRPC request-response
- Best for immediate result needs
- Requires timeout + retry + fallback design

## 2.2 Event-Driven Pattern
- Publish/subscribe via message broker
- Best for decoupled workflows and async scale
- Use idempotent consumers

## 2.3 ETL/Batch Pattern
- Scheduled movement and transformation
- Best for warehouse/reporting pipelines

## 2.4 Webhook Pattern
- External systems push event notifications
- Best for near-real-time integrations

---

## 3. Pattern Selection Guide

| Use Case | Pattern |
|---|---|
| Immediate user response required | Synchronous API |
| Cross-domain workflow trigger | Event-driven |
| Large historical reporting data | ETL/Batch |
| External system callback | Webhook |

---

## 4. Reliability Practices

- Correlation IDs
- Retry with exponential backoff
- Dead-letter queues
- Idempotency keys
- Circuit breakers and timeout budgets

---

## 5. Security Practices

- OAuth2/JWT/API key validation
- Signature verification for webhooks
- Least-privilege integration accounts
- Secret rotation policy
- Full integration audit logging
