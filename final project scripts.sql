create schema MSIS_2603_Project_MGTea;
use MSIS_2603_Project_MGTea;


CREATE TABLE `Customer` (
`Customer_id` int(11) NOT NULL,
`First_Name` varchar(255) NULL,
`Last_Name` varchar(255) NULL,
`Email` varchar(255) NULL,
`Prime_Member` varchar(255) NULL,
`Phone` varchar(255) NULL,
`Order_id` int(11) NULL,
PRIMARY KEY (`Customer_id`) 
);
CREATE TABLE `Order_C` (
`Order_id` int(11) NOT NULL,
`Customer_Name` varchar(255) NULL,
`Product_id` int(11) NOT NULL,
`Tracking_Number` int(11) NOT NULL,
`Order_Quantity` int(11) NULL,
`Delivery_Date` datetime NULL,
`Order_Date` datetime NULL,
`Payment_Method` varchar(255) NULL,
PRIMARY KEY (`Order_id`) 
);
CREATE TABLE `Products` (
`Product_id` int(11) NOT NULL,
`Product_Type` varchar(255) NULL,
`Product_Price` decimal(10,2) NULL,
`Order_id` int(11) NULL,
PRIMARY KEY (`Product_id`) 
);
CREATE TABLE `Supplier` (
`Supplier_id` int(11) NOT NULL,
`Product_id` int(11) NOT NULL,
`Address` varchar(255) NULL,
`Product_Type` varchar(255) NULL,
PRIMARY KEY (`Supplier_id`) 
);
CREATE TABLE `Delivery_Agent` (
`Tracking_Number` int(50) NOT NULL,
`Shipping_Address` varchar(255) NULL,
`Schedule_Delivery_Date` datetime NULL,
`Type_of_Service` varchar(255) NULL,
PRIMARY KEY (`Tracking_Number`) 
);
CREATE TABLE `Address` (
`Address_id` int(11) NOT NULL,
`Street` varchar(255) NULL,
`City` varchar(255) NULL,
`State` varchar(255) NULL,
`ZIP` int(11) NULL,
`Customer_id` int(11) NULL,
PRIMARY KEY (`Address_id`) 
);


ALTER TABLE `Order_C` ADD CONSTRAINT `Tracking_Number` FOREIGN KEY (`Tracking_Number`) REFERENCES `Delivery_Agent` (`Tracking_Number`);
ALTER TABLE `Customer` ADD CONSTRAINT `Order_id` FOREIGN KEY (`Order_id`) REFERENCES `Order_C` (`Order_id`);
ALTER TABLE `Address` ADD CONSTRAINT `Customer_id` FOREIGN KEY (`Customer_id`) REFERENCES `Customer` (`Customer_id`);
ALTER TABLE `Supplier` ADD CONSTRAINT `Product_id` FOREIGN KEY (`Product_id`) REFERENCES `Products` (`Product_id`);
ALTER TABLE `Products` ADD CONSTRAINT `Order_id2` FOREIGN KEY (`Order_id`) REFERENCES `Order_C` (`Order_id`);

#insert into Delivery_Agent
Insert into Delivery_Agent Values (1234567890,'1st street Santa Clara CA', '19-02-05', 'USPS Priority Mail Express');
Insert into Delivery_Agent Values (1234567891,'2nd street New York NY', '19-01-04', 'USPS Priority Mail');
Insert into Delivery_Agent Values (1234567892,'3rd street Los Angels CA', '19-03-14', 'USPS Priority Mail');
Insert into Delivery_Agent Values (1234567893,'4th street San Mateo CA', '19-09-04', 'USPS Priority First-Class Mail ');
Insert into Delivery_Agent Values (1234567894,'5th street Santa Clara CA', '19-02-08', 'USPS Retial Ground');
Insert into Delivery_Agent Values (1234567895,'6th street New Jersey NJ', '19-04-05', 'USPS Priority Mail Express');
Insert into Delivery_Agent Values (1234567896,'7th street Sacramento CA', '19-02-05', 'USPS Retial Ground');
Insert into Delivery_Agent Values (1234567897,'8th street Napa CA', '19-01-12', 'USPS Retial Ground');
Insert into Delivery_Agent Values (1234567898,'9th street Bloomington IN', '19-02-05', 'USPS Retial Ground');
Insert into Delivery_Agent Values (1234567899,'10th street Carmel IN', '19-03-04', 'USPS Retial Ground');

select * from Delivery_Agent;


#Order Table
INSERT into Order_C 
(Order_id,Customer_Name,Product_id,Tracking_Number,Order_Quantity,Delivery_Date,Order_Date,Payment_Method)
VALUES(101,'Borui Zhang',  1001, 1234567890, 1,'2019-02-05', '2019-02-05', 'credit');
Insert into order_c
Values (102, 'Jack Williams', 1001,1234567891,1, '2019-01-03', '2019-01-01', 'credit');
Insert into order_C 
Values (103, 'Robert Morris', 1003,1234567892,1,'2019-03-14', '2019-03-10', 'credit');
Insert into order_C 
Values (104, 'James Harden',  1001,1234567893,2, '2019-09-04', '2019-09-02', 'credit');
Insert into order_C 
Values (105, 'Chris Paul', 1001,1234567894,1,'2019-02-08', '2019-02-03', 'credit');
Insert into order_C 
Values (106, 'Clint Capela', 1006,1234567895,2, '2019-04-05', '2019-04-05', 'debit');
Insert into order_C 
Values (107, 'Eric Gordon', 1007,1234567896,1, '2019-02-05', '2019-02-03', 'credit');
Insert into order_C 
Values (108, 'Austin Rivers', 1004,1234567897,3, '2019-01-12', '2019-01-08', 'credit');
Insert into order_C 
Values (109, 'PJ Tucker', 1003,1234567898,1, '2019-02-05', '2019-02-03', 'credit');
Insert into order_C 
Values (110, 'Gerald Green', 1003,1234567899,1, '2019-03-04', '2019-03-02', 'credit');

select * from Order_C;

#Customer Table
INSERT INTO Customer Values
(001,'Borui', 'Zhang', 'boruizhang@scu.edu', 'Yes', '8189909999',101);

INSERT INTO Customer Values
(002, 'Jack', 'Williams', 'jwill@scu.edu', 'Yes', '8189901111',102);

INSERT INTO Customer Values
(003, 'Robert', 'Morris', 'rmorris@scu.edu', 'No', '8189902222',103);

INSERT INTO Customer Values
(004, 'James', 'Harden', 'jharden13@scu.edu', 'Yes', '8189901313',104);

INSERT INTO Customer Values
(005, 'Chris', 'Paul', 'cpaul3@scu.edu', 'No', '8189900303',105);

INSERT INTO Customer Values
(006, 'Clint', 'Capela', 'ccapela15@scu.edu', 'Yes', '8189901515',106);

INSERT INTO Customer Values
(007, 'Eric', 'Gordon', 'egordon10@scu.edu', 'Yes', '8189901010',107);

INSERT INTO Customer Values
(008, 'Austin', 'Rivers', 'arivers25@scu.edu', 'No', '8189902525',108);

INSERT INTO Customer Values
(009, 'PJ', 'Tucker', 'pjtuck04@scu.edu', 'Yes', '8189900404',109);

INSERT INTO Customer Values
(010, 'Gerald', 'Green', 'ggreen@scu.edu', 'Yes', '8189901414',110);

select * from Customer;

#Address
Insert into Address Values (1001, '1st street','Santa Clara', 'CA', 95050,001);
Insert into Address Values (1002, '2nd street','New York', 'NY', 10020,002);
Insert into Address Values (1003, '3rd street','Los Angels', 'CA', 95090,003);
Insert into Address Values (1004, '4th street','San Mateo', 'CA', 96901,004);
Insert into Address Values (1005, '5th street','Santa Clara', 'CA', 95051,005);
Insert into Address Values (1006, '6th street','New Jersey', 'NJ', 10010,006);
Insert into Address Values (1007, '7th street','Sacramento', 'CA', 93910,007);
Insert into Address Values (1008, '8th street','Napa', 'CA', 95110,008);
Insert into Address Values (1009, '9th street','Bloomington', 'IN', 47401,009);
Insert into Address Values (1010, '10th street','Carmel', 'IN', 95133,010);

select * from Address;

#Products Table
INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(201, 'Food', 9.99, 101);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(202, 'Office Supply', 19.99, 102);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(203, 'Office Supply', 12.99, 103);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(204, 'Books&Audio', 59.99, 104);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(205, 'Sports&Outdoors', 99.99, 105);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(206, 'Health&Lifestyle', 29.99, 106);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(207, 'Beauty', 24.99, 107);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(208, 'Home&Kitchen', 14.99, 108);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(209, 'Office Supply', 4.99, 109);

INSERT INTO Products 
(Product_id, Product_Type, Product_Price, Order_id) VALUES
(210, 'Food', 10.99, 110);

select * from Products;

#Supplier Table
INSERT INTO Supplier 
VALUES (301,201,'500 El Camino Real, Santa Clara, CA 95050', 'Food');
INSERT INTO Supplier
VALUES (302,202,'305 - 14th Ave. S. Suite 3B, Seattle, WA 98128', 'Office Supply');
INSERT INTO Supplier
VALUES (303,203,'98 E 3rd Ave, San Mateo, CA 94401','Office Supply');
INSERT INTO Supplier
VALUES (304,204,'34265 Fremont Blvd, Fremont, CA 94555','Books&Audible');
INSERT INTO Supplier
VALUES (305,205,'2121 E 7th Pl, Los Angeles, CA 90021','Sports&Outdoors');
INSERT INTO Supplier
VALUES (306,206,'20 W 34th St, New York, NY 10001','Health&Lifestyle');
INSERT INTO Supplier
VALUES (307,207,'75 9th Ave, New York, NY 10011','Beauty');
INSERT INTO Supplier
VALUES (308,208,'3 Brewster Rd, Newark, NJ 07114','Home&Kitchen');
INSERT INTO Supplier
VALUES (309,209,'8525 Garland Rd, Dallas, TX 75218','Office Supply');
INSERT INTO Supplier
VALUES (310,210,'11300 FM148, Terrell, TX 75160','Food');

select * from Supplier;


#Enumerate queries on Delivery agent
#1
select * from Delivery_Agent;
INSERT INTO Delivery_Agent 
VALUES(234567890, '11th Street Santa Clara CA', '19-02-01', 'USPS Priority');
#2
select * from Delivery_Agent;
UPDATE Delivery_Agent 
set Type_of_Service = 'USPS Retail Ground'
WHERE Tracking_Number = 234567890;
SELECT * FROM Delivery_Agent;
#3
DELETE FROM Delivery_Agent
WHERE Tracking_Number = 234567890;
SELECT * FROM Delivery_Agent;

#Enumerate queries on Customer
#1
INSERT INTO Customer Values
(012,'Jon', 'Snow', 'jsnow@scu.edu', 'Yes', 8189908989,101);
#2
select Email 
from Customer
where Customer_id= 007;
#3
select * from Address;
UPDATE Address
SET City = 'San Jose'
where Customer_id = 003;
select * from Address;

#Enumerate queries on Suppliers
#1
INSERT INTO Supplier 
VALUES (312,201,'520 El Camino Real, Santa Clara, CA 95050', 'Food');
#2
select count(Supplier_id)
from Supplier
where Product_Type='food';
#3
select * from Supplier;
UPDATE Supplier
SET Address = '622 Franklin Street, Santa Clara, CA 95050'
where Supplier_id = 301;
select * from Supplier;

#Create Triggers
#AFTER INSERT
Create Table AddressInsert (`Address_id` int(11) NOT NULL,
`Street` varchar(255) NULL,
`City` varchar(255) NULL,
`State` varchar(255) NULL,
`ZIP` int(11) NULL,
`Customer_id` int(11) NULL);

Create Trigger AddressInsertTrigger
AFTER insert ON Address
FOR EACH ROW
INSERT INTO AddressInsert select Address_id,Street,City,State,ZIP,Customer_id from Address;

#After Update
Create Table AddressUpdates (`Address_id` int(11) NOT NULL,
`Street` varchar(255) NULL,
`City` varchar(255) NULL,
`State` varchar(255) NULL,
`ZIP` int(11) NULL,
`Customer_id` int(11) NULL);

DELIMITER //
Create Trigger AddressUpdateTrigger
AFTER UPDATE ON Address
FOR EACH ROW
BEGIN
IF OLD.Street <> NEW.Street then
INSERT INTO AddressUpdates(Address_id,Street,City,State,ZIP,Customer_id) VALUES(NEW.Address_id,NEW.Street,NEW.City,NEW.State,NEW.ZIP,NEW.Customer_id) ;
END IF;
END//
DELIMITER ;

#Before Delete
drop table customer_2;
drop trigger customerdeletetrigger_1;
drop table customer_delete1;
CREATE TABLE customer_2 as
(select * from customer);

create table customer_delete1(
Customer_id int,
First_Name varchar(50),
Last_Name varchar(50),
Email varchar(50),
Prime_Member varchar(5),
Phone varchar(10),
Order_id int
);

DELIMITER $$
CREATE TRIGGER customerdeletetrigger_1
BEFORE DELETE ON customer_2
FOR EACH ROW BEGIN
INSERT INTO customer_delete1(Customer_id,First_Name,Last_Name,Email,Prime_Member,Phone,Order_id)
VALUES (old.Customer_id,old.First_Name,old.Last_Name,old.Email,old.Prime_Member,old.Phone,old.Order_id);
END $$
DELIMITER ;

select * from customer_2;

DELETE FROM customer_2
WHERE Prime_Member = 'No';

select * from customer_delete1;

#Create Procedures
create table customer_1 as
(select * from customer);

DELIMITER $$
CREATE PROCEDURE update_table()
BEGIN
 UPDATE customer_1
 set Prime_Member = 'Yes'
 Where Customer_id = 3;
END$$
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;

Call update_table();

select * from customer_1;




#Business Metrics 
#1(avg days of delivery)
select * from order_c;
SELECT avg(DATEDIFF(o.delivery_date, o.order_date)) from Order_C o;

#2(Prime members who choose 2 day delivery)
SELECT c.First_Name,c.Last_Name,c.Email,c.Phone,o.Order_id
FROM Customer c inner join Order_C o 
ON c.Order_id = o.Order_id and c.Prime_Member = 'Yes' and (DATEDIFF(o.delivery_date, o.order_date)=2);

#3(Frequency of each delivery time)
SELECT distinct(DATEDIFF(delivery_date, order_date)),
count(*)
FROM Order_c
GROUP BY 1;


#4(count of customers from the same state)
select distinct(State),count(state) from Address
Group by 1;

#5(Popularity of the Prodcuts)
SELECT  distinct(p.Product_Type), sum(o.order_quantity)
FROM Products p inner join Order_c o 
ON p.order_id = o.order_id 
GROUP BY 1
Order by 2;








