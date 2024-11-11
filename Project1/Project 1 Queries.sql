--Retrieve the total sales for each product category
SELECT Product, SUM(TotalSales) AS TotalSales
FROM `LITA Capstone SalesData`
GROUP BY Product;

--  Find the number of sales transactions in each region
SELECT Region, COUNT(OrderID) AS NumberOfTransactions
FROM `LITA Capstone SalesData`
GROUP BY Region;

--Find the highest-selling product by total sales value
SELECT Product, SUM(TotalSales) AS TotalSales
FROM `LITA Capstone SalesData`
GROUP BY Product
ORDER BY TotalSales DESC
LIMIT 1;

-- Calculate total revenue per product
SELECT Product, SUM(TotalSales) AS TotalRevenue
FROM `LITA Capstone SalesData`
GROUP BY Product;

--Calculate monthly sales totals for the current year
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalSales) AS MonthlySales
FROM `LITA Capstone SalesData`
WHERE YEAR(OrderDate) = 2024
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Month;

-- Find the top 5 customers by total purchase amount
SELECT CustomerId, SUM(TotalSales) AS TotalPurchaseAmount
FROM `LITA Capstone SalesData`
GROUP BY CustomerId
ORDER BY TotalPurchaseAmount DESC
LIMIT 5;

--Calculate the percentage of total sales contributed by each region
SELECT Region, 
       SUM(TotalSales) AS TotalSales,
       (SUM(TotalSales) / (SELECT SUM(TotalSales) FROM Sales) * 100) AS SalesPercentage
FROM `LITA Capstone SalesData`
GROUP BY Region;

--Identify products with no sales in the last quarter
SELECT Product
FROM `LITA Capstone SalesData`
WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY Product
HAVING SUM(TotalSales) = 0;
