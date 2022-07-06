-- https://leetcode.com/problems/movie-rating/
WITH cte1 AS (
    SELECT 
        movie_id,
        AVG(rating) rnk
    FROM
        MovieRating
    WHERE
        MONTH(created_at) = 2
    AND
        YEAR(created_at) = 2020
    GROUP BY 
        1
),
cte2 AS (
    SELECT 
        user_id,
        COUNT(*) rnk
    FROM
        MovieRating
    GROUP BY 
        1
),
cte3 AS (
    SELECT 
        u.name results
    FROM
        cte2 c
    INNER JOIN
        Users u
    USING
        (user_id)
    ORDER BY
        c.rnk DESC,
        u.name
    LIMIT 
        1
),
cte4 AS  (
    SELECT 
        m.title results
    FROM
        cte1 c
    INNER JOIN
        Movies m
    USING
        (movie_id)
    ORDER BY
        c.rnk DESC,
        m.title
    LIMIT 
        1
)

SELECT
    *
FROM 
    cte3
UNION ALL
SELECT
    *
FROM 
    cte4
