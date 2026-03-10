-- =====================================================================
-- SCHEMA: core
-- Purpose: Dimension tables in a data warehouse store descriptive, textual
--          attributes (context)
-- ====================================================================

CREATE TABLE core.dim_bank (
    bank_key SERIAL PRIMARY KEY,
    bank_code VARCHAR(10) NOT NULL,
    bank_name VARCHAR(100),
    effective_from DATE NOT NULL DEFAULT CURRENT_DATE,
    effective_to DATE,
    is_current BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_bank UNIQUE (bank_code, effective_from)
);

CREATE TABLE core.dim_date (
    date_key INT PRIMARY KEY,
    date DATE NOT NULL,
    year SMALLINT NOT NULL,
    quarter SMALLINT NOT NULL,
    month SMALLINT NOT NULL,
    day SMALLINT NOT NULL,
    month_name VARCHAR(10),
    day_name VARCHAR(10),
    week_of_year SMALLINT,
    day_of_week SMALLINT,
    is_weekend BOOLEAN,
    is_month_end BOOLEAN,
    is_quarter_end BOOLEAN,
    is_year_end BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE core.dim_channel (
    channel_key SERIAL PRIMARY KEY,
    channel_code VARCHAR(20) NOT NULL,
    channel_name VARCHAR(50) NOT NULL,
    channel_description VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    effective_from DATE NOT NULL DEFAULT CURRENT_DATE,
    effective_to DATE,
    is_current BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_channel UNIQUE (channel_code, effective_from)
);