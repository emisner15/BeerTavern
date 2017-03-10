-- Eric Misner

-- CS 325

-- 12/7/2016


-- This report is usfull if you wanted to check what beers came in what serving styles
-- and the price of the serving style that the beer comes in.
-- It also displays the ammount for each serving style and shows a count
-- so that we can see which style the beers can come in.
ttitle 'Beer | Type Info'

btitle 'Humboldt | Beer Tavern'

set pagesize 35
set linesize 75


spool 325report2-results.txt

break on beer_name skip 1 on serving_style
compute count of serving_style on beer_name

col beer_name heading 'Beers' format a15
col serving_style_name heading 'Serving|Styles' format a10
col serving_quatity heading 'Amount|For|Style' format a5
col price heading 'Price|Of|Style' format $0.99

drop veiw beer_serving_style_info;

create veiw beer_serving_style_info as

select beer_name,serving_style,serving_quantity,price
from serving_style a, beer b,beer_serving_style c
where b.beer_id = c.beer_id and(c.serving_style_id = a.serving_style_id);

spool off

ttitle off
btitle off
