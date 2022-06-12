-- https://leetcode.com/problems/median-employee-salary/
WITH cte1 AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary) AS row_no,
        COUNT(*) OVER(PARTITION BY company) AS total_rows
    FROM 
        Employee
),
cte2 AS (
    SELECT 
        *,
        total_rows % 2 = 1 flag_odd,
        total_rows / 2 med
    FROM 
        cte1
)
SELECT
    id,
    company,
    salary
FROM 
    cte2
WHERE
        (flag_odd AND row_no = CEIL(med))
    OR  (NOT flag_odd AND row_no IN (med, med + 1))
ORDER BY 
    2,
    3
