-- https://leetcode.com/problems/products-with-three-or-more-orders-in-two-consecutive-years/
WITH cte AS (
    SELECT 
        product_id,
        YEAR(purchase_date) year,
        COUNT(*) order_count
    FROM
        Orders
    GROUP BY
        1,
        2
    HAVING
        COUNT(*) >= 3
)

SELECT DISTINCT
    t1.product_id
FROM
    cte t1
INNER JOIN
    cte t2
WHERE 
    t1.product_id = t2.product_id
AND 
    (t1.year - t2.year = 1)



-- Alternative
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
    
-- How to make this work for N consecutive years?
