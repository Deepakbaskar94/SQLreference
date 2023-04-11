#Drop database if exists and create a new one
DROP DATABASE IF EXISTS sql_invoicing;
CREATE DATABASE sql_invoicing; 

#Create a table 
CREATE TABLE payment_methods (
  payment_method_id tinyint(4) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  PRIMARY KEY (payment_method_id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#Inserting data into a table
INSERT INTO payment_methods VALUES (1,'Credit Card'); 
#or
INSERT INTO payment_methods(payment_method_id, name) VALUES (1,'Credit Card');

#DELETE - remove particular row from the table
DELETE FROM Customers WHERE customer_id = 3;

#ALTER - adding a column to an already existing table
ALTER TABLE Customers ADD email varchar(20);

#ALTER - modifying a column data type from an already existing table
ALTER TABLE Customers MODIFY COLUMN email varchar(255); 

#ALTER - removing a column from a table
ALTER TABLE Customers DROP COLUMN email;

#RENAME - changing the name of the table
ALTER TABLE customers RENAME new_customers;

#Same as the above query
RENAME TABLE new_customers TO customers;

#DROP - Deleting a table
DROP TABLE customers; 

#TRUNCATE - deleting only data of the table
TRUNCATE TABLE customers; 

#Mentioning which database to use
USE sql_store;

#Select statement with alias for column name
SELECT name, unit_price, unit_price * 1.1 AS new_price
FROM products;

#WHERE - Select statement with a condition
SELECT * 
FROM Customers
WHERE points > 3000;

#UPDATE - update data of a particular table
UPDATE customers
SET points = points + 50
WHERE birth_date <='1990-01-01';

#AND - returns records which satisfy both the conditions
SELECT * , (unit_price * quantity) AS total_price 
FROM order_items
WHERE order_id = 6 AND (unit_price * quantity) > 30;

#OR - returns records whose first_name matches either of the two
SELECT *
FROM customers
WHERE first_name = "Elka" OR first_name = "Ambur";

/*
* IN - returns the records which contain the value specified 
* NOT IN - returns records other than the specified values
*/
SELECT * 
FROM products
WHERE quantity_in_stock IN (49, 38, 72);

#NOT IN - returns records whose first_name does not contain the specified values
SELECT *
FROM customers
WHERE first_name NOT IN ("Elka", "Ambur");

#BETWEEN - returns the records within the range of values specified, inclusive 
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

#LIKE - matches a pattern
SELECT *
FROM customers
WHERE (address LIKE '%Avenue%' OR address LIKE '%Trail%') AND phone LIKE '%9';

#REGEXP - returns if the record matches either of the column value
SELECT *
FROM customers
WHERE first_name REGEXP "Elka|Ambur";

#$ - returns records whose last_name ends with ey or on
SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';

#^ - returns records whose last_name starts with my or contain se
SELECT *
FROM customers
WHERE last_name REGEXP '^my|se'; 

#[] - returns records whose last_name contains br or bu
SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]';

#IS NOT NULL - returns records whose specified column value is not null
SELECT *
FROM orders
WHERE shipper_id IS NOT NULL;

#ORDER BY - orders the records in the specified order based on the given column
SELECT *
FROM Order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC;

#LIMIT - limits the number of records returned to the value specified
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

#LIMIT with OFFSET - returns the number of records with a offset value
SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3, 3; -- offset, limit

#INNER JOIN - Joining two tables based on a common column : returns only matched records
SELECT order_id, o.product_id, quantity, name 
FROM order_items o
JOIN products p ON o.product_id = p.product_id; 

#INNER JOIN - Joining multiple tables together based on a common column
SELECT o.order_id, o.product_id, quantity, name 
FROM ((order_items o
JOIN products p ON o.product_id = p.product_id)
JOIN order_item_notes oin ON o.order_id = oin.order_id); 

#Same as the above query without paranthesis
SELECT o.order_id, o.product_id, quantity, name 
FROM order_items o
JOIN products p ON o.product_id = p.product_id
JOIN order_item_notes oin ON o.order_id = oin.order_id;

USE sql_hr;

#INNER JOIN along with alias for column name
SELECT e.employee_id, e.first_name, e.job_title, e.reports_to, m.first_name AS manager
FROM employees e
JOIN employees m ON e.reports_to = m.employee_id;

USE sql_invoicing;

#INNER JOIN - multiple tables
SELECT p.payment_id, c.client_id, c.name, invoice_id, date, amount, pm.name, c.city, c.state, c.phone
FROM payments p
JOIN payment_methods pm ON p.payment_method = pm.payment_method_id
JOIN clients c ON c.client_id = p.client_id;

USE sql_store;

#RIGHT OUTER JOIN - Joins table based on the given column name 
#returns records with matched column from the left table and all the records from the right table
SELECT p.product_id, quantity, name  
FROM order_items oi
RIGHT JOIN products p ON oi.product_id = p.product_id; 

SELECT order_id, p.product_id, quantity, name  
FROM order_items oi  
RIGHT JOIN products p ON oi.product_id = p.product_id;

#LEFT OUTER JOIN on multiple tables
#returns records with matched column from the right table and all the records from the left table
SELECT o.order_id, o.product_id, quantity, name  
FROM order_items o 
LEFT JOIN products p ON o.product_id = p.product_id 
JOIN order_item_notes oin ON o.order_id = oin.order_id;

#USING 
#Same as above query but with USING clause - can be used only if the column names match
SELECT o.order_id, o.product_id, quantity, name  
FROM order_items o 
LEFT JOIN products p  
USING (product_id) 
JOIN order_item_notes oin 
USING (order_id); 

#NATURAL JOIN - Finds the common column name and performs the JOIN operation 
SELECT oi.order_id, oi.product_id, quantity  
FROM order_items oi 
NATURAL LEFT JOIN orders o; 

#NATURAL JOIN - No common column name, so returns everything
SELECT oi.order_id, oi.product_id, quantity, name  
FROM order_items oi 
NATURAL LEFT JOIN order_statuses os; 

#CROSS JOIN - returns all records whether they match or not
#Explicit Cross Join
SELECT *
FROM products p
CROSS JOIN shippers sh;

#Implicit Cross Join
SELECT *
FROM products p, shippers sh;

USE sql_store;

#Subqueries - Query within the parenthesis will be executed first and then its result is used to execute the outer query
UPDATE orders
SET comments = "Gold Customer"
WHERE customer_id IN (SELECT customer_id 
					FROM Customers
					WHERE points > 3000);
                    
#GROUP BY - merge rows together that have the same column values for the specified column
#HAVING - condition with agregate functions
SELECT count(state) AS state_count, state
FROM customers
GROUP BY state
HAVING count(state) <> 1
ORDER BY state_count;

#EXISTS - if the sub query contains data only then the outer query will be executed
SELECT * FROM customers c
WHERE EXISTS (SELECT * FROM orders o WHERE c.customer_id = o.customer_id);

#CASE - same as if else statements
SELECT *,
CASE
	WHEN points >  3000 THEN "Gold Customer"
    WHEN points >  1500 THEN "Silver Customer"
    ELSE "Bronze Customer"
END AS Customer_status
FROM customers;

#UNION - returns distinct rows after merging rows
SELECT customer_id, first_name, points, 'Bronze' AS type
FROM customers
WHERE points < 2000
UNION 
SELECT customer_id, first_name, points, 'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION 
SELECT customer_id, first_name, points, 'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;

#UNION ALL- returns all rows after merging rows
SELECT customer_id, first_name, points, 'Bronze' AS type
FROM customers
WHERE points < 2000
UNION ALL
SELECT customer_id, first_name, points, 'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION ALL
SELECT customer_id, first_name, points, 'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;

#Copying an entire table with its data into another
INSERT INTO orders_archived
SELECT * FROM orders;

USE sql_invoicing;
CREATE TABLE invoices_archived
SELECT * FROM invoices WHERE payment_date IS NOT NULL;

INSERT INTO invoices_archived
SELECT * FROM invoices WHERE payment_date IS NOT NULL;

#User Defined Functions in MySQL
#Any one of the below options should be mentioned
#DETERMINISTIC/NOT DETERMINISTIC - Whether the function returns the same output for the same set of inputs or not
#READS SQL DATA/MODIFIES SQL DATA - Whether the function reads or modifies data
#NO SQL/CONTAINS SQL - Whether the function contains SQL statements or not 
DELIMITER $$
CREATE FUNCTION showMessage(firstName varchar(50), lastName varchar(50))
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	RETURN concat(firstName, lastName);
END $$
DELIMITER ;

#Calling a function 
SELECT showMessage("Jane", "Doe") AS Name;

#Dropping a function
DROP FUNCTION showMessage;

#Show all the functions defined in the database
SHOW FUNCTION STATUS WHERE db = 'sql_store';

#Function Example using SQL statements
DROP FUNCTION IF EXISTS insert_data;
DELIMITER $$
CREATE FUNCTION insert_data(name varchar(50), quantity_in_stock int, unit_price decimal)
RETURNS varchar(50)
DETERMINISTIC
CONTAINS SQL
MODIFIES SQL DATA
BEGIN
	INSERT INTO products(name, quantity_in_stock, unit_price) VALUES (name, quantity_in_stock, unit_price);
	RETURN name;
END $$
DELIMITER ;

SELECT insert_data("Pen", 43, 1.21) AS product_name;

#Not Possible - Cannot call a stored procedure from a function 
#Error returned as Error Code: 1305. FUNCTION sql_store.sp_getCustomers does not exist
DELIMITER $$
CREATE FUNCTION calling_stored_procedure()
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	RETURN sp_getCustomers();
END $$
DELIMITER ;

SELECT calling_stored_procedure();

#Stored Procedures - Set of statements that are executed frequently
DELIMITER &&
CREATE PROCEDURE sp_getCustomers()
BEGIN
	SELECT * FROM customers;
END && 
DELIMITER ;

#Calling a stored procedure
CALL sp_getCustomers();

#Returning a value from the stored procedure
DELIMITER &&
CREATE PROCEDURE sp_getCustomersCount(OUT var int)
BEGIN
	SELECT Count(*) INTO var FROM customers;
END && 
DELIMITER ;

CALL sp_getCustomersCount(@CusCount);
SELECT @CusCount;

#Stored procedure with parameter
DELIMITER &&
CREATE PROCEDURE sp_getHighestCustomers(IN var int)
BEGIN
	SELECT * FROM customers ORDER BY points DESC LIMIT var;
END && 
DELIMITER ;

CALL sp_getHighestCustomers(8);

#Stored procedure that accepts an argument and returns a value
DELIMITER &&
CREATE PROCEDURE sp_getCustomersName(INOUT var varchar(50))
BEGIN
	SELECT Count(first_name) INTO var FROM customers WHERE birth_date > var;
END && 
DELIMITER ;

SET @var1 = '1986-03-28';
CALL sp_getCustomersName(@var1);
SELECT @var1;

#Deleting a stored procedure
DROP PROCEDURE IF EXISTS sp_getCustomersName;

#Creating a temperory table 
CREATE TEMPORARY TABLE temp_customers
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, c.birth_date, c.state, c.points
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

#Any operations can be performed on the temperory tables, it will not affect the actual table
SELECT * FROM temp_customers;

#Deleting a temperory table - not neccessary as they will be automatically deleted once the session is closed
DROP TEMPORARY TABLE IF EXISTS temp_customers;

USE sql_store;

#triggers - called before inserting the values provided into the table
DELIMITER $$
CREATE TRIGGER trigger_customers BEFORE INSERT
ON customers FOR EACH ROW
BEGIN
	IF NEW.points < 0 THEN SET NEW.points = 0;
	END IF;
END $$ 

#Insert statements which trigger the trigger_customers trigger
INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points) VALUES("Dwayne","Johnson","1980-01-01","804-427-9456","14187 Commercial Trail",'Hampton','VA', 1765),
("Richard","Thompson","1985-01-01","804-427-9556","14687 Commercial Trail",'Hampton','MA', -0908);

INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points) VALUES("Dwayne1","Johnson1","1980-01-01","804-427-9456","14187 Commercial Trail",'Hampton','VA', 1765),
("Richard1","Thompson1","1985-01-01","804-427-9556","14687 Commercial Trail",'Hampton','MA', -0908);

SELECT * FROM customers;

#Deleting a trigger if it exists
DROP TRIGGER IF EXISTS trigger_customers;

#views - Creating a view for the Join query
CREATE VIEW customers_view AS
SELECT c.customer_id, first_name, birth_date, points
FROM customers c
JOIN orders o
USING (customer_id);

SELECT * FROM customers_view;

#Performing DML operations on the view created
UPDATE customers_view SET first_name = "Dolores"
WHERE customer_id = 5;

#Data in the actual table will also be affected
SELECT * FROM customers;

#Transactions - Set of statements that will be executed and committed to database only if all the statements are successfully executed
#ACID Properties - Any transcation defined should have these properties
#Atomicity - ALL or None
#Consistancy - DB should be consisitent before and after transaction 
#Isolation - Each transaction should be independent of each other
#Durability - Changes of a successful transaction should be committed even if there is a system crash
START TRANSACTION;
    INSERT INTO customers (customer_id, first_name, last_name, birth_date, phone, address, city, state, points) 
    VALUES(19,"Jane","Doe","1989-01-01","904-427-9456","14187 Avenue Trail",'Hampton','MA', 1895);
    
    INSERT INTO orders (order_id, customer_id, order_date, status, comments, shipped_date, shipper_id) 
    VALUES(11,19,"2023-09-29",1,DEFAULT,DEFAULT,DEFAULT);

	SELECT * FROM customers;
COMMIT;

#ROLLBACK - If any of the statement inside the transaction ROLLBACK can be called to restore the database to the previous position
#Cannot be used on CREATE, UPDATE, ALTER, DROP database/tables
#After execution of transaction statements either COMMIT or ROLLBACK can be called
START TRANSACTION;
	SELECT * FROM order_item_notes;
	DROP TABLE order_item_notes;
    SELECT * FROM order_item_notes;
ROLLBACK;

#SAVEPOINT
START TRANSACTION;
	INSERT INTO orders (order_id, customer_id, order_date, status, comments, shipped_date, shipper_id) 
    VALUES(12,19,"2023-09-29",1,DEFAULT,DEFAULT,DEFAULT);
   
   -- saves the instance of the database at this particular point
    SAVEPOINT save_point; 
    
    INSERT INTO orders (order_id, customer_id, order_date, status, comments, shipped_date, shipper_id) 
    VALUES(13,19,"2023-09-29",1,DEFAULT,DEFAULT,DEFAULT);
    
    -- rolls back to this savepoint where the statements executed after the last save point are dropped
    ROLLBACK TO SAVEPOINT save_point; 
    
    INSERT INTO orders (order_id, customer_id, order_date, status, comments, shipped_date, shipper_id) 
    VALUES(14,19,"2023-09-29",1,DEFAULT,DEFAULT,DEFAULT);
    
    -- deletes the savepoint specified
    RELEASE SAVEPOINT save_point; 
COMMIT;

#Deletes the view if it exists
DROP VIEW IF EXISTS customers_view;

#Constraints - Creating a table with constraints
CREATE TABLE employee(
	id int PRIMARY KEY AUTO_INCREMENT,
	first_name varchar(50) NOT NULL UNIQUE,
    last_name varchar(50),
    age int CHECK(age>=18),
    city varchar(50) DEFAULT 'Bengaluru',
    department ENUM('Management','HR','Development','Testing'),
    customer_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

#Creating an INDEX for a table 
CREATE INDEX emp_index ON employee(id);

#SELECT query using index value created
SELECT * FROM employee USE INDEX(emp_index);

#Throws error - Error Code: 3819. Check constraint 'employee_chk_1' is violated.
INSERT INTO employee(first_name, last_name, age, city, department, customer_id) VALUES("John", "Doe", 16, "Kolkata", "HR", 17);

#Executes properly
INSERT INTO employee(first_name, last_name, age, department, customer_id) VALUES("John", "Doe", 18, "HR", 17);

#Throws Error - Error Code: 1062. Duplicate entry 'John' for key 'employee.first_name'
INSERT INTO employee(first_name, last_name, age, department, customer_id) VALUES("John", "Doe", 18, "HR", 17);

#Throws Error - Error Code: 1048. Column 'first_name' cannot be null
INSERT INTO employee(first_name, last_name, age, department, customer_id) VALUES(NULL, NULL, 18, "HR", 17);

#Shows indexes and constraints of the specified table
SHOW INDEX IN employee;

#ALTER the constraints added to the existing table
ALTER TABLE employee CHANGE last_name last_name varchar(50) NOT NULL; 

#Gives the structure of the table
DESCRIBE customers;

#Creating a new user to access the MySQL database
CREATE USER 'test'@'localhost' IDENTIFIED BY 'abcd';

#Creating multiple user accounts
CREATE USER 'test1'@'localhost' IDENTIFIED BY 'abcde',
			'test2'@'localhost' IDENTIFIED BY 'abcdef';
            
#Creating a new user to access the MySQL database with any hostname
CREATE USER 'test3'@'%' IDENTIFIED BY 'abcd3';   

#Creating a new user to access the MySQL database with specific hostname but any subdomain
CREATE USER 'test4'@'%.subdomain' IDENTIFIED BY 'abcd4';          

#Shows the grants given to the user. When a new user is created no grant is provided to the user
SHOW GRANTS FOR test@localhost;

#Get the users and hosts 
SELECT User, Host FROM mysql.user;

#Deleting a user account
DROP USER test1@localhost;

#Deleting multiple user accounts
DROP USER test2@localhost, test4@.subdomain, test3@localhost;

#Show current users
SHOW PROCESSLIST;

#Kill the running user process
KILL 34;

#After the process is killed drop the user account as before
DROP USER root@localhost;

#Granting privilages to a user
#Only SELECT privilege is granted. Cannot do any other operations
GRANT SELECT ON customers TO test@localhost;

#Revoking privileges to a user
REVOKE SELECT ON customers FROM test@localhost;

#Locking and Unlocking accounts
#Trying to access the locked account gives access denied error
CREATE USER 'test5@localhost' IDENTIFIED BY '12345' ACCOUNT LOCK;

ALTER USER 'test5@localhost' IDENTIFIED BY '12345' ACCOUNT UNLOCK;

#Locking and Unlocking tables
#Provides read access to the table - write operation cannot be performed
LOCK TABLES customers READ;

#Throws error : Error Code: 1099. Table 'customers' was locked with a READ lock and can't be updated
INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points) 
    VALUES("Jane1","Doe1","1989-01-01","904-427-9456","14187 Avenue Trail",'Hampton','MA', 1895);

#Provides write access to the table and the data to the table can be inserted only in the current session
#Table needs to be UNLOCKED for it to be accessible in other sessions
LOCK TABLES customers WRITE;

#Will be executed in this session. Does not execute throws table locked error in other sessions
INSERT INTO customers (first_name, last_name, birth_date, phone, address, city, state, points) 
    VALUES("Jane1","Doe1","1989-01-01","904-427-9456","14187 Avenue Trail",'Hampton','MA', 1895);

#removes lock from all the tables
UNLOCK TABLES;

SHOW DATABASES; -- Shows all the databases in the server
USE sql_store;
SHOW TABLES; -- Shows all the tables in the selected Database
SHOW INDEX IN customers; -- Shows the index defined for the table specified
SHOW GRANTS FOR root@localhost; -- Shows the privileges granted for the specified user
SHOW PROCESSLIST; -- Shows all the processes currently running

