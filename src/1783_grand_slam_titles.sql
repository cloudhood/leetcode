-- https://leetcode.com/problems/grand-slam-titles/
WITH Slams AS (
    SELECT 
        year,
        Wimbledon player_id,
        "Wimbledon" slam 
    FROM 
        Championships
    UNION ALL
    SELECT 
        year,
        Fr_open player_id,
        "FR" slam 
    FROM 
        Championships
    UNION ALL
    SELECT 
        year,
        US_open player_id,
        "US" slam 
    FROM 
        Championships
    UNION ALL
    SELECT 
        year,
        Au_open player_id,
        "AU" slam 
    FROM 
        Championships
)
SELECT 
    player_id, 
    player_name, 
    COUNT(*) grand_slams_count
FROM 
    Players
RIGHT JOIN 
    Slams
USING 
    (player_id)
GROUP BY 
    1, 
    2
