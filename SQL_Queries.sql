-- STEP 1: Create Database
CREATE DATABASE IF NOT EXISTS Company;
USE Company;

-- STEP 2: Create Tables
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- STEP 3: Insert Data
INSERT INTO Customers (name, city, email) VALUES
('Adhi', 'Chennai', 'adhi@gmail.com'),
('Ravi', 'Mumbai', 'ravi@gmail.com'),
('Bala', 'Delhi', 'bala@gmail.com'),
('Ajay', 'Bangalore', 'ajay@gmail.com'),
('Sara', 'Hyderabad', 'sara@gmail.com'),
('Karan', 'Kolkata', 'karan@gmail.com'),
('Divya', 'Chennai', 'divya@gmail.com'),
('Rahul', 'Mumbai', 'rahul@gmail.com'),
('Priya', 'Delhi', 'priya@gmail.com'),
('Anil', 'Chennai', 'anil@gmail.com'),
('Nikita', 'Delhi', 'nikita@gmail.com'),
('Vikram', 'Bangalore', 'vikram@gmail.com'),
('Meena', 'Hyderabad', 'meena@gmail.com'),
('Suresh', 'Kolkata', 'suresh@gmail.com'),
('Pooja', 'Chennai', 'pooja@gmail.com'),
('Aman', 'Delhi', 'aman@gmail.com'),
('Lakshmi', 'Mumbai', 'lakshmi@gmail.com'),
('Gaurav', 'Bangalore', 'gaurav@gmail.com'),
('Kavya', 'Chennai', 'kavya@gmail.com'),
('Deepak', 'Delhi', 'deepak@gmail.com');

INSERT INTO Orders (customer_id, order_date, amount, status) VALUES
(1, '2023-01-01', 4500.00, 'Completed'),
(2, '2023-01-02', 3200.00, 'Completed'),
(3, '2023-01-03', 1500.00, 'Pending'),
(1, '2023-01-10', 2000.00, 'Completed'),
(4, '2023-01-15', 6200.00, 'Cancelled'),
(5, '2023-01-17', 4100.00, 'Completed'),
(6, '2023-01-20', 3300.00, 'Completed'),
(2, '2023-01-22', 2800.00, 'Completed'),
(3, '2023-01-25', 2100.00, 'Completed'),
(7, '2023-01-28', 5000.00, 'Completed'),
(8, '2023-01-30', 3900.00, 'Completed'),
(9, '2023-02-01', 2750.00, 'Pending'),
(10, '2023-02-03', 1500.00, 'Completed'),
(11, '2023-02-04', 3500.00, 'Completed'),
(12, '2023-02-05', 2900.00, 'Cancelled'),
(13, '2023-02-06', 6000.00, 'Completed'),
(14, '2023-02-07', 4100.00, 'Completed'),
(15, '2023-02-08', 4500.00, 'Completed'),
(16, '2023-02-09', 2000.00, 'Completed'),
(17, '2023-02-10', 3100.00, 'Pending');

-- a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT * FROM Orders WHERE amount > 3000;
SELECT * FROM Orders ORDER BY order_date DESC;
SELECT status, COUNT(*) AS total_orders 
FROM Orders
GROUP BY status;


-- b. JOINS (INNER, LEFT, RIGHT)
SELECT o.order_id, c.name, o.amount, o.status
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

SELECT c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id;

SELECT c.name, o.order_id
FROM Orders o
RIGHT JOIN Customers c ON o.customer_id = c.customer_id;

-- c. Subqueries
SELECT * FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);

SELECT * FROM Orders
WHERE amount > (
    SELECT AVG(amount) FROM Orders
);

-- d. Aggregate Functions (SUM, AVG)
SELECT SUM(amount) AS total_revenue
FROM Orders
WHERE status = 'Completed';

SELECT AVG(amount) AS avg_order_value FROM Orders;

SELECT status, COUNT(*) AS total_orders FROM Orders GROUP BY status;

-- e. Views
CREATE VIEW Customer_Order_View AS
SELECT c.customer_id, c.name AS customer_name,c.city, o.order_id, o.order_date, o.amount, o.status
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;
SELECT * FROM Customer_Order_View WHERE status = 'Completed';

-- f. Indexes
CREATE INDEX idx_customers_city ON Customers(city);
SHOW INDEX FROM Customers;

CREATE INDEX idx_orders_customer_id ON Orders(customer_id);
SHOW INDEX FROM Orders;



