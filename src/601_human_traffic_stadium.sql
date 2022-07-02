-- https://leetcode.com/problems/human-traffic-of-stadium/
--
-- Gaps and Islands problem
--
-- Three or more rows with consecutive ID's.
--
-- V1
WITH cte AS (
    SELECT 
        *
    FROM
        Stadium
    WHERE
        people >= 100
)

SELECT DISTINCT
    c1.*
FROM
    cte c1
INNER JOIN
    cte c2
INNER JOIN
    cte c3
ON
   (c1.id = c2.id - 1 AND c1.id = c3.id - 2)
OR  
   (c1.id = c2.id + 1 AND c1.id = c3.id + 2)
OR
   (c1.id = c2.id - 1 AND c1.id = c3.id + 1)
ORDER BY
    c1.visit_date

-- V2
--
-- id	row_number	d	cnt
-- 1	1	        0	4
-- 2	2	        0	4
-- 3	3	        0	4
-- 4	4	        0	4
-- 6	5	        1	5
-- 7	6	        1	5
-- 8	7	        1	5
-- 9	8	        1	5
-- 10	9	        1	5
-- 15	10	        5	2
-- 16	11	        5	2
-- 19	12	        7	2
-- 20	13	        7	2
WITH cte1 AS (
    SELECT 
        *,
        id - (ROW_NUMBER() OVER (ORDER BY id)) as d
    FROM    
        stadium
    WHERE 
        people >= 100
),
cte2 AS (
    SELECT
        d,
        COUNT(*) OVER (PARTITION BY d) cnt
    FROM
        cte1
)

SELECT DISTINCT
    cte1.id,
    cte1.visit_date,
    cte1.people
FROM
    cte1
INNER JOIN
    cte2
USING   
    (d)
WHERE
    cte2.cnt >= 3
