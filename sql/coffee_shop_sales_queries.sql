DROP TABLE IF EXISTS coffee_shop_sales ;

CREATE TABLE coffee_shop_sales(
        transaction_id	INT PRIMARY KEY,
		transaction_date DATE,
		transaction_time TIME,
		transaction_qty	INT,
		store_id INT,	
		store_location VARCHAR(30),	
		product_id	INT,
		unit_price	FLOAT,
		product_category VARCHAR(30),
		product_type VARCHAR(30),	
		product_detail VARCHAR(100)
);
SELECT * FROM coffee_shop_sales;
SELECT COUNT(*)
FROM coffee_shop_sales;

/* problem 1
calculate total sales for each respective month
determine the month on month increase or decrease in sales
calculate the difference in sales between the selected month and previous month
*/

--calculate total sales for each respective month


SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
    CONCAT(ROUND((SUM(transaction_qty * unit_price) / 1000)::numeric, 2),'K') AS total_sales
FROM coffee_shop_sales
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY month;

--determine the month on month increase or decrease in sales
--selected month/current month=may=5
--previous month=April=4

WITH monthly_sales AS (
    SELECT
        EXTRACT(MONTH FROM transaction_date) AS month,
        SUM(transaction_qty * unit_price) AS total_sales
    FROM coffee_shop_sales
    WHERE EXTRACT(MONTH FROM transaction_date) IN (4, 5)
    GROUP BY EXTRACT(MONTH FROM transaction_date)
)
SELECT
    month,
    ROUND(total_sales::numeric, 2) AS total_sales,
    ROUND(
        (
            (total_sales - LAG(total_sales) OVER (ORDER BY month))
            / NULLIF(LAG(total_sales) OVER (ORDER BY month), 0)
            * 100
        )::numeric,
        2
    ) AS mom_increase_percentage
FROM monthly_sales
ORDER BY month;


--calculate total orders for each respective month

SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
    SUM(transaction_id) AS total_orders
FROM coffee_shop_sales
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY month;

--calculate the difference in orders between the selected month and previous month

SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
    COUNT(transaction_id) AS total_orders,
    ROUND(((COUNT(transaction_id) -LAG(COUNT(transaction_id)) OVER (ORDER BY EXTRACT(MONTH FROM transaction_date)))::numeric
            / NULLIF(LAG(COUNT(transaction_id)) OVER (ORDER BY EXTRACT(MONTH FROM transaction_date)),0) ) * 100,2) 
			AS mom_increase_percentage
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) IN (4, 5)
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY month;

--calculate total quantity sold for each respective month

SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
    SUM(transaction_qty) AS total_quantity_sold
FROM coffee_shop_sales
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY month;

-- determine the month on month increase or decrease in sales

SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
     SUM(transaction_qty) AS total_quantity_sold,
    ROUND(((SUM(transaction_qty) -LAG(SUM(transaction_qty)) OVER (ORDER BY EXTRACT(MONTH FROM transaction_date)))::numeric
            / NULLIF(LAG(SUM(transaction_qty)) OVER (ORDER BY EXTRACT(MONTH FROM transaction_date)),0) ) * 100,2) 
			AS mom_increase_percentage
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) IN (4, 5)
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY month;


SELECT
    CONCAT(ROUND((SUM(unit_price * transaction_qty) / 1000)::numeric, 1), 'K') AS total_sales,
    CONCAT(ROUND((COUNT(transaction_id)::numeric / 1000), 1), 'K') AS total_orders,
    CONCAT(ROUND((SUM(transaction_qty)::numeric / 1000), 1), 'K') AS total_quantity_sold
FROM coffee_shop_sales;


SELECT
    CASE
        WHEN EXTRACT(ISODOW FROM transaction_date) IN (6, 7)
            THEN 'WEEKEND'
        ELSE 'WEEKDAY'
    END AS day_type,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) AS total_sales
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) = 5
GROUP BY day_type
ORDER BY day_type;


SELECT store_location,
       CONCAT(ROUND(SUM(unit_price * transaction_qty)::numeric/1000,2),'K') as total_sales
FROM coffee_shop_sales
GROUP BY store_location


-- Avg sales for may month

SELECT ROUND(AVG(total_sales)::numeric,2) as avg_sales 
  FROM (SELECT transaction_date, 
        SUM(transaction_qty * unit_price) AS total_sales
  FROM coffee_shop_sales
  WHERE EXTRACT(MONTH FROM transaction_date) = 5
  GROUP BY transaction_date) AS  daily_sales;

  --daily sales for a particular month
  
SELECT
    transaction_date as day_of_month,
    ROUND(SUM(transaction_qty * unit_price)::numeric, 2) 
	FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) = 5
GROUP BY transaction_date
ORDER BY transaction_date;

--COMPARING DAILY SALES WITH AVERAGE SALES – IF GREATER THAN “ABOVE AVERAGE” and LESSER THAN “BELOW AVERAGE”
SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        EXTRACT(DAY FROM transaction_date) AS day_of_month,
        ROUND(SUM(unit_price * transaction_qty)::numeric,2) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        EXTRACT (MONTH FROM transaction_date) = 5  -- Filter for May
    GROUP BY 
        EXTRACT(DAY FROM transaction_date)
) AS sales_data
ORDER BY 
    day_of_month;

--sales wrt product category
SELECT Product_category,
       ROUND(SUM(unit_price * transaction_qty)::numeric,2) AS total_sales
FROM coffee_shop_sales
GROUP BY Product_category
ORDER BY SUM(unit_price * transaction_qty) DESC

SELECT Product_type,
       ROUND(SUM(unit_price * transaction_qty)::numeric,2) AS total_sales
FROM coffee_shop_sales
GROUP BY Product_type
ORDER BY SUM(unit_price * transaction_qty) DESC

-- Total sales and total quantity sold and total orders at a particular time in a day

SELECT ROUND(SUM(unit_price * transaction_qty)::numeric,2) AS total_sales,
      SUM(transaction_qty) AS total_quantity,
	   COUNT(*) AS total_orders
FROM coffee_shop_sales
WHERE EXTRACT (MONTH FROM transaction_date)=5 AND
      EXTRACT(ISODOW FROM transaction_date)=1 AND
	  EXTRACT(HOUR FROM transaction_time)=8

--which hour the most coffee's are sold

SELECT EXTRACT(HOUR FROM transaction_time) AS hour,
       ROUND(SUM(unit_price * transaction_qty)::numeric,2) AS total_sales,
       SUM(transaction_qty) AS total_quantity
	 FROM coffee_shop_sales
	 WHERE EXTRACT (MONTH FROM transaction_date)=5
	 GROUP BY EXTRACT(HOUR FROM transaction_time)
	 ORDER BY hour;

--sales by days

SELECT
     EXTRACT (DAY FROM transaction_date) AS day,
	 ROUND(SUM(unit_price * transaction_qty)::numeric,2) AS total_sales,
       SUM(transaction_qty) AS total_quantity
	 FROM coffee_shop_sales
	 WHERE EXTRACT (MONTH FROM transaction_date)=5
	 GROUP BY EXTRACT(DAY FROM transaction_date)
	 ORDER BY day;


SELECT
    CASE
        WHEN EXTRACT(ISODOW FROM transaction_date) = 1 THEN 'Monday'
        WHEN EXTRACT(ISODOW FROM transaction_date) = 2 THEN 'Tuesday'
        WHEN EXTRACT(ISODOW FROM transaction_date) = 3 THEN 'Wednesday'
        WHEN EXTRACT(ISODOW FROM transaction_date) = 4 THEN 'Thursday'
        WHEN EXTRACT(ISODOW FROM transaction_date) = 5 THEN 'Friday'
        WHEN EXTRACT(ISODOW FROM transaction_date) = 6 THEN 'Saturday'
        WHEN EXTRACT(ISODOW FROM transaction_date) = 7 THEN 'Sunday'
    END AS day_name,
    ROUND(SUM(unit_price * transaction_qty)::numeric, 2) AS total_sales,
    SUM(transaction_qty) AS total_quantity
FROM coffee_shop_sales
WHERE EXTRACT(MONTH FROM transaction_date) = 5
GROUP BY day_name

       
