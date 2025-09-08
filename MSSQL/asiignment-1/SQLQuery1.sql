use db;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    user_id INT PRIMARY KEY, 
    email VARCHAR(50), 
    name VARCHAR(20)
);

-- Create the books table
-- 'products_id' is the logical PRIMARY KEY, so it must be a unique column.
-- It is also good practice to define it as a primary key.
CREATE TABLE books (
    products_id INT PRIMARY KEY,
    tittle VARCHAR(40),
    price FLOAT
);

-- Create the orders table
-- 'order_id' is the PRIMARY KEY of this table.
-- 'user_id' is a FOREIGN KEY referencing the 'users' table.
-- 'products_id' (not 'products') is a FOREIGN KEY referencing the 'books' table.
-- The columns for foreign keys must be created in the table before the constraint is defined.
-- A foreign key must reference a primary key or unique key in another table.
CREATE TABLE orders (
    order_id INT PRIMARY KEY, 
    user_id INT,
    products_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (products_id) REFERENCES books(products_id)
);


INSERT INTO users (user_id, email, name) VALUES
(1, 'callmebhai@gmail.com', 'gopal'),
(2, 'toxicmajhi@gmail.com', 'manjith'),
(3, 'kalajadu@gmail.com', 'soumya'),
(5, 'ghostlaugh@gmail.com', 'jaisai'),
(4, 'vimalpanmasal@gmail.com', 'ajaydev');

-- Always order your SELECT statements for predictable results
SELECT * FROM users ORDER BY user_id;

-- This UPDATE statement is correct
UPDATE users SET name='namita' WHERE user_id=5;

INSERT INTO books (products_id, tittle, price) VALUES
(101, 'mssql', 100),
(102, 'half girl friend', 699),
(103, 'black magic', 700),
(104, 'how to marpha', 1000),
(105, 'AOT', 20001);

INSERT INTO books (products_id, tittle, price) VALUES (106, 'how to laugh', 2005);

INSERT INTO orders (order_id, user_id, products_id) VALUES (401, 1, 101),(402, 2, 102),(403, 3, 103),(404, 4, 104),(405,4,105);

EXEC sp_help orders;



select * from books;
select * from users;








