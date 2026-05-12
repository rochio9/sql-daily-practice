-- =============================================================
-- Ejercicio: Employees Earning More Than Their Managers
-- Plataforma: LeetCode (easy -> medium)
-- URL:https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
-- Fecha: 2026-05-12
-- =============================================================

-- Enunciado:
-- Table: Employee

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | salary      | int     |
-- | managerId   | int     |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, 
-- and the ID of their manager.
-- Write a solution to find the employees who earn more than their managers.
-- Return the result table in any order.
-- The result format is in the following example.

-- =============================================================
-- Solución (MySQL)
-- =============================================================
-- Se resuelve con un Self Join.
SELECT A.name AS Employee 
FROM Employee A JOIN Employee B 
ON B.id=A.managerId 
WHERE A.salary>B.Salary;