# Write your MySQL query statement below
-- SELECT product_id,first_year,quantity,price
WITH first_year_cte AS (
    SELECT product_id,sale_id, MIN(year) AS first_year, quantity,price
    FROM sales
    GROUP BY product_id
)
SELECT s.product_id, fy.first_year,s.quantity,s.price
FROM sales s
JOIN first_year_cte as fy ON fy.product_id = s.product_id
AND fy.first_year = s.year
