-- https://leetcode.com/problems/tasks-count-in-the-weekend/
WITH cte AS (
    SELECT 
        *,
        IF(DAYOFWEEK(submit_date) IN (1, 7), 1, 0) flag_weekend
    FROM
        Tasks
)

SELECT 
    SUM(flag_weekend) weekend_cnt,
    COUNT(*) - SUM(flag_weekend) working_cnt
FROM
    cte
    
