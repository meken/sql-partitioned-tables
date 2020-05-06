IF EXISTS(SELECT 1 FROM sys.database_principals WHERE [NAME] = '<data-factory>')
    DROP USER [<data-factory>];
GO

CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;
GO

ALTER ROLE db_datareader ADD MEMBER [<data-factory>];
ALTER ROLE db_datawriter ADD MEMBER [<data-factory>];
GO