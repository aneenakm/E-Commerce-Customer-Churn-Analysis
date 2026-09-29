# E-Commerce Customer Churn Analysis

## Project Overview

This project focuses on analyzing customer churn in an e-commerce dataset using **MySQL and SQL**. The project follows a structured data analysis workflow covering database creation, data cleaning, data transformation, exploratory analysis, and relational analysis.

The analysis explores customer behavior and churn patterns across factors such as **tenure, payment methods, order categories, coupon usage, satisfaction scores, cashback, order behavior, and distance from warehouse**.

## Objectives

* Prepare and clean the customer churn dataset for analysis
* Handle missing values using appropriate imputation techniques
* Identify and remove data outliers
* Standardize inconsistent categorical values
* Transform raw data into analysis-ready fields
* Compare churned and active customers
* Analyze customer behavior across different segments
* Apply SQL aggregation, subqueries, `CASE` statements, `HAVING`, and `JOIN` operations
* Demonstrate relational database concepts using customer return data

## Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Concepts:** Data Cleaning, Data Transformation, Exploratory Data Analysis
* **SQL Techniques:** Aggregations, Grouping, Subqueries, CASE Statements, JOINs, Primary Keys, Foreign Keys

## Project Files

### `Customer_churn_db`

Contains the database and initial customer churn table setup, including table creation and insertion of the original dataset.

### `CustomerChurn_DataCleaning`

Contains SQL queries used for:

* Missing-value analysis
* Mean and mode imputation
* Outlier identification and removal
* Standardization of categorical values
* Column renaming
* Data preparation

### `Customer_churn_Analysis`

Contains SQL queries for:

* Churned vs. active customer analysis
* Customer segmentation
* Payment method analysis
* Order category analysis
* Coupon and cashback analysis
* Satisfaction and complaint analysis
* Distance-based churn analysis
* Subquery-based analysis
* Customer returns analysis using relational joins

## Data Cleaning & Transformation

The dataset was prepared using the following steps:

* Imputed missing numerical values using mean values
* Imputed categorical/integer fields using mode values
* Removed records where `WarehouseToHome > 100`
* Standardized inconsistent values such as payment modes and device categories
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

A separate `Customer_returns` table was created to demonstrate relational database concepts.

The table includes:

* `ReturnID`
* `CustomerID`
* `ReturnDate`
* `RefundAmount`

A **foreign key** connects `Customer_returns.CustomerID` with `Customer_Churn.CustomerID`.

An `INNER JOIN` was then used to retrieve return information for customers who were both **churned and had submitted complaints**.

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
* Data Cleaning & Transformation

## Key Learning Outcomes

Through this project, I gained practical experience in:

* Cleaning and preparing real-world-style datasets using SQL
* Applying aggregate functions for business analysis
* Using `GROUP BY` and `HAVING` for segment-level analysis
* Writing subqueries for comparative analysis
* Creating derived analytical categories using `CASE`
* Working with relational tables using primary and foreign keys
* Performing multi-table analysis using `JOIN`
* Translating business questions into SQL queries

## Author

## **Aneena K M**

