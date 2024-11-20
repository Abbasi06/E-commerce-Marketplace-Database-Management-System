--CREATION OF TABLES NAMELY: PRODUCTS, CATEGORY, SELLER, WAREHOUSE, ACCOUNTS, PRODUCT_ORDER, SHIPPING
CREATE TABLE Products(Product_ID DECIMAL(20) PRIMARY KEY,
Product_Name VARCHAR(165),
Description VARCHAR(255),
Price DECIMAL(20,2),
Seller_ID DECIMAL(20),
Category_ID DECIMAL(20)
);

CREATE TABLE Category(Category_ID DECIMAL(20) PRIMARY KEY,
Category_Name VARCHAR(50)
);

CREATE TABLE Seller(Seller_ID DECIMAL(20) PRIMARY KEY,
Seller_First_Name VARCHAR(50),
Seller_Last_Name VARCHAR(50),
Seller_Address VARCHAR(255),
Seller_City VARCHAR(50),
Seller_State VARCHAR(50),
Seller_Zip DECIMAL(20),
Seller_Phone_Number DECIMAL(20),
Seller_Email VARCHAR(100)
);

CREATE TABLE Warehouse(Receipt_ID DECIMAL(20) PRIMARY KEY,
Product_ID DECIMAL(20),
Number_Of_Units DECIMAL(20),
Condition_Of_Products  VARCHAR(50),
Item_Status VARCHAR(50)
);

CREATE TABLE Accounts(User_Name VARCHAR(50) PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Address VARCHAR(255),
City VARCHAR(50),
State VARCHAR(50),
Zip DECIMAL(20),
Phone_Number DECIMAL(20),
Email VARCHAR(100)
);

CREATE TABLE Product_Order(Order_ID DECIMAL(20) PRIMARY KEY,
User_Name VARCHAR(50),
Product_ID DECIMAL(20),
Number_Of_Items DECIMAL(20),
Shipping_Speed VARCHAR(50),
Seller_ID DECIMAL(20)
);

CREATE TABLE Shipping(Tracking_ID DECIMAL(20) PRIMARY KEY,
Shipping_Address VARCHAR(255),
Shipping_City VARCHAR(50),
Shipping_State VARCHAR(50),
Shipping_Zip DECIMAL(20),
Shipping_Phone_Number DECIMAL(20),
Shipping_Status NUMBER(1),
Order_ID DECIMAL(20) 
);

--FOREIGN KEY ADDED TO THE TABLES REFERING THE RESPECTIVE TABLES
ALTER TABLE Products
ADD CONSTRAINT Seller_ID_FK
FOREIGN KEY(Seller_ID) REFERENCES Seller(Seller_ID);

ALTER TABLE Products
ADD CONSTRAINT Category_ID_FK
FOREIGN KEY(Category_ID) REFERENCES Category(Category_ID);

ALTER TABLE Warehouse
ADD CONSTRAINT Product_ID_FK
FOREIGN KEY(Product_ID) REFERENCES Products(Product_ID);

ALTER TABLE Product_Order
ADD CONSTRAINT Product_Order_Product_ID_FK
FOREIGN KEY(Product_ID) REFERENCES Products(Product_ID);

ALTER TABLE Product_Order
ADD CONSTRAINT Product_Order_Seller_ID_FK
FOREIGN KEY(Seller_ID) REFERENCES Seller(Seller_ID);

ALTER TABLE Product_Order
ADD CONSTRAINT User_Name_Order_FK
FOREIGN KEY(User_Name) REFERENCES Accounts(User_Name);

ALTER TABLE Shipping
ADD CONSTRAINT Order_ID_FK
FOREIGN KEY(Order_ID) REFERENCES Product_Order(Order_ID);
