use customer_behavior;
SELECT * FROM customer;
-- total revenue by male and female cus?
select gender,sum(purchase_amount) as revenue from customer group by gender;
-- which customer used a discount but still spent more than avg purchase amount?
select customer_id,purchase_amount from customer where discount_applied='yes' and purchase_amount>=(select avg(purchase_amount) from customer);
-- which are the top 5 products with the higest avg review rating?
select item_purchased,avg(review_rating) from customer group by (item_purchased) order by avg(review_rating) desc limit 5;
-- compare the avg purchase amounts between standard and express shiping?
select shipping_type,avg(purchase_amount) from customer where shipping_type='Express'or shipping_type='Standard' group by(shipping_type);
-- compare avg spend and revenue between subscribers and non subs? which spends more
select subscription_status,count(customer_id) ,round(avg(purchase_amount),2),sum(purchase_amount) from customer group by subscription_status;

