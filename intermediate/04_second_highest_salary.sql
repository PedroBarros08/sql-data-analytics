-- ============================================================
-- Exercise: Second Highest Salary
-- Company: FAANG
-- Platform: DataLemur
-- Difficulty: Intermediate
-- ============================================================

SELECT DISTINCT
    salary AS second_highest_salary
FROM (
    SELECT
        salary,

        -- RANK() assigns the same rank to employees with
        -- identical salaries, allowing ties for second place.

        RANK() OVER (
            ORDER BY salary DESC
        ) AS sal_rank
    FROM employee
) AS t

-- Select the salary ranked second. DISTINCT ensures that
-- duplicate second-highest salaries appear only once.
WHERE sal_rank = 2;