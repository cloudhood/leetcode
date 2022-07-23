-- https://leetcode.com/problems/project-employees-iii/
WITH cte AS (
    SELECT
        p.project_id,
        p.employee_id,
        DENSE_RANK() OVER (PARTITION BY p.project_id ORDER BY e.experience_years DESC) rnk
    FROM
        Project p
    INNER JOIN
        Employee e
    USING
        (employee_id)
)
SELECT
    project_id,
    employee_id
FROM
    cte
WHERE
    rnk = 1
