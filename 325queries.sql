-- Eric Misner
-- CS 325 
-- 12/9/2016


spool 325query-results.txt

prompt query 1

select cust_lname,cust_birth,cust_age
from customers;

prompt query 2

select beer_name,serving_style,beer_style_name
from serving_style,beer_style,beer,beer_serving_style
where beer.beer_id = beer_serving_style.beer_id
                     and (beer_serving_style.serving_style_id = serving_style.serving_style_id)
                     and (beer.beer_style_id = beer_style.beer_style_id)
                     and (beer_name = 'Blue Moon');

prompt query 3

select sale_total,menu_item_id
from menu_items a,sales b
where a.purchase_id in (select b.purchase_id
                        from sales);

prompt query 4

select sum(bottle_ammount)
from beer;

prompt query 5

select distinct menu_item_id,sale_total
from  sales,menu_items
where sales.purchase_id = menu_items.purchase_id and(sale_total < 7);

prompt query 6

select serving_style,serving_quantity,beer_name
from serving_style,beer_serving_style,beer
where beer.beer_id = beer_serving_style.beer_id and(serving_style.serving_style_id = beer_serving_style.serving_style_id);

prompt query 7

select avg(sale_total),sale_date
from sales
group by sale_date;

prompt query 8

(select beer_style_id
 from beer
 where beer_name = 'Sam Adams')
union
(select beer_style_id
 from beer_style
 where beer_style_name = 'Lager');




spool off
