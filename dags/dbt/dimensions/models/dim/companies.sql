{{ config(materialized='table') }}

SELECT
    1 AS id
    , 'Company X' AS company_name
    , 'ENABLED' AS company_status
UNION ALL
SELECT
    2 AS id
    , 'Company Y' AS company_name
    , 'DISABLED' AS company_status
UNION ALL
SELECT
    3 AS id
    , 'Company Z' AS company_name
    , 'ENABLED' AS company_status
