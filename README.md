# 🛒 AI-Powered E-Commerce Sales & Customer Analytics

## 📌 Project Overview

The **AI-Powered E-Commerce Sales & Customer Analytics** project analyzes e-commerce sales and customer data to identify important business trends, customer purchasing behavior, product performance, sales patterns, and inventory-related insights.

The project works with **1,200+ e-commerce records across 6 datasets** and uses **MySQL** for relational data analysis and business intelligence. ChatGPT was also used as a supporting tool for SQL query development, troubleshooting, and analytical exploration.

---

## 🎯 Project Objectives

* Analyze overall e-commerce sales performance
* Understand customer purchasing behavior
* Identify high-performing and low-performing products
* Analyze order and sales trends
* Study customer retention patterns
* Identify purchasing patterns
* Generate insights useful for inventory planning
* Create SQL-based business reports and analytical findings

---

## 📊 Dataset

The project contains **1,200+ e-commerce records distributed across 6 datasets**.

The datasets were cleaned, transformed, and analyzed using relational SQL techniques.

### Key Analysis Areas

* Customer Information
* Orders
* Products
* Sales
* Customer Purchasing Behavior
* Product Performance
* Order Trends
* Inventory Planning

---

## 🛠️ Technologies Used

| Technology           | Purpose                               |
| -------------------- | ------------------------------------- |
| **MySQL**            | Data analysis and SQL querying        |
| **SQL**              | Business analysis and data extraction |
| **ChatGPT**          | SQL assistance and analytical support |
| **Git & GitHub**     | Project version control               |
| **Jupyter Notebook** | Data analysis environment             |

---

## 🔄 Project Workflow

```text
Raw E-Commerce Data
        ↓
Data Cleaning
        ↓
Data Transformation
        ↓
Relational Data Analysis
        ↓
MySQL Database
        ↓
SQL Queries
        ↓
Business Analysis
        ↓
Insights & Recommendations
```

---

## 🧹 Data Preparation

The datasets were prepared before analysis by performing:

* Data cleaning
* Data transformation
* Data validation
* Handling inconsistent records
* Relational data analysis
* Preparing datasets for SQL-based analysis

---

## 🧠 SQL Analysis

More than **25 MySQL queries** were developed to perform business and customer analytics.

### SQL Concepts Used

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `JOIN`
* `INNER JOIN`
* `LEFT JOIN`
* `CTE`
* Subqueries
* Aggregate Functions
* `CASE` Statements
* Window Functions

### Example Analysis Questions

```sql
-- Example: Calculate total sales by product

SELECT 
    product_id,
    SUM(sales_amount) AS total_sales
FROM orders
GROUP BY product_id
ORDER BY total_sales DESC;
```

```sql
-- Example: Analyze customer purchase frequency

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;
```

---

## 📈 Business Analysis

The project generated **15+ business findings** covering:

### 👥 Customer Analytics

* Customer purchasing behavior
* Customer retention patterns
* Purchase frequency
* Customer activity

### 🛍️ Product Analytics

* Product performance
* Best-performing products
* Product purchasing patterns
* Product-level sales trends

### 💰 Sales Analytics

* Overall sales trends
* Order trends
* Revenue patterns
* Sales performance

### 📦 Inventory Planning

* Identification of product demand patterns
* Analysis of product performance
* Insights that can support inventory planning

---

## 🤖 AI-Assisted Analysis

ChatGPT was used as a **supporting analytical tool** during the project.

It helped with:

* SQL query development
* SQL troubleshooting
* Query improvement
* Exploring analytical approaches
* Supporting business insight generation

The final analysis and interpretation were based on the project's datasets and SQL results.

---

## 🔍 Key Outcomes

The project successfully:

* Analyzed **1,200+ e-commerce records**
* Worked across **6 datasets**
* Developed **25+ MySQL queries**
* Applied advanced SQL techniques
* Generated **15+ business findings**
* Analyzed customer and product behavior
* Identified sales and purchasing trends
* Produced insights relevant to inventory planning

---

## 📁 Suggested Project Structure

```text
AI-Powered-Ecommerce-Analytics/
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── ...
│
├── sql/
│   ├── data_cleaning.sql
│   ├── sales_analysis.sql
│   ├── customer_analysis.sql
│   └── product_analysis.sql
│
├── notebooks/
│   └── ecommerce_analysis.ipynb
│
├── reports/
│   └── business_insights.pdf
│
├── screenshots/
│   └── sql_results.png
│
└── README.md
```

---

## 🚀 How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/AI-Powered-Ecommerce-Analytics.git
```

### 2. Open MySQL

Create the project database:

```sql
CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
```

### 3. Import the Datasets

Import the project CSV files into the appropriate MySQL tables.

### 4. Run SQL Scripts

Execute the SQL files from the `/sql` folder.

```text
sql/
├── data_cleaning.sql
├── sales_analysis.sql
├── customer_analysis.sql
└── product_analysis.sql
```

### 5. Analyze the Results

Review the query outputs to identify:

* Sales trends
* Customer behavior
* Product performance
* Purchasing patterns
* Inventory-related insights

---

## 📌 Skills Demonstrated

This project demonstrates practical experience in:

**SQL • MySQL • Data Cleaning • Data Transformation • ETL • EDA • Relational Data Analysis • Customer Analytics • Sales Analytics • Product Analytics • Business Analysis • KPI Analysis • AI-Assisted Data Analysis • GitHub**


## ⭐ Project Highlights

> **1,200+ Records | 6 Datasets | 25+ SQL Queries | 15+ Business Findings**

This project demonstrates how SQL-based data analysis and AI-assisted analytical techniques can be used to transform raw e-commerce data into meaningful business insights.
