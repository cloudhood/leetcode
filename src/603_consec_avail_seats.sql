-- https://leetcode.com/problems/consecutive-available-seats/
SELECT DISTINCT
    c1.seat_id
FROM
    Cinema c1
INNER JOIN
    Cinema c2
ON
    c1.free = c2.free = 1
AND
    ABS(c2.seat_id - c1.seat_id) = 1
ORDER BY
    1
