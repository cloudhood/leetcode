-- https://leetcode.com/problems/rising-temperature/submissions/
SELECT 
    w2.id id
FROM 
    Weather w1
INNER JOIN 
    Weather w2
ON 
    DATEDIFF(w2.recordDate, w1.recordDate) = 1
AND 
    w2.temperature > w1.temperature
