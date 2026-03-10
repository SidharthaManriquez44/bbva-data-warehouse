-- =====================================================================
-- SCHEMA: core
-- Purpose: Dimension tables in a data warehouse store descriptive, textual
--          attributes (context)
-- ====================================================================

CREATE TABLE core.fact_bank_metrics (
    fact_key BIGSERIAL PRIMARY KEY,
    bank_key INT NOT NULL,
    date_key INT NOT NULL,
    channel_key INT NOT NULL,
    branches INT,
    atms INT,
    digital_clients INT,
    total_clients INT,
    total_loans NUMERIC(18,2),
    total_deposits NUMERIC(18,2),
    net_income NUMERIC(18,2),
    etl_run_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_bank
        FOREIGN KEY (bank_key)
        REFERENCES core.dim_bank(bank_key),

    CONSTRAINT fk_date
        FOREIGN KEY (date_key)
        REFERENCES core.dim_date(date_key),

    CONSTRAINT fk_channel
        FOREIGN KEY (channel_key)
        REFERENCES core.dim_channel(channel_key),

    CONSTRAINT fk_etl_run
        FOREIGN KEY (etl_run_id)
        REFERENCES meta.etl_runs(run_id),

    CONSTRAINT uq_grain UNIQUE (bank_key, date_key, channel_key)
);
