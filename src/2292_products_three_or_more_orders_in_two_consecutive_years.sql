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
