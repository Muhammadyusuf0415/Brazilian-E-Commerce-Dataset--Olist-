-- 02_import_data.sql
-- CSV fayllardan Postgresga ma'lumot import qilish (example path: /data/*.csv)
-- Tizimingizga mos ravishda file path va delimiter ni sozlang.

-- customers.csv
-- COPY requires server access or use psql \copy from client.
-- Example using psql client:
\copy customers(customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state) FROM '/path/to/customers.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy sellers(seller_id, seller_zip_code_prefix, seller_city, seller_state) FROM '/path/to/sellers.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy orders(order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date) FROM '/path/to/orders.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy order_items(order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value) FROM '/path/to/order_items.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy products(product_id, product_category_name, product_name_length, product_description_length, product_photos_qty) FROM '/path/to/products.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy payments(order_id, payment_sequential, payment_type, payment_installments, payment_value) FROM '/path/to/payments.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy reviews(review_id, order_id, review_score, review_comment_message, review_creation_date, review_answer_timestamp) FROM '/path/to/reviews.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

\copy geolocation(geolocation_zip_code_prefix, geolocation_latitude, geolocation_longitude, geolocation_city, geolocation_state) FROM '/path/to/geolocation.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');

-- Agar fayllar serverda joylashgan bo'lmasa, \copy bilan psql client dan foydalaning.
