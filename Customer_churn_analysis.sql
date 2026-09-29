-- Project Title: E-Commerce Customer Churn Analysis
-- Data Exploration and Analysis:
use ecomm;
-- 1. Retrieve the count of churned and active customers from the dataset.
SELECT ChurnStatus,COUNT(*) AS Count_Status 
	FROM Customer_churn GROUP BY ChurnStatus;
-- 2.Display the average tenure and total cashback amount of customers who churned.
SELECT AVG(Tenure) AS Average_Tenure, SUM(CashbackAmount) AS Total_Cashback from customer_churn 
	WHERE ChurnStatus="Churned";
-- 3.Determine the percentage of churned customers who complained.
SELECT SUM(ComplaintReceived = 'Yes') * 100 / COUNT(*) AS complaint_percentage FROM customer_churn
	WHERE ChurnStatus = 'Churned';
-- 4. Identify the city tier with the highest number of churned customers whose preferred order category is Laptop & Accessory.
SELECT CityTier, COUNT(*) As Customer_Count FROM Customer_churn 	
	WHERE ChurnStatus = 'Churned' AND preferredOrderCat = 'Laptop & Accessory' 	
	GROUP BY CityTier ORDER BY Customer_count DESC LIMIT 1;
-- 5. Identify the most preferred payment mode among active customers.
SELECT PreferredPaymentMode ,Count(*) AS payment_count From customer_churn 
	WHERE ChurnStatus="Active" 
	GROUP BY PreferredPaymentMode ORDER BY payment_count DESC LIMIT 1;
-- 6. Calculate the total order amount hike from last year for customers who are single and prefer mobile phones for ordering.
SELECT SUM(OrderAmountHikeFromlastYear) AS Total_Hike FROM Customer_Churn 
	WHERE MaritalStatus = 'Single' AND preferredOrderCat = 'Mobile Phone';
-- 7. Find the average number of devices registered among customers who used UPI as their preferred payment mode.    
SELECT AVG(NumberOfDeviceRegistered) AS Avg_Device_Count FROM Customer_Churn 
	WHERE PreferredPaymentMode ="UPI" ;
-- 8. Determine the city tier with the highest number of customers.
SELECT CityTier , COUNT(*) AS Customer_count FROM Customer_Churn 
	GROUP BY CityTier ORDER BY Customer_count DESC LIMIT 1;
-- 9. Identify the gender that utilized the highest number of coupons.
SELECT Gender ,SUM(CouponUsed) AS Coupon_count FROM Customer_Churn 	
	GROUP BY Gender ORDER BY Coupon_count DESC LIMIT 1;
-- 10. List the number of customers and the maximum hours spent on the app in each preferred order category.
SELECT preferredOrderCat,COUNT(CustomerID) AS Customer_count,MAX(HoursSpentOnApp) AS Maximum_TimeSpend_ON_App 
	from Customer_churn GROUP BY preferredOrderCat;
-- 11. Calculate the total order count for customers who prefer using credit cards and have the maximum satisfaction score.
SELECT SUM(OrderCount) AS Count_of_Orders from customer_churn 
	Where PreferredPaymentMode = "Credit Card"  AND 
    SatisfactionScore = (SELECT MAX(SatisfactionScore)FROM customer_churn );
-- 12. What is the average satisfaction score of customers who have complained?
SELECT AVG(SatisfactionScore) FROM Customer_churn 
	WHERE ComplaintReceived = 'yes';
-- 13. List the preferred order category among customers who used more than 5 coupons.
SELECT DISTINCT PreferredOrderCat FROM customer_churn
	WHERE CouponUsed > 5;
-- 14. List the top 3 preferred order categories with the highest average cashback amount.
SELECT preferredOrderCat ,AVG(CashbackAmount) AS Average_Cashback FROM Customer_Churn 
	GROUP BY preferredOrderCat ORDER BY Average_Cashback DESC LIMIT 3;
-- 15. Find the preferred payment modes of customers whose average tenure is 10 months and have placed more than 500 orders.
SELECT PreferredPaymentMode, AVG(Tenure) AS Average_Tenure, SUM(OrderCount) AS Total_Orders FROM customer_churn
	GROUP BY PreferredPaymentMode HAVING AVG(Tenure) = 10 AND SUM(OrderCount) > 500;
-- 16. Categorize customers based on their distance from the warehouse to home such as 'Very Close Distance' for distances <=5km, 'Close Distance' for <=10km,'Moderate Distance' for <=15km, and 'Far Distance' for >15km. Then, display the churn status breakdown for each distance category.
SELECT ChurnStatus, Count(*) AS Count_of_customers,
     CASE 
		WHEN WarehouseToHome <= 5 THEN 'Very Close'
		WHEN WarehouseToHome<= 10 THEN 'Close'
		WHEN WarehouseToHome<= 15 THEN 'Moderate'
		ELSE 'Far'
	END AS Distance FROM Customer_churn  GROUP BY churnStatus ,Distance ;
-- 17. List the customer’s order details who are married, live in City Tier-1, and their order counts are more than the average number of orders placed by all customers.
SELECT CustomerID,MaritalStatus,CityTier,OrderCount,PreferredOrderCat,PreferredPaymentMode,OrderAmountHikeFromlastYear,CashbackAmount FROM customer_churn
	WHERE MaritalStatus = 'Married' AND CityTier = 1 AND OrderCount > (SELECT AVG(OrderCount)
      FROM customer_churn);
-- 18a) Create a ‘customer_returns’ table in the ‘ecomm’ database and insert the following data:
/*ReturnID CustomerID 	ReturnDate 	RefundAmount
	1001 	50022 		2023-01-01 		2130
	1002 	50316 		2023-01-23 		2000
	1003 	51099 		2023-02-14 		2290
	1004 	52321 		2023-03-08 		2510
	1005 	52928 		2023-03-20 		3000
	1006 	53749 		2023-04-17 		1740
	1007 	54206 		2023-04-21 		3250
	1008 	54838 		2023-04-30 		1990*/
CREATE TABLE Customer_returns ( ReturnID INT PRIMARY KEY , CustomerID INT, ReturnDate DATE, RefundAmount INT ,
	FOREIGN KEY (CustomerID) REFERENCES Customer_Churn(CustomerID));
INSERT INTO Customer_returns(ReturnID,CustomerID,ReturnDate,RefundAmount)
VALUES( 1001,50022,'2023-01-01',2130),(
1002,50316,'2023-01-23',2000),(
1003,51099,'2023-02-14',2290),(
1004,52321,'2023-03-08',2510),(
1005,52928,'2023-03-20',3000),(
1006,53749,'2023-04-17',1740),(
1007,54206,'2023-04-21',3250),(
1008,54838,'2023-04-30',1990);
SELECT * FROM Customer_returns;
-- 18b)Display the return details along with the customer details of those who have churned and have made complaints.
SELECT c.CustomerID, r.ReturnID,r.ReturnDate,r.RefundAmount FROM Customer_returns AS r JOIN Customer_Churn AS c 
    ON r.CustomerID = c.CustomerID
WHERE ChurnStatus='Churned' AND ComplaintReceived ='YES'; 

    








