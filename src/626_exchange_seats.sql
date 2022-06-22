-- https://leetcode.com/problems/exchange-seats/
SELECT
    id,
    COALESCE(
        CASE 
            WHEN id % 2 = 1 THEN LEAD(student) OVER (ORDER BY id)
            ELSE LAG(student) OVER (ORDER BY id)
        END,
        student
    ) student
FROM
    Seat
