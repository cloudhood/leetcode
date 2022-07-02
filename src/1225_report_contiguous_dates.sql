-- https://leetcode.com/problems/report-contiguous-dates/ 
--
-- WIP
WITH success AS (
    SELECT
        success_date period_date,
        "succeeded" period_state,
        RANK() OVER (ORDER BY success_date) n1
    FROM
        Succeeded
),
fails AS (
    SELECT
        fail_date period_date,
        "failed" period_state,
        RANK() OVER (ORDER BY fail_date) n1
    FROM
        Failed
),
comb AS (
    SELECT 
        *
    FROM
        success
    UNION ALL
    SELECT 
        *
    FROM
        fails
),
comb2 AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY period_date) n2
    FROM
        comb
    WHERE 
        YEAR(period_date) = '2019'
),
comb3 AS (
    SELECT
        *,
        (n2 - n1) n3
    FROM
        comb2
)

SELECT 
  period_state,
  MIN(period_date) start_date,
  MAX(period_date) end_date
SELECT 
    *
FROM
    comb3
GROUP BY
    some_rank,
    peroid_state
