-- https://leetcode.com/problems/product-sales-analysis-iv/
WITH cte AS (
    SELECT
        s.user_id,
        s.product_id,
        SUM(s.quantity * p.price) spend,
        MAX(SUM(s.quantity * p.price)) OVER (PARTITION BY user_id) max_spend
    FROM
        Sales s
    INNER JOIN
        Product p
    USING
        (product_id)
    GROUP BY
        1, 
        2
)

SELECT 
    user_id,
    product_id
FROM
    cte
WHERE
    spend = max_spend
