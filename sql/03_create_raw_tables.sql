CREATE TABLE IF NOT EXISTS raw.customers_snapshot (LIKE src.customers INCLUDING ALL);
CREATE TABLE IF NOT EXISTS raw.accounts_snapshot  (LIKE src.accounts INCLUDING ALL);
CREATE TABLE IF NOT EXISTS raw.transactions_snapshot (LIKE src.transactions INCLUDING ALL);

TRUNCATE raw.customers_snapshot, raw.accounts_snapshot, raw.transactions_snapshot;