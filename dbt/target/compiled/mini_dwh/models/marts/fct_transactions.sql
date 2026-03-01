

select
  t.txn_id,
  t.txn_time,
  date_trunc('day', t.txn_time) as txn_date,
  t.amount,
  t.txn_type,
  a.account_id,
  a.product,
  a.customer_id
from "dwh"."analytics_stg"."stg_transactions" t
join "dwh"."analytics_stg"."stg_accounts" a using (account_id)

