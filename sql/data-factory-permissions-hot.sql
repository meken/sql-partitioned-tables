CREATE USER [<data-factory>] FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER [<data-factory>];
ALTER ROLE db_datawriter ADD MEMBER [<data-factory>];

GRANT EXECUTE ON usp_switch_partition TO [<data-factory>];
GRANT EXECUTE ON usp_prepare_for_next_day TO [<data-factory>];