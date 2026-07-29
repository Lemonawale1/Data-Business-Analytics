
--------------------------------------------------------------------------------------------------------------------------------
-- DDL and DQL
--------------------------------------------------------------------------------------------------------------------------------


-- =====================================================
-- TABLE 1: CUSTOMERS
-- =====================================================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    city VARCHAR(50),
    join_date DATE
);

INSERT INTO customers (customer_id, name, email, city, join_date) VALUES
(1, 'Ram Sharma', 'ram.sharma@email.com', 'Kathmandu', '2023-01-15'),
(2, 'Sita Thapa', 'sita.thapa@email.com', 'Pokhara', '2023-02-20'),
(3, 'Hari Gurung', 'hari.gurung@email.com', 'Kathmandu', '2023-03-10'),
(4, 'Gita Rai', 'gita.rai@email.com', 'Lalitpur', '2023-04-05'),
(5, 'Krishna Shrestha', 'krishna.s@email.com', 'Pokhara', '2023-05-12'),
(6, 'Anita Tamang', 'anita.t@email.com', 'Kathmandu', '2023-06-18'),
(7, 'Binod Karki', 'binod.k@email.com', 'Bhaktapur', '2023-07-22'),
(8, 'Chandra Magar', 'chandra.m@email.com', 'Lalitpur', '2023-08-30'),
(9, 'Deepak Adhikari', 'deepak.a@email.com', 'Kathmandu', '2023-09-14'),
(10, 'Elina Basnet', 'elina.b@email.com', 'Pokhara', '2023-10-25'),
(11, 'Fanindra Neupane', 'fanindra.n@email.com', 'Kathmandu', '2023-11-08'),
(12, 'Geeta Poudel', 'geeta.p@email.com', 'Bhaktapur', '2023-12-01'),
(13, 'Himal Lama', 'himal.l@email.com', 'Lalitpur', '2024-01-10'),
(14, 'Indira KC', 'indira.kc@email.com', 'Pokhara', '2024-02-14'),
(15, 'Jeevan Bhandari', 'jeevan.b@email.com', 'Kathmandu', '2024-03-20');

select name, customer_id
from customers 
order by 1 desc,2 desc ;


select *
from customers order by 1 desc
limit 1;

-- =====================================================
-- TABLE 2: PRODUCTS
-- =====================================================
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Laptop', 'Electronics', 85000.00),
(102, 'Smartphone', 'Electronics', 45000.00),
(103, 'Tablet', 'Electronics', 35000.00),
(104, 'Headphones', 'Electronics', 5000.00),
(105, 'Mouse', 'Electronics', 1500.00),
(106, 'Keyboard', 'Electronics', 2500.00),
(107, 'Winter Jacket', 'Clothing', 3500.00),
(108, 'T-Shirt', 'Clothing', 800.00),
(109, 'Jeans', 'Clothing', 2200.00),
(110, 'Sneakers', 'Clothing', 4500.00),
(111, 'Backpack', 'Accessories', 2800.00),
(112, 'Watch', 'Accessories', 8500.00),
(113, 'Sunglasses', 'Accessories', 1800.00),
(114, 'Water Bottle', 'Accessories', 450.00),
(115, 'Desk Lamp', 'Home', 1200.00),
(116, 'Coffee Maker', 'Home', 6500.00),
(117, 'Blender', 'Home', 3800.00),
(118, 'Rice Cooker', 'Home', 4200.00),
(119, 'Notebook Set', 'Stationery', 350.00),
(120, 'Pen Pack', 'Stationery', 180.00);

-- =====================================================
-- TABLE 3: ORDERS
-- =====================================================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001, 1, '2024-01-05', 'Delivered'),
(1002, 2, '2024-01-08', 'Delivered'),
(1003, 3, '2024-01-10', 'Delivered'),
(1004, 1, '2024-01-15', 'Delivered'),
(1005, 4, '2024-01-18', 'Delivered'),
(1006, 5, '2024-01-22', 'Delivered'),
(1007, 6, '2024-01-25', 'Delivered'),
(1008, 2, '2024-02-01', 'Delivered'),
(1009, 7, '2024-02-05', 'Delivered'),
(1010, 8, '2024-02-10', 'Delivered'),
(1011, 3, '2024-02-14', 'Delivered'),
(1012, 9, '2024-02-18', 'Delivered'),
(1013, 1, '2024-02-22', 'Delivered'),
(1014, 10, '2024-02-28', 'Delivered'),
(1015, 11, '2024-03-05', 'Delivered'),
(1016, 4, '2024-03-10', 'Delivered'),
(1017, 12, '2024-03-15', 'Delivered'),
(1018, 5, '2024-03-20', 'Delivered'),
(1019, 13, '2024-03-25', 'Delivered'),
(1020, 6, '2024-03-30', 'Shipped'),
(1021, 14, '2024-04-02', 'Shipped'),
(1022, 7, '2024-04-05', 'Processing'),
(1023, 15, '2024-04-08', 'Processing'),
(1024, 8, '2024-04-10', 'Processing'),
(1025, 2, '2024-04-12', 'Pending');

-- =====================================================
-- TABLE 4: ORDER_ITEMS
-- =====================================================
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 101, 1, 85000.00),
(2, 1001, 104, 2, 5000.00),
(3, 1002, 102, 1, 45000.00),
(4, 1002, 108, 3, 800.00),
(5, 1003, 107, 2, 3500.00),
(6, 1003, 109, 1, 2200.00),
(7, 1004, 103, 1, 35000.00),
(8, 1004, 105, 1, 1500.00),
(9, 1005, 111, 1, 2800.00),
(10, 1005, 112, 1, 8500.00),
(11, 1006, 116, 1, 6500.00),
(12, 1006, 114, 2, 450.00),
(13, 1007, 102, 1, 45000.00),
(14, 1007, 106, 1, 2500.00),
(15, 1008, 110, 1, 4500.00),
(16, 1008, 108, 2, 800.00),
(17, 1009, 115, 2, 1200.00),
(18, 1009, 119, 5, 350.00),
(19, 1010, 117, 1, 3800.00),
(20, 1010, 118, 1, 4200.00),
(21, 1011, 101, 1, 85000.00),
(22, 1011, 113, 1, 1800.00),
(23, 1012, 104, 1, 5000.00),
(24, 1012, 106, 2, 2500.00),
(25, 1013, 112, 1, 8500.00),
(26, 1014, 107, 1, 3500.00),
(27, 1014, 109, 2, 2200.00),
(28, 1015, 103, 1, 35000.00),
(29, 1016, 110, 2, 4500.00),
(30, 1016, 111, 1, 2800.00),
(31, 1017, 116, 1, 6500.00),
(32, 1017, 117, 1, 3800.00),
(33, 1018, 102, 1, 45000.00),
(34, 1019, 118, 2, 4200.00),
(35, 1019, 115, 1, 1200.00),
(36, 1020, 105, 3, 1500.00),
(37, 1020, 106, 2, 2500.00),
(38, 1021, 108, 4, 800.00),
(39, 1021, 119, 10, 350.00),
(40, 1022, 104, 2, 5000.00),
(41, 1023, 101, 1, 85000.00),
(42, 1023, 102, 1, 45000.00),
(43, 1024, 113, 2, 1800.00),
(44, 1024, 114, 3, 450.00),
(45, 1025, 107, 1, 3500.00);

-- =====================================================
-- TABLE 5: DAILY_SALES (for time-series analysis)
-- =====================================================
CREATE TABLE daily_sales (
    sale_date DATE PRIMARY KEY,
    total_orders INT,
    total_revenue DECIMAL(10, 2)
);


INSERT INTO daily_sales (sale_date, total_orders, total_revenue) VALUES
('2024-01-01', 5, 45000.00),
('2024-01-02', 8, 62000.00),
('2024-01-03', 6, 48000.00),
('2024-01-04', 12, 95000.00),
('2024-01-05', 9, 71000.00),
('2024-01-06', 4, 32000.00),
('2024-01-07', 3, 28000.00),
('2024-01-08', 7, 55000.00),
('2024-01-09', 11, 88000.00),
('2024-01-10', 10, 78000.00),
('2024-01-11', 8, 64000.00),
('2024-01-12', 6, 51000.00),
('2024-01-13', 5, 42000.00),
('2024-01-14', 4, 35000.00),
('2024-01-15', 9, 72000.00),
('2024-01-16', 13, 105000.00),
('2024-01-17', 11, 89000.00),
('2024-01-18', 8, 67000.00),
('2024-01-19', 7, 58000.00),
('2024-01-20', 5, 43000.00),
('2024-01-21', 4, 36000.00),
('2024-01-22', 10, 82000.00),
('2024-01-23', 12, 96000.00),
('2024-01-24', 9, 74000.00),
('2024-01-25', 8, 65000.00),
('2024-01-26', 6, 52000.00),
('2024-01-27', 5, 44000.00),
('2024-01-28', 4, 37000.00),
('2024-01-29', 11, 91000.00),
('2024-01-30', 14, 115000.00),
('2024-01-31', 10, 83000.00);







-----------------------------------------------------------------------------------------------------------------------
-- SQL Basic and Intermediate
-----------------------------------------------------------------------------------------------------------------------

-- ============================================
-- SQL BASICS PRACTICE QUERIES
-- ============================================

-- ============================================
-- 1. SELECT (Retrieve Data)
-- ============================================

-- Get all customers
SELECT * FROM customers;

-- Get specific columns (name and city)
SELECT name, city FROM customers;


-- ============================================
-- 2. WHERE (Filtering Data)
-- ============================================

-- Customers from Kathmandu
SELECT * 
FROM customers
WHERE city = 'Kathmandu';


SELECT * 
FROM customers
WHERE city like 'Kathmandu';

-- Orders after Feb 1, 2024
SELECT * 
FROM orders
WHERE order_date > '2024-02-01';


-- ============================================
-- 3. ORDER BY (Sorting Data)
-- ============================================

-- Customers sorted alphabetically by name
SELECT * 
FROM customers
ORDER BY name ASC;

-- Products sorted by price (highest first)
SELECT * 
FROM products
ORDER BY price DESC;


-- ============================================
-- 4. GROUP BY (Grouping Data)
-- ============================================

-- Count number of customers in each city
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- Total revenue per product
SELECT product_id, SUM(quantity * unit_price) AS revenue
FROM order_items
GROUP BY product_id;


-- ============================================
-- 5. AGGREGATE FUNCTIONS
-- ============================================

-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total sales revenue
SELECT SUM(quantity * unit_price) AS total_sales
FROM order_items;

-- Average product price
SELECT AVG(price) AS avg_price
FROM products;

-- Minimum product price
SELECT MIN(price) AS min_price
FROM products;

-- Maximum product price
SELECT MAX(price) AS max_price
FROM products;


---------------------Having Clause

--- categories witrh the average price greater than 5000

SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 5000;



-- ============================================
-- 6. INNER JOIN (Matching Records Only)
-- ============================================

-- Get order details with customer names

SELECT o.order_id, c.name, o.order_date
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


-- ============================================
-- 7. LEFT JOIN (All Left + Matching Right)
-- ============================================

-- All customers and their orders (if any)
SELECT c.name, o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================================
-- 8. RIGHT JOIN (All Right + Matching Left)
-- ============================================

-- All orders with customer info
SELECT c.name, o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================================
-- 9. FULL JOIN (All Records from Both)
-- ============================================

-- All customers and all orders (matched + unmatched)
SELECT c.name, o.order_id
FROM customers c
FULL OUTER JOIN orders o
ON c.customer_id = o.customer_id;


-- ============================================
-- 10. FILTER + GROUP BY
-- ============================================

-- Total orders per city
SELECT c.city, COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city;


-- ============================================
-- 11. SORT + AGGREGATION
-- ============================================

-- Top selling products by revenue
SELECT product_id, SUM(quantity * unit_price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC;



SELECT * FROM products WHERE price > 500 AND category = 'Electronics';

SELECT * FROM customers WHERE city = 'Kathmandu' OR city = 'Pokhara';


SELECT * FROM customers WHERE city not in('Kathmandu', 'Pokhara');


SELECT * FROM orders WHERE NOT status = 'Pending';




SELECT 'Kathmandu' AS city
UNION
SELECT 'Kathmandu';



SELECT 'Kathmandu' AS city
UNION ALL
SELECT 'Kathmandu';


SELECT order_date,
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month
FROM orders o




CREATE TABLE constraint_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2)
    	check (price > 0),
    stock_qty int default 0,
    made_in char(5) ---fill extra part by space
);

INSERT INTO constraint_products (product_id, product_name, category, price, stock_qty, made_in) VALUES
(100.5, 'Laptop', 'Electronics', 18000.00,default,'c'),
(102, 'Smartphone', 'Electronics', 45000.00,1,'Nepal'),
(103, 'Tablet', 'Electronics', 35000.00,2,'Nepal'),
(104, 'Headphones', 'Electronics', 5000.00,3,'Nepal');


select *
from constraint_products

drop table constraint_orders




CREATE TABLE constraint_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    	check (status in ('Pending','Processing'))
);


INSERT INTO constraint_orders (order_id, customer_id, order_date, status) VALUES
(1, 101, '2026-03-01', 'Pending'),
(2, 102, '2026-03-02', 'Processing'),
(3, 103, '2026-03-03', 'Pending'),
--(4, 103, '2026-03-03', 'Delivered');



select *
from constraint_orders


INSERT INTO constraint_orders (order_id, customer_id, order_date, status)
VALUES (5, 200, '2026-03-10', NULL);


-------calculate the total number of orders and total sales for each month.
-- The output should show the year, month, total orders, and total sales, sorted by year and month.


SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    EXTRACT(MONTH FROM o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
GROUP BY 
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date)
ORDER BY year, month;





-------------------------------------------------------------------------------------------------------------------------
-- Advance SQL
-------------------------------------------------------------------------------------------------------------------------

-- =========================================
-- DROP TABLES (if exist)
-- =========================================
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS teachers;

-- =========================================
-- CREATE TABLES
-- =========================================

CREATE TABLE teachers (
    teacher_id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    teacher_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE subjects (
    subject_id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    subject_name VARCHAR(100),
    teacher_id INT REFERENCES teachers(teacher_id)
);


CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    student_name VARCHAR(100),
    city VARCHAR(50),
    is_active BOOLEAN
);

CREATE TABLE enrollments (
    enrollment_id INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    subject_id INT REFERENCES subjects(subject_id),
    grade VARCHAR(5)
);

/*
 * DQL Test
 */

select * from teachers;

select * from students;

select * from enrollments;

select * from subjects;


-- =========================================
-- INSERT DATA
-- =========================================

-- Teachers
INSERT INTO teachers (teacher_name, city) 
values	('Ramesh Shrestha', 'Kathmandu'),
		('Sunita Tamang', 'Pokhara'),
		('Sandesh Adhikari', 'Kathmandu'),
		('Anita Maharjan', 'Lalitpur');




-- Subjects
INSERT INTO subjects(subject_name, teacher_id) 
VALUES('Mathematics', 1),
('Computer Science', 2),
('Accountancy', 3),
('English', 3),
('Physics', NULL);


select *
from subjects



ALTER TABLE teachers
DROP COLUMN phone;




-- Students
INSERT INTO students (student_name, city, is_active)  VALUES
('Aarav Thapa', 'Kathmandu', TRUE),
('Priya Gurung', 'Pokhara', TRUE),
('Suman Poudel', 'Butwal', TRUE),
('Kabita Shrestha', 'Kathmandu', FALSE),
('Rohan Dahal', 'Chitwan', TRUE);



select *
from students

SELECT student_name, is_active::text AS is_active
FROM students;



-- Enrollments
INSERT INTO enrollments (student_id, subject_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B+'),
(1, 3, 'A'),
(2, 1, 'B'),
(2, 2, 'A+'),
(3, 3, 'C'),
(3, 4, 'B'),
(4, 1, 'A');


select *
from enrollments


-----------------------------------------------------------

-- Alter to Add column

alter table students
add column email varchar(200);

alter table students
add column joined_date date;


select * from students;


alter table teachers
add column phone varchar(10),
add column email varchar(100) default null;

select * from teachers;

-- Alter column to modify column

alter table students
alter column joined_date type varchar(10);

-- Alter column to rename column

alter table teachers
rename column phone to Mobile_Number


select * from teachers;

alter table teachers
drop column mobile_number;


----- DML 

--- Insert
insert 



-- Update

update teachers
set email = 'Ramesh@gmail.com'


update teachers
set email = null
where email = 'Ramesh@gmail.com'

select concat(split_part(teacher_name,' ',1),'.', split_part(teacher_name,' ',2),'@skillshikyateachers.com')
from teachers

update teachers
set email = concat(split_part(teacher_name,' ',1),'.', split_part(teacher_name,' ',2),'@skillshikyateachers.com')
	





-- DML to Delete

delete from teachers
where email

create user luman;

create user suman;

grant select on students to suman;

revoke select on students from suman;
------------------------------


------one to many

SELECT s.subject_name, t.teacher_name
FROM subjects s
JOIN teachers t ON s.teacher_id = t.teacher_id;


SELECT t.teacher_name,
  COUNT(s.subject_id) AS total
FROM teachers t
JOIN subjects s ON t.teacher_id = s.teacher_id
GROUP BY t.teacher_name;



-----many to many

SELECT st.student_name, su.subject_name, e.grade
FROM enrollments e
JOIN students st ON e.student_id = st.student_id
JOIN subjects  su ON e.subject_id = su.subject_id;


select * from enrollments e;

select * from student s;



------union

SELECT city FROM teachers
UNION
SELECT city FROM students;


----union all

SELECT city FROM teachers
UNION ALL
SELECT city FROM students;


---self join

SELECT a.student_name AS student_1,
       b.student_name AS student_2, a.city
FROM students a
JOIN students b ON a.city = b.city
             AND a.student_id < b.student_id and ;



SELECT st.student_name, su.subject_name
FROM students st
Cross JOIN subjects su
ORDER BY st.student_name;


select *
from subjects


------------------------------------------------------
-- TCL
-----------------------------------------------------


BEGIN;  -- Start the transaction

  -- Step 1: Add the student
  INSERT INTO students (student_name, city, is_active)
  VALUES ('Manisha Lama', 'Kathmandu', TRUE);



COMMIT;  -- Save both changes together

--- RollBack

BEGIN;  -- Start the transaction

delete from students
where student_name = 'Manisha Lama'; 

rollback;

COMMIT; 



--- Save point

BEGIN;  -- Start the transaction

  INSERT INTO students (student_name, city, is_active)
  VALUES ('Anisha Lama', 'Pokhara', TRUE);
  
  savepoint after_students;
  
  INSERT INTO students (student_name, city, is_active)
  VALUES ('Tshering Sherpa', 'Manang', TRUE);
  
rollback to after_students;

COMMIT; 



select * 
from students


---------------------------------------------------------------------------------------------------------------------------------------------


select *
from Students;


select *
from orders



SELECT 
    c.city,
    COUNT(CASE WHEN o.status = 'Delivered' THEN 1 END) AS Delivered,
    COUNT(CASE WHEN o.status = 'Shipped' THEN 1 END) AS Shipped,
    COUNT(CASE WHEN o.status = 'Processing' THEN 1 END) AS Processing
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;



SELECT 
    o.customer_id,
    COUNT(CASE WHEN o.status = 'Delivered' THEN 1 END) AS Delivered,
    COUNT(CASE WHEN o.status = 'Shipped' THEN 1 END) AS Shipped,
    COUNT(CASE WHEN o.status = 'Processing' THEN 1 END) AS Processing
FROM orders o
group by 1 order by 1


select *
from customers


SELECT name, city,
       ROW_NUMBER() OVER (ORDER BY name) AS row_num
FROM customers order by 1;



SELECT product_name, price,
       RANK() OVER (ORDER BY price DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY price DESC) AS dense_rank
FROM products;



SELECT sale_date, total_revenue,
       LAG(total_revenue, 1) OVER (ORDER BY sale_date) AS prev_day,
       LEAD(total_revenue, 1) OVER (ORDER BY sale_date) AS next_day
FROM daily_sales;




WITH customer_totals AS (
  SELECT c.customer_id,c.name,c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity*oi.unit_price) AS total_spent
  FROM customers c
  JOIN orders o ON c.customer_id=o.customer_id
  JOIN order_items oi ON o.order_id=oi.order_id
  GROUP BY c.customer_id,c.name,c.city
)
SELECT name,city,total_orders,total_spent
FROM   customer_totals
WHERE  total_spent > 50000
ORDER  BY total_spent DESC;


WITH customer_cte_ktm AS (
  SELECT 
    customer_id,
    name,
    city
  FROM customers
  WHERE city = 'Kathmandu'
)
SELECT *
FROM customer_cte_ktm;


CREATE TEMP TABLE temp_customers AS
SELECT 
  customer_id,
  name,
  city
FROM customers
WHERE city = 'Kathmandu';

SELECT *
FROM temp_customers;


DROP TABLE temp_customers;





--nested query

SELECT product_name, category, price
FROM products p1
WHERE price = (
    SELECT MAX(price) FROM products p2
    WHERE p2.category = p1.category   -- References outer query!
);


--sub query

SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);




-------------------windows function

CREATE TABLE windows_function_table (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    score INT
);

INSERT INTO windows_function_table VALUES
(1, 'A', 'Kathmandu', 90),
(2, 'B', 'Kathmandu', 80),
(3, 'C', 'Kathmandu', 80),
(4, 'D', 'Kathmandu', 70),

(5, 'E', 'Pokhara', 95),
(6, 'F', 'Pokhara', 95),
(7, 'G', 'Pokhara', 85),
(8, 'H', 'Pokhara', 80);


select *
from windows_function_table


SELECT 
    id,
    name,
    city,
    score,

    ROW_NUMBER() OVER (
        PARTITION BY city 
        ORDER BY score DESC
    ) AS row_num,

    RANK() OVER (
        PARTITION BY city 
        ORDER BY score DESC
    ) AS rank_num,

    DENSE_RANK() OVER (
        PARTITION BY city 
        ORDER BY score DESC
    ) AS dense_rank_num

FROM windows_function_table;



