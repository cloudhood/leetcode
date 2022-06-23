-- https://leetcode.com/problems/users-with-two-purchases-within-seven-days/
SELECT 
    t1.user_id
FROM
    Purchases t1
INNER JOIN
    Purchases t2
ON 
    t1.user_id = t2.user_id
AND
    t1.purchase_id <> t2.purchase_id
AND
    ABS(DATEDIFF(t2.purchase_date,  t1.purchase_date)) <= 7
GROUP BY 
    1
HAVING
    COUNT(*) > 1
ORDER BY 
    1
