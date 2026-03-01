{{ config(materialized='incremental', unique_key='txn_id') }}

select
  t.txn_id,
  t.txn_time,
  date_trunc('day', t.txn_time) as txn_date,
  t.amount,
  t.txn_type,
  a.account_id,
  a.product,
  a.customer_id
from {{ ref('stg_transactions') }} t
join {{ ref('stg_accounts') }} a using (account_id)

{% if is_incremental() %}
  where t.txn_time > (select coalesce(max(txn_time), '1900-01-01'::timestamp) from {{ this }})
{% endif %}