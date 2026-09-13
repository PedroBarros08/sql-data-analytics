-- ============================================================
-- Exercise: Third Transaction of Every User
-- Company: Uber
-- Platform: DataLemur
-- Difficulty: Intermediate
-- ============================================================

SELECT
    user_id,
    spend,
    transaction_date
FROM (
    SELECT
        user_id,
        spend,
        transaction_date,

        -- Number each transaction chronologically within each user.
        -- ROW_NUMBER() is appropriate because we need the third.

        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY transaction_date
        ) AS transaction_number
    FROM transactions

) AS t
-- Keep only the third transaction for each user.
WHERE transaction_number = 3;
