-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
WITH comb AS (
    SELECT
       requester_id id
    FROM
        RequestAccepted
    UNION ALL 
    SELECT
        accepter_id id
    FROM
        RequestAccepted
)
SELECT 
    id,
    COUNT(*) num
FROM
    comb
GROUP BY 
    1
ORDER BY
    2 DESC
LIMIT 
    1
