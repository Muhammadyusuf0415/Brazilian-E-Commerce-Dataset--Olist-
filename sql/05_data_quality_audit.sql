-- 05_data_quality_audit.sql
-- 
-- Data quality checks: duplicates, orphan foreign keys, invalid values

-- 1) Duplicate primary keys
SELECT order_id, COUNT(*) FROM orders GROUP BY order_id HAVING COUNT(*) > 1;
SELECT product_id, COUNT(*) FROM products GROUP BY product_id HAVING COUNT(*) > 1;

-- 2) Orphan order_items (order_id not in orders)
SELECT oi.order_id, COUNT(*) FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id WHERE o.order_id IS NULL GROUP BY oi.order_id LIMIT 20;

-- 3) Payments sum vs order_items per order (basic consistency)
SELECT p.order_id, SUM(p.payment_value) AS payments_total, COALESCE(SUM(oi.price),0) AS items_total
FROM payments p
LEFT JOIN order_items oi ON p.order_id = oi.order_id
GROUP BY p.order_id
HAVING ABS(COALESCE(SUM(p.payment_value),0) - COALESCE(SUM(oi.price),0)) > 1e-6
LIMIT 50;

-- 4) Invalid dates (approved before purchase)
SELECT order_id FROM orders WHERE order_approved_at < order_purchase_timestamp;
