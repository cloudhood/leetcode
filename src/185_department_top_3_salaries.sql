-- https://leetcode.com/problems/department-top-three-salaries/submissions/
WITH rnk AS (
    SELECT 
        *,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) salary_rank
    FROM Employee
)

SELECT 
    d.name Department,
    r.name Employee,
    r.salary Salary
FROM 
    rnk r
INNER JOIN 
    Department d 
ON 
    r.departmentId = d.id
WHERE 
    r.salary_rank < 4
