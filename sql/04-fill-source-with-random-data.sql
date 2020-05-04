SELECT TOP (10000000) n = CONVERT(INT, ROW_NUMBER() OVER (ORDER BY s1.[object_id]))
INTO numbers
FROM sys.all_objects AS s1 CROSS JOIN sys.all_objects AS s2 CROSS JOIN sys.all_objects AS s3
OPTION (MAXDOP 1);
CREATE UNIQUE CLUSTERED INDEX n ON numbers(n);


SELECT TOP (8640000) d = DATEADD(ms, 100*(r.n-1), '20200501')
INTO dates
FROM numbers r
OPTION (MAXDOP 1);
CREATE UNIQUE CLUSTERED INDEX d on dates(d);


INSERT INTO orders
	SELECT
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		r.d,
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		CAST(REPLACE(NEWID(), '-', '') AS VARCHAR(32)),
		CAST(REPLACE(NEWID(), '-', '') AS VARCHAR(32)),
		CAST(REPLACE(NEWID(), '-', '') AS VARCHAR(32)),
		CAST(REPLACE(NEWID(), '-', '') AS VARCHAR(32)),
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		CAST(ABS(RAND() * 1000000) AS BIGINT),
		CAST(REPLACE(NEWID(), '-', '') AS VARCHAR(32))
	FROM dates r