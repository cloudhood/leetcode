-- https://leetcode.com/problems/build-the-equation/
WITH cte1 AS (
    SELECT
        *,
        IF(factor < 0, "-", "+") sign,
        ABS(factor) fact,
        IF(power = 0 OR power = 1, "", CONCAT("^", power)) pow
    FROM
        Terms
),
cte2 AS (
    SELECT
        *,
        IF(power = 0, CONCAT(sign, fact, pow), CONCAT(sign, fact, "X", pow)) eqn
    FROM
        cte1
)
-- Should tidy up using two REGEXP_REPLACE calls.
SELECT
    CONCAT(
        REPLACE(
            REPLACE(
                REPLACE(
                    REPLACE(
                        GROUP_CONCAT(eqn ORDER BY power DESC), ",", "+"
                    ), 
                "-+", "-"),
            "+-", "-"),
        "++", "+"),
    "=0") equation
FROM
    cte2
