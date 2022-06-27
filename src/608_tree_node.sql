-- https://leetcode.com/problems/tree-node/
SELECT DISTINCT
    t1.id,
    CASE
        WHEN t1.p_id IS NULL
        THEN "Root"
        WHEN t2.p_id IS NOT NULL
        THEN "Inner"
        ELSE "Leaf"
    END type
FROM
    Tree t1
LEFT JOIN
    Tree t2
ON 
    t1.id = t2.p_id
ORDER BY 
    1
