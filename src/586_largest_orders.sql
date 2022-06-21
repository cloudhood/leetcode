-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/
SELECT
    customer_number
FROM
    Orders
GROUP BY
    1
ORDER BY
    COUNT(*) DESC
LIMIT 
    1
