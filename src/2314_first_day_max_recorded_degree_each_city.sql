-- https://leetcode.com/problems/the-first-day-of-the-maximum-recorded-degree-in-each-city/
WITH cte AS (
    SELECT
        city_id,
        MAX(degree) degree
    FROM
        Weather
    GROUP BY
        1
)
SELECT 
    c.city_id,
    MIN(w.day) day,
    c.degree
FROM 
    cte c
INNER JOIN
    Weather w
USING
    (city_id, degree)
GROUP BY 
    c.city_id,
    c.degree
ORDER BY 
    c.city_id
