/*
====================================================
Script: Create Database and Schemas
====================================================
Purpose:
    This script creates a new database named 'DataWarehouse'. 
    If the database already exists, it will be dropped and recreated.

    Once the database is created, the script sets up the following schemas:
    - bronze
    - silver
    - gold

WARNING:
    Executing this script will permanently delete the existing 'DataWarehouse' 
    database along with all its data. Proceed with caution.
*/


USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
