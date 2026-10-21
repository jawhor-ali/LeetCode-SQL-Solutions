SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE activity_date BETWEEN 
    -- Subtract 29 days from the end date to get a total 30-day window
    DATE_SUB('2019-07-27', INTERVAL 29 DAY) 
    AND '2019-07-27'
-- CRITICAL FIX: Group by the day to avoid the NULL/0 collapsing error
GROUP BY activity_date;
