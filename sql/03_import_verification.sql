-- 03_import_verification.sql
-- 
-- Import qilingan ma'lumotlarni tekshirish uchun skriptlar

-- 1) Har jadvaldagi satrlar soni
SELECT 'customers' AS table_name, COUNT(*) AS rows FROM customers
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation;

-- 2) NULL tekshiruvlari: muhim ustunlar
SELECT 'orders' AS table_name, COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_id FROM orders;
SELECT 'order_items' AS table_name, COUNT(*) FILTER (WHERE order_id IS NULL OR product_id IS NULL) FROM order_items;

-- 3) Namuna (10 ta)
SELECT * FROM orders ORDER BY order_purchase_timestamp DESC LIMIT 10;
SELECT * FROM order_items LIMIT 10;
