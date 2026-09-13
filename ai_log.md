# AI-Assisted Prompting Log

## AI-Assisted Prompt #1 — SQL (RCTCF)

### Role
You are an experienced SQL data analyst helping me debug a SQLite query for a BigBasket-style category performance diagnostic project.

### Context
I have a SQLite database named `bigbasket_capstone.db` containing `orders`, `products`, `customers`, and `category_targets` tables. The `orders` table contains order dates, quantities, amounts, payment modes, statuses, and ratings. The `products` table contains product names, categories, suppliers, and prices.

### Task
Help me write a SQL query that produces a monthly-by-category business report using only Delivered orders. The output must contain category, month, order_count, total_revenue, and avg_revenue.

### Constraints
Use SQLite syntax. The month must be created using `strftime('%Y-%m', order_date)`. Join `orders` with `products` using `product_id`. Group the results by category and month. Do not include Cancelled or Pending orders. The query must be runnable directly against the database.

### Format
Return only the SQL query in a code block, followed by a short explanation of how the query works.

### Verification Performed
I ran the resulting monthly-by-category query against `bigbasket_capstone.db` and verified that it returned 36 category-month rows and a grand total Delivered revenue of 88282.

## AI-Assisted Prompt #2 — Pandas (RCTCF)

### Role
You are an experienced Python/Pandas data analyst helping me clean and validate a deliberately messy retail order export.

### Context
I have `orders_raw.csv` and `products.csv` from a deterministic BigBasket-style diagnostic. The raw orders file contains duplicate order IDs, inconsistent city/category casing and whitespace, missing `amount_inr` values, and artificially large amount outliers.

### Task
Help me write a Pandas workflow that loads the two CSVs, diagnoses the raw data, removes duplicate order IDs while keeping the first row, standardizes city/category with `str.strip().str.title()`, leaves missing amounts as missing, caps Delivered non-null amount outliers using the IQR upper fence, derives month/month_name/revenue_per_unit/is_delivered, and then finds the top category and top supplier by capped Delivered revenue.

### Constraints
Use `pd.read_csv()`. Do not fill missing revenue values. Revenue calculations must exclude missing amounts. Calculate Q1 and Q3 with `quantile()`, IQR as Q3-Q1, and the upper fence as Q3 + 1.5*IQR. Use `.clip(upper=...)` to cap values. Merge products on `product_id` to obtain supplier. The workflow must remain reproducible from the repo root.

### Format
Return a concise, runnable Pandas workflow with clear diagnostic printouts and three matplotlib charts.

### Verification Performed
I ran the workflow on `orders_raw.csv` and `products.csv`, confirmed 508 raw rows reduced to exactly 500 after duplicate removal, found 16 Delivered amount values above the IQR fence, and confirmed the top cleaned/capped category was `Household Essentials` and the top supplier was `HomeEssentials Traders`.
