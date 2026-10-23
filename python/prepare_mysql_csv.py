import pandas as pd
import unicodedata

# Load cleaned dataset
df = pd.read_csv("food_products_cleaned.csv")

# Clean text columns so MySQL Workbench can read them safely
text_columns = [
    "product_name",
    "brands",
    "countries",
    "categories",
    "nutriscore_grade"
]

for column in text_columns:
    df[column] = df[column].fillna("Unknown")

    df[column] = df[column].apply(
        lambda x: unicodedata.normalize("NFKD", str(x))
        .encode("ascii", "ignore")
        .decode("ascii")
    )

# Save MySQL-compatible CSV
df.to_csv(
    "food_products_mysql.csv",
    index=False,
    encoding="ascii"
)

print("MySQL CSV created successfully!")
print("Records:", len(df))
print("File: food_products_mysql.csv")
