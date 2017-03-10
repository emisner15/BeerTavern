-- Eric Misner
-- CS 325
-- 12/09/2016

-- This report shows where in the menu the different beers would be


ttitle 'Menu ID|Beer ID| Beer'

btitle 'Humboldt | Beer Tavern'

set pagesize 35
set linesize 75


spool 325report3-results.txt

col menu_item_id heading 'Menu|Item' format a10
col beer_name heading 'Beer' format a15



drop veiw Beer_Ids;

create view beer_Ids as

select menu_item_id,beer_name
from menu_items a , beer b
where a.beer_id = b.beer_id;


spool off

ttitle off
btitle off
