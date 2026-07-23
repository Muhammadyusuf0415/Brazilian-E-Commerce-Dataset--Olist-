-- 01_create_tables.sql
-- 
-- Creates the core tables for the Olist Brazilian e-commerce dataset (Postgres syntax)

CREATE TABLE IF NOT EXISTS sellers (
  seller_id VARCHAR PRIMARY KEY,
  seller_zip_code_prefix VARCHAR,
  seller_city VARCHAR,
  seller_state VARCHAR
);

CREATE TABLE IF NOT EXISTS customers (
  customer_id VARCHAR PRIMARY KEY,
  customer_unique_id VARCHAR,
  customer_zip_code_prefix VARCHAR,
  customer_city VARCHAR,
  customer_state VARCHAR
);

CREATE TABLE IF NOT EXISTS orders (
  order_id VARCHAR PRIMARY KEY,
  customer_id VARCHAR NOT NULL,
  order_status VARCHAR,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_items (
  order_id VARCHAR NOT NULL,
  order_item_id INTEGER NOT NULL,
  product_id VARCHAR NOT NULL,
  seller_id VARCHAR,
  shipping_limit_date TIMESTAMP,
  price NUMERIC,
  freight_value NUMERIC,
  PRIMARY KEY (order_id, order_item_id)
);

CREATE TABLE IF NOT EXISTS products (
  product_id VARCHAR PRIMARY KEY,
  product_category_name VARCHAR,
  product_name_length INTEGER,
  product_description_length INTEGER,
  product_photos_qty INTEGER
);

CREATE TABLE IF NOT EXISTS payments (
  order_id VARCHAR NOT NULL,
  payment_sequential INTEGER,
  payment_type VARCHAR,
  payment_installments INTEGER,
  payment_value NUMERIC,
  PRIMARY KEY (order_id, payment_sequential)
);

CREATE TABLE IF NOT EXISTS reviews (
  review_id VARCHAR PRIMARY KEY,
  order_id VARCHAR,
  review_score INTEGER,
  review_comment_message TEXT,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP
);

CREATE TABLE IF NOT EXISTS geolocation (
  geolocation_zip_code_prefix VARCHAR,
  geolocation_latitude NUMERIC,
  geolocation_longitude NUMERIC,
  geolocation_city VARCHAR,
  geolocation_state VARCHAR
);

-- Optional: product category translation table if present in dataset
CREATE TABLE IF NOT EXISTS product_category_name_translation (
  product_category_name VARCHAR PRIMARY KEY,
  product_category_name_english VARCHAR
);

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON orders (customer_id);
CREATE INDEX IF NOT EXISTS idx_order_items_product_id ON order_items (product_id);
CREATE INDEX IF NOT EXISTS idx_order_items_seller_id ON order_items (seller_id);
CREATE INDEX IF NOT EXISTS idx_payments_order_id ON payments (order_id);
CREATE INDEX IF NOT EXISTS idx_reviews_order_id ON reviews (order_id);
