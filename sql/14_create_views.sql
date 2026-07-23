-- 14_create_views.sql
-- Qo'shimcha ko'rinishlar dashboard va tez so'rovlar uchun
-- 
-- Customer RFM view (basic)
CREATE OR REPLACE VIEW vw_customer_rfm AS
WITH last_date AS (SELECT MAX(order_purchase_timestamp) AS snapshot_date FROM orders)
, customer_m AS (
  SELECT c.customer_id,
         MAX(o.order_purchase_timestamp) AS last_order_date,
         COUNT(DISTINCT o.order_id) AS frequency,
         COALESCE(SUM(oi.price),0) AS monetary
  FROM customers c
  LEFT JOIN orders o ON c.customer_id = o.customer_id
  LEFT JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY c.customer_id
)
SELECT
  m.customer_id,
  EXTRACT(DAY FROM (ld.snapshot_date - m.last_order_date))::INT AS recency_days,
  m.frequency,
  m.monetary
FROM customer_m m CROSS JOIN last_date ld;

-- Monthly KPIs view
CREATE OR REPLACE VIEW vw_monthly_kpis AS
SELECT date_trunc('month', o.order_purchase_timestamp) AS month,
       COUNT(DISTINCT o.order_id) AS orders,
       SUM(oi.price) AS revenue,
       SUM(oi.freight_value) AS freight_total,
       AVG(oi.price) AS avg_item_price
FROM orders o
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY 1;
