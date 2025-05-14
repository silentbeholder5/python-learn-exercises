-- 1. Basic SELECT and Filtering:
-- Retrieve all product names and their unit prices, but only for products priced above $20.
SELECT product_name, unit_price
FROM products
WHERE unit_price > 20;

-- 2. Sorting and Limiting Results:
-- List the top 10 most expensive products, including their names and unit prices.
SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 10;

-- 3. String Functions:
-- Extract the first three letters of each product name and display them alongside the product names.
SELECT product_name, SUBSTRING(product_name, 1, 3) AS first_three_letters
FROM products;

-- 4. Aggregation and Grouping:
-- Calculate the total sales amount (quantity * unit price) for each product.
SELECT p.product_name, SUM(od.quantity * od.unit_price) AS total_sales
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.product_name;

-- 5. Conditional Aggregation:
-- Calculate the total sales for products that are either discontinued or still active.
SELECT
    CASE WHEN p.discontinued = 1 THEN 'Discontinued' ELSE 'Active' END AS status,
    SUM(od.quantity * od.unit_price) AS total_sales
FROM products p
JOIN order_details od ON p.product_id = od.product_id
GROUP BY p.discontinued;

-- 6. JOIN Operations:
-- Retrieve the order ID, customer name, and employee name for all orders.
SELECT o.order_id, c.company_name AS customer_name,
       e.first_name || ' ' || e.last_name AS employee_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN employees e ON o.employee_id = e.employee_id;

-- 7. Complex JOIN:
-- List all products with their corresponding category and supplier names.
SELECT p.product_name, c.category_name, s.company_name AS supplier_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- 8. Subqueries:
-- List all products where the unit price is higher than the average product price.
SELECT product_name, unit_price
FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products);

-- 9. HAVING Clause:
-- List all categories and their total sales, but only include categories with total sales above $10,000.
SELECT c.category_name, SUM(od.quantity * od.unit_price) AS total_sales
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_details od ON p.product_id = od.product_id
GROUP BY c.category_name
HAVING SUM(od.quantity * od.unit_price) > 10000;

-- 10. Window Functions:
-- Rank products within each category based on their unit prices (highest to lowest).
SELECT
    product_name,
    category_id,
    unit_price,
    RANK() OVER (PARTITION BY category_id ORDER BY unit_price DESC) AS price_rank
FROM products;

-- 11. Date Functions:
-- Retrieve all orders placed in the last 30 days.
SELECT *
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

-- 12. Case Statements:
-- Display each product with a column indicating "High Price" if unit price > $50,
-- "Medium Price" if between $20-$50, and "Low Price" if below $20.
SELECT
    product_name,
    unit_price,
    CASE
        WHEN unit_price > 50 THEN 'High Price'
        WHEN unit_price >= 20 THEN 'Medium Price'
        ELSE 'Low Price'
    END AS price_category
FROM products;

-- 13. CTE (Common Table Expression):
-- Use a CTE to calculate the total sales per product, then filter for products with total sales above $5,000.
WITH ProductSales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(od.quantity * od.unit_price) AS total_sales
    FROM products p
    JOIN order_details od ON p.product_id = od.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT product_name, total_sales
FROM ProductSales
WHERE total_sales > 5000;

-- 14. Recursive CTE:
-- Create a recursive CTE to list all employees and their direct reports (organizational hierarchy).
WITH RECURSIVE EmployeeHierarchy AS (
    -- Base case: employees with no manager (top level)
    SELECT employee_id, first_name, last_name, reports_to, 0 AS level
    FROM employees
    WHERE reports_to IS NULL

    UNION ALL

    -- Recursive case: employees with managers
    SELECT e.employee_id, e.first_name, e.last_name, e.reports_to, eh.level + 1
    FROM employees e
    JOIN EmployeeHierarchy eh ON e.reports_to = eh.employee_id
)
SELECT
    level,
    employee_id,
    first_name || ' ' || last_name AS employee_name
FROM EmployeeHierarchy
ORDER BY level, employee_id;

-- 15. Complex Query Combining Multiple Concepts:
-- Retrieve customer names, the number of orders they placed, and their total spending.
-- Only include customers who placed more than five orders.
SELECT
    c.company_name,
    COUNT(o.order_id) AS order_count,
    SUM(od.quantity * od.unit_price) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.company_name
HAVING COUNT(o.order_id) > 5
ORDER BY total_spending DESC;
