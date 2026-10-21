# Write your MySQL query statement below
 WITH FirstOrders AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM delivery
    GROUP BY customer_id
 )  
 SELECT 
 ROUND(
        AVG(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 
        2
    ) AS immediate_percentage
        FROM delivery d
        JOIN FirstOrders fo ON fo.customer_id= d.customer_id
        AND d.order_date=fo.first_order_date
