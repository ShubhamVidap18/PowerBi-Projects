SELECT * from pizza_sales

--Total Revenue
SELECT SUM(total_price) AS Total_Revenue from pizza_sales

--Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Ord_Value FROM pizza_sales

--Total Pizza's Sold
SELECT SUM(quantity) AS Total_Pizzas_sold from pizza_sales

--Total Orders 
SELECT COUNT(DISTINCT order_id) AS Total_Ord_Placed from pizza_sales

--Average Pizzz's per Ord
SELECT COUNT(pizza_id) / COUNT(DISTINCT order_id) AS Avg_pizza_per_ord from pizza_sales 
--or--
SELECT	CAST(COUNT(pizza_id) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT(order_id)) as DECIMAL(10,2)) from pizza_sales


--Week day wise Total Orders:
SELECT DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT(order_id)) as Total_Orders 
from pizza_sales
GROUP BY DATENAME(DW, order_date)


--Month wise Total Orders
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders ASC


--% of Sales by Pizza Category
SELECT pizza_category, SUM(total_price)	* 100 / (SELECT SUM(total_price) from pizza_sales)
AS Percent_Sales_by_cat from pizza_sales
GROUP BY pizza_category	


--% of Sales by Pizza Size
SELECT pizza_size, SUM(total_price)	* 100 / (SELECT SUM(total_price) from pizza_sales)
AS Percent_Sales_by_cat from pizza_sales
GROUP BY pizza_size	

		
--Top 5 best sellers by Revenue, Total	Quantity and Total Orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
		

--Bottom 5 best sellers by Revenue, Total	Quantity and Total Orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC			
		

--Top 5 best sellers by Quantity, Total	Quantity and Total Orders
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC	