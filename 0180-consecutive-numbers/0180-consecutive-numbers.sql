# Write your MySQL query statement below
-- SELECT DISTINCT l1.num AS ConsecutiveNums
-- FROM logs l1
-- JOIN logs l2 ON l2.id = l1.id + 1
-- JOIN logs l3 ON l3.id = l2.id + 1
-- WHERE l1.num = l2.num AND l2.num = l3.num;

WITH SequencedLogs AS (
    SELECT 
        num,
        LEAD(num, 1) OVER(ORDER BY id) AS next_num,
        LEAD(num, 2) OVER(ORDER BY id) AS next_next_num
    FROM logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM SequencedLogs
WHERE num = next_num AND num = next_next_num;
