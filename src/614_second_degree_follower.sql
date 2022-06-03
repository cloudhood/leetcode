# -- https://leetcode.com/problems/second-degree-follower/submissions/
# SELECT 
#     f1.followee follower,
#     COUNT(DISTINCT f1.follower) num
# FROM 
#     Follow f1
# LEFT JOIN 
#     Follow f2
# ON 
#     f1.followee = f2.follower
# WHERE 
#     f2.follower is not null
# GROUP BY 
#     1
# ORDER BY 
#     1

SELECT 
    followee as follower, 
    COUNT(*) num 
FROM
    Follow
WHERE
    followee IN (SELECT follower FROM Follow)
GROUP BY 
    1
ORDER BY
    1
