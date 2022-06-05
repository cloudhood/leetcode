-- https://leetcode.com/problems/number-of-calls-between-two-persons/
WITH cte AS (
    SELECT 
      *,
      to_id > from_id AS flag
    FROM 
      Calls
)

SELECT 
  IF(flag, from_id, to_id) person1,
  IF(flag, to_id, from_id) person2,
  COUNT(*) call_count,
  SUM(duration) total_duration
FROM 
  cte
GROUP BY 
  1, 
  2
