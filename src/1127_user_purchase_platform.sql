-- https://leetcode.com/problems/user-purchase-platform/
--
-- Create CTEs for "metadata" and creating an entry for "both"
WITH cte1 AS (
    SELECT DISTINCT 
        spend_date,
        "desktop" platform
    FROM
        Spending
    UNION ALL
    SELECT DISTINCT 
        spend_date,
        "mobile" platform
    FROM
        Spending
    UNION ALL
    SELECT DISTINCT 
        spend_date,
        "both" platform
    FROM
        Spending
),
cte2 AS (
    SELECT 
        spend_date, 
        user_id,
        IF(COUNT(*) = 2, 'both', platform) platform, 
        SUM(amount) amount
    FROM 
        Spending
    GROUP BY 
        1, 
        2   
)
SELECT
    c1.spend_date,
    c1.platform,
    IFNULL(SUM(amount), 0) total_amount,
    COUNT(user_id) total_users
FROM
    cte1 c1
LEFT JOIN
    cte2 c2
USING (
    spend_date,
    platform
)
GROUP BY
    1,
    2
