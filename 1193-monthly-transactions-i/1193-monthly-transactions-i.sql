# Write your MySQL query statement below
-- OUTPUT : month | country | trans_count | approved_count | trans_total_amount | approved_total_amount
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(trans_date) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN trans_date END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount 
FROM transactions
GROUP BY month, country