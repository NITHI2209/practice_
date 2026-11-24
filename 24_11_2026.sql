 /*33) Display all orders and their matching customer details using RIGHT JOIN*/
SELECT o.orderid, c.customerID, c.customer_name, c.city
FROM orders o
RIGHT JOIN customers c
ON o.customer_id = c.customerID

 /*34) Display all customers and all orders, including unmatched records using*/
SELECT o.orderid, o.order_date, o.payment_status,c.customerID, c.customer_name, c.city
FROM orders o
FULL JOIN customers c
ON o.customer_id = c.customerID

/*35) Combine every customer with every product using CROSS JOIN.*/
SELECT c.customerID, c.customer_name,p.product_id, p.product_name
FROM customers c
CROSS JOIN products p
