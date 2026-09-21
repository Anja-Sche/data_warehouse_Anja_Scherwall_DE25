USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS parking_dlt_role;
CREATE ROLE IF NOT EXISTS parking_reader;

USE ROLE SECURITYADMIN;
SELECT current_role();

GRANT ROLE parking_dlt_role TO USER extract_loader_p;
GRANT ROLE parking_dlt_role TO USER ANJASCHE;
GRANT ROLE parking_reader TO USER ANJASCHE;


GRANT USAGE ON WAREHOUSE parking_wh TO ROLE parking_dlt_role;
GRANT USAGE ON DATABASE parking TO ROLE parking_dlt_role;
GRANT USAGE ON SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT CREATE TABLE ON SCHEMA parking.staging TO ROLE parking_dlt_role;


GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA parking.staging TO ROLE parking_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA parking.staging TO ROLE parking_dlt_role;


GRANT USAGE ON WAREHOUSE parking_wh TO ROLE parking_reader;
GRANT USAGE ON DATABASE parking TO ROLE parking_reader;
GRANT USAGE ON SCHEMA parking.staging TO ROLE parking_reader;
GRANT SELECT ON ALL TABLES IN SCHEMA parking.staging TO ROLE parking_reader;
GRANT SELECT ON FUTURE TABLES IN SCHEMA parking.staging TO ROLE parking_reader;