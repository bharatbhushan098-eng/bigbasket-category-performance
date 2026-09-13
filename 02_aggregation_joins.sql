-- BigBasket Capstone - Aggregation and Joins
-- 1. INNER JOIN + GROUP BY + HAVING
SELECT p.category,COUNT(o.order_id) AS total_orders,SUM(o.amount_inr) AS total_revenue,AVG(o.amount_inr) AS average_revenue FROM orders o INNER JOIN products p ON o.product_id=p.product_id WHERE o.status='Delivered' GROUP BY p.category HAVING total_revenue>10000 ORDER BY total_revenue DESC;
-- 2. LEFT JOIN
SELECT p.product_id,p.product_name,p.category,COUNT(o.order_id) AS total_orders FROM products p LEFT JOIN orders o ON p.product_id=o.product_id GROUP BY p.product_id,p.product_name,p.category ORDER BY total_orders ASC,p.product_id ASC;
