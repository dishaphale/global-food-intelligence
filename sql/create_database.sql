CREATE DATABASE IF NOT EXISTS food_intelligence;
USE food_intelligence;
CREATE TABLE IF NOT EXISTS food_products (
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