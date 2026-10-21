# Write your MySQL query statement below
SELECT ROUND(
    -- Step 3: Count players with a consecutive login / total players
    COUNT(DISTINCT a.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2
) AS fraction
FROM Activity a
JOIN (
    -- Step 1: Find the first login date per player (Monday)
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f 
  ON a.player_id = f.player_id 
  -- Step 2: Date comparison for the consecutive day (Tuesday)
  AND a.event_date = DATE_ADD(f.first_login, INTERVAL 1 DAY);
