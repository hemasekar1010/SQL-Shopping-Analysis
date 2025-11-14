-- SQL shopping customer behavior-p1
create database sql_project;

--CREATE TABLE
CREATE TABLE customer_behavior
             (
                Customer_ID	INT PRIMARY KEY,
				Age INT,
				Gender VARCHAR(8),	
				Item_Purchased	VARCHAR(20),
				Category VARCHAR(20),
				Purchase_Amount INT,
				Location VARCHAR(25),	
				Size VARCHAR(4),
				Color VARCHAR(15),	
				Season VARCHAR(20),
				Review_Rating FLOAT,	
				Subscription_Status	VARCHAR(5),
				Shipping_Type VARCHAR(20),	
				Discount_Applied VARCHAR(4),	
				Promo_Code_Used VARCHAR(4),
				previous_Purchases	INT,
				Payment_Method VARCHAR(20),
				Frequency_of_Purchases VARCHAR(20)
  );

-- TO VIEW THE TABLE COLUMN
  SELECT * FROM customer_behavior;

-- TO VIEW TOTAL NUMBER IN THE DATASET
SELECT 
     COUNT(*) 
FROM customer_behavior

-- DATA CLEANING
-- TO FIND NULL VALUES
SELECT * FROM customer_behavior
WHERE  
     Customer_ID IS NULL
	 OR
     Age IS NULL
	 OR
	 Gender IS NULL
	 OR
	 Item_Purchased IS NULL
	 OR
	 Category IS NULL
	 OR
	 Purchase_Amount IS NULL
	 OR
	 Location IS NULL
	 OR
	 Size IS NULL
	 OR
	 Color IS NULL
	 OR
	 Season IS NULL
	 OR
	 Review_Rating IS NULL
	 OR
	 Subscription_Status IS NULL
	 OR
	 Shipping_Type IS NULL
	 OR
	 Discount_Applied IS NULL
	 OR
	 Promo_Code_Used IS NULL
	 OR
	 previous_Purchases IS NULL
	 OR
	 Payment_Method IS NULL
	 OR
	 Frequency_of_Purchases IS NULL
 
	 
-- DATA EXPLORATION

--What is the average age of customers by gender?
SELECT Gender, round(AVG(Age),2) AS Average_Age
FROM Customer_behavior
GROUP BY Gender ;

--How many customers have made more than 5 previous purchases?
SELECT Customer_ID, Previous_Purchases
FROM Customer_behavior
WHERE Previous_Purchases > 5
LIMIT 100;

--Which age group has the highest frequency of purchases?
SELECT Age, COUNT(*) AS Purchase_Count
FROM Customer_behavior
GROUP BY Age
ORDER BY Purchase_Count DESC
LIMIT 10;

--What is the distribution of subscription status across different locations?
SELECT Subscription_Status,Location,
COUNT(*) AS Subscriber_Count
FROM Customer_behavior
GROUP BY Subscription_Status, Location
ORDER BY Location DESC
LIMIT 100;

--What are the top 5 most purchased items by category?
SELECT Category ,Item_Purchased,COUNT (*) AS TOP_FIVE
FROM Customer_behavior
GROUP BY Category ,Item_Purchased
ORDER BY TOP_FIVE DESC
LIMIT 5;

--Which season sees the highest purchase volume?
SELECT Season, SUM(Purchase_Amount) AS Highest_Purchase
FROM Customer_behavior
GROUP BY Season
ORDER BY Highest_Purchase DESC;

--What is the average purchase amount for each item category?
SELECT category, ROUND(AVG(Purchase_Amount),2) AS Average_purchase_amt,
COUNT(*) AS NO_OF_ITEMS
FROM Customer_behavior
GROUP BY category
ORDER BY NO_OF_ITEMS DESC;

--Which color and size combinations are most popular?
SELECT Size,Color,COUNT(*)AS COMBO_COUNT
FROM Customer_behavior
GROUP  BY Size,color
ORDER BY  COMBO_COUNT DESC;

--Which location has the highest total purchase amount?
SELECT Location, SUM(Purchase_AmouSnt) AS Total_purchase_amt,
COUNT (*) AS Highest_purchase
FROM Customer_behavior
GROUP BY Location
ORDER BY  Highest_purchase DESC
LIMIT 20;

--What is the most commonly used payment method?
SELECT Payment_Method,COUNT(*) AS Common_payment_mode
FROM Customer_behavior
GROUP BY  Payment_Method
ORDER BY Common_payment_mode DESC;

--How many purchases used a promo code?	
SELECT Promo_Code_Used, COUNT(*) AS Promo_Used
FROM Customer_behavior
GROUP BY Promo_Code_Used;

--What is the average review rating for each item category
SELECT Category,AVG(Review_Rating) AS avg_rating, 
COUNT(*) AS no_of_rating
FROM Customer_behavior
GROUP BY Category
ORDER BY no_of_rating DESC;

--Do subscribed customers leave higher ratings than unsubscribed ones?
SELECT 
  Subscription_Status, 
  ROUND(AVG(Review_Rating)) AS Avg_Rating,
  COUNT(*) AS Rating_Count
FROM Customer_behavior
GROUP BY Subscription_Status
ORDER BY Avg_Rating DESC;

--Most common Frequency_of_Purchases?
SELECT 
  Frequency_of_Purchases, 
  COUNT(*) AS Frequency_Count
FROM Customer_behavior
GROUP BY Frequency_of_Purchases
ORDER BY Frequency_Count DESC;
