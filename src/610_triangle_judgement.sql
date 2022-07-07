-- https://leetcode.com/problems/triangle-judgement/
SELECT 
    x,
    y,
    z,
    IF(x + z > y AND y + z > x AND x + y > z, "Yes", "No") triangle
FROM
    Triangle
