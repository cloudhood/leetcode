-- https://leetcode.com/problems/average-time-of-process-per-machine/
WITH lags AS (
    SELECT
        machine_id,
        process_id,
        activity_type,
        timestamp,
        timestamp - LAG(timestamp) OVER (
            PARTITION BY 
                machine_id, 
                process_id 
            ORDER BY 
                machine_id, 
                process_id, 
                activity_type
        ) proc_time
    FROM
        Activity
)

SELECT
    machine_id,
    ROUND(AVG(proc_time), 3) processing_time
FROM
    lags
GROUP BY 
    1
