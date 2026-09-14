USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS movie_dlt_role;
CREATE ROLE IF NOT EXISTS movie_reader_role;

USE ROLE SECURITYADMIN;


GRANT ROLE movie_dlt_role TO USER extract_loader;
GRANT ROLE movie_reader_role TO USER ANJASCHE;
GRANT ROLE movie_dlt_role TO USER ANJASCHE;


GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movie_dlt_role;
GRANT USAGE ON DATABASE movies TO ROLE movie_dlt_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movie_dlt_role;

GRANT CREATE TABLE ON SCHEMA movies.staging TO ROLE movie_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies.staging TO ROLE movie_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movie_dlt_role;


-- Check grants
SHOW GRANTS ON SCHEMA movies.staging;
SHOW FUTURE GRANTS IN SCHEMA movies.staging;
SHOW GRANTS TO ROLE movie_dlt_role;
SHOW GRANTS TO USER extract_loader;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movie_reader_role;
GRANT USAGE ON DATABASE movies TO ROLE movie_reader_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movie_reader_role;
GRANT SELECT ON ALL TABLES IN SCHEMA movies.staging TO ROLE movie_reader_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movie_reader_role;
