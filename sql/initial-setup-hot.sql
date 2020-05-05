-- Source table

CREATE PARTITION FUNCTION pf_daily(datetime2)
AS RANGE RIGHT FOR VALUES (
    '20200501', '20200502', '20200503', '20200504',
    '20200505', '20200506', '20200507', '20200508',
    '20200509', '20200510', '20200511', '20200512');

CREATE PARTITION SCHEME ps_daily
AS PARTITION pf_daily ALL TO ([PRIMARY]);

CREATE TABLE orders (
    [customer_id] BIGINT NOT NULL,
    [order_date] DATETIME2(7) NOT NULL,
    [order_amount] BIGINT NOT NULL DEFAULT 0,
    [product_id] BIGINT NOT NULL,
    [desc_1] VARCHAR(32) NULL,
    [desc_2] VARCHAR(32) NULL,
    [desc_3] VARCHAR(32) NULL,
    [desc_4] VARCHAR(32) NULL,
    [num_1] BIGINT NULL,
    [num_2] BIGINT NULL,
    [num_3] BIGINT NULL,
    [num_4] BIGINT NULL,
    [order_code] VARCHAR(32) NULL,
    PRIMARY KEY ([customer_id], [order_date])
) ON ps_daily([order_date]);

-- Staging table

CREATE PARTITION FUNCTION pf_daily_staging(datetime2)
AS RANGE RIGHT FOR VALUES (
    '20200501',
    '20200502');

CREATE PARTITION SCHEME ps_daily_staging
AS PARTITION pf_daily_staging ALL TO ([PRIMARY]);

CREATE TABLE orders_staging (
    [customer_id] BIGINT NOT NULL,
    [order_date] DATETIME2(7) NOT NULL,
    [order_amount] BIGINT NOT NULL DEFAULT 0,
    [product_id] BIGINT NOT NULL,
    [desc_1] VARCHAR(32) NULL,
    [desc_2] VARCHAR(32) NULL,
    [desc_3] VARCHAR(32) NULL,
    [desc_4] VARCHAR(32) NULL,
    [num_1] BIGINT NULL,
    [num_2] BIGINT NULL,
    [num_3] BIGINT NULL,
    [num_4] BIGINT NULL,
    [order_code] VARCHAR(32) NULL,
    PRIMARY KEY ([customer_id], [order_date])
) ON ps_daily_staging([order_date]);
