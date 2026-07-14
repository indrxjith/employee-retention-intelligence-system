import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine import URL


# PostgreSQL connection details
username = "postgres"
password = ""
host = "localhost"
port = 5433
database = "employee_retention"


# Create a safe PostgreSQL connection URL
connection_url = URL.create(
    drivername="postgresql+psycopg2",
    username=username,
    password=password,
    host=host,
    port=port,
    database=database
)

# Create database engine
engine = create_engine(connection_url)


# CSV file path
csv_path = "../data/WA_Fn-UseC_-HR-Employee-Attrition.csv"


# Read CSV file
df = pd.read_csv(csv_path)


# Display CSV information
print("=" * 50)
print("CSV loaded successfully")
print(f"Rows: {df.shape[0]}")
print(f"Columns: {df.shape[1]}")
print("=" * 50)


# Load data into PostgreSQL
df.to_sql(
    name="staging_hr_employee",
    con=engine,
    if_exists="replace",
    index=False
)


# Success message
print("✅ Data imported into PostgreSQL successfully!")
