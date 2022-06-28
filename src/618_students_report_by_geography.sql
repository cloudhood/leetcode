-- https://leetcode.com/problems/students-report-by-geography/
WITH ranks AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY continent ORDER BY name) n
    FROM
        Student
    ORDER BY
        name
),
usa AS (
   SELECT DISTINCT
        n, 
        name America
    FROM
        ranks
    WHERE
        continent = "America"
),
asia AS (
    SELECT DISTINCT
        n, 
        name Asia
    FROM
        ranks
    WHERE
        continent = "Asia"
),
eu AS (
    SELECT DISTINCT 
        n, 
        name Europe
    FROM
        ranks
    WHERE
        continent = "Europe"
)

SELECT
    America,
    Asia,
    Europe
FROM (
    SELECT DISTINCT 
        n
    FROM 
        ranks
    ORDER BY 
        1
)  t
LEFT JOIN usa
USING (n)
LEFT JOIN asia
USING (n)
LEFT JOIN eu
USING (n)
ORDER BY
    1,
    2,
    3
    
