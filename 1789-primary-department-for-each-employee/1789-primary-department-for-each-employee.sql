# Write your MySQL query statement below
WITH department_count AS (
    SELECT e1.employee_id, COUNT(e1.department_id) AS depart_count
    FROM employee e1
    GROUP BY e1.employee_id
)
SELECT e1.employee_id, e1.department_id 
FROM employee e1
JOIN department_count dc ON dc.employee_id=e1.employee_id
WHERE dc.depart_count =1
OR dc.depart_count>1 AND e1.primary_flag='Y'
GROUP BY e1.employee_id