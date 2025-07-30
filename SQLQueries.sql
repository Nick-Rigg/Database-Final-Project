-- List all the shipments where the carrier is UPS. --

SELECT * FROM shipment WHERE carrier = "UPS";

-- Shows the names of each customer and their total amount spent. --

SELECT c.name, SUM(p.total) AS total_spent
FROM customers c
JOIN purchases p ON c.customer_id = p.customer_id
GROUP BY c.name;

-- Shows the card number and names of each customer. --

SELECT c.cardnumber, cus.name
FROM creditcard c, customer cus
WHERE c.customerid = cus.customerid;

-- Selects the name and customerid for any customer with more than 1 credit card. --

SELECT c.customerid, c.name, COUNT(cc.cardid) AS card_count
FROM customer c
JOIN creditcard cc ON c.customerid = cc.customerid
GROUP BY c.customerid, c.name
HAVING COUNT(cc.cardid) > 1;