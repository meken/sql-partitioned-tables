DROP TABLE IF EXISTS orders;
GO

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
)
GO