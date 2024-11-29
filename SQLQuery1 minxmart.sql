 ---- Restoring Minx mart Data base


---- Restoring Minx mart Data base








	 ---making use of the minxmart database
	 Use Minxmart;

	 ---view the customer table
	 SELECT * FROM customer;

	 ---view the location table
	 select * from location;

	 --- view the product table--
	 select * from product;

	 -----view the sales team table
	 Select * from sales_team;

	 --- view the sales order table--
	 select * from sales_order;

	 
	 --- view the region table--
	 select* from region;

	 ----AGGregation

	 ---1 return total number of rows in the sales_order table
	 Select Count (*) AS total_rows
	 from sales_order;
	 ---here where you uses as it names the column--

	---2: Suppose we want to return the total number of orders that minxmart received.
 SELECt COUNT (order_number) As total_orders
FROM sales_order;


--Suppose we want to return the total revenue generated. 
Select sum(order_quantity * Discount_Applied * unit_price) AS total_revenue from sales_order;

select *from sales_order;
select  COUNT(distinct ProductID) from sales_ordeR as NUMBER_PRODUCT_ORDERED;


select *from sales_order;

----Suppose we want to return the most recent order date.
SELECT  MAX (ORDERDATE)  AS MOST_RECENT_ORDER
FROM sales_order;

---Suppose we want to return the earliest order date.
SELECT  MIN (ORDERDATE) 
AS EARLIEST_ORDER_dATE FROM sales_order;


---Suppose we want to return the overall average price of all products.

select Round(AVG(UNIT_PRICE),2)  
AS avg_unit_price from sales_order;


----Aggregation + group by
-----Suppose we want to return the total number of orders handled by each salesteam---\

select salesteamid, count(ordernumber) AS total_orders 
from sales_order
group by SalesTeamID;

-----Suppose we want to return the total units/quantity ordered for each product

select PRODUCTID, SUM(order_quantity)  as total_QUANTITY 
from sales_order
group by ProductID;

----3.Suppose we want to return the total number of states in each of the regions
 

select * from region;

--SORTING IN SQL

/*1: Suppose we want to return the order number, customer id, product id, and quantity columns,
but we would want the result to be ordered by the latest order number first*/

SELECT ORDERNUMBER, customerid, productid,order_quantity
from sales_order
Order by ordernumber Desc;


/*Suppose we want to return the total number of orders handled by each salesperson, with the
result ordered by their numbers (highest first)*/


select * FROM sales_order;

Select sum(order_quantity * Discount_Applied * unit_price) AS total_revenue from sales_order;



/*Suppose we want to return the order number, customer id, product id, quantity, and revenue
columns, but we would want the result to be ordered by the highest revenue first*/ 

SELECT ORDERNUMBER, 
       CUSTOMERID, 
       PRODUCTID, 
       ORDER_QUANTITY, 
       ROUND(ORDER_QUANTITY * Discount_applied * unit_price, 2) AS REVENUE
FROM sales_order
ORDER BY REVENUE DESC;

/*Suppose we want to return the top 5 most ordered products*---- to do this you uses Top (5)*/

SELECT TOP(5)
		ProductID,
		COUNT(ORDERNUMBER) aS TOTAL_ORDERS
		FROM SALES_ORDER
		GROUP BY PRODUCTID
		ORDER BY TOTAL_ORDERS DESC;


select * from sales_order; 


/*2: Suppose we want to return the least/bottom 5 ordered products*/


SELECT TOP(5)
		ProductID,
		COUNT(ORDERNUMBER) aS TOTAL_ORDERS
		FROM SALES_ORDER
		GROUP BY PRODUCTID
		ORDER BY TOTAL_ORDERS;

	/*Suppose we want to return the id of the salesperson who handled the most orders*/

	
select * from sales_order; 

	SELECT Top (1)
	       SalesTeamID,
		   Count(orderNumber) as Total_orders
		   from sales_order
		   group by SalesTeamID
		   order by Total_orders desc;

		   
select * from sales_order; 


/*Suppose we want to return only orders from customer with customer id 22*/

SELECT	* from sales_order 
         WHERE CustomerID = 22;

/* Suppose we want to return the total number of orders made via the Wholesale sales channel*/

SELECT COUNT(*) FROM sales_order WHERE sales_channel = ‘Wholesale’;

SELECT Sales_Channel,
       count(OrderNumber) AS total_orders
FROM sales_order
WHERE Sales_Channel IN ('in-store', 'online', 'distributor', 'wholesale')
GROUP BY Sales_Channel;

 
 
SELECT	*
        from sales_order
		Where order_quantity >5;


/*Example Scenario 6: Suppose we want to return the total 
revenue generated only if the revenue from orders is greater than 5000*/

SELECT  ROUND(Sum(Order_Quantity * Discount_Applied* Unit_Cost),2) AS REVENUE
	    FROM SALES_ORDER 
		where(Order_Quantity * Discount_Applied* Unit_Cost) >5000
	   ; 


	   /*Example Scenario 1: Suppose we want to return orders via the 
	   Distributor sales channel with discount above 3% */




	   /*Suppose we want to return only orders with product 
	   id 12 and order date is 31st May, 2018*/

	  SELECT * FROM sales_order
	  where ProductID= 12 and OrderDate= '2018-05-31';

	  /*Suppose we want to return stores that are either in Alabama or the City Type is Town*/

	  select * from location
	           Where state= 'Alabama' Or Type= 'Town';

			   /*IN and NO IN*/


			  /* Suppose we want to return orders from three customers with id 13, 17 and 20*/

			  select * from sales_order
			           WHERE CustomerID in (13,17,20);


/*Suppose we want to return orders from all sales channel 
excluding Wholesale, In-Store, and Online*/

Select * from 
       sales_order where sales_channel 
	   NOt in( 'Wholesale', 'In-store','online'); 

/* using the comparison operstor*/
Select * from 
       sales_order where sales_channel 
	   !=( 'Wholesale', 'In-store','online'); 

	   /*Between*/
	  -- Suppose we want to return orders having products with unit price between 500 and 1000--

 Select * from  sales_order
       Where unit_price  between 500 and 1000; 
-- Using Comparison Operators---
	   Select * from  sales_order
       Where unit_price  >= 500 and Unit_Price<= 1000;
	   
/*Suppose we want to return orders made between 1st June, 2018 and 30th June, 2018*/
       SELECT COUNT(OrderNumber) as total_orders_June FROM sales_order
	   WHERE OrderDate BETWEEN '2018-06-1' AND '2018-06-30'
	   ;

	   --LIKE/ILIKE OPERATORS WITH WILDCARDS--
/*Suppose we want to return customers having Group in their name-----> YOU NEED TO USE A WILD CARD %
*/


Select * from customer
       Where Customer_Names LIKE '%GROUP' ;

	   /*Suppose we want to return the information of cities that end with the letter e*/
 SELECT * FROM location
          WHERE City_Name LIKE '%e';

/*Suppose we want to return the information of cities having the letters en anywhere in their name*/

 SELECT * FROM location 
          WHERE city_name LIKE '%en%';

 /*Suppose we want to return the information of cities having letter A as their second character */

SELECT City_Name
		county,
		State code,
		state, from location
         where city_name LIKE ‘__a%’;

		 ---Suppose we want to return only the year values from the order date column--
SELECT
      YEAR(OrderDate) AS Year1,
	  Format(OrderDate, 'yyyy') As Year2
	   FROM sales_order;


	   ----2.Suppose we want to return only the month values from the order date column--
	   
		SELECT
	   MONTH(OrderDate) As Month1,
	   Format(OrderDate, 'MMMM') As Month2
	   fROM Sales_order;

	  select* from sales_order;

	  --suppose you want to return the revenue generated per month ---
	  
	  select
	  FORMAT(OrderDate,'MMMM') As Month,
	  Round(SUM(Order_Quantity * Discount_applied * Unit_Price),2) as Revenue
	  From  sales_order
       Group by FORMAT(OrderDate,'MMMM')
	   Order by SUM(Order_Quantity * Discount_applied * Unit_cost) Desc;
	 
	  --Suppose we want to return total number of orders by day of the week--

	  SELECT 
	      FORMAT(OrderDate,'dddd') As Weekday,
		  COUNT(OrderNumber) As total_orders
		 
		  From sales_order
		  Group BY Format (OrderDate,'dddd')
		  Order by total_orders Desc;

		  -- Suppose we want to return the order summary by month and day of the week--
		  ----order summary is the total number of orders and totl revenue generated

		   
		   SELECT 
    FORMAT(OrderDate, 'ddd') AS Weekday,
    FORMAT(OrderDate, 'MMM') AS Month,
    COUNT(OrderNumber) AS Total_Orders,
    ROUND(SUM(Order_Quantity * Discount_Applied * Unit_Price), 2) AS Revenue
FROM sales_order
GROUP BY FORMAT(OrderDate, 'ddd'), FORMAT(OrderDate, 'MMM')
ORDER BY Month;

Select 
* from sales_order;

--Suppose we want to set the discount of product with id 22 to 15% (0.15)

Update Sales_order
set Discount_Applied= 0.15 
where ProductID =22;

/* Suppose we want to reduce the unit price of some products by 350 if the unit cost is greater 
than 1000*/

BEGIN TRANSACTION;
UPDATE sales_order
SET Unit_Price =Unit_Price -350
WHERE Unit_Cost > 1000;

ROLLBACK;


/*Suppose we want to get the total amount spent by a particular customer, but we only know 
their name*/

/*SELECT customer_id, SUM(unit_price * order_quantity * discount_applied) as revenue
FROM sales_order
WHERE customer_id = (SELECT customer_id
FROM customer
WHERE customer_name LIKE 'Eminence Corp’)
GROUP BY customer_id;*/

/*Suppose we want to return order details for products with a unit price greater than the average
unit price of all products*/

SELECT * FROM sales_order;

SELECT AVG(Unit_Price)FROM sales_order;

SELECT * FROM sales_order
WHERE Unit_Price > (SELECT AVG(Unit_Price)FROM sales_order);


/*SUBQUERY/NESTED QUERY/ CTE(COMMON TABLE EXPRESSIONS)


/*JOIN*/
--Suppose we want to return order details of customers who ordered via the Distributor sales 
channe--*/

SELECT   CUSTOMER.CustomerID, 
        Customer_Names,
		OrderNumber,
        ProductID, 
		Order_Quantity,
		Discount_Applied, 
		Unit_Price, revenue 
		FROM sales_order
INNER JOIN
customer ON
CUSTOMER.CUSTOMERID= SALES_ORDER.CUSTOMERID;

--Suppose we want to return the total number of orders from each citY--

SELECT * FROM sales_order;

SELECT * FROM location;

SELECT COUNT(OrderNumber) 
FROM sales_order As TotalOrders;

select 
       city_name, 
	   COUNT(OrderNumber)As Total_Orders
      FROM sales_order
     INNER JOIN location ON
      location.StoreID=sales_order.StoreID
	  Group by City_Name;



	  -- Suppose we want to return the total number of stores in each region-

	  
	  select 
	  region,
	  COUNT(STOREID) AS Total_stores

	  from Location l
	  inner join 
	  region r on 
	  r.StateCode= L.StateCode
	  Group by Region
	  order by Total_stores desc;


	  /*Suppose we want to return order details of customers who ordered via the Distributor sales 
channel, including the name of products ordered, and city of store where order took place*/

/*customer_name, order_number, city_name, product_name, order_quantity,
discount_applied, unit_price, revenue*/

select * from sales_order;

SELECT * FROM sales_order so
         INNER JOIN customer C
		 ON C.CustomerID=SO.CustomerID
		 INNER JOIN location L
		 ON L.StoreID= SO.StoreID
		 INNER JOIN product P
		 ON P.ProductID= SO.ProductID
		WHERE Sales_Channel= 'Distributor';


		--Suppose we want to return the top 10 customers by total spending (revenue)--

		SELECT TOP(10) Customer_Names Revenue
		FROM customer C		
		INNER JOIN sales_order so
		ON C.CustomerID= SO.CustomerID
		GROUP BY Customer_Names;


		SELECT Top(10)
		    so.CustomerID,
			Customer_Names,
			SUM(revenue) As total_spending
			from sales_order so
			left join customer c
			on c.CustomerID= so.customerID

			group by so.CustomerID,Customer_Names
			order by total_spending desc;
			
		
		/*Suppose we want to return the least/bottom 10 products by quantity ordered*/

		SELECT 
		Top(10) 
		Product_Name,
		SUM(order_quantity) as Quantity_ordered
		FROM sales_order AS SO
		RIGHT JOIN product AS P
		ON P.ProductID= SO.ProductID
		Group by Product_Name 
		Order by Quantity_ordered;

	---CASE WHEN--
	--Suppose we want to categorize the price of products into high, medium and low--

	SELECT OrderNumber, Unit_Price,
	CASE	
	   WHEN Unit_Price >=1500 THEN 'HIGH'
	   WHEN Unit_Price BETWEEN 500 AND 1500 THEN 'MEDIUM'
	   ELSE 'LOW'
	   END AS Price_Category
	
	FROM SALES_ORDER;

	--2.Suppose we want to count the number of orders in each price category--
	 

-- CTE IN SQL--
	WITH tab AS(
	SELECT OrderNumber, Unit_Price,
	CASE	
	   WHEN Unit_Price >=1500 THEN 'HIGH'
	   WHEN Unit_Price BETWEEN 500 AND 1500 THEN 'MEDIUM'
	   ELSE 'LOW'
	   END AS Price_Category
	
	FROM SALES_ORDER)
	SELECT Price_Category,
	Count (OrderNumber) As total_orders
	From tab
	Group by Price_category; 
	--Suppose we want to create a view for orders made in August--
	
	CREATE VIEW  August_orders AS
	SELECT * from sales_order
	where MONTH(OrderDate)= 8;
	select * from August_orders;

	---suppose we want to create a view for the Top 10 most ordered product
	CREATE VIEW top10_most_ordered_product AS
	SELECT Top (10) pd.ProductID, Product_Name
	,count(OrderNumber) as total_orders
	FROM sales_order as so
	Join product as pd
	on so.ProductID= pd.ProductID
	group by pd.ProductID, Product_Name
	order by total_orders desc;

	 SELECT * FROM  top10_most_ordered_product;


	 ---PROCEDURES IN SQL

	 SELECT * FROM product;
	 INSERT INTO product
	 vALUES(48, 'Iphone');
