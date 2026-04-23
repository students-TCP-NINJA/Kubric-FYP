CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE TABLE IF NOT EXISTS kubric_metrics (
  time TIMESTAMPTZ NOT NULL,
  source VARCHAR(255) NOT NULL,
  metric_name VARCHAR(255) NOT NULL,
  metric_value DOUBLE PRECISION NOT NULL,
  labels JSONB DEFAULT '{}'::jsonb
);

SELECT create_hypertable('kubric_metrics', 'time', if_not_exists => TRUE);

CREATE INDEX IF NOT EXISTS idx_kubric_metrics_source_time ON kubric_metrics (source, time DESC);
CREATE INDEX IF NOT EXISTS idx_kubric_metrics_metric_time ON kubric_metrics (metric_name, time DESC);

-- Optional retention/compression (tune for your infra)
-- SELECT add_retention_policy('kubric_metrics', INTERVAL '90 days');
-- ALTER TABLE kubric_metrics SET (
--   timescaledb.compress = true
-- );
-- SELECT add_compression_policy('kubric_metrics', INTERVAL '7 days');