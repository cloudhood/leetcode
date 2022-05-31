SELECT 
    d.dept_name,
    COALESCE(COUNT(DISTINCT s.student_id), 0) student_number
FROM
    Department d
LEFT JOIN
    Student s
USING 
    (dept_id)
GROUP BY 
    1
ORDER BY 
    2 DESC, 
    1
