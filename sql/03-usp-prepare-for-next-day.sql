CREATE OR ALTER PROCEDURE usp_prepare_for_next_day
AS
BEGIN
    DECLARE @oldest datetime2 = CAST(
        (SELECT TOP 1 [value] FROM sys.partition_range_values
            WHERE function_id = (
                SELECT function_id FROM sys.partition_functions
                    WHERE [name] = 'pf_daily'
                )
            ORDER BY boundary_id
        ) AS datetime2)

    DECLARE @latest datetime2 = CAST(
        (SELECT TOP 1 [value] FROM sys.partition_range_values
            WHERE function_id = (
                SELECT function_id FROM sys.partition_functions
                    WHERE [name] = 'pf_daily'
                )
            ORDER BY boundary_id DESC
        ) AS datetime2)

    -- source table, add new partition and remove oldest one
    DECLARE @srcnew datetime2 = DATEADD(DAY, 1, @latest)

    ALTER PARTITION SCHEME ps_daily
    NEXT USED [PRIMARY];

    ALTER PARTITION FUNCTION pf_daily()
    SPLIT RANGE (@srcnew);

    ALTER PARTITION FUNCTION pf_daily()
    MERGE RANGE (@oldest);

    -- staging table, add new partition and remove oldest one
    DECLARE @stgnew datetime2 = DATEADD(DAY, 2, @oldest)

    ALTER PARTITION SCHEME ps_daily_staging
    NEXT USED [PRIMARY];

    ALTER PARTITION FUNCTION pf_daily_staging()
    SPLIT RANGE (@stgnew);

    ALTER PARTITION FUNCTION pf_daily_staging()
    MERGE RANGE (@oldest);

    TRUNCATE TABLE orders_staging;
END
