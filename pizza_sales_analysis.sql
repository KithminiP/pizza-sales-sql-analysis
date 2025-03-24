-- ?? Pizza Sales Analysis
-- Dataset: pizza_sales.csv
-- Tool: Databricks Community Edition using Spark SQL

-----------------------------------------------------
-- 1. Total Sales per Pizza (Rounded to 2 Decimal Places)
-----------------------------------------------------
SELECT 
  pizza_name,
  ROUND(SUM(total_price),2) AS total_sales
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sales DESC;


-----------------------------------------------------
-- 2. Top-Selling Pizza Categories
-----------------------------------------------------
SELECT 
  pizza_category,
  SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;


-----------------------------------------------------
-- 3. Best-Selling Pizza Sizes
-----------------------------------------------------
SELECT 
  pizza_size,
  SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_sold DESC;


-----------------------------------------------------
-- 4. Average Order Value (AOV)
-----------------------------------------------------
SELECT 
  ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM pizza_sales;


-----------------------------------------------------
-- 5. Daily Sales (Rounded to 2 Decimal Places)
-----------------------------------------------------
SELECT 
  order_date,
  ROUND(SUM(quantity * price), 2) AS daily_sales
FROM pizza_sales
GROUP BY order_date
ORDER BY order_date;
