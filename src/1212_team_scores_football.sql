-- https://leetcode.com/problems/team-scores-in-football-tournament/

-- Alternative
WITH diffs AS (
    SELECT 
        host_team,
        guest_team,
        (host_goals - guest_goals) goal_diff
    FROM
        Matches
),
comb AS (
    SELECT 
        host_team team_id, 
        goal_diff 
    FROM 
        diffs
    UNION ALL
    SELECT 
        guest_team team_id, 
        -goal_diff goal_diff 
    FROM 
        diffs
)

SELECT
    t1.*,
    COALESCE(
        SUM(CASE 
                 WHEN t2.goal_diff > 0 THEN 3
                 WHEN t2.goal_diff = 0 THEN 1
                 ELSE 0
             END)
    ) num_points
FROM
    Teams t1
LEFT JOIN
    comb t2
USING
    (team_id)
GROUP BY
    1,
    2
ORDER BY
    3 DESC,
    1
    
-- Naive
WITH host AS (
    SELECT
        host_team team_id,
        CASE 
            WHEN host_goals > guest_goals 
            THEN 3
            WHEN host_goals = guest_goals
            THEN 1
            ELSE 0
        END num_points
    FROM
        matches
),
guest AS (
    SELECT
        guest_team team_id,
        CASE 
            WHEN host_goals < guest_goals 
            THEN 3
            WHEN host_goals = guest_goals
            THEN 1
            ELSE 0
        END num_points
    FROM
        matches
),
points AS (
    SELECT 
        * 
    FROM
        host
    UNION ALL
    SELECT 
        *
    FROM
        guest
),
totals AS (
    SELECT 
        team_id,
        SUM(num_points) num_points
    FROM
        points
    GROUP BY
        1

)
SELECT 
    t.*,
    COALESCE(s.num_points, 0) num_points
FROM
    Teams t
LEFT JOIN
    totals s
USING
    (team_id)
ORDER BY
    3 DESC,
    1


