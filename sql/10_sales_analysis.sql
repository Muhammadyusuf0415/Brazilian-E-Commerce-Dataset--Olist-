-- 10_sales_analysis.sql
-- Sales metrikalari: OAV, ARPU, growth

-- Monthly revenue and average order value
SELECT date_trunc('month', o.order_purchase_timestamp) AS month,
       COUNT(DISTINCT o.order_id) AS orders,
       SUM(oi.price) AS revenue,
       SUM(oi.price)/COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- Revenue by payment type
SELECT p.payment_type, SUM(p.payment_value) AS total_paid, COUNT(DISTINCT p.order_id) AS orders_count
FROM payments p
GROUP BY p.payment_type
ORDER BY total_paid DESC;
