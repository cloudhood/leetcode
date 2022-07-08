-- https://leetcode.com/problems/shortest-distance-in-a-line/
SELECT
    MIN(ABS(p1.x - p2.x)) AS shortest
FROM
    Point p1
INNER JOIN
    Point p2 
ON 
    p1.x <> p2.x
    
-- Alt
WITH cte AS (
    SELECT
        ABS(x - LEAD(x) OVER (ORDER BY x ASC)) d
    FROM
        Point
)
SELECT 
    MIN(d) shortest 
FROM
    cte
