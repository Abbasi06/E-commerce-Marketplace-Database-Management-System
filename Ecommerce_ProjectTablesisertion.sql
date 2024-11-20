--INSERTION OF VALUES TO THE TABLES CATEGORY, SELLER, PRODUCTS, WAREHOUSE, ACCOUNTS, PRODUCT_ORDER, SHIPPING
--NOTE: The below tables are additonal values that are inserted these are not used for the aspect validations. So, these can be used for addtionally inserting values to the tables.
INSERT INTO Category(Category_ID, Category_Name)
VALUES(11, 'Kids');

INSERT INTO Seller(Seller_ID, Seller_First_Name, Seller_Last_Name, Seller_Address, Seller_City, Seller_State, Seller_Zip, Seller_Phone_Number, Seller_Email)
VALUES(1005, 'John', 'Way','F Road', 'San diego', 'California', '156310', '7894781230', 'Johnway@gmail.com');

INSERT INTO Products(Product_ID, Product_Name, Description, Price, Seller_ID, Category_ID)
VALUES(2004,'Airpods', 'An earphones sold by Apple Inc.', 520.00, 1003, 2);

INSERT INTO Warehouse(Receipt_ID, Product_ID, Number_Of_Units, Condition_Of_Products, Item_Status)
VALUES(3004, 2004, 30, 'New',  'Delivered');

INSERT INTO Accounts(User_Name, First_Name, Last_Name, Address, City, State, Zip, Phone_Number, Email)
VALUES('A7', 'Penny', 'Richard', 'Tason st', 'Quincy', 'MA', 07810, 8845561230, 'prichard@gmail.com');

INSERT INTO Product_Order(Order_ID, User_Name, Product_id, Number_Of_Items, Shipping_Speed, Seller_ID)
VALUES(4005, 'A6', 2002, 11,'standard shipping', 1002);

INSERT INTO Shipping(Tracking_ID, Shipping_Address, Shipping_City, Shipping_State, Shipping_Zip, Shipping_Phone_Number, Shipping_Status, Order_ID)
VALUES(5002, 'Williams st', 'San Jose', 'CA', 58784, 7896875636, 1, 4002);
