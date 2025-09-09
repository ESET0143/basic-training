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

select u.name, b.title
from users u inner join orders o on u.user_id=o.user_id
inner join books b on o.product_id=b.product_id 
where b.price in(select max(price) from books);
