select
  customer_id,
  full_name,
  segment,
  created_at::timestamp as created_at
from raw.customers_snapshot