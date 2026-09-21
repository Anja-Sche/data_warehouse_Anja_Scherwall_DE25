--  a) Create a marketing virtual warehouse called marketing_wh with size xs, 1 min suspend time, it should autoresume, suspend initially and give it a suitable comment.

USE ROLE SYSADMIN;

CREATE WAREHOUSE IF NOT EXISTS marketing_wh 
WITH
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Warehouse for practicing assigning and using roles in snowflake.';


-- b) Now create a database called ifood, and add a staging layer by creating a schema called staging.

CREATE DATABASE IF NOT EXISTS ifood;

CREATE SCHEMA IF NOT EXISTS ifood.staging;


-- c) Create a user called extract_loader and setup its credentials.

USE ROLE USERADMIN;
SELECT current_role();
SELECT current_user();

CREATE USER IF NOT EXISTS extract_loader
    PASSWORD = ''
    DEFAULT_WAREHOUSE = marketing_wh;


-- d) Create a role marketing_dlt_role and grant it access to staging.

CREATE ROLE IF NOT EXISTS marketing_dlt_role;

USE ROLE SECURITYADMIN;

GRANT USAGE ON WAREHOUSE marketing_wh TO ROLE marketing_dlt_role;
GRANT USAGE ON DATABASE ifood TO ROLE marketing_dlt_role;
GRANT USAGE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;


GRANT CREATE TABLE ON SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;

GRANT SELECT ON ALL TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA ifood.staging TO ROLE marketing_dlt_role;


-- e) Assign marketing_dlt_role to extract_loader user.

GRANT ROLE marketing_dlt_role TO USER extract_loader;
GRANT ROLE marketing_dlt_role TO USER ANJASCHE;
