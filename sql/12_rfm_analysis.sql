-- 12_rfm_analysis.sql
-- RFM: Recency, Frequency, Monetary qiymatlarni hisoblash va segmentatsiya

-- Base RFM metrics (as of a chosen snapshot date)
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
  EXTRACT(DAY FROM (ld.snapshot_date - m.last_order_date)) AS recency_days,
  m.frequency,
  m.monetary
FROM customer_m m CROSS JOIN last_date ld
ORDER BY monetary DESC
LIMIT 100;

-- Simple RFM scoring (1-5) example
-- Note: for production compute quantiles and map accordingly.
