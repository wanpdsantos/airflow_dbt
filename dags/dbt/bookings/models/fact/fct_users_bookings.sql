{{ config(materialized='table') }}


SELECT
    1 AS id
    , 1 AS user_id
    , 1 AS company_id
    , 1 AS region_id
    , CURRENT_DATE AS date_created
    , 'ACTIVE' AS status
    , 10 AS total_paid
    , 30 AS session_time
UNION ALL
SELECT
    2 AS id
    , 1 AS user_id
    , 2 AS company_id
    , 3 AS region_id
    , CURRENT_DATE AS date_created
    , 'ACTIVE' AS status
    , 15 AS total_paid
    , 60 AS session_time
UNION ALL
SELECT
    3 AS id
    , 3 AS user_id
    , 2 AS company_id
    , 2 AS region_id
    , CURRENT_DATE AS date_created
    , 'EXPIRED' AS status
    , 20 AS total_paid
    , 15 AS session_time
UNION ALL
SELECT
    4 AS id
    , 3 AS user_id
    , 3 AS company_id
    , 1 AS region_id
    , CURRENT_DATE AS date_created
    , 'ACTIVE' AS status
    , 50 AS total_paid
    , 30 AS session_time
UNION ALL
SELECT
    5 AS id
    , 2 AS user_id
    , 1 AS company_id
    , 1 AS region_id
    , CURRENT_DATE AS date_created
    , 'ACTIVE' AS status
    , 30 AS total_paid
    , 10 AS session_time
