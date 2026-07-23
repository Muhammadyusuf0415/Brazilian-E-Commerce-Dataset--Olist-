-- 15_powerbi_queries.sql
-- Power BI / dashboard-ga moslash uchun tayyor so'rovlar va tavsiyalar
-- Power BI-da to'g'ridan-to'g'ri PostgreSQL bilan ishlaganda quyidagi view-lardan foydalanish tavsiya etiladi.
-- 
-- 1) View: order-level metrics (id, date, revenue, items_count)
SELECT * FROM vw_order_totals;

-- 2) View: customer summary
SELECT * FROM vw_customer_summary;

-- 3) Performance: agar Power BI tezroq ishlashi kerak bo'lsa, materialized view-larni yarating
-- Example: materialized monthly revenue
CREATE MATERIALIZED VIEW IF NOT EXISTS mv_monthly_revenue AS
SELECT date_trunc('month', o.order_purchase_timestamp) AS month,
       SUM(oi.price) AS revenue,
       COUNT(DISTINCT o.order_id) AS orders_count
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1
WITH NO DATA;

-- REFRESH MATERIALIZED VIEW mv_monthly_revenue;  -- refresh when new data loaded
-- Power BI-ga ulanish: SELECT * FROM mv_monthly_revenue;
