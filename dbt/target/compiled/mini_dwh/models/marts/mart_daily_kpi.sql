select
  txn_date,
  count(*) as txn_cnt,
  sum(amount) as net_amount,
  sum(case when amount > 0 then amount else 0 end) as inflow,
  sum(case when amount < 0 then -amount else 0 end) as outflow,
  count(distinct customer_id) as active_customers
from "dwh"."analytics_mart"."fct_transactions"
group by 1
order by 1