import requests
import json

url = "https://world.openfoodfacts.org/api/v3/product/3017624010701"

headers = {
    "User-Agent": "GlobalFoodIntelligence/1.0 (student-project)"
}

response = requests.get(url, headers=headers)

response.raise_for_status()

data = response.json()

print("Status Code:", response.status_code)
print(json.dumps(data, indent=4))
