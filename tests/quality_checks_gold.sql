/*
===============================================================================
Script: Quality Checks
===============================================================================
Purpose:
    This script conducts data quality checks on the Gold Layer to validate 
    the integrity, consistency, and accuracy of the data. These checks ensure:
    - Surrogate keys in dimension tables are unique.
    - Referential integrity exists between fact and dimension tables.
    - Logical relationships in the data model are valid for analytical use.

Usage Notes:
    - Review the output of each check carefully.
    - Investigate and resolve any anomalies or discrepancies detected.
===============================================================================
*/

-- ====================================================================
-- Check: Uniqueness of Customer Key in gold.dim_customers
-- ====================================================================
-- Expectation: No duplicate keys should be returned.
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.product_key'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_sales'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
