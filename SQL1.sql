-- Last name starts with MY or contains SE
 select last_name from  customers
where last_name regexp 'my|se';

-- Last name contains b followed by R or U
select * from customers
where last_name like 'b[ru]';

 -- Get the orders that are not shipped
 select * from orders
 where shipped_date is null;
 
 -- Start order times by order_id = 2 descending orders as per their total price
 
  SELECT order_id, quantity*unit_price as total_price FROM order_items
 where order_id =2
 order  by total_price desc;
 
  -- Get the top 3 loyal customers
 select * from customers
 order by first_name
 limit 3;
 
 -- Join order_items table with products
 select * from order_items oi
 join products p
 on oi.product_id = p.product_id;
 
  -- In sql_invoicing join 3 tables payment, client, payment_methods and show name of the client and payment method
  
  
    select c.name,pm.name,p.payment_method from payment_methods pm
  join clients c 
  on pm.name = c.name
  join payments p
  on c.client_id= p.payment_id;
  
  -- Join product with order_items table and show product_id, product name, and quantity
  select p.product_id, name, oi.quantity from products p
  join order_items oi
  on p.product_id = oi.product_id;
  
  -- Get all rows with these columns – order_date, order_id, first_name, shipper, status
  select order_date, order_id,c.customer_id, status from orders o
  join customers c
  on o.customer_id = c.customer_id;
  
  --  Write a query from sql_invoicing to get date, client name, amount, payment method
  select date, c.name , payment_method, amount from payments p
  join clients 
  on p.payment_id = p. payment_id
  join clients c
  on c.client_id = p.client_id;
  
  -- Get customer_id, first_name, points, type 0-1000 bronze, 2000-3000 silver and 3000> gold
   select customer_id , first_name,points ,"bronze" as medal
   from customers
   where points between 0 to 1000
union
select customer_id , first_name ,points, "silver" as meadal 
from customers
where points between 1000 to 2000
union
select customer_id , first_name,points, "gold"  as medal
 from customers
where points >3000;
   
 -- Last name ends with EY or ON 
 select last_name from  customers
where last_name regexp 'caffrey|son';

-- Get the customers whose phone numbers ends with 9
  select * from  customers
where phone like '%9';

-- From order_items tables, get the items for the order number 6 where the total price >30
SELECT order_id, quantity*unit_price as total FROM order_items
having order_id= 6 and total>30;
  
 --  Get the order placed in 2019
 select * from orders
 where order_date > '2019-01-01';
 
 
 
 
 
 
 
 