
-- Eric Misner

-- CS 325 Presentation

-- 12/6/2016


-- This report grabs all of the customers purchase info like the last date they bought something at the bar and the price of that beer
-- it also shows the names of the customers and the age; just for leagal reasons.


ttitle 'Customer | Purchase Info'

btitle 'Humboldt | Beer Tavern'

set pagesize 35
set linesize 75

spool 325report1-results.txt

col cust_fname heading 'Customers|First Name' format a15
col cust_lname heading 'Customer|Last Name' format a11
col cust_birth heading  'Birthday' format a9 
col cust_cell_phone heading 'Customer|Cell|Number' format a15
col sale_date heading  'Customer|Purchase|Date'format 15
col sale_total heading 'Sale|Total' format $0.99


drop view customer_pur_info;

create view customer_pur_info as

select cust_fname,cust_lname,cust_birth,cust_cell_phone,sale_date,sale_total
from sales a , customers b , cust_numbers c
where a.cust_id = b.cust_id and(b.cust_id = c.cust_id)
order by cust_lname;

spool off

ttitle off
btitle off

