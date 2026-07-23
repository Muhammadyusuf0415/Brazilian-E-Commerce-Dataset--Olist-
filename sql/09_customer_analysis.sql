-- 09_customer_analysis.sql
-- Customer analysis: eng ko'p buyurtma berganlar, churn, segmentatsiya

-- Top 20 customers by total spend
SELECT c.customer_id, SUM(oi.price) AS total_spent, COUNT(DISTINCT o.order_id) AS orders_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 20;

-- Customers with only one order (potential churn risk)
SELECT c.customer_id, COUNT(DISTINCT o.order_id) AS orders_count, MAX(o.order_purchase_timestamp) AS last_order
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT o.order_id) = 1;
