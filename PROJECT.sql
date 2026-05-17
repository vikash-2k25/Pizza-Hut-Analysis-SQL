USE PIZZA;
SHOW TABLES;
SELECT * FROM order_detail;
SELECT * FROM orders;
SELECT * FROM pizza_types;
SELECT * FROM pizzas;

-- RELATIONSHIP BETWEEN PIZZA_ORDER_DETAILS AND PIZZA_ORDERS (ORDER_ID)
-- RELATIONSHIP BETWEEN PIZZAS AND PIZZA_ORDER_DETAILS (PIZZA_ID)
-- RELATIONSHIP BETWEEN PIZZA_TYPES AND PIZZAS (PIZZA_TYPE_ID)

-- Basic 
-- 1.	Retrieve the total number of orders placed.

SELECT COUNT(ORDER_ID) AS Total_Order_Placed FROM order_detail;


-- 2.	Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(order_detail.quantity * pizzas.price),0) as Total_Revenue 
FROM order_detail 
join pizzas
on order_detail.pizza_id = pizzas.pizza_id;

-- 3.	Identify the highest-priced pizza.
SELECT MAX(PRICE) AS Highest_price FROM PIZZAS;

-- 4.	Identify the most common pizza size ordered. Size, quantity
SELECT PIZZAS.SIZE , sum(order_detail.quantity) as Total_Quantity 
from order_detail 
join pizzas
on order_detail.pizza_id = pizzas.pizza_id
group by pizzas.size;

-- 5.	List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name ,sum(order_detail.quantity) as Total_Quantity 
from order_detail 
join pizzas on order_detail.pizza_id = pizzas.pizza_id
join pizza_types on pizza_types.pizza_type_id = pizzas.pizza_type_id
group by pizza_types.name
order by Total_Quantity Desc limit 5; 

-- Intermediate:
-- 1.	Join the necessary tables to find the total quantity of each pizza category ordered.
		select pizza_types.category , sum(order_detail.quantity) as Total_Quantity 
        from order_detail
        join pizzas on order_detail.pizza_id = pizzas.pizza_id
        join pizza_types on pizzas.pizza_type_id = pizza_types.pizza_type_id
        group by pizza_types.category;

-- Determine the distribution of orders by hour of the day.

SELECT HOUR(time) AS order_hour,COUNT(order_id) AS total_orders
FROM orders
GROUP BY HOUR(time)
ORDER BY order_hour;

-- 3. Join relevant tables to find the category-wise distribution of pizzas.

SELECT pizza_types.category, COUNT(pizzas.pizza_id) AS total_pizzas
FROM pizzas
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.category
ORDER BY total_pizzas DESC;


-- 4. Group the orders by date and calculate the average quantity 
--    number of pizzas ordered per day.

SELECT ROUND(AVG(daily_total),2) AS avg_pizzas_per_day
FROM(SELECT orders.date,SUM(order_detail.quantity) AS daily_total
    FROM orders
    JOIN order_detail
    ON orders.order_id = order_detail.order_id
    GROUP BY orders.date) AS daily_orders;


--  Determine the top 3 most ordered pizza types based on revenue.
SELECT    pizza_types.name, ROUND(SUM(order_detail.quantity * pizzas.price),2) AS revenue
FROM order_detail
JOIN pizzas
ON order_detail.pizza_id = pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3;


--  Calculate the percentage contribution of each pizza type to total revenue.

SELECT pizza_types.name, ROUND(SUM(order_detail.quantity * pizzas.price),2) AS revenue,
    ROUND((SUM(order_detail.quantity * pizzas.price) /(SELECT SUM(order_detail.quantity * pizzas.price)
	FROM order_detail
    JOIN pizzas
	ON order_detail.pizza_id = pizzas.pizza_id)) * 100, 2) AS revenue_percentage
FROM order_detail
JOIN pizzas
ON order_detail.pizza_id = pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id;

--  Analyze the cumulative revenue generated over time.
SELECT date, revenue, SUM(revenue) OVER(ORDER BY order_date) AS cumulative_revenue
FROM(SELECT orders.date,ROUND(SUM(order_detail.quantity * pizzas.price),2) AS revenue
    FROM orders
    JOIN order_detail
    ON orders.order_id = order_detail.order_id
    JOIN pizzas
    ON order_detail.pizza_id = pizzas.pizza_id
    GROUP BY orders.date
) AS sales_data
GROUP BY pizza_types.name
ORDER BY revenue_percentage DESC;

-- Determine the top 3 most ordered pizza types 
--    based on revenue for each pizza category.

SELECT * FROM(SELECT pizza_types.category, pizza_types.name,ROUND(SUM(order_detail.quantity * pizzas.price),2) AS revenue,
        RANK() OVER(PARTITION BY pizza_types.category 
        ORDER BY SUM(order_detail.quantity * pizzas.price) DESC) AS rank_no
        FROM order_detail
    JOIN pizzas
    ON order_detail.pizza_id = pizzas.pizza_id
    JOIN pizza_types
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
    GROUP BY pizza_types.category, pizza_types.name
) AS ranked_pizzas
WHERE rank_no <= 3;

--  Find orders where total bill amount is greater than 100
SELECT     orders.order_id,ROUND(SUM(order_detail.quantity * pizzas.price),2) AS total_bill
FROM orders
JOIN order_detail
ON orders.order_id = order_detail.order_id
JOIN pizzas
ON order_detail.pizza_id = pizzas.pizza_id
GROUP BY orders.order_id
HAVING total_bill > 100
ORDER BY total_bill DESC;

--  Find the least ordered pizza
SELECT    pizza_types.name, SUM(order_detail.quantity) AS total_quantity
FROM order_detail
JOIN pizzas
ON order_detail.pizza_id = pizzas.pizza_id
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_quantity ASC
LIMIT 1;





