import pandas as pd

# Load original CSV
df = pd.read_csv("food_products.csv")

print("Original records:", len(df))

# Remove duplicate products
df = df.drop_duplicates(subset="barcode")

# Remove products without product name
df = df.dropna(subset=["product_name"])

# Nutrition columns
numeric_columns = [
    "calories",
    "fat",
    "saturated_fat",
    "carbohydrates",
    "sugars",
    "proteins",
    "salt"
]

# Convert nutrition columns to numbers
# Invalid/missing values become NaN
for column in numeric_columns:
    df[column] = pd.to_numeric(df[column], errors="coerce")

# Text columns
text_columns = [
    "brands",
    "countries",
    "categories",
    "nutriscore_grade"
]

# Fill missing text values
for column in text_columns:
    df[column] = df[column].fillna("Unknown")

# Save properly cleaned dataset
df.to_csv(
    "food_products_cleaned.csv",
    index=False,
    na_rep="",
    encoding="utf-8-sig"
)

print("Cleaned records:", len(df))
print("Cleaning completed successfully!")
print("File created: food_products_cleaned.csv")

# Show missing nutritional values
print("\nMissing nutritional values:")
print(df[numeric_columns].isna().sum())
