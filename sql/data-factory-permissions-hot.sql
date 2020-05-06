IF EXISTS(SELECT 1 FROM sys.database_principals WHERE [NAME] = '<data-factory>')
    DROP USER [<data-factory>];
GO

CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;
GO

ALTER ROLE db_datareader ADD MEMBER [<data-factory>];
ALTER ROLE db_datawriter ADD MEMBER [<data-factory>];
GO

GRANT EXECUTE ON usp_switch_partition TO [<data-factory>];
GRANT EXECUTE ON usp_prepare_for_next_day TO [<data-factory>];
GO