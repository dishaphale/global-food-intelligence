USE food_intelligence;
CREATE TABLE food_products (
    barcode VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    brands VARCHAR(255),
    countries TEXT,
    categories TEXT,
    calories DECIMAL(10,2),
    fat DECIMAL(10,2),
    saturated_fat DECIMAL(10,2),
    carbohydrates DECIMAL(10,2),
    sugars DECIMAL(10,2),
    proteins DECIMAL(10,2),
    salt DECIMAL(10,2),
    nutriscore_grade VARCHAR(10)
);
SHOW TABLES;
DESCRIBE food_products;
SELECT COUNT(*) AS total_products
FROM food_products;
SHOW WARNINGS;
SELECT COUNT(*) AS total_products,
       COUNT(DISTINCT barcode) AS unique_barcodes
FROM food_products;

SELECT
    COUNT(*) AS total,
    SUM(product_name IS NULL) AS missing_names,
    SUM(brands IS NULL) AS missing_brands,
    SUM(countries IS NULL) AS missing_countries,
    SUM(categories IS NULL) AS missing_categories,
    SUM(calories IS NULL) AS missing_calories,
    SUM(fat IS NULL) AS missing_fat,
    SUM(saturated_fat IS NULL) AS missing_saturated_fat,
    SUM(carbohydrates IS NULL) AS missing_carbohydrates,
    SUM(sugars IS NULL) AS missing_sugars,
    SUM(proteins IS NULL) AS missing_proteins,
    SUM(salt IS NULL) AS missing_salt
FROM food_products;

SELECT
    MAX(LENGTH(barcode)) AS max_barcode_length,
    MAX(LENGTH(product_name)) AS max_product_name_length,
    MAX(LENGTH(brands)) AS max_brand_length
FROM food_products;

SELECT COUNT(*) AS blank_barcodes
FROM food_products
WHERE barcode = '' OR barcode IS NULL;

SELECT barcode, COUNT(*) AS occurrences
FROM food_products
GROUP BY barcode
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS total_products
FROM food_products;







-- Transformation 
CREATE TABLE food_products_transformed AS
SELECT
    barcode,
    product_name,
    brands,
    countries,

    -- Take the first category
    TRIM(SUBSTRING_INDEX(categories, ',', 1)) AS primary_category,

    calories,
    fat,
    saturated_fat,
    carbohydrates,
    sugars,
    proteins,
    salt,

    nutriscore_grade,

    -- Convert Nutri-Score to numerical value
    CASE
        WHEN LOWER(nutriscore_grade) = 'a' THEN 5
        WHEN LOWER(nutriscore_grade) = 'b' THEN 4
        WHEN LOWER(nutriscore_grade) = 'c' THEN 3
        WHEN LOWER(nutriscore_grade) = 'd' THEN 2
        WHEN LOWER(nutriscore_grade) = 'e' THEN 1
        ELSE NULL
    END AS nutriscore_value

FROM food_products;

SELECT *
FROM food_products_transformed
LIMIT 10;

DESCRIBE food_products_transformed;

-- Analysis --

-- 1.Nutrition comparison by category 
SELECT
    primary_category,
    COUNT(*) AS product_count,
    ROUND(AVG(calories), 2) AS avg_calories,
    ROUND(AVG(sugars), 2) AS avg_sugar,
    ROUND(AVG(fat), 2) AS avg_fat,
    ROUND(AVG(proteins), 2) AS avg_protein
FROM food_products_transformed
WHERE primary_category IS NOT NULL
GROUP BY primary_category
HAVING COUNT(*) >= 3
ORDER BY avg_calories DESC;

-- 2.Top 10 Highest-Sugar Products
SELECT
    product_name,
    brands,
    sugars,
    primary_category
FROM food_products_transformed
WHERE sugars IS NOT NULL
ORDER BY sugars DESC
LIMIT 10;

-- 3.Nutri-Score Distribution
SELECT
    nutriscore_grade,
    COUNT(*) AS product_count
FROM food_products_transformed
WHERE nutriscore_grade IS NOT NULL
GROUP BY nutriscore_grade
ORDER BY product_count DESC;

-- 4.Top 10 Countries by Product Count
SELECT
    countries,
    COUNT(*) AS product_count
FROM food_products_transformed
WHERE countries IS NOT NULL
GROUP BY countries
ORDER BY product_count DESC
LIMIT 10;

-- 5.Top 10 Highest-Protein Products 
SELECT
    product_name,
    brands,
    proteins,
    primary_category
FROM food_products_transformed
WHERE proteins IS NOT NULL
ORDER BY proteins DESC
LIMIT 10;

-- 6.Sugar vs Calories relationship 
SELECT
    product_name,
    sugars,
    calories,
    primary_category
FROM food_products_transformed
WHERE sugars IS NOT NULL
  AND calories IS NOT NULL;