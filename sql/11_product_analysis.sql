-- 11_product_analysis.sql
-- Mahsulot tahlili: eng ko'p sotilgan, mediana price, foto soni ta'siri

-- Top 20 selling products by revenue
SELECT oi.product_id, SUM(oi.price) AS revenue, COUNT(oi.order_id) AS units_sold
FROM order_items oi
GROUP BY oi.product_id
ORDER BY revenue DESC
LIMIT 20;

-- Price distribution per category (percentiles)
SELECT product_category_name,
       percentile_cont(0.25) WITHIN GROUP (ORDER BY price) AS p25,
       percentile_cont(0.5) WITHIN GROUP (ORDER BY price) AS median,
       percentile_cont(0.75) WITHIN GROUP (ORDER BY price) AS p75
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY product_category_name
ORDER BY median DESC
LIMIT 20;
