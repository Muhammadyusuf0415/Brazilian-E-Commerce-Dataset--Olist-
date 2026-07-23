-- 06_primary_foreign_keys.sql
-- 
-- Purpose: Add primary keys and foreign key constraints after validating data quality.



ALTER TABLE customers
ADD CONSTRAINT pk_customers
PRIMARY KEY (customer_id);

ALTER TABLE orders
ADD CONSTRAINT pk_orders
PRIMARY KEY (order_id);

ALTER TABLE products
ADD CONSTRAINT pk_products
PRIMARY KEY (product_id);

ALTER TABLE sellers
ADD CONSTRAINT pk_sellers
PRIMARY KEY (seller_id);

SELECT
    review_id,
    COUNT(*)
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

ALTER TABLE payments
ADD CONSTRAINT pk_payments
PRIMARY KEY(order_id, payment_sequential);

ALTER TABLE order_items
ADD CONSTRAINT pk_order_items
PRIMARY KEY(order_id, order_item_id);

ALTER TABLE category_translation
ADD CONSTRAINT pk_category_translation
PRIMARY KEY(product_category_name);

foreign keys

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY(customer_id)
REFERENCES customers(customer_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY(product_id)
REFERENCES products(product_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_sellers
FOREIGN KEY(seller_id)
REFERENCES sellers(seller_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY(order_id)
REFERENCES orders(order_id);

SELECT
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type
FROM information_schema.table_constraints tc
WHERE tc.table_schema='public'
ORDER BY tc.table_name, tc.constraint_type;