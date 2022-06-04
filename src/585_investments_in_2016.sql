-- https://leetcode.com/problems/investments-in-2016/submissions/
WITH counts AS (
    SELECT 
        *,
        COUNT(*) OVER (PARTITION BY lat, lon) loc_count,
        COUNT(*) OVER (PARTITION BY tiv_2015) tiv_count
    FROM 
        Insurance
)

SELECT
    ROUND(SUM(tiv_2016), 2) tiv_2016
FROM counts
WHERE
    tiv_count > 1
AND
    loc_count = 1
