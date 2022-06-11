-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
SELECT 
    t1.name Employee
FROM 
    Employee t1
INNER JOIN 
    Employee t2
ON 
    t1.managerId = t2.id
WHERE 
    t1.salary > t2.salary
