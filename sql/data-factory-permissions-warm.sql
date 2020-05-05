CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER [<data-factory>];
ALTER ROLE db_datawriter ADD MEMBER [<data-factory>];
