
  create view "dwh"."analytics_stg"."stg_transactions__dbt_tmp"
    
    
  as (
    select
  txn_id,
  account_id,
  txn_time::timestamp as txn_time,
  amount::numeric(18,2) as amount,
  txn_type
from raw.transactions_snapshot
  );