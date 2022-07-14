-- https://leetcode.com/problems/activity-participants/
WITH cte1 AS (
    SELECT 
        activity,
        COUNT(*) n
    FROM
        Friends
    GROUP BY
        1
),
cte2 AS (
    SELECT
        activity,
        n,
        MIN(n) OVER () n_min,
        MAX(n) OVER () n_max
    FROM
        cte1
)
SELECT
    activity
FROM
    cte2
WHERE
    n BETWEEN (n_min + 1) AND (n_max - 1)
