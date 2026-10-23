# global-food-intelligence
An end-to-end data engineering pipeline for food and nutrition analytics using Python, Open Food Facts API, MySQL, SQL, and Power BI.

#  Global Food Intelligence Pipeline

### An End-to-End Data Engineering & Analytics Pipeline for Nutrition Data

[![Python](https://shields.io)](https://python.org)
[![MySQL](https://shields.io)](https://mysql.com)
[![PowerBI](https://shields.io)](https://microsoft.com)

## Project Overview

This project focuses on collecting, cleaning, transforming, and analysing food product data from the Open Food Facts API. The pipeline uses Python and Pandas for data processing, MySQL for data storage, SQL for transformation and analysis, and Power BI for dashboard development.

The objective is to demonstrate how raw API data can be converted into structured information and meaningful nutrition-related insights.

## Project Objectives

* Collect food product data from a public API.
* Store raw API responses in JSON format.
* Clean and prepare data using Python and Pandas.
* Store structured data in MySQL.
* Perform data transformation and analysis using SQL.
* Present nutrition-related insights through a Power BI dashboard.

## Technologies Used

* Python
* Requests
* Pandas
* Open Food Facts API
* JSON and CSV
* MySQL
* SQL
* Power BI

## Project Workflow

Open Food Facts API → Data Ingestion → Raw JSON Storage → CSV Extraction → Data Cleaning → MySQL Storage → SQL Transformation and Analysis → Power BI Dashboard

## SQL Analysis

The project includes six analytical queries:

1. **Nutrition Comparison by Category** — Compares average calories, sugar, fat, and protein across food categories.
2. **Top 10 Products by Sugar Content** — Identifies products with the highest recorded sugar values.
3. **Nutri-Score Distribution** — Analyses the distribution of recorded Nutri-Score grades.
4. **Country Values by Product Count** — Identifies the most frequently occurring country values in the dataset.
5. **Top 10 Products by Protein Content** — Identifies products with the highest recorded protein values.
6. **Sugar vs. Calories Analysis** — Explores the relationship between sugar and calorie values.

## Power BI Dashboard

The dashboard presents key metrics and visualisations for exploring the food product dataset.

### Key Performance Indicators

| KPI              | Description                                 |
| ---------------- | ------------------------------------------- |
| Total Products   | Number of products included in the analysis |
| Average Calories | Average recorded calorie content            |
| Average Sugar    | Average recorded sugar content              |
| Average Protein  | Average recorded protein content            |
| Average Fat      | Average recorded fat content                |

### Dashboard Visualisations

* Average Calories by Food Category
* Top 10 Products by Sugar Content
* Nutri-Score Distribution
* Country Values by Product Count
* Top 10 Products by Protein Content
* Sugar vs. Calories Scatter Plot

### Dashboard Preview

![Global Food Intelligence Dashboard](dashboard/dashboard_screenshot.png)

## Repository Structure

```text
global-food-intelligence/
├── python/
│   ├── food_api_test.py
│   ├── food_data_ingestion.py
│   ├── clean_food_data.py
│   └── prepare_mysql_csv.py
├── sql/
│   ├── create_database.sql
│   ├── data_transformation.sql
│   └── data_analysis.sql
├── data/
│   ├── food_products_raw.json
│   └── food_products_cleaned.csv
├── dashboard/
│   ├── food_intelligence_dashboard.pbix
│   └── dashboard_screenshot.png
├── requirements.txt
└── README.md
```

## Setup and Execution

### Requirements

* Python 3.x
* MySQL Server and MySQL Workbench
* Power BI Desktop

### Install Python Dependencies

```bash
pip install -r requirements.txt
```

### Database Setup

1. Execute `create_database.sql` to create the database and original table.
2. Import the prepared food product dataset into MySQL.
3. Execute `data_transformation.sql` to create the transformed table.
4. Execute `data_analysis.sql` to run the analytical queries.

### Dashboard

Open `food_intelligence_dashboard.pbix` from the `dashboard` folder using Power BI Desktop. Configure the appropriate data-source connection if refreshing the data.

## Limitations

* The analysis depends on the availability and quality of data provided by Open Food Facts.
* Some products may contain incomplete nutritional information.
* Categories and country values may contain multiple entries or variations.
* Country counts reflect the country values stored in the dataset and do not necessarily represent normalised counts of individual countries.
* The findings represent the collected dataset and should not be generalised to all food products worldwide.

## Author

**Disha**
B.Sc. Data Science — Third Year
