
CREATE OR ALTER PROCEDURE usp_oldest_partition_date
AS
BEGIN
    SELECT FORMAT(CAST((SELECT TOP 1 [value] FROM sys.partition_range_values
            WHERE function_id = (
                SELECT function_id FROM sys.partition_functions
                    WHERE [name] = 'pf_daily'
                )
            ORDER BY boundary_id) as date), 'yyyy-MM-dd') as [value]
END
GO