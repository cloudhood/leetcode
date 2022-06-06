-- https://leetcode.com/problems/get-highest-answer-rate-question/
SELECT 
    question_id survey_log
FROM 
    SurveyLog
GROUP BY 
    1
ORDER BY 
    SUM(IF(action='answer', 1, 0)) / SUM(IF(action='show', 1, 0)) DESC, 
    question_id ASC
LIMIT 1
