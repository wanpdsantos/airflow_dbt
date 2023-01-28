{{ config(materialized='table') }}


SELECT
    1 AS id
    , 'Tom' AS user_name
    , 'ENABLED' AS user_status
UNION ALL
SELECT
    2 AS id
    , 'Mary' AS user_name
    , 'DISABLED' AS user_status
UNION ALL
SELECT
    3 AS id
    , 'Jack' AS user_name
    , 'ENABLED' AS user_status
