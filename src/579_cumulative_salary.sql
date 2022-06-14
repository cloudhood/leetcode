-- https://leetcode.com/problems/find-cumulative-salary-of-an-employee/
SELECT 
    e1.id,
    e1.month MONTH,
    SUM(e2.salary) salary
FROM 
    employee e1
INNER JOIN 
    employee e2 
ON 
    e1.id = e2.id
AND 
    (e1.month - e2.month) BETWEEN 0 AND 2
WHERE 
    (e1.id, e1.month) NOT IN (
        SELECT 
            id,
            MAX(MONTH)
        FROM 
            employee
        GROUP BY 
            1
    )
GROUP BY 
    1,
    2
ORDER BY 
    1,
    2 DESC
