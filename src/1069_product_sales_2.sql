-- https://leetcode.com/problems/product-sales-analysis-ii/
SELECT
    product_id,
    SUM(quantity) AS total_quantity
FROM
    Sales
GROUP BY
    1
