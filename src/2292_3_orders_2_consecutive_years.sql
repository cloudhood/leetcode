-- How to make this work for N consecutive years?
--
-- https://leetcode.com/problems/products-with-three-or-more-orders-in-two-consecutive-years/
WITH CTE1 AS (
    SELECT 
        YEAR(PURCHASE_DATE) AS CURR_YEAR,
        PRODUCT_ID,
        COUNT(ORDER_ID) AS CURR_ORDERS
    FROM 
        ORDERS 
    GROUP BY 
        1,
        2
),
CTE2 AS(
    SELECT 
        *, 
        LEAD(CURR_YEAR, 1) OVER (PARTITION BY PRODUCT_ID ORDER BY CURR_YEAR) AS NEXT_YEAR,
        LEAD(CURR_ORDERS, 1) OVER (PARTITION BY PRODUCT_ID ORDER BY CURR_YEAR) AS NEXT_ORDERS 
    FROM CTE1
)

SELECT DISTINCT 
    PRODUCT_ID 
FROM 
    CTE2
WHERE 
    NEXT_YEAR = CURR_YEAR + 1 
AND 
    CURR_ORDERS >= 3 AND NEXT_ORDERS >= 3
