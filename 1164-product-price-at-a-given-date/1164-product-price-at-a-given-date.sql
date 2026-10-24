# Write your MySQL query statement below
WITH latest_date_cte AS (
    SELECT product_id, MAX(change_date) AS max_date
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
SELECT p.product_id, p.new_price AS price
FROM products p
JOIN latest_date_cte ld ON p.product_id = ld.product_id 
    AND p.change_date = ld.max_date

UNION

SELECT DISTINCT product_id, 10 AS price
FROM products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';
