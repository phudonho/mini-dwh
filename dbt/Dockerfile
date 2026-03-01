FROM python:3.12

WORKDIR /usr/app/dbt

RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
 && pip install --no-cache-dir "dbt-core==1.8.0" "dbt-postgres==1.8.0"

CMD ["bash"]