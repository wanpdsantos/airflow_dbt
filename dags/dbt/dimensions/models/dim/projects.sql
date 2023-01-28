{{ config(materialized='table') }}

SELECT
    1 AS id
    , 'Project X' AS project_name
    , 'ENABLED' AS project_status
UNION ALL
SELECT
    2 AS id
    , 'Project Y' AS project_name
    , 'DISABLED' AS project_status
UNION ALL
SELECT
    3 AS id
    , 'Project Z' AS project_name
    , 'ENABLED' AS project_status
