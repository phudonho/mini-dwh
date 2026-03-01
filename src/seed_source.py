import os, uuid, random
from datetime import datetime, timedelta
import psycopg2

DSN = os.getenv("PG_DSN", "postgresql://dwh:dwh@localhost:5432/dwh")

def main():
    conn = psycopg2.connect(DSN)
    conn.autocommit = True
    cur = conn.cursor()

    # Clean
    cur.execute("TRUNCATE src.transactions, src.accounts, src.customers CASCADE;")

    # Customers
    segments = ["Retail", "SME", "Mass", "Priority"]
    customers = []
    for i in range(50):
        cid = f"C{1000+i}"
        customers.append(cid)
        cur.execute(
            "INSERT INTO src.customers(customer_id, full_name, segment, created_at) VALUES (%s,%s,%s,%s)",
            (cid, f"Customer {i}", random.choice(segments), datetime.now() - timedelta(days=random.randint(1, 365)))
        )

    # Accounts
    accounts = []
    products = ["CASA", "TD", "LOAN"]
    for i in range(80):
        aid = f"A{2000+i}"
        accounts.append(aid)
        cur.execute(
            "INSERT INTO src.accounts(account_id, customer_id, product, opened_at) VALUES (%s,%s,%s,%s)",
            (aid, random.choice(customers), random.choice(products), datetime.now() - timedelta(days=random.randint(1, 365)))
        )

    # Transactions
    txn_types = ["PAYMENT", "TRANSFER", "CASHIN", "CASHOUT"]
    base = datetime.now() - timedelta(days=30)
    for i in range(3000):
        tid = str(uuid.uuid4())
        t = base + timedelta(minutes=random.randint(0, 30*24*60))
        amt = round(random.uniform(10, 5000), 2)
        if random.random() < 0.4:
            amt = -amt
        cur.execute(
            "INSERT INTO src.transactions(txn_id, account_id, txn_time, amount, txn_type) VALUES (%s,%s,%s,%s,%s)",
            (tid, random.choice(accounts), t, amt, random.choice(txn_types))
        )

    cur.close()
    conn.close()
    print("Seeded src.*")

if __name__ == "__main__":
    main()