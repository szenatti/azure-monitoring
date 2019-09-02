# Azure SQL Database Security

## Firewall

### SQL Server Firewall

SELECT * FROM sys.firewall_rules ORDER BY name;

EXECUTE sp_set_firewall_rule @name = N'FirewallRules',
   @start_ip_address = '', @end_ip_address = ''

EXECUTE sp_delete_firewall_rule @name = N'FirewallRules'

### SQL Database Firewall

SELECT * FROM sys.database_firewall_rules ORDER BY name;

EXECUTE sp_set_database_firewall_rule @name = N'FirewallRules',
   @start_ip_address = '', @end_ip_address = ''

EXECUTE sp_delete_database_firewall_rule @name = N'FirewallRules'

## User Access

### AD Auth User

CREATE USER <Azure_AD_principal_name> FROM EXTERNAL PROVIDER;

CREATE USER [name.name@XXXXX.com.au] FROM EXTERNAL PROVIDER; 

CREATE USER [Finance Analyst Group] FROM EXTERNAL PROVIDER;

ALTER ROLE db_datareader ADD MEMBER [name.name@XXXXX.com.au];
ALTER ROLE db_datawriter ADD MEMBER [name.name@XXXXX.com.au];