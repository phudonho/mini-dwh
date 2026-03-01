select
  account_id,
  customer_id,
  product,
  opened_at::timestamp as opened_at
from raw.accounts_snapshot