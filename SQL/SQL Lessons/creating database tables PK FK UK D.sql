#project name

#date:

#creating database

#creating tables

#Data analysis for XXXX

#top 5 countries in revenue

#creating database

Create DATABASE sales;

USE sales;

DROP DATABASE sales;

CREATE DATABASE customers;

CREATE DATABASE IF NOT EXISTS customers;

USE customers;


#creating table 


CREATE 	TABLE employee
(
emp_id INT,
emp_name varchar(225),
emp_age INT
);

DROP TABLE employee;

CREATE TABLE IF NOT EXISTS students
(
	student_id INT,
    student_name varchar(225),
    address varchar(225),
    ph_number varchar(255)
);

SELECT * FROM students;

DROP TABLE students;

SELECT * FROM students;

CREATE TABLE IF NOT EXISTS employee
(
	emp_id INT,
    emp_name VARCHAR(255),
    date_of_birth DATE,
    address VARCHAR(255)
);

SELECT * FROM employee;

CREATE TABLE IF NOT EXISTS books
(
	category_id INT,
    book_title varchar(255),
    author VARCHAR(255),
    publication_date DATE
);
SELECT * FROM books;

CREATE TABLE IF NOT EXISTS departments
(
	department_id INT,
    department_names varchar(255),
    employee_id INT
    );
    
SELECT * FROM DEPARTMENTS;

CREATE TABLE products
(
	product_id INT,
    product_name VARCHAR(255),
    descriptions VARCHAR(255),
    duration_month DATE
);

SELECT * FROM PRODUCTS;

CREATE TABLE courses
(
	course_id INT,
    course_name VARCHAR(255),
    descriptions VARCHAR(255),
    duration_month DATE
);

SELECT * FROM courses;

CREATE TABLE cities
(
	city_id INT,
    city_names VARCHAR(255),
    population INT,
    area_size INT 
);

SELECT * FROM cities;

ALTER TABLE products

ADD COLUMN prices INT;

SELECT * FROM products;

DROP TABLE products;

CREATE TABLE products
(
	product_id INT,
    product_name VARCHAR(255),
    descriptions VARCHAR(255),
    prices INT
);

SELECT * FROM products;

# create the table with primary key
#option 1 
CREATE TABLE customers
(
	customers_id INT,
    first_name VARCHAR(225),
    last_name VARCHAR (225),
    email_address VARCHAR(225),
    number_of_complain INT,
PRIMARY KEY (customers_id)
);

DROP TABLE customers;

#Option2 
CREATE TABLE customers
(
	customers_id INT PRIMARY KEY,
    first_name VARCHAR(225),
    last_name VARCHAR (225),
    email_address VARCHAR(225),
    number_of_complain INT
);

#OPTION 1,2 CUSTOMERS_ID INPUT BY OURSELF

DROP TABLE customers;

#Option3

# CUSTOMERS_ID INPUT BY AUTO INDESING/AUTO INCREMENT

CREATE TABLE customers
(
	customers_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR (225),
    email_address VARCHAR(225),
    number_of_complain INT
);



CREATE TABLE buyers
(
	buyer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT
);

DROP TABLE buyers;

USE customers;

CREATE TABLE buyers
(
	buyer_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT,
PRIMARY KEY (buyer_id)
);

SELECT * FROM buyers;

DROP TABLE buyers;

CREATE TABLE buyers
(
	buyer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT
);

DROP TABLE buyers;

CREATE TABLE buyers
(
	buyer_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT,
PRIMARY KEY (buyer_id)
);


#how to drop primary key
#option1 (just primary key)
DROP TABLE buyers;


CREATE TABLE buyers
(
	buyer_id INT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT
);

ALTER TABLE buyers
ADD PRIMARY KEY (buyer_id);


ALTER TABLE buyers
DROP PRIMARY KEY;




#option2 (primary key+ auto_increment)

CREATE TABLE buyers
(
	buyer_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT,
PRIMARY KEY (buyer_id)
);

ALTER TABLE  buyers
MODIFY COLUMN buyer_id INT NOT NULL,
DROP PRIMARY KEY;


#FOREIGN KEY

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number),
FOREIGN KEY (customer_id) REFERENCES buyers(buyer_id) ON DELETE CASCADE 
);

#adding foreign key into existing table

DROP TABLE SALES;

CREATE TABLE sales
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(10),
PRIMARY KEY (purchase_number)
);
DROP TABLE buyers;

CREATE TABLE customers
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    number_of_complain INT,
PRIMARY KEY (customer_id)
);


ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

SELECT * FROM sales;

#drop foreign key 

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

#unique _ avoid duplicate data 

CREATE TABLE customersunique
(
	customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    ph_number INT ,
    number_of_complain INT,
PRIMARY KEY (customer_id),
UNIQUE KEY (email_address),
UNIQUE KEY (ph_number)
);

#adding the unique key existing table

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

ALTER TABLE customers
DROP INDEX email_address; 


#default key_ constraint -

CREATE TABLE customerdefault
(customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    email_address VARCHAR(225),
    ph_number INT ,
    number_of_complain INT DEFAULT 0,
PRIMARY KEY (customer_id)
);


#adding default constrainints in existing table

ALTER TABLE cities
CHANGE COLUMN city_names city_names INT DEFAULT 0;

ALTER TABLE cities
CHANGE COLUMN population number_of_people INT;

#insert into
INSERT INTO table_name(col_1,col_2,col_3)
VALUES (data_col_1, data_col_2,data_col_3);

INSERT INTO customerdefault (first_name,last_name,email_address, ph_number, number_of_complain)
VALUES ('Hnin', 'Yu', 'yu@gmail.com', 098987564, 0);


INSERT INTO customerdefault (first_name,last_name,email_address, ph_number, number_of_complain)
VALUES ('Win', 'Au', 'win@gmail.com', 0990987564, 2),
('W', 'A', 'wa@gmail.com', 0990008754, 3)
;

SELECT*FROM customerdefault;

INSERT INTO customerdefault (first_name,last_name,email_address, ph_number)
VALUES ('San', 'AU', 'Sn@gmail.com', 0999987564),
('T', 'I', 'ti@gmail.com', 0900008754)
;

SELECT * FROM customerdefault;


INSERT INTO customerdefault (first_name,last_name,email_address, ph_number,number_of_complain)
VALUES ('SU', 'SU', 'SU@gmail.com', 0909987564,6),
('TT', 'IT', 'II@gmail.com', 0909008754,0)
;


SELECT * FROM customerdefault;

#NOT NULL

CREATE TABLE companies
(
	company_id INT auto_increment PRIMARY KEY,
    headquarter_ph_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL
);

SELECT * FROM companies;

#drop not null

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;





