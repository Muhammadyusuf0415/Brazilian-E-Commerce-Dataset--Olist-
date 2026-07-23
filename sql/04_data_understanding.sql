-- 04_data_understanding.sql
-- Ma'lumotlarni umumiy tushunish (summary va taqsimotlar)

-- Unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers, COUNT(DISTINCT customer_unique_id) AS unique_customer_unique_id FROM customers;

-- Orders per month
SELECT date_trunc('month', order_purchase_timestamp) AS month, COUNT(*) AS orders_count, SUM((SELECT COALESCE(SUM(price + freight_value),0) FROM order_items oi WHERE oi.order_id = o.order_id)) AS dummy_total_estimate
FROM orders o
GROUP BY 1
ORDER BY 1;

-- Distribution of review scores
SELECT review_score, COUNT(*) FROM reviews GROUP BY review_score ORDER BY review_score;
