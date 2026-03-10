-- ---------------------------------------------------------------------
-- INDEX
-- Table: fact tables
-- Purpose: Partition by year
--          Use BRIN index for date_key
-- ---------------------------------------------------------------------

CREATE INDEX idx_fact_date ON core.fact_bank_metrics(date_key);
CREATE INDEX idx_fact_bank ON core.fact_bank_metrics(bank_key);
CREATE INDEX idx_fact_channel ON core.fact_bank_metrics(channel_key);
CREATE INDEX idx_dim_date_year ON core.dim_date(year);
CREATE INDEX idx_fact_date_bank ON core.fact_bank_metrics(date_key, bank_key);