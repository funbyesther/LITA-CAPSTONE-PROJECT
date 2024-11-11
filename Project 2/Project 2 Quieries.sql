-- Project 2 Table: "LITA Capstone Dataset"

-- Retrieve the total number of customers from each region
SELECT Region, COUNT(DISTINCT CustomerID) AS TotalCustomers
GROUP BY Region;

-- Find the most popular subscription type by the number of customers
SELECT SubscriptionType, COUNT(DISTINCT CustomerID) AS NumberOfCustomers
GROUP BY SubscriptionType
ORDER BY NumberOfCustomers DESC
LIMIT 1;

-- Find customers who canceled their subscription within 6 months
SELECT CustomerID, CustomerName, SubscriptionType, SubscriptionStart, SubscriptionEnd
WHERE Canceled = `TRUE`
  AND DATEDIFF(SubscriptionEnd, SubscriptionStart) <= 180;
  
-- Calculate the average subscription duration for all customers
SELECT AVG(Subscription Duration) AS AverageSubscriptionDuration;

-- Find customers with subscriptions longer than 12 months
SELECT CustomerID, CustomerName, SubscriptionType, SubscriptionStart, SubscriptionEnd
WHERE DATEDIFF(SubscriptionEnd, SubscriptionStart) > 365;

-- Calculate total revenue by subscription type
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
GROUP BY SubscriptionType;

-- Find the top 3 regions by subscription cancellations.
SELECT Region, COUNT(*) AS Cancellations
WHERE Canceled = `TRUE`
GROUP BY Region
ORDER BY Cancellations DESC
LIMIT 3;

-- Find the total number of active and canceled subscriptions.
SELECT
    SUM(CASE WHEN Canceled = `TRUE` THEN 1 ELSE 0 END) AS CanceledSubscriptions,
    SUM(CASE WHEN Canceled = `FALSE` THEN 1 ELSE 0 END) AS ActiveSubscriptions;
