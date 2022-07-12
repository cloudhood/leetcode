-- https://leetcode.com/problems/biggest-single-number/description/
WITH nums AS (
    SELECT
        num, 
        COUNT(*)
    FROM
        MyNumbers
    GROUP BY
        1
    HAVING
        COUNT(*) = 1
)

SELECT
    MAX(num) num
FROM
    nums

