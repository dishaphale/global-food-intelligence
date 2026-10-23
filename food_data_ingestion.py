import requests
import json
import csv
import time
from requests.auth import HTTPBasicAuth

url = "https://world.openfoodfacts.net/api/v2/search"

headers = {
    "User-Agent": "GlobalFoodIntelligence/1.0 (student-project)"
}

all_products = []

for page in range(1, 6):

    print("\nFetching page:", page)

    params = {
        "page": page,
        "page_size": 100,
        "fields": "code,product_name,brands,countries,categories,nutriments,nutriscore_grade"
    }

    response = requests.get(
        url,
        params=params,
        headers=headers,
        auth=HTTPBasicAuth("off", "off"),
        timeout=30
    )

    print("Status Code:", response.status_code)

    if response.status_code == 200:

        data = response.json()

        products = data.get("products", [])

        all_products.extend(products)

        print("Products received:", len(products))
        print("Total products:", len(all_products))

        time.sleep(2)

    else:
        print("API Error:", response.status_code)
        break


# Save raw JSON
with open("food_products_raw.json", "w", encoding="utf-8") as file:
    json.dump(all_products, file, indent=4, ensure_ascii=False)


# Save CSV
with open("food_products.csv", "w", newline="", encoding="utf-8") as file:

    writer = csv.writer(file)

    writer.writerow([
        "barcode",
        "product_name",
        "brands",
        "countries",
        "categories",
        "calories",
        "fat",
        "saturated_fat",
        "carbohydrates",
        "sugars",
        "proteins",
        "salt",
        "nutriscore_grade"
    ])

    for product in all_products:

        nutrients = product.get("nutriments", {})

        writer.writerow([
            product.get("code", ""),
            product.get("product_name", ""),
            product.get("brands", ""),
            product.get("countries", ""),
            product.get("categories", ""),
            nutrients.get("energy-kcal_100g", ""),
            nutrients.get("fat_100g", ""),
            nutrients.get("saturated-fat_100g", ""),
            nutrients.get("carbohydrates_100g", ""),
            nutrients.get("sugars_100g", ""),
            nutrients.get("proteins_100g", ""),
            nutrients.get("salt_100g", ""),
            product.get("nutriscore_grade", "")
        ])


print("\n==============================")
print("DATA INGESTION COMPLETED")
print("==============================")
print("Total products collected:", len(all_products))
print("Raw file: food_products_raw.json")
print("CSV file: food_products.csv")
