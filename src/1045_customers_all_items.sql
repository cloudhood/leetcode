-- https://leetcode.com/problems/customers-who-bought-all-products/
WITH cte AS (
    SELECT DISTINCT
        customer_id,
        COUNT(DISTINCT product_key) n
    FROM
        Customer
    GROUP BY 
        1
)

SELECT customer_id
FROM cte
WHERE n = (
    SELECT 
        COUNT(DISTINCT product_key)
    FROM
        Product
)
