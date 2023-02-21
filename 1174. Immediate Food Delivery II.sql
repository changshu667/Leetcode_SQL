
-- Two steps:
-- 1. calculate ratio based on new created column (need to use CASE WHEN)
-- 2. the calculation is based on only "first time order", create this table first


With CTE As (
    SELECT customer_id, MIN(order_date) as first_order_date
    FROM Delivery
    GROUP BY customer_id
)

SELECT 
    ROUND(AVG(CASE WHEN d.customer_pref_delivery_date = d.order_date THEN 1 ELSE 0 END),4)*100 as immediate_percentage
FROM Delivery d
INNER JOIN CTE c
ON d.customer_id = c.customer_id
AND d.order_date = c.first_order_date