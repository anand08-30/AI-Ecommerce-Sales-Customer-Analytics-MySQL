/*
===============================================================
PROJECT: AI-Powered E-Commerce Sales & Customer Analytics
DATABASE: MySQL
AUTHOR: Anand Kumar Mishra
PURPOSE: Data Analyst Portfolio Project

IMPORTANT:
1. Update the CSV file paths in the LOAD DATA commands.
2. If MySQL Workbench import wizard is used, skip the LOAD DATA
   commands and import each CSV into the matching table.
3. Execute this file section by section.
===============================================================
*/


/* ============================================================
   01. DATABASE CREATION
============================================================ */



CREATE DATABASE ecommerce_ai_analytics;

USE ecommerce_ai_analytics;

/* ============================================================
   02. TABLE CREATION
============================================================ */

CREATE TABLE users (
    user_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(150),
    gender VARCHAR(20),
    city VARCHAR(100),
    signup_date DATE
);

CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10,2),
    rating DECIMAL(3,2)
);

CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    user_id VARCHAR(20),
    order_date DATETIME,
    order_status VARCHAR(30),
    total_amount DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    user_id VARCHAR(20),
    quantity INT,
    item_price DECIMAL(10,2),
    item_total DECIMAL(10,2)
);

CREATE TABLE events (
    event_id VARCHAR(20) PRIMARY KEY,
    user_id VARCHAR(20),
    product_id VARCHAR(20),
    event_type VARCHAR(30),
    event_timestamp DATETIME
);

CREATE TABLE reviews (
    review_id VARCHAR(20) PRIMARY KEY,
    order_id VARCHAR(20),
    product_id VARCHAR(20),
    user_id VARCHAR(20),
    rating INT,
    review_text TEXT,
    review_date DATETIME
);


/* ============================================================
   03. VERIFY TABLES
============================================================ */

SHOW TABLES;

DESCRIBE users;
DESCRIBE products;
DESCRIBE orders;
DESCRIBE order_items;
DESCRIBE events;
DESCRIBE reviews;




/* ============================================================
   04. CSV IMPORT
   OPTION A: Use MySQL Workbench Table Data Import Wizard.
   OPTION B: Use LOAD DATA LOCAL INFILE.

   Update the paths according to your computer.
   The CSV files must have a header row.
============================================================ */

/*
-- USERS
LOAD DATA LOCAL INFILE 'C:/YOUR_PATH/users(2).csv'
INTO TABLE users
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(user_id, name, email, gender, city, signup_date);

-- PRODUCTS
LOAD DATA LOCAL INFILE 'C:/YOUR_PATH/products(3).csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, category, brand, price, rating);

-- ORDERS
LOAD DATA LOCAL INFILE 'C:/YOUR_PATH/orders(2).csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, user_id, order_date, order_status, total_amount);

-- ORDER ITEMS
LOAD DATA LOCAL INFILE 'C:/YOUR_PATH/order_items(2).csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_item_id, order_id, product_id, user_id, quantity, item_price, item_total);

-- EVENTS
LOAD DATA LOCAL INFILE 'C:/YOUR_PATH/events(1).csv'
INTO TABLE events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(event_id, user_id, product_id, event_type, event_timestamp);

-- REVIEWS
LOAD DATA LOCAL INFILE 'C:/YOUR_PATH/reviews(2).csv'
INTO TABLE reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(review_id, order_id, product_id, user_id, rating, review_text, review_date);
*/


/* ============================================================
   05. BASIC DATA VERIFICATION
============================================================ */

SELECT 'users' AS table_name, COUNT(*) AS total_rows FROM users
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'events', COUNT(*) FROM events
UNION ALL
SELECT 'reviews', COUNT(*) FROM reviews;

SELECT * FROM users LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_items LIMIT 10;
SELECT * FROM events LIMIT 10;
SELECT * FROM reviews LIMIT 10;



/* ============================================================
   06. DATA QUALITY AND VALIDATION
============================================================ */

-- Missing values in users
SELECT
    SUM(user_id IS NULL) AS missing_user_id,
    SUM(name IS NULL) AS missing_name,
    SUM(email IS NULL) AS missing_email,
    SUM(gender IS NULL) AS missing_gender,
    SUM(city IS NULL) AS missing_city,
    SUM(signup_date IS NULL) AS missing_signup_date
FROM users;

-- Missing values in products
SELECT
    SUM(product_id IS NULL) AS missing_product_id,
    SUM(product_name IS NULL) AS missing_product_name,
    SUM(category IS NULL) AS missing_category,
    SUM(brand IS NULL) AS missing_brand,
    SUM(price IS NULL) AS missing_price,
    SUM(rating IS NULL) AS missing_rating
FROM products;

-- Missing values in orders
SELECT
    SUM(order_id IS NULL) AS missing_order_id,
    SUM(user_id IS NULL) AS missing_user_id,
    SUM(order_date IS NULL) AS missing_order_date,
    SUM(order_status IS NULL) AS missing_order_status,
    SUM(total_amount IS NULL) AS missing_total_amount
FROM orders;

-- Duplicate users
SELECT
    user_id,
    COUNT(*) AS duplicate_count
FROM users
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Duplicate products
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Duplicate orders
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Duplicate order items
SELECT
    order_item_id,
    COUNT(*) AS duplicate_count
FROM order_items
GROUP BY order_item_id
HAVING COUNT(*) > 1;

-- Duplicate events
SELECT
    event_id,
    COUNT(*) AS duplicate_count
FROM events
GROUP BY event_id
HAVING COUNT(*) > 1;

-- Duplicate reviews
SELECT
    review_id,
    COUNT(*) AS duplicate_count
FROM reviews
GROUP BY review_id
HAVING COUNT(*) > 1;

-- Invalid product values
SELECT *
FROM products
WHERE price < 0
   OR rating < 0
   OR rating > 5;

-- Invalid order values
SELECT *
FROM orders
WHERE total_amount < 0;

-- Invalid order item values
SELECT *
FROM order_items
WHERE quantity <= 0
   OR item_price < 0
   OR item_total < 0;

-- Invalid review ratings
SELECT *
FROM reviews
WHERE rating < 1
   OR rating > 5;

-- Order status distribution
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;




/* ============================================================
   07. RELATIONSHIP VALIDATION
============================================================ */

-- Orders without matching users
SELECT o.*
FROM orders o
LEFT JOIN users u
    ON o.user_id = u.user_id
WHERE u.user_id IS NULL;

-- Order items without matching orders
SELECT oi.*
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Order items without matching products
SELECT oi.*
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Events without matching users
SELECT e.*
FROM events e
LEFT JOIN users u
    ON e.user_id = u.user_id
WHERE u.user_id IS NULL;

-- Events without matching products
SELECT e.*
FROM events e
LEFT JOIN products p
    ON e.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Reviews without matching products
SELECT r.*
FROM reviews r
LEFT JOIN products p
    ON r.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Compare order total with order-item total
SELECT
    o.order_id,
    o.total_amount AS order_total,
    ROUND(SUM(oi.item_total), 2) AS calculated_item_total,
    ROUND(o.total_amount - SUM(oi.item_total), 2) AS difference
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    o.order_id,
    o.total_amount
ORDER BY ABS(o.total_amount - SUM(oi.item_total)) DESC;


/* ============================================================
   08. SALES AND REVENUE ANALYSIS
============================================================ */

-- Total recorded order value
SELECT
    ROUND(SUM(total_amount), 2) AS total_order_value
FROM orders;

-- Total orders
SELECT
    COUNT(*) AS total_orders
FROM orders;

-- Average order value
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;

-- Minimum and maximum order value
SELECT
    ROUND(MIN(total_amount), 2) AS minimum_order_value,
    ROUND(MAX(total_amount), 2) AS maximum_order_value
FROM orders;

-- Sales by order status
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_order_value,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
GROUP BY order_status
ORDER BY total_order_value DESC;

-- Completed orders
SELECT
    COUNT(*) AS completed_orders,
    ROUND(SUM(total_amount), 2) AS completed_order_value,
    ROUND(AVG(total_amount), 2) AS average_completed_order_value
FROM orders
WHERE order_status = 'completed';

-- Monthly order trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_order_value,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

-- Daily order trend
SELECT
    DATE(order_date) AS order_day,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_order_value
FROM orders
GROUP BY DATE(order_date)
ORDER BY order_day;

-- Orders by year
SELECT
    YEAR(order_date) AS order_year,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_order_value
FROM orders
GROUP BY YEAR(order_date)
ORDER BY order_year;

-- Orders by month number
SELECT
    MONTH(order_date) AS month_number,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_order_value
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month_number;

-- Cancelled and returned order value
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_order_value
FROM orders
WHERE order_status IN ('cancelled', 'returned')
GROUP BY order_status;


/* ============================================================
   09. CUSTOMER ANALYSIS
============================================================ */

-- Total customers
SELECT
    COUNT(DISTINCT user_id) AS total_customers
FROM users;

-- Customers with orders
SELECT
    COUNT(DISTINCT user_id) AS customers_with_orders
FROM orders;

-- Customer order frequency
SELECT
    user_id,
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_spent,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
GROUP BY user_id
ORDER BY total_spent DESC;

-- Top 10 customers by order value
SELECT
    u.user_id,
    u.name,
    u.city,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_spent
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY
    u.user_id,
    u.name,
    u.city
ORDER BY total_spent DESC
LIMIT 10;

-- Repeat customers
SELECT
    user_id,
    COUNT(*) AS order_count
FROM orders
GROUP BY user_id
HAVING COUNT(*) >= 2
ORDER BY order_count DESC;

-- Customer spending by city
SELECT
    u.city,
    COUNT(DISTINCT u.user_id) AS unique_customers,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_order_value
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.city
ORDER BY total_order_value DESC;

-- Customer spending by gender
SELECT
    u.gender,
    COUNT(DISTINCT u.user_id) AS unique_customers,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_order_value
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY u.gender
ORDER BY total_order_value DESC;

-- Customers with no orders
SELECT
    u.user_id,
    u.name,
    u.city
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

-- Customers with more than one order
SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
GROUP BY
    u.user_id,
    u.name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;


/* ============================================================
   10. PRODUCT AND CATEGORY ANALYSIS
============================================================ */

-- Product catalog summary by category
SELECT
    category,
    COUNT(*) AS total_products,
    ROUND(AVG(price), 2) AS average_price,
    ROUND(AVG(rating), 2) AS average_product_rating
FROM products
GROUP BY category
ORDER BY total_products DESC;

-- Product catalog summary by brand
SELECT
    brand,
    COUNT(*) AS total_products,
    ROUND(AVG(price), 2) AS average_price,
    ROUND(AVG(rating), 2) AS average_rating
FROM products
GROUP BY brand
ORDER BY total_products DESC;

-- Top 10 products by quantity sold
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Top 10 products by recorded item sales
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    ROUND(SUM(oi.item_total), 2) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY total_sales DESC
LIMIT 10;

-- Category-level item sales
SELECT
    p.category,
    SUM(oi.quantity) AS total_quantity_sold,
    ROUND(SUM(oi.item_total), 2) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- Brand-level item sales
SELECT
    p.brand,
    SUM(oi.quantity) AS total_quantity_sold,
    ROUND(SUM(oi.item_total), 2) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.brand
ORDER BY total_sales DESC;

-- Products with no order-item records
SELECT
    p.product_id,
    p.product_name,
    p.category
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- Highest-rated products
SELECT
    product_id,
    product_name,
    category,
    rating
FROM products
ORDER BY rating DESC
LIMIT 10;

-- Lowest-rated products
SELECT
    product_id,
    product_name,
    category,
    rating
FROM products
ORDER BY rating ASC
LIMIT 10;


/* ============================================================
   11. CUSTOMER BEHAVIOR AND EVENT ANALYSIS
============================================================ */

-- Event distribution
SELECT
    event_type,
    COUNT(*) AS total_events
FROM events
GROUP BY event_type
ORDER BY total_events DESC;

-- Unique users by event type
SELECT
    event_type,
    COUNT(DISTINCT user_id) AS unique_users
FROM events
GROUP BY event_type
ORDER BY unique_users DESC;

-- Event distribution by product
SELECT
    product_id,
    event_type,
    COUNT(*) AS total_events
FROM events
GROUP BY
    product_id,
    event_type
ORDER BY product_id, total_events DESC;

-- Most viewed products
SELECT
    product_id,
    COUNT(*) AS view_count
FROM events
WHERE event_type = 'view'
GROUP BY product_id
ORDER BY view_count DESC
LIMIT 10;

-- Most added-to-cart products
SELECT
    product_id,
    COUNT(*) AS cart_count
FROM events
WHERE event_type = 'cart'
GROUP BY product_id
ORDER BY cart_count DESC
LIMIT 10;

-- Purchase events by product
SELECT
    product_id,
    COUNT(*) AS purchase_events
FROM events
WHERE event_type = 'purchase'
GROUP BY product_id
ORDER BY purchase_events DESC;

-- User event activity
SELECT
    user_id,
    COUNT(*) AS total_events,
    COUNT(DISTINCT event_type) AS different_event_types
FROM events
GROUP BY user_id
ORDER BY total_events DESC;

-- Events by date
SELECT
    DATE(event_timestamp) AS event_date,
    event_type,
    COUNT(*) AS total_events
FROM events
GROUP BY
    DATE(event_timestamp),
    event_type
ORDER BY event_date, event_type;


/* ============================================================
   12. REVIEW AND CUSTOMER FEEDBACK ANALYSIS
============================================================ */

-- Review count
SELECT
    COUNT(*) AS total_reviews
FROM reviews;

-- Review rating distribution
SELECT
    rating,
    COUNT(*) AS total_reviews
FROM reviews
GROUP BY rating
ORDER BY rating DESC;

-- Average review rating
SELECT
    ROUND(AVG(rating), 2) AS average_review_rating
FROM reviews;

-- Review count and average rating by product
SELECT
    product_id,
    COUNT(*) AS total_reviews,
    ROUND(AVG(rating), 2) AS average_rating
FROM reviews
GROUP BY product_id
ORDER BY average_rating DESC;

-- Review analysis by category
SELECT
    p.category,
    COUNT(r.review_id) AS total_reviews,
    ROUND(AVG(r.rating), 2) AS average_rating
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.category
ORDER BY average_rating DESC;

-- Low-rated reviews
SELECT
    review_id,
    product_id,
    user_id,
    rating,
    review_text
FROM reviews
WHERE rating <= 2
ORDER BY rating ASC;

-- High-rated reviews
SELECT
    review_id,
    product_id,
    user_id,
    rating,
    review_text
FROM reviews
WHERE rating >= 4
ORDER BY rating DESC;

-- Reviews by month
SELECT
    DATE_FORMAT(review_date, '%Y-%m') AS review_month,
    COUNT(*) AS total_reviews,
    ROUND(AVG(rating), 2) AS average_rating
FROM reviews
GROUP BY DATE_FORMAT(review_date, '%Y-%m')
ORDER BY review_month;


/* ============================================================
   13. ADVANCED SQL: CTE ANALYSIS
============================================================ */

-- Customers with spending above average customer spending
WITH customer_sales AS (
    SELECT
        user_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY user_id
)
SELECT
    user_id,
    ROUND(total_spent, 2) AS total_spent
FROM customer_sales
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_sales
)
ORDER BY total_spent DESC;

-- Monthly sales using CTE
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        SUM(total_amount) AS monthly_total
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    order_month,
    ROUND(monthly_total, 2) AS monthly_total
FROM monthly_sales
ORDER BY order_month;

-- Category sales using CTE
WITH category_sales AS (
    SELECT
        p.category,
        SUM(oi.item_total) AS total_sales
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.category
)
SELECT
    category,
    ROUND(total_sales, 2) AS total_sales
FROM category_sales
ORDER BY total_sales DESC;


/* ============================================================
   14. ADVANCED SQL: WINDOW FUNCTIONS
============================================================ */

-- Rank products by total sales
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(oi.item_total) AS total_sales
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
)
SELECT
    product_id,
    product_name,
    category,
    ROUND(total_sales, 2) AS total_sales,
    DENSE_RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM product_sales
ORDER BY sales_rank;

-- Rank products within each category
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(oi.item_total) AS total_sales
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
)
SELECT
    product_id,
    product_name,
    category,
    ROUND(total_sales, 2) AS total_sales,
    DENSE_RANK() OVER (
        PARTITION BY category
        ORDER BY total_sales DESC
    ) AS category_rank
FROM product_sales
ORDER BY category, category_rank;

-- Running monthly order value
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        SUM(total_amount) AS monthly_total
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    order_month,
    ROUND(monthly_total, 2) AS monthly_total,
    ROUND(
        SUM(monthly_total) OVER (
            ORDER BY order_month
        ), 2
    ) AS running_total
FROM monthly_sales
ORDER BY order_month;


/* ============================================================
   15. ADVANCED SQL: CASE STATEMENTS
============================================================ */

-- Customer segmentation by recorded order value
SELECT
    user_id,
    ROUND(SUM(total_amount), 2) AS total_spent,
    CASE
        WHEN SUM(total_amount) >= 2000 THEN 'High Value'
        WHEN SUM(total_amount) >= 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM orders
GROUP BY user_id
ORDER BY total_spent DESC;

-- Order value segmentation
SELECT
    order_id,
    ROUND(total_amount, 2) AS total_amount,
    CASE
        WHEN total_amount >= 2000 THEN 'High Value Order'
        WHEN total_amount >= 1000 THEN 'Medium Value Order'
        ELSE 'Low Value Order'
    END AS order_segment
FROM orders
ORDER BY total_amount DESC;

-- Review sentiment proxy based on rating
SELECT
    review_id,
    rating,
    CASE
        WHEN rating >= 4 THEN 'Positive Rating'
        WHEN rating = 3 THEN 'Neutral Rating'
        ELSE 'Negative Rating'
    END AS rating_category
FROM reviews
ORDER BY rating DESC;


/* ============================================================
   16. BUSINESS KPI SUMMARY
============================================================ */

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT user_id) AS unique_ordering_customers,
    ROUND(SUM(total_amount), 2) AS total_recorded_order_value,
    ROUND(AVG(total_amount), 2) AS average_order_value,
    ROUND(MIN(total_amount), 2) AS minimum_order_value,
    ROUND(MAX(total_amount), 2) AS maximum_order_value
FROM orders;

SELECT
    COUNT(*) AS completed_orders,
    ROUND(SUM(total_amount), 2) AS completed_order_value,
    ROUND(
        100.0 * SUM(order_status = 'completed') / COUNT(*),
        2
    ) AS completed_order_percentage
FROM orders;

SELECT
    COUNT(*) AS total_events,
    COUNT(DISTINCT user_id) AS active_event_users,
    COUNT(DISTINCT product_id) AS products_with_events
FROM events;

SELECT
    COUNT(*) AS total_reviews,
    ROUND(AVG(rating), 2) AS average_review_rating,
    SUM(rating <= 2) AS low_rating_reviews,
    SUM(rating >= 4) AS high_rating_reviews
FROM reviews;


/* ============================================================
   17. OPTIONAL FOREIGN KEY CONSTRAINTS
   Run only after relationship validation is complete.
============================================================ */

/*
ALTER TABLE orders
ADD CONSTRAINT fk_orders_users
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_items_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_items_products
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE events
ADD CONSTRAINT fk_events_users
FOREIGN KEY (user_id) REFERENCES users(user_id);

ALTER TABLE events
ADD CONSTRAINT fk_events_products
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_products
FOREIGN KEY (product_id) REFERENCES products(product_id);
*/


/* ============================================================
   18. PROJECT NOTES
============================================================ */

/*
Suggested resume skills:
- MySQL
- SQL Joins
- Data Cleaning and Validation
- Aggregation and Grouping
- CTEs
- Window Functions
- Customer Analytics
- Sales Analytics
- Product Analytics
- AI-Assisted SQL Development

AI workflow:
1. Ask ChatGPT to draft or explain a SQL query.
2. Validate table names, columns, joins, and filters.
3. Execute the query in MySQL.
4. Check the output for accuracy.
5. Document the actual findings in README.md.

Do not claim that AI created a predictive model unless you actually
build and evaluate one.
*/
