-- =============================================================
-- Ejercicio: Replace Employee ID With The Unique Identifier
-- Plataforma: LeetCode (easy -> medium)
-- URL:https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/
-- Fecha: 2026-05-15
-- =============================================================

-- Enunciado:
-- Table: Employees
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains the id and the name of an employee in 
-- a company.
-- Table: EmployeeUNI
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | unique_id     | int     |
-- +---------------+---------+
-- (id, unique_id) is the primary key (combination of columns with unique 
-- values) for this table.
-- Each row of this table contains the id and the corresponding unique id 
-- of an employee in the company.
-- Write a solution to show the unique ID of each user, If a user does not
-- have a unique ID replace just show null.
-- Return the result table in any order.

-- =============================================================
-- Solución (MySQL)
-- =============================================================
-- Se resuelve con un LEFT JOIN entre las tablas Employees y EmployeeUNI, 
-- utilizando la columna id como clave de unión.
SELECT DISTINCT B.unique_id, A.name 
FROM Employees A LEFT JOIN EmployeeUNI B 
ON A.id=B.id;