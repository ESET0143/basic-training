Use db
----to delete tables even contrains are presesnt!!!
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;
create table users(user_id int primary key, email varchar(20), name varchar(50));

create table books( product_id int primary key, title varchar(50), price float);

create table orders(
order_no int primary key, user_id int, product_id int, 
foreign key (product_id) references books(product_id), 
foreign key (user_id) references users(user_id));

insert into users values(1, 'Callmebhai@gmail.com', 'Gopal'), (2, 'toxicmanji@gmail.com', 'Manjit'), 
(3,'kalajadu@gmail.com', 'SowmayDeep'), (4, 'Vimalpan@gmail.com', 'Jaisai'), (5,'ghostlaugh@gmail.com', 'Namitha');

insert into books values(101, 'MSSQL', 100),(102, 'half girlfriend', 699.0), (103,'Blackmagic', 700), (104,'Marfa',2000),(105, 'howtolaugh', 2001);

insert into orders values(401, 1 ,101),(402, 2,103), (403, 2, 102), (404, 3, 103),(405,3,104), (406,4,102),(407,5,105),(408,5,102);
-- More orders for existing users
INSERT INTO orders VALUES
(409, 1, 102),  -- Gopal orders another 'Introduction to Python'
(410, 2, 101),  -- Manjit orders 'MSSQL'
(411, 3, 105),  -- SowmayDeep orders 'howtolaugh'
(412, 4, 103),  -- Jaisai orders 'Blackmagic'
(413, 5, 101);  -- Namitha orders another 'MSSQL'

-- Add some duplicate book orders for testing purposes
INSERT INTO orders VALUES
(414, 1, 101),  -- Gopal orders 'MSSQL' again
(415, 2, 102),  -- Manjit orders 'Introduction to Python' again
(416, 3, 104);  -- SowmayDeep orders 'Marfa' again


select u.name, b.title
from users u inner join orders o on u.user_id=o.user_id
inner join books b on o.product_id=b.product_id 
where b.price in(select max(price) from books);
select * from orders
select * from users
select * from books


---1 Find all the books, all the users and all the order

select u.name,o.order_no,b.title
from users u
inner join orders o
on u.user_id = o.user_id
inner join  books b 
on o.product_id = b.product_id;




--2 Find all orders

select * from orders


--3Find particular user who has order these books

select u.name,o.order_no,b.title
from users u
inner join orders o
on u.user_id = o.user_id
inner join  books b 
on o.product_id = b.product_id
where u.name='Manjit'


--4 Find books users has order

select b.title,u.name
from users u
inner join orders o
on u.user_id = o.user_id
inner join  books b 
on o.product_id = b.product_id
order by b.title;

--5. find total price of books user has order

select sum(b.price)
from users u
inner join orders o
on u.user_id = o.user_id
inner join  books b 
on o.product_id = b.product_id;

--6. Find the most valuable user


select top 1 u.name ,sum(b.price) as total
from users u
inner join orders o
on u.user_id = o.user_id
inner join  books b 
on o.product_id = b.product_id
group by u.name
order by total desc ; 



--7. Find the range of books from high to low

select title,price from books 
order by price desc;


--8. Find the highest price book
select top 1 title,price from books 
order by price desc;


--9 findthe cheapest book

select top 1 title,price from books 
order by price ;

--find newly added books



--------------



----------Tasks

/*Assignment 1 : Top N Books per User
Find the top 2 most expensive books purchased by each user.
. Use joins (orders > books > users)
· Apply ROW_NUMBER(), RANK(), and DENSE_RANK() with
PARTITION BY user id and ORDER BY price DESC
*/


select * ,
row_number () over(partition by u.user_id order by b.price desc) as row__number ,
rank () over(partition by u.user_id order by b.price desc) as rank_number ,
dense_rank () over(partition by u.user_id order by b.price desc) as denseRank_number 
from users u
inner join orders o
on u.user_id = o.user_id
inner join  books b 
on o.product_id = b.product_id












/*
Assignment 2 : Ranking Users by Total Spending
Find how much each user spent in total and rank them
. Use Sum(price) with PARTITION BY user id
. Apply RANK() and DENSE_RANK() to order users by total spending.
*/



