DROP USER IF EXISTS [<data-factory>];
CREATE USER [<data-factory>] WITH DEFAULT_SCHEMA=[dbo], SID=<sid>, TYPE=E;

CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;

ALTER ROLE db_datareader ADD MEMBER [<data-factory>];
ALTER ROLE db_datawriter ADD MEMBER [<data-factory>];
