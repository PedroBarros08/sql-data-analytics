# SQL Data Analytics

A collection of SQL solutions focused on **data analysis, business questions, and analytical problem-solving**.

This repository documents my practical SQL learning journey through real-world style problems, with a focus on writing clear queries and understanding the analytical reasoning behind each solution.

## Objectives

* Strengthen SQL skills for Data Analytics
* Develop analytical problem-solving skills
* Practice solving business-oriented data questions
* Improve understanding of data granularity and relationships
* Build practical evidence of SQL skills through documented solutions

## SQL Concepts Demonstrated

* Aggregations and `GROUP BY`
* `JOIN`
* `CASE WHEN`
* Common Table Expressions (`CTEs`)
* Subqueries
* Window Functions
* `ROW_NUMBER()`
* `RANK()`
* `PARTITION BY`
* Handling duplicates
* Analytical metrics

## Repository Structure

```text
sql-data-analytics/
│
├── README.md
│
└── intermediate/
    ├── 01_tiktok_signup_activation_rate.sql
    ├── 02_amazon_top_2_products_by_category.sql
    ├── 03_uber_third_transaction.sql
    └── 04_second_highest_salary.sql
```

## Exercises

### 01 — TikTok: Signup Activation Rate

**Problem:** Calculate the activation rate of users who signed up, considering that a user may receive multiple confirmation messages.

**Analytical reasoning:**
The solution uses a `LEFT JOIN` to preserve the signup population and then aggregates the data back to **one row per user** before calculating the metric. This prevents multiple text messages from causing overcounting.

**Key concepts:** `LEFT JOIN`, CTE, `CASE WHEN`, `GROUP BY`, `MAX()`, aggregation, data grain.

---

### 02 — Amazon: Top 2 Highest-Grossing Products by Category

**Problem:** Identify the two highest-grossing products within each category based on total customer spending during 2022.

**Analytical reasoning:**
The solution first aggregates spending to the **category-product grain** and then ranks products independently within each category.

**Key concepts:** CTE, `SUM()`, `GROUP BY`, `ROW_NUMBER()`, `PARTITION BY`, aggregation.

---

### 03 — Uber: Third Transaction of Every User

**Problem:** Obtain the third transaction made by every user.

**Analytical reasoning:**
The solution assigns a sequential number to each transaction within each user, ordered chronologically. `ROW_NUMBER()` is used because the requirement is to identify the **third transaction**, rather than the third distinct transaction date.

**Key concepts:** `ROW_NUMBER()`, `PARTITION BY`, `ORDER BY`, subqueries.

---

### 04 — Second Highest Salary

**Problem:** Determine the second highest salary among all employees. If multiple employees share the same salary, display the salary only once.

**Analytical reasoning:**
The solution uses `RANK()` to handle ties for the second-highest salary and `DISTINCT` to ensure that the resulting salary is displayed only once.

**Key concepts:** `RANK()`, `DISTINCT`, window functions, subqueries.

---

### 05 — Spotify: Cumulative Song Plays

**Problem:** Calculate the cumulative number of plays for each user and song up to August 4th, 2022, combining historical streaming data with the current week's activity.

**Analytical reasoning:** The solution aggregates the historical and weekly data to the **user-song grain** before combining them. A `FULL JOIN` is used to preserve users and songs that appear only in the current week's data. `COALESCE` then combines the identifiers and play counts from both sources.

**Key concepts:** CTE, `FULL JOIN`, `COALESCE`, `SUM()`, `GROUP BY`, data grain.

## Analytical Approach

For each problem, the goal is not only to produce a correct SQL query, but to understand the **analytical logic behind the solution**.

Before writing a query, I consider:

1. What does one row represent?
2. What is the grain of the data?
3. What grain does the business question require?
4. Can a `JOIN` produce multiple rows for the same entity?
5. Should the data be aggregated before applying a window function?
6. Which SQL function best represents the business requirement?
7. How should duplicates and edge cases be handled?

This approach helps ensure that the query answers the **business question**, rather than simply producing a technically valid result.

## Practice Platform

The exercises in this repository are based on problems from **DataLemur** and are used for SQL practice and skill development.

The original problem statements and datasets belong to their respective platform. This repository contains my own SQL solutions and analytical notes.

---

**Focus:** SQL • Data Analytics • Business Problem Solving