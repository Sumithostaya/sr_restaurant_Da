Create database srresturant_db;

Use srresturant_db;

Create Table order_details
(
order_details_id int not null,
order_id int not null,
order_date date,
order_time time,
item_id int,
Primary key (order_details_id)
);

CREATE TABLE menu_items (
    menu_item_id INT NOT NULL,
    item_name VARCHAR(255),
    category VARCHAR(255),
    price DECIMAL(10, 2),
    PRIMARY KEY (menu_item_id)
);

-- View the menu_items table.
Select * from menu_items;

 -- Find the number of items on the menu.
 
 Select  count(*) from menu_items;
 
-- What are the least and most expensive items on the menu?

Select * from menu_items
order by price desc;

-- How many Italian dishes are on the menu?
Select count(*) from menu_items
where category = 'Italian';

-- What are the least and most expensive Italian dishes on the menu?

Select * from menu_items
where category = 'Italian'
order by price;

Select * from menu_items
where category = 'Italian'
order by price desc;


-- How many dishes are in each category?
Select  category, count(menu_item_id) as num_dishes
from menu_items
group by category;

-- What is the average dish price within each category?

Select  category, avg(price) as avg_price
from menu_items
group by category;

-- View the order_details table. What is the date range of the table?

Select * from order_details;

-- what is the data range of the table

Select * from order_details
order by order_date;

Select min(order_date), max(order_date)  from order_details;


-- How many orders were made within this date range? 
Select count(*) from order_details;


-- how many items wrere ordered within this date range

Select count(distinct order_id ) from order_details;

-- Which orders had the most number of items?

 Select order_id, count(item_id) as mun_item
 from order_details
 group by order_id
 order by mun_item desc;

-- How many orders had more than 12 items?
Select count(*) from
   (Select order_id, count(item_id) as num_items
   from order_details
   group by order_id
   having num_items > 12) as  num_order ;
   
   -- Combine the menu_items and order_details tables into a single table.
   
   Select * from menu_items;
  Select * from order_details;
  
  Select * from order_details od
  left join menu_item mi on od.item_id = mi.menu_item_id;

-- What were the least and most ordered items? 
--  What categories were they in?

  Select item_name, categories, count(order_details_id) as num_purchases
  from order_details od
  left join menu_item mi on od.item_id = mi.menu_item_id
  group by item_name, categories
  order by num_purchases desc;
  
  
-- What were the top 5 orders that spent the most money?
select order_id, count(price) as total_spent
  from order_details od
  left join menu_item mi on od.item_id = mi.menu_item_id
  group by order_id
  order by total_spent  desc
  limit 5;
  

-- View the details of the highest spend order. 
-- What insights can you gather from the results?

Select order_id, category, count(item_id) as num_items
from order_details od 
left join menu_items mi
on  od.item_id =  mi.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by order_id, category;


   
   
   
   
   
