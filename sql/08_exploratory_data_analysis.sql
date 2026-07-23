-- 08_exploratory_data_analysis.sql
-- 
-- Purpose:
--     Explore sales performance, customer behavior,
--     product demand, payment trends, and delivery performance.


-- SELECT
--     ROUND(SUM(total_payment),2) AS total_revenue
-- FROM vw_sales;

-- SELECT
--     COUNT(DISTINCT order_id) AS total_orders
-- FROM vw_sales;

-- SELECT
--     COUNT(DISTINCT customer_unique_id) AS total_customers
-- FROM vw_sales;

-- SELECT
--     COUNT(DISTINCT seller_id) AS total_sellers
-- FROM vw_sales;

-- SELECT
--     COUNT(*) AS products_sold
-- FROM vw_sales;


-- SELECT
--     COUNT(DISTINCT product_id) AS unique_products_sold
-- FROM vw_sales;

-- SELECT
--     ROUND(AVG(total_payment), 2) AS average_order_value
-- FROM vw_orders;

-- SELECT
--     ROUND(AVG(review_score), 2) AS average_review_score
-- FROM vw_orders;

-- SELECT
--     ROUND(
--         AVG(
--             order_delivered_customer_date::date
--             -
--             order_purchase_timestamp::date
--         ),
--         2
--     ) AS average_delivery_days
-- FROM vw_orders;



-- SECTION 2: REVENUE ANALYSIS

-- SELECT
--     DATE_TRUNC('month', order_purchase_timestamp)::date AS month,
--     ROUND(SUM(total_payment),2) AS revenue
-- FROM vw_sales
-- GROUP BY month
-- ORDER BY month;

-- SELECT
--     DATE_TRUNC('month', order_purchase_timestamp)::date AS month,
--     COUNT(*) AS total_orders
-- FROM vw_orders
-- GROUP BY month
-- ORDER BY month;


-- SELECT
--     customer_state,
--     ROUND(SUM(total_payment), 2) AS revenue
-- FROM vw_orders
-- GROUP BY customer_state
-- ORDER BY revenue DESC;


-- SELECT
--     customer_city,
--     ROUND(SUM(total_payment), 2) AS revenue
-- FROM vw_orders
-- GROUP BY customer_city
-- ORDER BY revenue DESC
-- LIMIT 10;

-- Section 3 — Orders


-- SELECT
--     ROUND(AVG(total_payment),2) AS average_order_value
-- FROM (
--     SELECT
--         order_id,
--         MAX(total_payment) AS total_payment
--     FROM vw_sales
--     GROUP BY order_id
-- ) t;

-- SELECT
--     ROUND(AVG(total_payment),2) AS average_order_value
-- FROM vw_sales