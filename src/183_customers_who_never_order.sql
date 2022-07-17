-- https://leetcode.com/problems/customers-who-never-order/
SELECT
    c.name Customers
FROM
    Customers c
LEFT JOIN
    Orders o
ON
    c.id = o.customerId
WHERE
    o.id IS NULL
    
