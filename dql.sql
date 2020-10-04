--Display all the data of customers 
SELECT * FROM customers
-- Display the product_name and category for products which their price is between 5000 and 10000
SELECT Product_name, category FROM PRODUCT WHERE Price BETWEEN 5000 AND 10000
-- Display all the data of products sorted in descending order of price.
SELECT * FROM PRODUCT 
ORDER BY Price DESC
-- Display the total number of orders, the average amount, the highest total amount and the lower total amountFor each product_id, display the number of orders
SELECT COUNT(*), AVG(Total_amount), MAX(Total_amount),MIN(Total_amount) FROM ORDERS
--Display the customer_id which has more than 2 orders 
SELECT customer_id FROM ORDERS HAVING COUNT(*) >2
-- For each month of the 2020 year, display the number of orders
SELECT COUNT(*), MONTH(OrderDate) FROM ORDERS
GROUP BY MONTH(OrderDate)
--For each order, display the product_name, the customer_name and the date of the order
SELECT Product_name, Customer_name, OrderDate FROM ORDERS
INNER JOIN PRODUCT ON ORDERS.Product_id=PRODUCT.Product_id
INNER JOIN CUSTOMER ON ORDERS.Customer_id=CUSTOMER.Customer_id
-- Display all the orders made three months ago
SELECT * FROM ORDERS WHERE EXTRACT(MONTH FROM OrderDate)>=EXTRACT(MONTH FROM SYSDATE())-3
-- Display customers (customer_id) who have never ordered a product
SELECT * FROM CUSTOMER WHERE Customer_id NOT IN (SELECT Customer_id FROM ORDERS)
