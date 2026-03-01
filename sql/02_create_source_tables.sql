CREATE TABLE IF NOT EXISTS src.customers (
  customer_id TEXT PRIMARY KEY,
  full_name   TEXT,
  segment     TEXT,
  created_at  TIMESTAMP
);

CREATE TABLE IF NOT EXISTS src.accounts (
  account_id  TEXT PRIMARY KEY,
  customer_id TEXT REFERENCES src.customers(customer_id),
  product     TEXT,
  opened_at   TIMESTAMP
);

CREATE TABLE IF NOT EXISTS src.transactions (
  txn_id      TEXT PRIMARY KEY,
  account_id  TEXT REFERENCES src.accounts(account_id),
  txn_time    TIMESTAMP,
  amount      NUMERIC(18,2),
  txn_type    TEXT
);