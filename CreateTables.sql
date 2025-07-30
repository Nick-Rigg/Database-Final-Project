CREATE TABLE Customer ( 

	customerID INT PRIMARY KEY, 

	name VARCHAR(100), 

	email VARCHAR(100), 

	address VARCHAR(100) 

); 

CREATE TABLE CreditCard ( 

	cardID INT PRIMARY KEY, 

	customerID INT, 

	cardNumber VARCHAR(25), 

	expDate DATE, 

	FOREIGN KEY (customerID) REFERENCES Customer(customerID) 

); 

CREATE TABLE Product ( 

	productID INT PRIMARY KEY, 

	name VARCHAR(100), 

	price DECIMAL(10, 2), 

	stock INT 

); 

 

CREATE TABLE Purchase ( 

	purchaseID INT PRIMARY KEY, 

	customerID INT, 

	productID INT,  

	date DATE, 

	total DECIMAL(10, 2), 

	FOREIGN KEY (customerID) REFERENCES Customer(customerID), 

	FOREIGN KEY (productID) REFERENCES Product(productID) 

); 

CREATE TABLE Shipment ( 

	shipmentID INT PRIMARY KEY, 

	purchaseID INT, 

	shipDate DATE, 

	carrier VARCHAR(100), 

	trackingNumber VARCHAR(50), 

	FOREIGN KEY purchaseID REFERENCES Purchase(purchaseID) 

); 