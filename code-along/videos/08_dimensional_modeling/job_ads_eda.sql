SHOW ROLES;

USE ROLE JOB_ADS_DLT_ROLE;

USE SCHEMA job_ads.staging;

SHOW TABLES;

DESC TABLE data_field_job_ads;

USE WAREHOUSE dev_wh;

SELECT * FROM data_field_job_ads;

SELECT
    relevance, 
    workplace_address__street_address, 
    workplace_address__postcode, 
    publication_date, 
    webpage_url,
    source_type
FROM data_fiel_job_ads LIMIT 5;

SELECT 
    scope_of_work__min,
    scope_of_work__max,
    salary_type__label,
    duration__label,
    logo_url,
    employer__workplace,
    employer__name,
    employer__url
FROM data_fiel_job_ads LIMIT 5;

SELECT distinct(salary_type__label) AS type_of_salary
FROM data_fiel_job_ads;

