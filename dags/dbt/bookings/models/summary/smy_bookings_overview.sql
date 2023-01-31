{{ config(materialized='table') }}

SELECT
    company_id
    , region_id
    , SUM(total_paid) AS total_paid
    , SUM(session_time) AS total_session_time
    , AVG(total_paid) AS avg_total_paid
    , AVG(session_time) AS avg_session_time
FROM {{ ref('fct_users_bookings') }}
GROUP BY 1, 2
UNION ALL
SELECT
    company_id
    , region_id
    , SUM(total_paid) AS total_paid
    , SUM(session_time) AS total_session_time
    , AVG(total_paid) AS avg_total_paid
    , AVG(session_time) AS avg_session_time
FROM {{ ref('fct_users_premium_bookings') }}
GROUP BY 1, 2
