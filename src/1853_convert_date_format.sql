-- https://leetcode.com/problems/convert-date-format/
SELECT 
    DATE_FORMAT(day, "%W, %M %e, %Y") day
FROM 
    Days
