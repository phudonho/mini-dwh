FROM python:3.11-slim

WORKDIR /usr/app/dbt

# libs cho psycopg2 / dbt-postgres
RUN apt-get update && apt-get install -y --no-install-recommends \
    git gcc libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# cài dbt
RUN pip install --no-cache-dir dbt-postgres==1.8.0

# mặc định chạy bash để exec lệnh dbt
CMD ["bash"]