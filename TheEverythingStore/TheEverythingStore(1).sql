CREATE TABLE Categories
(CategoryId INT IDENTITY(1,1) NOT NULL,
Name VARCHAR(100) NOT NULL,
CONSTRAINT PK_Categories PRIMARY KEY (CategoryId));

CREATE TABLE Products
(ProductId INT IDENTITY(1000,1) NOT NULL,
Name VARCHAR(255) NOT NULL,
Description VARCHAR(8000),
Price DECIMAL(10,2) NOT NULL DEFAULT 0,
Photo VARCHAR(255),
CategoryId INT NOT NULL
CONSTRAINT PK_Products PRIMARY KEY (ProductId),
CONSTRAINT FK_Products_CategoryId
FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId));

CREATE TABLE Carts
(CartId VARCHAR(100) NOT NULL,
ProductId INT NOT NULL,
Quantity INT NOT NULL DEFAULT 1,
Price Decimal(10,2) NOT NULL,
CONSTRAINT PK_Carts PRIMARY KEY (CartId),
CONSTRAINT FK_Carts_ProductId
FOREIGN KEY (ProductId) REFERENCES Products(ProductId));

CREATE TABLE Orders
(OrderId INT IDENTITY(2000,1) NOT NULL,
OrderDate DATETIME NOT NULL,
UserId VARCHAR(100) NOT NULL,
Total Decimal(10,2) NOT NULL,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Address VARCHAR(255) NOT NULL,
City VARCHAR(100) NOT NULL,
Province VARCHAR(10) NOT NULL,
PostalCode VARCHAR(10) NOT NULL,
Phone VARCHAR(15) NOT NULL,
CONSTRAINT PK_Orders PRIMARY KEY (OrderId)); 

CREATE TABLE OrderDetails
(OrderDetailId INT IDENTITY(20000,1) NOT NULL,
OrderId INT NOT NULL,
ProductId INT NOT NULL,
Quantity INT NOT NULL DEFAULT 1,
Price Decimal(10,2) NOT NULL,
CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderDetailId),
CONSTRAINT FK_OrderDetails_OrderId
FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
CONSTRAINT FK_OrderDetails_ProductId
FOREIGN KEY (ProductId) REFERENCES Products(ProductId)); 