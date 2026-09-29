# E-Commerce Customer Churn Analysis

## Project Overview

This project analyzes customer churn in an e-commerce dataset using **MySQL and SQL**. It follows a structured data analysis workflow covering database creation, data cleaning, data transformation, exploratory analysis, and relational analysis.

The analysis examines customer behavior and churn patterns across **tenure, payment methods, order categories, coupon usage, satisfaction scores, cashback, order behavior, and warehouse distance**.

## Objectives

* Prepare and clean the customer churn dataset
* Handle missing values using appropriate imputation techniques
* Identify and remove outliers
* Standardize inconsistent categorical values
* Transform raw data into analysis-ready fields
* Compare churned and active customers
* Analyze customer behavior across different segments
* Apply SQL aggregation, subqueries, `CASE`, `HAVING`, and `JOIN` operations
* Demonstrate relational database concepts using customer return data

## Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Data Analysis:** Exploratory Data Analysis
* **SQL Concepts:** Aggregations, Grouping, Subqueries, CASE Statements, JOINs, Primary Keys, Foreign Keys

## Project Files

### `customer_churn_db.sql`

Contains the initial database and customer churn table setup, including table creation and insertion of the original dataset.

### `Customerchurn_Datacleaning.sql`

Contains SQL queries for:

* Missing-value analysis
* Mean and mode imputation
* Outlier identification and removal
* Standardization of categorical values
* Column renaming
* Data preparation and transformation

### `Customer_churn_analysis.sql`

Contains SQL queries for:

* Churned vs. active customer analysis
* Customer segmentation
* Payment method analysis
* Order category analysis
* Coupon and cashback analysis
* Satisfaction and complaint analysis
* Distance-based churn analysis
* Subquery-based analysis
* Customer return analysis using relational joins

## Data Cleaning & Transformation

The dataset was prepared through the following steps:

* Imputed missing numerical values using mean values
* Imputed selected fields using mode values
* Removed records where `WarehouseToHome > 100`
* Standardized inconsistent payment, login device, and order category values
* Renamed columns for improved readability
* Created `ComplaintReceived` to represent complaint status
* Created `ChurnStatus` to distinguish churned and active customers
* Created distance categories based on `WarehouseToHome`

### Distance Categories

| Warehouse Distance | Category   |
| ------------------ | ---------- |
| ≤ 5                | Very Close |
| 6–10               | Close      |
| 11–15              | Moderate   |
| > 15               | Far        |

## Analysis Performed

The project includes analysis of:

1. Churned and active customer counts
2. Average tenure and total cashback of churned customers
3. Percentage of churned customers who submitted complaints
4. Churn patterns by city tier and preferred order category
5. Most preferred payment method among active customers
6. Order amount increase among selected customer segments
7. Average registered devices among UPI users
8. Customer distribution by city tier
9. Coupon usage by gender
10. Customer count and maximum app usage by order category
11. Order volume among highly satisfied credit-card customers
12. Average satisfaction score among customers who complained
13. Preferred order categories among customers using more than five coupons
14. Top three categories by average cashback
15. Payment modes based on average tenure and order volume
16. Churn distribution across warehouse-distance categories
17. Married Tier-1 customers with above-average order counts
18. Customer return analysis for churned and complaining customers

## Customer Returns Analysis

A separate `Customer_returns` table was created within the analysis workflow to demonstrate relational database concepts.

The table contains:

* `ReturnID`
* `CustomerID`
* `ReturnDate`
* `RefundAmount`

A **foreign key** connects `Customer_returns.CustomerID` with `Customer_Churn.CustomerID`.

An `INNER JOIN` is used to retrieve return details for customers who are both **churned and have submitted complaints**.

## SQL Concepts Demonstrated

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `LIMIT`
* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `CASE`
* `HAVING`
* Subqueries
* `INNER JOIN`
* Primary Keys
* Foreign Keys
* `ALTER TABLE`
* `UPDATE`
* `DELETE`

## Key Learning Outcomes

This project provided practical experience in:

* Cleaning and preparing datasets using SQL
* Applying aggregate functions for business analysis
* Using `GROUP BY` and `HAVING` for segment-level analysis
* Writing subqueries for comparative analysis
* Creating derived categories using `CASE`
* Working with relational tables using primary and foreign keys
* Performing multi-table analysis using `JOIN`
* Translating business questions into SQL queries

## Author

**Aneena K M**



