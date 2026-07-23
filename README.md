# 🛒 Brazilian E-Commerce Data Analysis & Power BI Dashboard

### Dashboard Preview

<img src="images_and_videos/bandicam 2026-07-23 12-41-56-802.jpg" width="900" alt="Brazilian E-Commerce Power BI Dashboard">

### Dashboard Demo

[▶️ Watch Dashboard Demo](images_and_videos/bandicam%202026-07-23%2012-38-36-562.mp4)
## 📌 Project Overview

This project analyzes the Brazilian E-Commerce public dataset from **Olist**, one of the largest e-commerce marketplaces in Brazil.

The goal of this project is to transform raw e-commerce data into meaningful business insights using **PostgreSQL, SQL, and Power BI**.

The analysis focuses on sales performance, customer behavior, product categories, payment methods, delivery performance, and customer review scores.

---

## 🎯 Business Objectives

- Analyze overall sales and revenue performance
- Identify top-performing product categories
- Understand customer distribution across Brazilian states
- Analyze order and payment behavior
- Evaluate delivery performance
- Analyze customer review scores
- Identify key business trends and patterns
- Build an interactive Power BI dashboard

---

## 🗂️ Dataset

The project uses the **Brazilian E-Commerce Public Dataset by Olist**, which contains information about orders placed between 2016 and 2018.

The dataset includes the following tables:

| Table | Description |
|---|---|
| `customers` | Customer information and location |
| `orders` | Order status and timestamps |
| `order_items` | Products included in each order |
| `products` | Product information |
| `sellers` | Seller information and location |
| `payments` | Payment methods and payment values |
| `reviews` | Customer review scores and comments |
| `geolocation` | Brazilian geographic information |
| `category_translation` | Product category translations |

---

## 🛠️ Tools & Technologies

- **PostgreSQL** — Database management and SQL analysis
- **SQL** — Data cleaning, transformation, validation, and analysis
- **Power BI** — Interactive dashboard and data visualization
- **DAX** — Measures and business calculations
- **Power Query** — Data transformation and preparation
- **GitHub** — Project documentation and version control

---

## 🔄 Project Workflow

### 1. Data Import & Database Setup

The raw CSV files were imported into PostgreSQL and structured into relational tables.

### 2. Data Quality Audit

The dataset was reviewed to identify:

- Missing values
- Duplicate records
- Invalid or inconsistent data
- Data type issues
- Relationships between tables

### 3. Data Cleaning & Transformation

SQL was used to prepare the data for analysis, including:

- Handling missing values
- Standardizing data
- Creating calculated fields
- Validating relationships
- Preparing analytical views

### 4. Exploratory Data Analysis

SQL queries were used to explore:

- Revenue and sales performance
- Customer behavior
- Product categories
- Payment methods
- Order status
- Delivery performance
- Customer reviews
- Geographic distribution

### 5. Data Modeling

The cleaned and transformed data was connected to Power BI and organized into an analytical data model.

### 6. Dashboard Development

An interactive Power BI dashboard was created to provide a high-level overview of e-commerce performance and allow users to explore the data through filters and visualizations.

---

## 📊 Power BI Dashboard

The dashboard provides insights into key business metrics and performance indicators.

### Key Areas of Analysis

- 💰 Revenue Performance
- 📦 Order & Sales Analysis
- 👥 Customer Distribution
- 🛍️ Product Category Performance
- 💳 Payment Analysis
- 🚚 Delivery Performance
- ⭐ Customer Reviews
- 📍 Geographic Sales Analysis

### Dashboard Features

- KPI cards for key performance indicators
- Interactive slicers and filters
- Revenue analysis by state
- Top product categories
- Customer geographic distribution
- Sales and order trends
- Delivery performance analysis
- Payment method analysis

### Dashboard Preview

<img src="images/dashboard_preview.png" width="900" alt="Brazilian E-Commerce Power BI Dashboard">

---

## 📈 Key Business Questions

This project aims to answer the following questions:

1. How is overall revenue performing?
2. Which product categories generate the most revenue?
3. Which Brazilian states have the highest customer concentration?
4. What are the most commonly used payment methods?
5. How long does it take to deliver orders to customers?
6. How does delivery performance vary across different regions?
7. Which product categories receive the highest review scores?
8. What are the major trends in customer and sales activity?

---

## 💡 Key Insights

The analysis provides a data-driven view of the Brazilian e-commerce marketplace and helps identify patterns in:

- Customer demand
- Revenue generation
- Product performance
- Geographic concentration
- Payment behavior
- Logistics and delivery
- Customer satisfaction

These insights can help businesses better understand their customers, identify high-performing product segments, and improve operational and customer experience strategies.

---

## 📁 Project Structure

```text
Brazilian E-Commerce Dataset (Olist)/
│
├── Dataset/
│   ├── olist_customers_dataset.csv
│   ├── olist_geolocation_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_order_payments_dataset.csv
│   ├── olist_order_reviews_dataset.csv
│   ├── olist_orders_dataset.csv
│   ├── olist_products_dataset.csv
│   ├── olist_sellers_dataset.csv
│   └── product_category_name_translation.csv
│
├── images_and_videos/
│   ├── bandicam 2026-07-23 12-38-36-562.mp4
│   └── bandicam 2026-07-23 12-41-56-802.jpg
│
├── powerbi/
│   └── olist_dashboard.pbix
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql
│   ├── 03_import_verification.sql
│   ├── 04_data_understanding.sql
│   ├── 05_data_quality_audit.sql
│   ├── 06_data_cleaning.sql
│   ├── 07_primary_foreign_keys.sql
│   ├── 08_exploratory_data_analysis.sql
│   ├── 09_customer_analysis.sql
│   ├── 10_sales_analysis.sql
│   ├── 11_product_analysis.sql
│   ├── 12_delivery_analysis.sql
│   ├── 13_payment_analysis.sql
│   ├── 14_review_analysis.sql
│   └── 15_powerbi_queries.sql
│
├── .gitignore
│
└── README.md