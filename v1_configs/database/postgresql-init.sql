-- Kubric PostgreSQL baseline schema
CREATE SCHEMA IF NOT EXISTS kubric;

CREATE TABLE IF NOT EXISTS kubric.services (
  id UUID PRIMARY KEY,
  service_name VARCHAR(255) UNIQUE NOT NULL,
  owner_team VARCHAR(255) NOT NULL,
  sla_tier VARCHAR(50) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS kubric.incidents (
  id UUID PRIMARY KEY,
  service_id UUID NOT NULL REFERENCES kubric.services(id),
  title TEXT NOT NULL,
  severity VARCHAR(20) NOT NULL CHECK (severity IN ('critical','high','medium','low')),
  status VARCHAR(30) NOT NULL CHECK (status IN ('open','in_progress','resolved','closed')),
  opened_at TIMESTAMPTZ DEFAULT NOW(),
  resolved_at TIMESTAMPTZ,
  owner_user VARCHAR(255),
  root_cause TEXT
);

CREATE INDEX IF NOT EXISTS idx_incidents_service ON kubric.incidents(service_id);
CREATE INDEX IF NOT EXISTS idx_incidents_status ON kubric.incidents(status);
CREATE INDEX IF NOT EXISTS idx_incidents_opened_at ON kubric.incidents(opened_at DESC);

CREATE TABLE IF NOT EXISTS kubric.changes (
  id UUID PRIMARY KEY,
  service_id UUID NOT NULL REFERENCES kubric.services(id),
  change_type VARCHAR(30) NOT NULL,
  risk_level VARCHAR(20) NOT NULL,
  status VARCHAR(30) NOT NULL,
  requested_at TIMESTAMPTZ DEFAULT NOW(),
  approved_at TIMESTAMPTZ,
  implemented_at TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS kubric.audit_logs (
  id BIGSERIAL PRIMARY KEY,
  actor VARCHAR(255) NOT NULL,
  action VARCHAR(255) NOT NULL,
  target VARCHAR(255),
  details JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_audit_created_at ON kubric.audit_logs(created_at DESC);