-- Project Title: E-Commerce Customer Churn Analysis
-- Data cleaning and Data Transformation
use ecomm;
-- Data Cleaning : Handling Missing Values and Outliers:
-- checking missing value count
SELECT
	COUNT(*) AS Total_Rows,
    SUM(WarehouseToHome IS NULL) AS WarehouseToHome_Missing,
    SUM(HourSpendOnApp IS NULL) AS HourSpendOnApp_Missing,
    SUM(OrderAmountHikeFromlastYear IS NULL) AS OrderAmountHike_Missing,
    SUM(DaySinceLastOrder IS NULL) AS DaySinceLastOrder_Missing,
    SUM(Tenure IS NULL) AS Tenure_Missing,
    SUM(CouponUsed IS NULL) AS CouponUsed_Missing,
    SUM(OrderCount IS NULL) AS OrderCount_Missing
FROM customer_churn;
-- checking outlier
-- ➢ Handle outliers in the 'WarehouseToHome' column by deleting rows where the values are greater than 100.
SELECT CustomerID, WarehouseToHome FROM customer_churn
	WHERE WarehouseToHome > 100;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM customer_churn 
	WHERE WarehouseToHome > 100;
    
-- ➢ Impute mean for the following columns, and round off to the nearest integer if required: WarehouseToHome, HourSpendOnApp, OrderAmountHikeFromlastYear,DaySinceLastOrder.
-- WarehouseToHome
SELECT ROUND(AVG(WarehouseToHome)) AS mean_warehouse_to_home FROM customer_churn -- mean 16
	WHERE WarehouseToHome IS NOT NULL;
UPDATE customer_churn SET WarehouseToHome = 16
	WHERE WarehouseToHome IS NULL;
SELECT COUNT(*) AS remaining_missing FROM customer_churn WHERE WarehouseToHome IS NULL; 
-- HourSpendOnApp
SELECT ROUND(AVG(HourSpendOnApp)) AS mean_hours_spent FROM customer_churn -- mean 3
	WHERE HourSpendOnApp IS NOT NULL;
UPDATE customer_churn SET HourSpendOnApp = 3
	WHERE HourSpendOnApp IS NULL;
SELECT COUNT(*) AS remaining_missing FROM customer_churn WHERE HourSpendOnApp IS NULL;
-- OrderAmountHikeFromlastYear 
SELECT ROUND(AVG(OrderAmountHikeFromlastYear)) AS mean_order_hike FROM customer_churn -- mean 16
	WHERE OrderAmountHikeFromlastYear IS NOT NULL;
UPDATE customer_churn SET OrderAmountHikeFromlastYear = 16
	WHERE OrderAmountHikeFromlastYear IS NULL;
SELECT COUNT(*) AS remaining_missing FROM customer_churn WHERE OrderAmountHikeFromlastYear IS NULL;
-- DaySinceLastOrder
SELECT ROUND(AVG(DaySinceLastOrder)) AS mean_days_since_last_order FROM customer_churn -- mean 5
	WHERE DaySinceLastOrder IS NOT NULL;
UPDATE customer_churn SET DaySinceLastOrder = 5
	WHERE DaySinceLastOrder IS NULL;
SELECT COUNT(*) AS remaining_missing FROM customer_churn WHERE DaySinceLastOrder IS NULL;

-- ➢ Impute mode for the following columns: Tenure, CouponUsed, OrderCount.
-- Tenure
SELECT Tenure, COUNT(*) AS frequency FROM customer_churn
	WHERE Tenure IS NOT NULL GROUP BY Tenure ORDER BY frequency DESC; -- 1 690
UPDATE customer_churn SET Tenure = 1
	WHERE Tenure IS NULL;    -- replaced null with 1
-- CouponUsed
SELECT CouponUsed, COUNT(*) AS frequency FROM customer_churn
	WHERE CouponUsed IS NOT NULL GROUP BY CouponUsed ORDER BY frequency DESC LIMIT 1; -- 1 2104
UPDATE customer_churn SET CouponUsed = 1
	WHERE CouponUsed IS NULL;
-- OrderCount
SELECT OrderCount, COUNT(*) AS frequency FROM customer_churn
	WHERE OrderCount IS NOT NULL GROUP BY OrderCount ORDER BY frequency DESC LIMIT 1; -- 2 2024
UPDATE customer_churn SET OrderCount = 2
	WHERE OrderCount IS NULL;
-- Dealing with Inconsistencies:
-- ➢ Replace occurrences of “Phone” in the 'PreferredLoginDevice' column and “Mobile” in the 'PreferedOrderCat' column with “Mobile Phone” 
UPDATE customer_churn SET PreferredLoginDevice = "Mobile Phone" 
	WHERE PreferredLoginDevice = "Phone";
UPDATE customer_churn SET PreferedOrderCat = "Mobile Phone" 
	WHERE PreferedOrderCat = "Mobile";
-- ➢ Standardize payment mode values: Replace "COD" with "Cash on Delivery" and "CC" with "Credit Card" in the PreferredPaymentMode column.
UPDATE customer_churn SET PreferredPaymentMode = "Cash on Delivery"
	WHERE PreferredPaymentMode = "COD";
UPDATE customer_churn SET PreferredPaymentMode = "Credit Card"
	WHERE PreferredPaymentMode = "CC";

-- Data Transformation:
-- Column Renaming:
-- Rename the column "PreferedOrderCat" to "PreferredOrderCat".
ALTER TABLE customer_churn RENAME COLUMN PreferedOrderCat TO preferredOrderCat;
-- Rename the column "HourSpendOnApp" to "HoursSpentOnApp".
ALTER TABLE customer_churn RENAME COLUMN HourSpendOnApp TO HoursSpentOnApp;

-- Creating New Columns:
-- ➢ Create a new column named ‘ComplaintReceived’ with values "Yes" if the corresponding value in the ‘Complain’ is 1, and "No" otherwise.
ALTER TABLE customer_churn ADD COLUMN ComplaintReceived VARCHAR(20);
UPDATE customer_churn set ComplaintReceived = 
	CASE 
		WHEN Complain = 1 THEN 'YES'
		ELSE 'NO' 
	END;
-- ➢ Create a new column named 'ChurnStatus'. Set its value to “Churned” if the corresponding value in the 'Churn' column is 1, else assign “Active”.
ALTER TABLE customer_churn ADD COLUMN ChurnStatus VARCHAR(20);
UPDATE customer_churn SET ChurnStatus =
	CASE 
		WHEN Churn = 1 then "Churned"
        ELSE "Active"
	END;

-- Column Dropping:
-- ➢ Drop the columns "Churn" and "Complain" from the table.
ALTER TABLE Customer_churn DROP COLUMN Churn,DROP COLUMN Complain; 










