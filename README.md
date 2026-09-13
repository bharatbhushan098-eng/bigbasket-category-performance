# BigBasket Category Performance Diagnostic

## Project Overview

This project analyzes BigBasket-style order data to diagnose category-level performance against revenue targets.

The project covers SQL data analysis, spreadsheet reconciliation, Python-based data cleaning and exploratory analysis, and an interactive Tableau Public dashboard.

## Dataset

The project uses a deterministic dataset generated with seed 42.

Expected dataset counts:

- Products: 31
- Customers: 50
- Orders: 500
- Category Targets: 6
- Delivered Orders: 434
- Cancelled Orders: 42
- Pending Orders: 24

## Repository Structure

- `generate_data.py` — deterministic dataset generation
- `bigbasket_capstone.db` — SQLite database
- `orders_raw.csv` — raw orders data
- `products.csv` — product master data
- `verify.sql` — database verification queries
- `01_foundations.sql` — foundational SQL queries
- `02_aggregation_joins.sql` — aggregation and JOIN analysis
- `03_reporting.sql` — reporting queries and category target analysis
- `monthly_category_revenue.csv` — monthly category revenue report
- `analysis.ipynb` — Python data cleaning, analysis and visualization
- `BigBasket_Category_Performance_Cross_Check.xlsx` — spreadsheet analysis and reconciliation
- `DATA_STORY.md` — category performance data story and recommendations
- `ai_log.md` — AI usage and verification log

## SQL Analysis

The SQL analysis is divided into three stages:

### 01 Foundations

Includes:

- SELECT and WHERE filtering
- DISTINCT category analysis
- ORDER BY and LIMIT
- Column aliases
- IN filtering
- BETWEEN / NOT BETWEEN
- NULL checks

### 02 Aggregation and Joins

Includes:

- Orders and products INNER JOIN
- Category-level COUNT, SUM and AVG
- Delivered-order revenue analysis
- HAVING filter for categories above ₹10,000 revenue
- Products with zero orders using LEFT JOIN

### 03 Reporting

Includes:

- Order value tier classification using CASE
- Monthly category revenue
- Category target variance
- Floating-point-safe percentage variance calculations

## Spreadsheet Analysis

The spreadsheet contains:

- Monthly Data
- Category Targets
- Native PivotTable
- Category Summary
- Revenue vs target analysis
- Variance and percentage variance
- Category status classification
- Conditional formatting
- Reconciliation checks

Overall revenue reconciliation:

**₹88,282**

Delivered orders:

**434**

## Category Performance Summary

| Category | Revenue | Target | Status |
|---|---:|---:|---|
| Household Essentials | ₹21,715 | ₹17,000 | Above Target |
| Personal Care | ₹16,382 | ₹15,500 | Above Target |
| Bakery | ₹15,410 | ₹12,000 | Above Target |
| Dairy & Eggs | ₹14,090 | ₹16,500 | Below Target - Watch |
| Snacks & Beverages | ₹10,895 | ₹13,000 | Below Target - Watch |
| Fruits & Vegetables | ₹9,790 | ₹12,000 | Below Target - Watch |

## Python Analysis

`analysis.ipynb` performs:

- Raw data inspection
- Duplicate order removal
- Text standardization
- Missing-value handling
- Outlier detection using IQR
- Delivered-order analysis
- Revenue-per-unit calculation
- Monthly revenue analysis
- Category and supplier analysis
- Matplotlib visualizations
- Key analytical insights

The IQR method identified unusually high delivered-order amounts, which were capped at the calculated upper fence for exploratory analysis.

The strongest cleaned/capped monthly revenue was observed in **May 2026**.

## Tableau Public Dashboard

The interactive Tableau dashboard includes:

- Monthly revenue from January to June 2026
- Category revenue comparison
- Category status visualization
- Total Revenue KPI
- Total Delivered Orders KPI
- Average Order Value KPI
- Categories Meeting Target KPI
- Interactive filtering
- Category status legend

### Live Tableau Public Dashboard

https://public.tableau.com/app/profile/bharat.tomar/viz/BigBasketCategoryPerformenceDashboard/BigBasketCategoryPerformanceDashboard?publish=yes

## Data Story

The analysis identifies strong performance in Household Essentials, Personal Care and Bakery, while Dairy & Eggs, Snacks & Beverages, and Fruits & Vegetables remain below their respective targets.

The project includes two recommendations based on the category-level performance analysis in `DATA_STORY.md`.

## Validation

The project includes SQL verification, spreadsheet reconciliation and Python analysis to cross-check the results across multiple tools.

Key reconciliation result:

**Grand Total Revenue = ₹88,282**

**Delivered Orders = 434**

## Conclusion

This project demonstrates an end-to-end category performance diagnostic workflow using SQL, spreadsheets, Python and Tableau.

The analysis moves from raw data validation and cleaning to category-level target comparison, visualization and business recommendations.
