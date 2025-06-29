# 📊 SQL_for_Data_Analysis

This project demonstrates core SQL skills. It uses a simple E-commerce-style dataset with two tables: **Customers** and **Orders**.

---

## 📂 Project Structure

```
/SQL_for_Data_Analysis
├── SQL_Queries.sql         # All SQL queries for analysis
├── customers.csv           # Customers dataset
├── orders.csv              # Orders dataset
└── screenshots/            # Folder containing (query + output) screenshots

```

---

## ⚙️ Database Schema

✅ **Customers Table**  
- customer_id (Primary Key)  
- name  
- city  
- email  

✅ **Orders Table**  
- order_id (Primary Key)  
- customer_id (Foreign Key to Customers)  
- order_date  
- amount  
- status  

---

## ✅ Features / Tasks Completed

### a. Use SELECT, WHERE, ORDER BY, GROUP BY
- Basic filtering and sorting
- Grouping with aggregate results

### b. Use JOINS
- INNER JOIN to combine Customers and Orders
- LEFT JOIN for customers with or without orders
- RIGHT JOIN variations

### c. Write Subqueries
- Nested queries to find customers with >1 order
- Filter orders above average amount

### d. Use Aggregate Functions
- SUM of revenue
- AVG order value
- COUNT of orders by status

### e. Create Views for Analysis
- Saved views for easy reporting

### f. Optimize Queries with Indexes
- Indexes on foreign key columns
- Indexes on city for faster filtering

---

## 🚀 How to Use

✅ 1. Load the CSV files into your MySQL database  
✅ 2. Open and execute `SQL_Queries.sql` in MySQL Workbench or your preferred SQL client  
✅ 3. Review the query outputs and save the results as screenshots in the `screenshots/` folder  

---

## 📝 Notes

- The **customers.csv** and **orders.csv** files provide sample data to load into your database.  
- The **screenshots** folder demonstrates query execution with actual output results.  
- This structure is intended for easy evaluation and clear documentation.

---


## 📜 License

This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute it with attribution.  
