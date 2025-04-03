create table sales(s_id int primary key,p_id int,quantity int,sale_date date,total_price int);
insert into sales (s_id, p_id, quantity, sale_date, total_price)
values 
(1, 101, 5, '2025-02-01', 150),
(2, 102, 3, '2025-02-02', 90),
(3, 103, 10, '2025-02-03', 300),
(4, 104, 2, '2025-02-04', 60),
(5, 105, 7, '2025-02-05', 210),
(6, 106, 4, '2025-02-06', 120),
(7, 107, 8, '2025-02-07', 240),
(8, 108, 6, '2025-02-08', 180),
(9, 109, 9, '2025-02-09', 270),
(10, 110, 1, '2025-02-10', 30),
(11, 111, 12, '2025-02-11', 360),
(12, 112, 5, '2025-02-12', 150),
(13, 113, 15, '2025-02-13', 450),
(14, 114, 3, '2025-02-14', 90),
(15, 115, 4, '2025-02-15', 120),
(16, 116, 2, '2025-02-16', 60),
(17, 117, 10, '2025-02-17', 300),
(18, 118, 6, '2025-02-18', 180),
(19, 119, 7, '2025-02-19', 210),
(20, 120, 9, '2025-02-20', 270);

create table products(p_id int primary key,p_name varchar(50),category varchar(25),unit_price int);
insert into products (p_id, p_name, category, unit_price)
values 
(101, 'Laptop', 'Electronics', 1000),
(102, 'Smartphone', 'Electronics', 700),
(103, 'Tablet', 'Electronics', 400),
(104, 'Headphones', 'Electronics', 100),
(105, 'Smartwatch', 'Electronics', 250),
(106, 'Keyboard', 'Accessories', 50),
(107, 'Mouse', 'Accessories', 25),
(108, 'Monitor', 'Electronics', 200),
(109, 'Charger', 'Accessories', 30),
(110, 'USB Cable', 'Accessories', 10),
(111, 'Sofa', 'Furniture', 500),
(112, 'Dining Table', 'Furniture', 300),
(113, 'Bookshelf', 'Furniture', 150),
(114, 'Armchair', 'Furniture', 200),
(115, 'Coffee Table', 'Furniture', 100),
(116, 'T-Shirt', 'Clothing', 20),
(117, 'Jeans', 'Clothing', 40),
(118, 'Jacket', 'Clothing', 60),
(119, 'Shoes', 'Clothing', 80),
(120, 'Hat', 'Clothing', 15);

-- Ans :1  
select * from sales;

-- Ans : 2 
 select p_name,unit_price from products;


-- Ans : 3
select quantity,total_price from sales where total_price > 100;


-- Ans : 4
select * from products where category = 'Electronics';

-- Ans : 5
select sum(total_price) as total_revenue from sales;


-- Ans : 6
select sum(quantity) as total_quantity_sold from sales;


-- Ans : 7
select sale_date, COUNT(s_id) as sales_count from sales group by sale_date;


-- Ans : 8
select p_name,unit_price from products order by unit_price desc;  


-- Ans : 9
select s_id,p_id,total_price from sales where quantity >4;


-- Ans : 10
select sum(s.total_price) as total_revenue from sales as s join products as p on s.p_id = p.p_id
 where  category = 'Electronics';


-- Ans : 11
select p_name , unit_price from products where unit_price between 20 and 600;


-- Ans : 12
select sum(s.quantity) as total_quantity_sold from sales as s join products as p 
	 on s.p_id = p.p_id where p.category = 'Electronics';








