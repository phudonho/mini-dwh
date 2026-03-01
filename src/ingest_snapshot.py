import os
import psycopg2

DSN = os.getenv("PG_DSN", "postgresql://dwh:dwh@localhost:5432/dwh")

def main():
    conn = psycopg2.connect(DSN)
    conn.autocommit = True
    cur = conn.cursor()

    cur.execute("TRUNCATE raw.customers_snapshot, raw.accounts_snapshot, raw.transactions_snapshot;")

    cur.execute("INSERT INTO raw.customers_snapshot SELECT * FROM src.customers;")
    cur.execute("INSERT INTO raw.accounts_snapshot SELECT * FROM src.accounts;")
    cur.execute("INSERT INTO raw.transactions_snapshot SELECT * FROM src.transactions;")

    cur.close()
    conn.close()
    print("Ingested snapshots to raw.*")

if __name__ == "__main__":
    main()