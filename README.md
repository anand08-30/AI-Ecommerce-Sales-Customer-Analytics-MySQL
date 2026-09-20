# AI-Powered E-Commerce Sales & Customer Analytics Using MySQL

## 📌 Project Overview

The **AI-Powered E-Commerce Sales & Customer Analytics** project is a MySQL-based data analytics project designed to analyze e-commerce sales performance, customer behavior, product performance, and business KPIs.

This project uses SQL queries and AI-assisted SQL development to perform data validation, data analysis, and generate meaningful business insights. It demonstrates practical skills in MySQL, data cleaning, joins, CTEs, window functions, and business analytics.

## 🎯 Project Objectives

* Analyze e-commerce sales and revenue performance.
* Understand customer purchasing behavior.
* Identify top-performing products and categories.
* Analyze customer engagement using event data.
* Evaluate customer reviews and ratings.
* Perform data quality and relationship validation.
* Calculate important business KPIs using SQL.
* Use AI-assisted SQL development for query creation and explanation.

## 🛠️ Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **AI Tool:** ChatGPT for SQL assistance and query explanation
* **Analysis Techniques:** Data Cleaning, Data Validation, Joins, CTEs, Window Functions, CASE Statements
* **Documentation:** Markdown and GitHub

## 📂 Database Tables

The project includes the following tables:

| Table Name    | Description                                                                     |
| ------------- | ------------------------------------------------------------------------------- |
| `users`       | Stores customer information such as name, email, gender, city, and signup date. |
| `products`    | Contains product details, categories, brands, prices, and ratings.              |
| `orders`      | Stores order information, order dates, statuses, and total amounts.             |
| `order_items` | Contains product-level order details, quantities, prices, and item totals.      |
| `events`      | Stores customer interaction events such as product views and other activities.  |
| `reviews`     | Contains customer ratings, review text, and review dates.                       |

## 🔍 Project Workflow

### 1. Database and Table Creation

* Created the `ecommerce_ai_analytics` database.
* Created tables for users, products, orders, order items, events, and reviews.
* Defined primary keys and appropriate data types.

### 2. Data Import and Validation

* Imported datasets into MySQL tables.
* Checked missing values and duplicate records.
* Validated invalid values and order statuses.
* Checked relationships between tables.
* Identified orphan records and differences between order totals and item totals.

### 3. Sales and Revenue Analysis

* Analyzed total sales and revenue.
* Examined order performance by date and status.
* Calculated sales-related business KPIs.
* Analyzed order values and product-level revenue.

### 4. Customer Analysis

* Analyzed customer purchasing activity.
* Identified customer spending patterns.
* Segmented customers using SQL `CASE` statements.
* Examined customer behavior and engagement.

### 5. Product and Category Analysis

* Analyzed product performance.
* Compared revenue across product categories.
* Identified top-performing products.
* Examined product ratings and sales-related metrics.

### 6. Advanced SQL Analysis

* Used SQL `JOIN` operations to combine multiple tables.
* Applied Common Table Expressions (CTEs).
* Used window functions for ranking and analytical calculations.
* Applied `CASE` statements for customer segmentation.
* Created queries for business KPI analysis.

## 🤖 AI-Assisted SQL Workflow

ChatGPT was used as an assistance tool during SQL development:

1. Asked ChatGPT to draft and explain SQL queries.
2. Validated table names, column names, joins, and filters.
3. Executed SQL queries in MySQL Workbench.
4. Checked query results for accuracy.
5. Documented the analysis and project workflow.

**Note:** AI was used to support SQL development and learning. Queries were validated and executed in MySQL.

## 📊 Key Skills Demonstrated

* MySQL Database Management
* SQL Data Analysis
* Data Cleaning and Validation
* SQL Joins
* Common Table Expressions (CTEs)
* Window Functions
* CASE Statements
* Customer Segmentation
* Sales and Revenue Analysis
* Business KPI Analysis
* AI-Assisted SQL Development

## 📁 Project Structure

```text
AI-Ecommerce-Sales-Customer-Analytics-MySQL/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── sql/
│   └── ecommerce_analytics_complete.sql
│
├── data/
│   └── README.md
│
├── results/
│   └── README.md
│
└── documentation/
    └── data_dictionary.md
```

## 🚀 How to Run This Project

1. Install MySQL Server and MySQL Workbench.
2. Create the project database.
3. Import the required datasets into the corresponding tables.
4. Open the SQL file in MySQL Workbench.
5. Execute the SQL queries section by section.
6. Review the output and validate the results.
7. Document relevant findings and business insights.

## 📌 Project Purpose

This project was developed as a **Data Analyst portfolio project** to demonstrate practical SQL skills, e-commerce analytics, data validation, and AI-assisted problem-solving using MySQL.

## 👨‍💻 Author

**Anand Kumar Mishra**

Aspiring Data Analyst | SQL | Python | Excel | Power BI

GitHub: [Add Your GitHub Profile Link](https://github.com/anand08-30)

---

⭐ If you find this project useful, feel free to explore the repository and provide feedback.

