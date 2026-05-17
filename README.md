# Pizza-Hut-Analysis-SQL
# 🍕 Pizza Sales Analysis using SQL

## 📌 Project Title
**Pizza Sales Data Analysis Using SQL**

---

# 📖 Project Overview

This project focuses on analyzing pizza sales data using SQL.  
The main objective of this project is to extract meaningful business insights from raw sales data by using different SQL concepts such as:

- Joins
- Aggregations
- Group By
- Subqueries
- Window Functions
- Ranking Functions
- Revenue Analysis
- Time-Based Analysis

The dataset contains information about:

- Orders
- Order Details
- Pizza Types
- Pizza Prices & Sizes

Using SQL queries, different business problems were solved to understand customer behavior, sales performance, revenue trends, and product performance.

---

# 🗂️ Database Tables Used

## 1️⃣ `orders`

Contains order date and order time.

| Column Name | Description |
|---|---|
| order_id | Unique order ID |
| order_date | Date of order |
| order_time | Time of order |

---

## 2️⃣ `order_detail`

Contains quantity and pizza ordered.

| Column Name | Description |
|---|---|
| order_details_id | Unique ID |
| order_id | Order ID |
| pizza_id | Pizza ID |
| quantity | Quantity ordered |

---

## 3️⃣ `pizzas`

Contains pizza size and price details.

| Column Name | Description |
|---|---|
| pizza_id | Pizza ID |
| pizza_type_id | Pizza Type |
| size | Pizza Size |
| price | Pizza Price |

---

## 4️⃣ `pizza_types`

Contains pizza category and pizza names.

| Column Name | Description |
|---|---|
| pizza_type_id | Pizza Type ID |
| name | Pizza Name |
| category | Pizza Category |

---

# ❓ Problems Solved in This Project

## 🔹 Basic Level Queries

- Total number of orders placed
- Total revenue generated
- Highest priced pizza
- Most common pizza size ordered
- Total pizzas sold
- Distribution of orders by hour
- Category-wise pizza distribution

---

## 🔹 Intermediate Level Queries

- Top 5 most ordered pizzas
- Revenue by pizza category
- Average order value
- Busiest day based on orders
- Busiest month based on revenue
- Average pizzas ordered per day
- Orders with bill greater than specific amount

---

## 🔹 Advanced Level Queries

- Percentage contribution of each pizza type to total revenue
- Cumulative revenue analysis
- Top 3 pizzas by revenue for each category
- Ranking pizzas using Window Functions
- Running total calculations
- Revenue comparison using `LAG()`
- Category-wise sales contribution

---

# 🛠️ SQL Concepts Used

## 🔗 Joins

```sql
INNER JOIN
LEFT JOIN
RIGHT JOIN
```

## 📊 Aggregate Functions

```sql
SUM()
COUNT()
AVG()
MAX()
MIN()
```

## 📌 Grouping

```sql
GROUP BY
HAVING
ORDER BY
```

## 📂 Subqueries

```sql
SELECT * FROM (
   ...
) AS subquery;
```

## 🚀 Window Functions

```sql
RANK()
DENSE_RANK()
LAG()
OVER()
PARTITION BY
```

---

# 📈 Key Insights Found

## ⏰ 1. Peak Ordering Hours

Most orders were placed during afternoon and evening hours, showing peak customer activity during meal times.

---

## 🍕 2. Best Selling Pizza Categories

Some pizza categories generated significantly higher revenue compared to others.

### Business Benefits:
- Focus marketing on profitable categories
- Improve inventory planning
- Increase sales through promotions

---

## 💰 3. Top Revenue Generating Pizzas

A few pizza types contributed major revenue to the business.

### Business Benefits:
- Promote best-selling pizzas
- Create combo offers
- Improve menu strategy

---

## 👥 4. Customer Ordering Behavior

Customers mostly preferred certain pizza sizes more than others.

### Business Benefits:
- Better stock management
- Optimize pricing strategy
- Improve customer satisfaction

---

## 📉 5. Revenue Trend Analysis

The cumulative revenue query helped analyze sales growth over time.

### Business Benefits:
- Identify high sales periods
- Detect seasonal demand
- Track business growth

---

## 🧾 6. Average Order Value

The project calculated average spending per order, helping measure customer purchasing behavior.

---

## 🏆 7. Top Performing Categories

Using ranking functions, top pizzas from each category were identified.

### Business Benefits:
- Improve menu design
- Remove low-performing items
- Increase profitability

---

# 🎯 Business Impact of This Project

This project helps businesses:

✅ Improve sales strategy  
✅ Understand customer preferences  
✅ Increase revenue  
✅ Optimize menu performance  
✅ Identify high-demand products  
✅ Make data-driven decisions  

---

# ⚙️ Tools & Technologies Used

- SQL
- MySQL
- Joins
- Window Functions
- Aggregate Functions

---

# 📚 Conclusion

This SQL Pizza Sales Analysis project demonstrates how SQL can be used to solve real-world business problems and generate actionable insights from raw data.

The project covers:

- Data Analysis
- Business Intelligence
- Revenue Analysis
- Customer Behavior Analysis
- Advanced SQL Techniques

It is a great project for:



---

# 👨‍💻 Author

**Vikash Bhandari**  
SQL & Data Analytics Enthusiast
