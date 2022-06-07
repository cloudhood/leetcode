-- https://leetcode.com/problems/sellers-with-no-sales/
SELECT DISTINCT
    s.seller_name
FROM 
    Seller s 
LEFT JOIN 
    Orders o
ON 
    s.seller_id = o.seller_id 
AND 
    YEAR(o.sale_date) = 2020 -- Filter before join
WHERE 
    o.order_id IS NULL
ORDER BY 
    1
