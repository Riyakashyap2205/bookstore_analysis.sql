-- creaate tables for books, customers, orders
drop table book;
drop table if exists Books;
create table books(
	Book_id serial primary key,
	Title varchar(100),
	Author varchar(100),
	Genre varchar(50),
	Published_year int,
	price numeric (10,2),
	stock int
);
select * from books;

drop table if exists customers;
create table customers(
	Customer_id serial primary key,
	Customer_name varchar(100),
	Email varchar(100),
	Phone varchar(15),
	City varchar(50),
	Country varchar (150)
);
select * from customers;

drop table if exists orders;
create table orders(
	Order_id serial primary key,
	Customer_id int references customers(customer_id),
	Book_id int references books(book_id),
	Order_date date,
	Quantity int,
	Total_amount numeric(10,2)
);
select * from orders; 
select * from books;
select * from customers;


-- Basic queries --
-- Retieve all books in the 'fiction' genre
select * from books 
where Genre in('Fiction');

-- Find books published after the year 1950
select *from books
where published_year>=1950;

-- books that publishes btn 1950 and 2000
select*from books
where published_year between 1950 and 2000;

-- List all customers from canada
select customer_name from customers
where country = 'Canada';

-- Show orders places in nov 2023
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

-- Retrieve the total stock of books available
select sum(stock) as total_stock from books;

-- Find the details of the most expensive book
select * from books where price=(select max(price) from books) ;

-- Show all customers who ordered more than 1 quantity of a book
select * from orders
where orders.quantity>1; 

-- Retrieve all orders where the total amount exceeds $20
select * from orders
where total_amount>20;

-- List all genres available in the Books table
select distinct genre from books;

-- Find the book with the lowest stock
SELECT *
FROM books
WHERE stock = (SELECT MIN(stock) FROM books
);

-- Calculate the total revenue generated from all orders 
select sum(total_amount) as total_rev
from orders; 


-- Advance queries --
--  Retrieve the total number of books sold for each genre
select
	b.genre,
	sum(o.quantity) as total_books_sold
from orders o
join books b
on o.book_id=b.book_id
group by b.genre;

-- Find the average price of books in the "Fantasy" genre
select * from books;
select avg(price) as avg_price 
from books
where genre='Fantasy';

-- List customers who have placed at least 2 orders
select customer_id, count(*) as total_orders
from orders
group by customer_id
having count(*) >= 2;

-- Find the most frequently ordered book
select 
	b.book_id,b.title,
	sum(o.quantity) as total_sold
from books b
join orders o
on b.book_id=o.book_id
group by b.book_id, b.title
order by total_sold desc
limit 1;

-- Show the top 3 most expensive books of 'Fantasy' Genre 
select * from books;
select title,price from books 
where genre ='Fantasy'
order by price desc
limit 3;

-- Retrieve the total quantity of books sold by each author
select 
	b.author,
	sum(o.quantity) as total_sold
from books b
join orders o
on b.book_id=o.book_id
group by b.author
order by total_sold desc;

-- List the cities where customers who spent over $30 are located
select
	distinct c.city
from customers c
join orders o
on c.customer_id=o.customer_id
where o.total_amount>30;

-- Find the customer who spent the most on orders
select 
	c.customer_name,
	sum(o.total_amount) as max_spent
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.customer_name
order by max_spent desc
limit 1;

-- Calculate the stock remaining after fulfilling all orders
select 
	b.book_id,b.title,b.stock,
	sum(o.quantity) as sold_books,
	b.stock-sum(o.quantity) as remaining_stock
from books b
join orders o
on b.book_id=o.book_id
group by b.book_id,b.title,b.stock;























	