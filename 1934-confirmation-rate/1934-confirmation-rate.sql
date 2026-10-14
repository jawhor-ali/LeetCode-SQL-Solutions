# Write your MySQL query statement below
SELECT s.user_id,
    IFNULL(ROUND(AVG(c.action = 'confirmed'), 2), 0) AS confirmation_rate 
FROM signups s
LEFT JOIN confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id;
