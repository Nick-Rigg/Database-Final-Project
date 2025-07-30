INSERT INTO Customer (customerID, name, email, address) VALUES
(1, 'Evan Heidenreich', 'heidenen@mail.uc.edu', '123 Maple St, Springfield, IL'),
(2, 'Nick Rigg', 'riggns@mail.uc.edu', '456 Oak Ave, Denver, CO'),
(3, 'Eric Cartman', 'cartet@mail.uc.edu', '789 Pine Rd, Austin, TX');

INSERT INTO CreditCard (cardID, customerID, cardNumber, expDate) VALUES
(1, 1, '4111111111111111', '2026-12-01'),
(2, 1, '5500000000000004', '2025-08-15'),
(3, 2, '340000000000009',  '2027-03-20'),
(4, 3, '6011000000000004', '2026-11-05');

INSERT INTO Product (productID, name, price, stock) VALUES
(1, 'Laptop', 999.99, 9),
(2, 'Wireless Mouse', 25.50, 50),
(3, 'Mechanical Keyboard', 79.99, 25),
(4, 'Monitor 24-inch', 149.99, 15),
(5, 'Wireless Headphones', 49.99, 100);

INSERT INTO Purchase (purchaseID, customerID, productID, date, total) VALUES
(1, 1, 1, '2025-07-15', 999.99),
(2, 1, 2, '2025-07-15', 25.50),
(3, 2, 4, '2025-07-20', 149.99),
(4, 3, 3, '2025-07-21', 79.99),
(5, 3, 5, '2025-07-21', 49.99);

INSERT INTO Shipment (shipmentID, purchaseID, shipDate, carrier, trackingNumber) VALUES
(1, 1, '2025-07-16', 'UPS', '1Z999AA10123456784'),
(2, 2, '2025-07-16', 'FedEx', '612999123456'),
(3, 3, '2025-07-21', 'USPS', '940011189922385937'),
(4, 4, '2025-07-22', 'Amazon', 'JD0146000045738293'),
(5, 5, '2025-07-22', 'UPS', '1Z999BB10123456890');