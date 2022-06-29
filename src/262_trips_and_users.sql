-- https://leetcode.com/problems/trips-and-users/
--
-- Need two joins, can't just do one join with OR.
WITH unbanned AS (
    SELECT 
	users_id
    FROM 
	Users
    WHERE 
	banned = "No"
    AND 
	role <> "partner"
)
SELECT 
    request_at "Day",
    ROUND(SUM(IF(Status LIKE "cancelled%", 1, 0)) / COUNT(*), 2) "Cancellation Rate"   
FROM 
    Trips t
INNER JOIN
    unbanned u1
ON 
    t.client_id = u1.users_id
INNER JOIN 
    unbanned u2
ON 
    t.driver_id = u2.users_id
WHERE 
    request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY 
    1
