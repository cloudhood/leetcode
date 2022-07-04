-- https://leetcode.com/problems/average-salary-departments-vs-company/
--
-- First attempt
WITH sal AS (
    SELECT 
        id,
        employee_id,
        amount,
        DATE_FORMAT(pay_date, "%Y-%m") pay_month
    FROM
        Salary
),
comb1 AS (
    SELECT
        s.*,
        e.department_id,
        AVG(amount) OVER (PARTITION BY pay_month) avg_overall
    FROM
        sal s
    INNER JOIN
        Employee e
    USING
        (employee_id)
),
comb2 AS (
    SELECT
        pay_month,
        department_id,
        avg_overall,
        AVG(amount) OVER (PARTITION BY pay_month, department_id) avg_dept
    FROM
        comb1 c
)
SELECT DISTINCT
    pay_month,
    department_id,
    CASE 
        WHEN avg_dept < avg_overall THEN "lower"
        WHEN avg_dept > avg_overall THEN "higher"
        ELSE "same"
    END comparison
FROM
    comb2
