-- https://leetcode.com/problems/human-traffic-of-stadium/
--
-- Three or more rows with consecutive ID's.
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
