/*
==============================================================
07 - CREATING VIEWS
==============================================================

Cleaning Decisions

1. No duplicate primary keys detected.
2. No orphan records detected.
3. NULL review comments were retained because customers are not
   required to leave a written review.
4. NULL delivery dates were retained because canceled and
   unavailable orders are expected to have no delivery date.
5. Original raw data was preserved.
6. Data transformations will be applied through SQL views.
==============================================================
*/

-- CREATE OR REPLACE VIEW vw_delivered_orders AS
-- SELECT *
-- FROM orders
-- WHERE order_status = 'delivered';

-- CREATE OR REPLACE VIEW vw_products AS
-- SELECT
--     p.product_id,
--     COALESCE(
--         t.product_category_name_english,
--         p.product_category_name
--     ) AS product_category,
--     p.product_weight_g,
--     p.product_length_cm,
--     p.product_height_cm,
--     p.product_width_cm
-- FROM products p
-- LEFT JOIN category_translation t
--     ON p.product_category_name = t.product_category_name;

-- CREATE OR REPLACE VIEW vw_order_payments AS
-- SELECT
--     order_id,
--     SUM(payment_value) AS total_payment
-- FROM payments
-- GROUP BY order_id;


-- CREATE OR REPLACE VIEW vw_orders AS
-- SELECT
--     o.order_id,
--     o.order_purchase_timestamp,
--     o.order_approved_at,
--     o.order_delivered_carrier_date,
--     o.order_delivered_customer_date,
--     o.order_estimated_delivery_date,
--     o.customer_id,
--     c.customer_unique_id,
--     c.customer_city,
--     c.customer_state,
--     op.total_payment,
--     r.review_score
-- FROM vw_delivered_orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id
-- JOIN vw_order_payments op
--     ON o.order_id = op.order_id
-- LEFT JOIN reviews r
--     ON o.order_id = r.order_id;


CREATE VIEW vw_sales AS
SELECT
    oi.order_id,
    o.order_purchase_timestamp,

    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    oi.order_item_id,
    oi.product_id,
    vp.product_category,
    oi.seller_id,

    oi.price,
    oi.freight_value,

    pt.payment_type,

    -- Item qiymati
    (oi.price + oi.freight_value) AS item_total,

    -- Order bo'yicha jami to'lov
    op.total_payment,

    -- Itemga proporsional taqsimlangan payment
    ROUND(
        op.total_payment *
        (
            (oi.price + oi.freight_value)
            /
            SUM(oi.price + oi.freight_value)
            OVER (PARTITION BY oi.order_id)
        ),
        2
    ) AS allocated_payment,

    r.review_score

FROM vw_delivered_orders o

JOIN customers c
    ON o.customer_id = c.customer_id

JOIN order_items oi
    ON o.order_id = oi.order_id

JOIN vw_products vp
    ON oi.product_id = vp.product_id

JOIN vw_order_payments op
    ON o.order_id = op.order_id

JOIN  payments pt
    ON o.order_id = pt.order_id

LEFT JOIN reviews r
    ON o.order_id = r.order_id;



SELECT
    order_id,
    MAX(total_payment) AS total_payment,
    ROUND(SUM(allocated_payment), 2) AS allocated_sum
FROM vw_sales
GROUP BY order_id
HAVING ROUND(MAX(total_payment), 2) <> ROUND(SUM(allocated_payment), 2);