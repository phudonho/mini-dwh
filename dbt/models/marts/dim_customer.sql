select
  c.customer_id,
  c.full_name,
  c.segment,
  min(a.opened_at) as first_account_opened_at,
  count(distinct a.account_id) as account_cnt
from {{ ref('stg_customers') }} c
left join {{ ref('stg_accounts') }} a using (customer_id)
group by 1,2,3