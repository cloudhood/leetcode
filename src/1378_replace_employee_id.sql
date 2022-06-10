-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
SELECT
    s.unique_id,
    t.name
FROM
    Employees t
LEFT JOIN
    EmployeeUNI s
USING
    (id)
ORDER BY
    2 
