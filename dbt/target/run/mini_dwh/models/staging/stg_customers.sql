
  create view "dwh"."analytics_stg"."stg_customers__dbt_tmp"
    
    
  as (
    select
  customer_id,
  full_name,
  segment,
  created_at::timestamp as created_at
from raw.customers_snapshot
  );