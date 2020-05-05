CREATE OR ALTER PROCEDURE usp_switch_partition
AS
    ALTER TABLE orders SWITCH PARTITION 2
    TO orders_staging PARTITION 2;
GO
