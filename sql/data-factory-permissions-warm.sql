DROP USER IF EXISTS [<data-factory>];
CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;
GO

CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;
GO

ALTER ROLE db_datareader ADD MEMBER [<data-factory>];
ALTER ROLE db_datawriter ADD MEMBER [<data-factory>];
GO