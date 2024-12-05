--5. AGGREGATE FUNCTIONS
/*Task 1:
Calculate the total number of orders placed by all customers.*/

select count(order_id) from orders;

/*Task 2:
Find the total revenue generated from orders paid via 'UPI' from the orders
table.*/

select sum(order_amount)
from orders
where payment_mode = 'UPI';

/*Task 3:
Get the average price of all products in the products table.*/

select avg(price)
from products;

/*Task 4:
Find the maximum and minimum total price of orders placed in 2023.*/

select min(total_price),max(total_price) 
from order_items oi
join orders o
on o.order_id = oi.order_id
where extract(year from o.order_date)=2023;

/*Task 5:
Calculate the total quantity of products ordered for each product_id using 
the order_items table*/

select product_id,sum(quantity) 
from order_items
group by product_id;
