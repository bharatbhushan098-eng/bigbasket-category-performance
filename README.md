# BigBasket Category Performance Diagnostic

A connected BigBasket-style category performance diagnostic built across SQLite, spreadsheet analysis, Tableau Public, and Pandas.

## Project overview

Part 1 creates the deterministic SQLite dataset and produces the fixed monthly-by-category revenue CSV. Part 2 rebuilds those same totals in a spreadsheet and reconciles them. Part 3 visualizes the fixed CSV in one Tableau Public dashboard. Part 4 independently cleans the deliberately messy raw export in Pandas and cross-validates the leading category.

## Repository structure

- `generate_data.py` — exact deterministic data-generation script.
- `bigbasket_capstone.db` — SQLite database used for Parts 1–3.
- `orders_raw.csv` — deliberately messy raw order export for Part 4.
- `products.csv` — product/supplier reference data for Part 4.
- `verify.sql` — database count/status verification.
- `01_foundations.sql` — foundational SQL queries.
- `02_aggregation_joins.sql` — joins, aggregation, and HAVING queries.
- `03_reporting.sql` — tiering, monthly reporting, and target variance queries.
- `monthly_category_revenue.csv` — fixed 36-row Part 1 output consumed by Parts 2–3.
- `BigBasket_Category_Performance_Cross_Check.xlsx` — spreadsheet workbook.
- `analysis.ipynb` — complete Pandas cleaning, validation, and chart workflow.
- `DATA_STORY.md` — category target story and two recommendations.
- `ai_log.md` — two RCTCF AI-assisted prompts and concrete verification steps.

## Regenerate Part 1

From the repository root:

```bash
python3 generate_data.py
```

The script uses `random.seed(42)` and must not be modified for the fixed acceptance results.

Expected database counts:

- products: 31
- customers: 50
- orders: 500
- category_targets: 6
- Delivered: 434
- Cancelled: 42
- Pending: 24

The fixed monthly revenue export has 36 rows and a grand total Delivered revenue of ₹88,282.

## SQL pointers

- Foundational syntax: `01_foundations.sql`
- Aggregation and joins: `02_aggregation_joins.sql`
- Reporting and target variance: `03_reporting.sql`
- Verification: `verify.sql`

## Spreadsheet

Workbook: `BigBasket_Category_Performance_Cross_Check.xlsx`

The workbook contains Monthly Data, Category Targets, Pivot Table, and Category Summary. The final submission should contain a native working PivotTable created in Google Sheets/Excel with Category as Rows and SUM(total_revenue) plus SUM(order_count) as Values.

## Tableau Public dashboard

**Live Tableau Public URL:** `https://public.tableau.com/app/profile/bharat.tomar/viz/BigBasketCategoryPerformenceDashboard/BigBasketCategoryPerformanceDashboard?publish=yes`

The final dashboard should contain:
- monthly revenue trend for Jan–Jun 2026,
- descending category revenue bar chart,
- category target-tier coloring,
- four KPI cards,
- a visible interactive filter/action affecting all worksheets.

## Data story

See `DATA_STORY.md` for the category-by-category target status, shortfall/overage amounts, and exactly two recommendations.

## Python / Pandas

Run `analysis.ipynb` from the repository root. It loads `orders_raw.csv` and `products.csv`, removes duplicate order IDs, standardizes city/category, retains missing revenue as missing, caps Delivered outliers using the IQR upper fence, and cross-validates the top category and supplier.

## AI-assisted prompting

See `ai_log.md` for both required RCTCF prompts and the concrete verification performed for each.
