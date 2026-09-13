-- ============================================================
-- Exercise: Top 2 Highest-Grossing Products by Category
-- Company: Amazon
-- Platform: DataLemur
-- Difficulty: Intermediate
-- ============================================================


WITH tb AS (
    -- First aggregate spending to the category-product grain.
    -- Ranking individual transactions would not answer the
    -- business question, which is based on total product spend.
    SELECT
        category,
        product,
        SUM(spend) AS total_spend
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY
        category,
        product
),

tb_1 AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_spend DESC
        ) AS nr
    FROM tb
)
-- Keep only the two highest-grossing products per category.
SELECT
    category,
    product,
    total_spend
FROM tb_1
WHERE nr IN (1, 2);