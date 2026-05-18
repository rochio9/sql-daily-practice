-- =============================================================
-- Ejercicio: Workers With the Highest Salaries
-- Plataforma: stratascratch (easy -> medium)
-- URL:https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1
-- Fecha: 2026-05-17
-- =============================================================

-- Enunciado:
-- Table: worker
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | departament   | text    |
-- | first_name    | text    |
-- | joining_date  | date    |
-- | last_name     | text    |
-- | salary        | bigint  |
-- | worker_id     | bigint  |
-- +---------------+---------+

-- Table: title
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | affected_from | date    |
-- | worker_ref_id | bigint  |
-- | worker_title  | text    |
-- +---------------+---------+

-- Management wants to analyze only employees with official job 
-- titles. Find the job titles of the employees with the highest 
-- salary. If multiple employees have the same highest salary, 
-- include all their job titles.

-- =============================================================
-- Solución (PostgreSQL):
-- =============================================================
-- Se realiza un JOIN entre las tablas worker y title para obtener 
-- los títulos de los trabajadores. Luego, se filtra por el salario 
-- máximo encontrado en la subconsulta que también realiza un JOIN 
-- para asegurar que solo se consideren los trabajadores con 
-- títulos oficiales.

SELECT worker_title AS best_paid_title 
FROM title JOIN worker 
ON worker_id=worker_ref_id 
WHERE salary = (SELECT MAX(salary) 
                FROM worker JOIN  title 
                ON worker_id=worker_ref_id 
                WHERE worker_title IS NOT NULL);