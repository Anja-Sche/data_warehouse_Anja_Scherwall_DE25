-- Exercise 0 - Introduction
-- a) - b)

SHOW WAREHOUSES;

SHOW DATABASES;

USE GOOGLE_KEYWORDS_SEARCH_DATASET_DISCOVER_ALL_SEARCHES_ON_GOOGLE;

SHOW SCHEMAS;

SHOW TABLES IN SCHEMA DATAFEEDS;

SHOW VIEWS IN SCHEMA GOOGLE_KEYWORDS_SEARCH_DATASET_DISCOVER_ALL_SEARCHES_ON_GOOGLE.DATAFEEDS;

SELECT * FROM GOOGLE_KEYWORDS_SEARCH_DATASET_DISCOVER_ALL_SEARCHES_ON_GOOGLE.DATAFEEDS.GOOGLE_KEYWORDS;

SHOW COLUMNS;


-- c) Find out number of rows in the dataset.

SELECT COUNT(*) AS total_rows FROM DATAFEEDS.GOOGLE_KEYWORDS;

-- d) When is the first search and when is the latest search in the dataset?

SELECT 
    MIN(DATE) AS first_date,
    MAX(DATE) AS last_date
FROM DATAFEEDS.GOOGLE_KEYWORDS;

-- e) Which are the 10 most popular keywords?

SELECT KEYWORD, COUNT(KEYWORD) AS AMOUNT
FROM DATAFEEDS.GOOGLE_KEYWORDS
GROUP BY KEYWORD
ORDER BY AMOUNT DESC
LIMIT 10;

-- f) How many unique keywords are there?

SELECT COUNT(DISTINCT KEYWORD)
FROM DATAFEEDS.GOOGLE_KEYWORDS;

-- g) Check what type of platforms are used and how many users per platform

SELECT PLATFORM, COUNT(PLATFORM) as AMOUNT
FROM DATAFEEDS.GOOGLE_KEYWORDS
GROUP BY PLATFORM;

-- h) Let's dive into what swedish people are searching. Go into worldbanks country codes to find out the country code for Sweden. 
-- Find the 20 most popular keywords and the number of searches of that keyword.

SELECT KEYWORD, COUNT(KEYWORD) AS AMOUNT
FROM DATAFEEDS.GOOGLE_KEYWORDS
WHERE COUNTRY IN (752)
GROUP BY KEYWORD
ORDER BY AMOUNT DESC
LIMIT 20;

-- i) Lets see how popular spotify is around the world. List the top 10 number countries and the number of searches for spotify.

SELECT COUNTRY, COUNT(COUNTRY) AS COUNTRY_SEARCHES
FROM DATAFEEDS.GOOGLE_KEYWORDS
WHERE KEYWORD IN ('spotify')
GROUP BY COUNTRY
ORDER BY COUNTRY_SEARCHES DESC
LIMIT 10;