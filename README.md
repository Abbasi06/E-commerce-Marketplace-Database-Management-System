# E-commerce-Marketplace-Database-Management-System

Introduction: This project involves designing and implementing a database system modelled after Amazon’s marketplace. The system supports core operations like product creation, order management, inventory updates, and shipping.

Entities and Relationships Entities: Products, Category, Warehouse, Seller, Accounts, Product_Order, Shipping Relationships: One-to-many between Products and Category, Seller, Warehouse One-to-one between Product_Order and Shipping

Business Rules: Products must belong to a category and have a unique seller. Customers must have accounts to place orders. Orders should have at least one product and a unique shipping ID.

Key Features: Product Creation: Sellers can add products with a stored procedure. Inventory Management: Sellers update stock when products are delivered. Account Management: New customer accounts are created via a stored procedure. Order Processing: Products are linked to orders and shipped with tracking updates.

Indexing: An index on the Last_Name column in the Accounts table improves query performance, reducing lookup times.

Conclusion: This project helped develop my skills in database design and optimization, creating a system that supports e-commerce operations efficiently.
