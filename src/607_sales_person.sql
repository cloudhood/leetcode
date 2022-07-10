-- https://leetcode.com/problems/sales-person/
WITH red AS (
    SELECT 
        com_id
    FROM
        Company
    WHERE
        name = "RED"
),
red_sales AS (
    SELECT
        sales_id
    FROM
        Orders o
    INNER JOIN
        red r
    USING
        (com_id)
)
SELECT
    name
FROM
    SalesPerson s
WHERE
    sales_id NOT IN (
        SELECT
            sales_id
        FROM
            red_sales
    
    ) 
    
-- Alternative
-- https://leetcode.com/problems/sales-person/
SELECT
    s.name  
FROM
    orders o 
INNER JOIN 
    company c 
ON  
    o.com_id = c.com_id 
AND
    c.name = 'RED'
RIGHT JOIN  
    salesperson s
ON 
    s.sales_id = o.sales_id
WHERE 
    o.sales_id IS NULL
