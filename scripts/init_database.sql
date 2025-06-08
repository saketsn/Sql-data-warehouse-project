/*
====================================================
Create Database and Schemas
====================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
   Running this script will drop the entire 'DataWarehouse' database if it exists.
   All data in the database will be permanently deleted. Proceed with caution.
*/

use master;
Go

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases where name = 'DataWarehouse')
Begin
   Alter Database DAtaWarehouse set single user with RollBack Immediate;
   Drop Datebase DataWarehouse;
End;
Go

Create database DataWarehouse;

use DataWarehouse;

create schema bronze;
Go
create schema silver;
Go
create schema gold;
