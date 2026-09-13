-- ============================================================
-- Exercise: TikTok Signup Activation Rate
-- Company: TikTok
-- Platform: DataLemur
-- Difficulty: Intermediate
--
-- Business Rule:
-- A user is considered activated if they received at least
-- one confirmation text with signup_action = 'Confirmed'.
--
-- Important:
-- A user may receive multiple text messages.
-- Therefore, the analysis must be performed at user level
-- rather than message level.
-- ============================================================


-- Step 1: Join signups with their text messages.
-- The emails table defines the population of users we want
-- to analyse. LEFT JOIN preserves users who have no text record.

WITH tb_main AS (
    SELECT
        e.email_id,
        e.user_id,
        t.text_id,
        t.signup_action
    FROM emails AS e
    LEFT JOIN texts AS t
        ON e.email_id = t.email_id
),

-- Step 2: Return to the user grain.
-- A user may have multiple text messages, so we need one row
-- per user before calculating the activation rate.

tb_users AS (
    SELECT
        user_id,
        MAX(
            CASE
                WHEN signup_action = 'Confirmed' THEN 1
                ELSE 0
            END
        ) AS active
    FROM tb_main
    GROUP BY user_id
)

-- Step 3: Calculate the activation rate.
-- SUM(active) = number of activated users
-- COUNT(*)   = total number of users

SELECT
    ROUND(
        SUM(active) * 1.0 / COUNT(*),
        2
    ) AS activation_rate
FROM tb_users;
