-- https://leetcode.com/problems/user-activity-for-the-past-30-days-ii/
WITH cte AS (
    SELECT
        user_id,
        COUNT(DISTINCT session_id) n_sess
    FROM
        Activity
    WHERE
        activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
    GROUP BY
        user_id
)

SELECT
    ROUND(IFNULL(AVG(n_sess), 0), 2) average_sessions_per_user 
FROM
    cte
