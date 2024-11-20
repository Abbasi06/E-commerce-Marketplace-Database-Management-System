--ASPECT 1
--CREATION OF STORED PROCEDURES FOR CATEGORY, SELLER, AND PRODUCTS
CREATE OR REPLACE PROCEDURE ADD_CATEGORY(
Category_ID_arg IN DECIMAL,
Category_Name_arg IN VARCHAR)
IS 
BEGIN
INSERT INTO Category(Category_ID,
Category_Name)
VALUES(Category_ID_arg,
Category_Name_arg);
END;

CREATE OR REPLACE PROCEDURE ADD_SELLER(Seller_ID_arg IN DECIMAL,
Seller_First_Name_arg IN VARCHAR,
Seller_Last_Name_arg IN VARCHAR,
Seller_Address_arg IN VARCHAR,
Seller_City_arg IN VARCHAR,
Seller_State_arg IN VARCHAR,
Seller_Zip_arg IN DECIMAL,
Seller_Phone_Number_arg IN DECIMAL,
Seller_Email_arg IN VARCHAR)
IS BEGIN
INSERT INTO Seller(Seller_ID,
Seller_First_Name,
Seller_Last_Name,
Seller_Address,
Seller_City,
Seller_State,
Seller_Zip,
Seller_Phone_Number,
Seller_Email)
VALUES(Seller_ID_arg,
Seller_First_Name_arg,
Seller_Last_Name_arg,
Seller_Address_arg,
Seller_City_arg,
Seller_State_arg,
Seller_Zip_arg,
Seller_Phone_Number_arg,
Seller_Email_arg);
END;

CREATE OR REPLACE PROCEDURE ADD_PRODUCT(
Product_ID_arg IN DECIMAL,
Product_Name_arg IN VARCHAR,
Description_arg IN VARCHAR,
Price_arg IN DECIMAL,
Seller_ID_arg IN DECIMAL,
Category_ID_arg IN DECIMAL)
IS BEGIN
INSERT INTO Products(Product_ID, Product_Name, Description, Price, Seller_ID, Category_ID)
VALUES(Product_ID_arg, Product_Name_arg, Description_arg, Price_arg, Seller_ID_arg, Category_ID_arg);
END;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR CATEGORY TABLE
BEGIN ADD_CATEGORY(1, 'Computers');
END;
/
BEGIN ADD_CATEGORY(2, 'Electronics');
END;
/
BEGIN ADD_CATEGORY(3, 'Appliances');
END;
/
BEGIN ADD_CATEGORY(4, 'Computers');
END;
/
BEGIN ADD_CATEGORY(5, 'Shoes');
END;
/
BEGIN ADD_CATEGORY(6, 'Clothing');
END;
/
BEGIN ADD_CATEGORY(7, 'Jewelry');
END;
/
BEGIN ADD_CATEGORY(8, 'Plants');
END;
/
BEGIN ADD_CATEGORY(9, 'Games');
END;
/
BEGIN ADD_CATEGORY(10, 'Toys');
END;
/

select * from category;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR SELLER TABLE
BEGIN ADD_SELLER(1000, 'John', 'Smith','A Road', 'Worcester', 'Massachusetts', '161310', '7894561230', 'John@gmail.com');
END;
/
BEGIN ADD_SELLER(1001, 'Jerry', 'Wahn','B Road', 'Beverly Hills', 'California', '191310', '4561237890', 'Jerry@gmail.com');
END;
/
BEGIN ADD_SELLER(1002, 'Ravi', 'Kumar','C Road', 'Boston', 'Massachusetts', '181310', '8520741963', 'Ravi@gmail.com');
END;
/
BEGIN ADD_SELLER(1003, 'Mac', 'Joey','D Road', 'Dayton', 'Ohio', '131310', '7531598520', 'Mac@gmail.com');
END;
/
BEGIN ADD_SELLER(1004, 'Jennifer', 'Cooper','E Road', 'Buffalo', 'New York', '141310', '1234567890', 'Cooper@gmail.com');
END;
/

SELECT * FROM SELLER;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR PRODUCTS TABLE
BEGIN ADD_PRODUCT(2000,'Video Camera', 'A self‐driving video camera which automatically follows a subject that is being recorded', 300.00, 1000, 2);
END;
/
BEGIN ADD_PRODUCT(2001,'Holographic Keyboard', 'A holographic keyboard that emits a three‐dimensional projection of a keyboard and recognizes virtual key presses from the typist', 150.00, 1001, 1);
END;
/
BEGIN ADD_PRODUCT(2002,'Play Station ', 'A Tempest 3D AudioTech', 20.00, 1002, 1);
END;
/
BEGIN ADD_PRODUCT(2003,'Earphones', 'A holographic keyboard that emits a three‐dimensional projection of a keyboard and recognizes virtual key presses from the typist', 30.00, 1003, 2);
END;
/
--DISPLAYING PRODUCTS WHICH AR ELESS THAN OR EQUAL TO 30.00$ ONLY UNDER THE CATEGORY 'COMPUTERS' AND 'ELECTORNICS'
SELECT * FROM Products
WHERE Category_ID IN (SELECT Category_ID FROM Category WHERE Category_Name IN ('Computers' , 'Electronics')) AND Price <= 30.00;

--ASPECT 2
--CREATION OF STORED PROCEDURES FOR WAREHOUSE
CREATE OR REPLACE PROCEDURE ADD_PRODUCT_WAREHOUSE(
Receipt_ID_arg IN DECIMAL,
Product_ID_arg IN DECIMAL,
Number_Of_Units_arg IN DECIMAL,
Condition_Of_Products_arg IN VARCHAR,
Item_Status_arg IN VARCHAR)
IS BEGIN
INSERT INTO Warehouse(Receipt_ID, Product_ID, Number_Of_Units, Condition_Of_Products, Item_Status)
VALUES(Receipt_ID_arg, Product_ID_arg, Number_Of_Units_arg, Condition_Of_Products_arg, Item_Status_arg);
END;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR WAREHOUSE TABLE
BEGIN ADD_PRODUCT_WAREHOUSE(3000,2000, 3, 'New', 'Delivered');
END;
/
BEGIN ADD_PRODUCT_WAREHOUSE(3001, 2001, 5, 'New', 'Delivered');
END;
/
BEGIN ADD_PRODUCT_WAREHOUSE(3002, 2002, 11, 'Used', 'Delivered');
END;
/
BEGIN ADD_PRODUCT_WAREHOUSE(3003, 2003, 15, 'Used',  'Delivered');
END;
/

SELECT * FROM Warehouse;

--SELLER REQUESTING LIST OF PRODUCTS THAT HAS AN INVENTORY OF 11 OR LESS.
SELECT s.Seller_ID, w.Product_ID, p.Product_Name, p.Description, p.Price, p.Category_ID, w.Number_Of_Units FROM Products p
INNER JOIN Warehouse w ON w.Product_ID = p.Product_ID
INNER JOIN Seller s ON s.Seller_ID = p.Seller_ID
WHERE Number_Of_Units <= 11;

--ASPECT 3
--CREATION OF STORED PROCEDURES FOR ACCOUNTS
CREATE OR REPLACE PROCEDURE ADD_Account(
User_Name_arg IN VARCHAR,
First_Name_arg IN VARCHAR,
Last_Name_arg IN VARCHAR,
Address_arg IN VARCHAR,
City_arg IN VARCHAR,
State_arg IN VARCHAR,
Zip_arg IN DECIMAL,
Phone_Number_arg IN DECIMAL,
Email_arg IN VARCHAR)
IS BEGIN
INSERT INTO Accounts(User_Name, First_Name, Last_Name, Address, City, State, Zip, Phone_Number, Email)
VALUES(User_Name_arg, First_Name_arg, Last_Name_arg, Address_arg, City_arg, State_arg, Zip_arg, Phone_Number_arg, Email_arg);
END;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR ACCOUNTS TABLE
BEGIN ADD_ACCOUNT('A1', 'Shastri', 'Sri', 'Bollywood st', 'Worcester', 'MA', 01610, 7894561230, 'ssri@gmail.com');
END;
/
BEGIN ADD_ACCOUNT('A2', 'Monisha', 'Sri', 'Koreatown', 'Los Angeles', 'CA', 01710, 9894561230, 'msri@gmail.com');
END;
/
BEGIN ADD_ACCOUNT('A3', 'Varsha', 'Sri', 'China Town', 'Brighton', 'UT', 01810, 7594561230, 'vsri@gmail.com');
END;
/
BEGIN ADD_ACCOUNT('A4', 'Alex', 'Pandiyan', 'Greenland st', 'Austin', 'TX', 01910, 6894561230, 'pandiyan@gmail.com');
END;
/
BEGIN ADD_ACCOUNT('A5', 'Markin', 'Luther', 'Woodland st', 'Chicago', 'MI', 01110, 2894561230, 'luther@gmail.com');
END;
/
BEGIN ADD_ACCOUNT('A6', 'Penny', 'Sri', 'Mason st', 'Provincetown', 'RI', 01210, 8894561230, 'psri@gmail.com');
END;
/

SELECT * FROM Accounts;

--THE LAST NAMES OF THE CONSUMERS WHERE THERE ARE ATLEAST 4 ACCOUNTS ASSOICIATED WITH THE LAST NAME
SELECT COUNT(Last_Name) AS Last_Name_Sri FROM Accounts
WHERE Last_Name = 'Sri';

--ASPECT 4
--CREATION OF STORED PROCEDURES FOR PRODUCT_ORDER
CREATE OR REPLACE PROCEDURE ADD_Orders(
Order_ID_arg IN DECIMAL,
User_Name_arg IN VARCHAR,
Product_id_arg IN DECIMAL,
Number_Of_Items_arg IN DECIMAL,
Shipping_Speed_arg IN VARCHAR,
Seller_ID_arg IN DECIMAL)
IS BEGIN
INSERT INTO Product_Order(Order_ID, User_Name, Product_id, Number_Of_Items, Shipping_Speed, Seller_ID)
VALUES(Order_ID_arg, User_Name_arg, Product_id_arg, Number_Of_Items_arg, Shipping_Speed_arg, Seller_ID_arg);
END;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR PRODUCT_ORDER TABLE
BEGIN ADD_Orders(4000, 'A3', 2000, 1,'one‐day', 1000);
END;
/
BEGIN ADD_Orders(4001, 'A1', 2000, 3,'two‐day', 1000);
END;
/

select * from Product_Order;

BEGIN ADD_Orders(4002, 'A4', 2002, 3,'two‐day', 1002);
END;
/
BEGIN ADD_Orders(4003, 'A5', 2002, 3,'two‐day', 1002);
END;
/
BEGIN ADD_Orders(4004, 'A6', 2002, 3,'two‐day', 1002);
END;
/

--DETAILS OF THE USERS WHO BOUGHT A PARTICULAR PRODUCT MORE THAN 3 TIMES
SELECT a.User_Name, a.First_Name, a.Last_Name, a.Address, a.City, a.City, a.Zip, a.Phone_Number, a.Email, o.Product_ID FROM Accounts a
INNER JOIN Product_Order o ON o.User_Name = a.User_Name
WHERE o.Product_ID IN (SELECT Product_ID FROM Product_Order
GROUP BY Product_ID
HAVING COUNT(DISTINCT User_Name) >= 3);

--ASPECT 5
--CREATION OF STORED PROCEDURES FOR SHIPPING
CREATE OR REPLACE PROCEDURE ADD_Shipping(
Tracking_ID_arg IN DECIMAL,
Shipping_Address_arg IN VARCHAR,
Shipping_City_arg IN VARCHAR,
Shipping_State_arg IN VARCHAR,
Shipping_Zip_arg IN DECIMAL,
Shipping_Phone_Number_arg IN DECIMAL,
Shipping_Status_arg IN NUMBER,
Order_ID_arg IN DECIMAL)
IS BEGIN
INSERT INTO Shipping(Tracking_ID, Shipping_Address, Shipping_City, Shipping_State, Shipping_Zip, Shipping_Phone_Number, Shipping_Status, Order_ID)
VALUES(Tracking_ID_arg, Shipping_Address_arg, Shipping_City_arg, Shipping_State_arg, Shipping_Zip_arg, Shipping_Phone_Number_arg, Shipping_Status_arg, Order_ID_arg);
END;

--IMPLEMENTING THE STORED PROCEDURE CREATED FOR SHIPPING TABLE
BEGIN ADD_Shipping(5000, 'Cambridge st', 'Boston', 'MA', 56454, 4596871236, 1, 4000);
END;
/
BEGIN ADD_Shipping(5001, 'Stanford st', 'San Fransisco', 'CA', 58754, 7896871236, 1, 4001);
END;
/

SELECT * FROM Shipping;

--THE TOTAL NUMBER OF SHIPPIED ITEMS FOR EACH USER.
SELECT a.User_Name, COUNT(s.Tracking_ID) AS TotalShippedItems
FROM Accounts a
INNER JOIN Product_Order o ON a.User_Name = o.User_Name
INNER JOIN Shipping s ON o.Order_ID = s.Order_ID
GROUP BY a.User_Name;

--CREATING INDEX
CREATE INDEX index_last_name ON Accounts(Last_Name);

--DIFFERENCE WHILE USING INDEX OR OMPLEMENTING AFTER CREATING INDEX
SELECT COUNT(Last_Name) AS Last_Name_Sri FROM Accounts
WHERE Last_Name = 'Sri';

--SAVE THE WORK
commit;
