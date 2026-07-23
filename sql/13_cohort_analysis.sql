-- 13_cohort_analysis.sql
-- Cohort tahlili: birinchi buyurtma oyiga asosan retention jadvali

WITH first_orders AS (
  SELECT customer_id, MIN(date_trunc('month', order_purchase_timestamp)) AS cohort_month
  FROM orders
  GROUP BY customer_id
),
orders_month AS (
  SELECT customer_id, date_trunc('month', order_purchase_timestamp) AS order_month
  FROM orders
)
SELECT
  f.cohort_month,
  o.order_month,
  COUNT(DISTINCT o.customer_id) AS customers_in_month
FROM first_orders f
JOIN orders_month o ON f.customer_id = o.customer_id
GROUP BY f.cohort_month, o.order_month
ORDER BY f.cohort_month, o.order_month;
