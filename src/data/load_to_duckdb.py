import duckdb

DB_PATH = "data/processed/instacart.duckdb"

con = duckdb.connect(DB_PATH)

print("Loading orders...")
con.execute("""
CREATE OR REPLACE TABLE orders AS
SELECT *
FROM read_csv_auto('data/raw/orders.csv');
""")

print("Loading order_products_prior...")
con.execute("""
CREATE OR REPLACE TABLE order_products_prior AS
SELECT *
FROM read_csv_auto('data/raw/order_products__prior.csv');
""")

print("Loading products...")
con.execute("""
CREATE OR REPLACE TABLE products AS
SELECT *
FROM read_csv_auto('data/raw/products.csv');
""")

print("Loading aisles...")
con.execute("""
CREATE OR REPLACE TABLE aisles AS
SELECT *
FROM read_csv_auto('data/raw/aisles.csv');
""")

print("Loading departments...")
con.execute("""
CREATE OR REPLACE TABLE departments AS
SELECT *
FROM read_csv_auto('data/raw/departments.csv');
""")

print("Load complete.")

for table in [
    "orders",
    "order_products_prior",
    "products",
    "aisles",
    "departments"
]:
    count = con.execute(
        f"SELECT COUNT(*) FROM {table}"
    ).fetchone()[0]

    print(f"{table}: {count:,} rows")

con.close()