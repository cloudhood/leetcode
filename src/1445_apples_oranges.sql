-- https://leetcode.com/problems/apples-oranges/
WITH cte AS (
    SELECT  
      sale_date,
      IF(fruit = "apples", sold_num,  0) apple_num,
      IF(fruit = "oranges", sold_num, 0) orange_num
    FROM 
      Sales
)

SELECT
  sale_date,
  SUM(apple_num - orange_num) diff
FROM 
  cte
GROUP BY 
  1
