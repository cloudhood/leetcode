-- https://leetcode.com/problems/report-contiguous-dates/
--
-- The key insight is to identify consecutive dates per state using a derived ROW_NUMBER variable.
-- When difference between n1 and n2 changes, we have a new run.
--
-- fails
-- period_date	period_state	n1		
-- 28/12/2018	fail	        1		
-- 29/12/2018	fail	        2		
-- 04/01/2019	fail	        3   		
-- 05/01/2019	fail	        4		
--			
-- successes
-- period_date	period_state	n1		
-- 30/12/2018	success	        1		
-- 31/12/2018	success	        2		
-- 01/01/2019	success	        3		
-- 02/01/2019	success	        4		
-- 03/01/2019	success	        5		
-- 06/03/2019	success	        6		
				
-- combined
-- period_date	period_state	n1	n2	n2 - n1
-- 28/12/2018	fail	        1	1	0
-- 29/12/2018	fail	        2	2	0
-- 04/01/2019	fail	        3	8	5
-- 05/01/2019	fail	        4	9	5
-- 30/12/2018	success     	1	3	2
-- 31/12/2018	success     	2	4	2
-- 01/01/2019	success     	3	5	2
-- 02/01/2019	success	        4	6	2
-- 03/01/2019	success     	5	7	2
-- 06/03/2019	success	        6	10	4
WITH success AS (
    SELECT
        success_date period_date,
        "succeeded" period_state,
        ROW_NUMBER() OVER (ORDER BY success_date) n1 - ROW_NUMBER() works too
    FROM
        Succeeded
),
fails AS (
    SELECT
        fail_date period_date,
        "failed" period_state,
        ROW_NUMBER() OVER (ORDER BY fail_date) n1
    FROM
        Failed
),
comb AS (
    SELECT 
        *
    FROM
        success
    UNION ALL
    SELECT 
        *
    FROM
        fails
),
comb2 AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (ORDER BY period_date) n2
    FROM
        comb
    WHERE 
        YEAR(period_date) = '2019'
),
comb3 AS (
    SELECT
        *,
        CAST(n2 AS SIGNED) - CAST(n1 AS SIGNED) diff
    FROM
        comb2
)

SELECT 
  period_state,
  MIN(period_date) start_date,
  MAX(period_date) end_date
FROM
    comb3
GROUP BY
    diff,
    period_state
