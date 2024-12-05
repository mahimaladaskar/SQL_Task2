--1. JOINS
/* Task 1:
Retrieve the customer_name, city, and order_date for each customer who 
placed an order in 2023 by joining the customers and orders tables.*/

select c.customer_name,c.city,o.order_date 
from customers c 
join orders o
on c.customer_id = o.customer_id
where extract(year from o.order_date)=2023;


/* Task 2:
Get a list of all products (with product_name, category, and total_price) 
ordered by customers living in Mumbai, by joining the customers, orders, 
order_items, and products tables. */

select p.product_name,p.category,oi.total_price 
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
join products p 
on p.product_id = oi.product_id
where c.city = 'Mumbai';

/* Task 3:
Find all orders where customers paid using 'Credit Card' and display the 
customer_name, order_date, and total_price by joining the customers, 
orders, and order_items tables.
*/

select c.customer_name,o.order_date,oi.total_price 
from customers c
join orders o 
on c.customer_id = o.customer_id
join order_items oi 
on o.order_id = oi.order_id
where o.payment_mode = 'Credit Card';

/* Task 4:
Display the product_name, category, and the total_price for all products 
ordered in the first half of 2023 (January - June) by joining the orders, 
order_items, and products tables. */

select p.product_name,p.category,oi.total_price 
from orders o
join order_items oi
on o.order_id = oi.order_id
join products p
on p.product_id = oi.product_id
where o.order_date between '2023-01-01' and '2023-06-30';

/* Task 5:
Show the total number of products ordered by each customer, displaying 
customer_name and total products ordered, using joins between 
customers, orders, and order_items.
*/

select customer_name, sum(oi.quantity) as total_pro_ordered
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
group by customer_name;





