/*-------------------------------------------------
-------------------------------------------------
           Measures Exploration
--------------------------------------------------
-------------------------------------------------
*/

--Find the Total Sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

--Find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales

--Find the average selling price
SELECT AVG(price) AS avg_price FROM gold.fact_sales

--Find the Total number of orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales  --This eliminates any duplicates in order number as a customer can buy more than 1 product in a single transaction. 

--Find the total number of products
SELECT COUNT(product_key) AS total_orders FROM gold.dim_products
SELECT COUNT(DISTINCT product_key) AS total_orders FROM gold.dim_products

--Find the total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers  -- Here we can have customers who is in database but did not placed any order.

--Find the total number of customers that has placed an order
SELECT COUNT(customer_key) AS total_customers FROM gold.fact_sales  -- We can have customers who have ordered more than once
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales

-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;
