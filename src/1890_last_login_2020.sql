-- https://leetcode.com/problems/the-latest-login-in-2020/
SELECT 
    user_id,
    MAX(time_stamp) last_stamp
FROM 
    Logins
WHERE 
    YEAR(time_stamp) = 2020
GROUP BY
    1
HAVING
    COUNT(*) > 0
