-- https://leetcode.com/problems/friend-requests-i-overall-acceptance-rate/
WITH reqs AS (
    SELECT 
        1 id, 
        COUNT(DISTINCT sender_id, send_to_id) n
    FROM
        FriendRequest
),
accepts AS (
    SELECT
        1 id,
        COUNT(DISTINCT requester_id, accepter_id) k
    FROM
        RequestAccepted
)

SELECT 
    ROUND(COALESCE(k / n, 0), 2) accept_rate
FROM
    reqs r
INNER JOIN
    accepts a
USING
    (id)
    
