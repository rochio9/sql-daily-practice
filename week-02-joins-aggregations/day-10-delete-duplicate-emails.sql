-- =============================================================
-- Ejercicio: Delete Duplicate Emails
-- Plataforma: LeetCode (easy -> medium)
-- URL:https://leetcode.com/problems/delete-duplicate-emails/description/
-- Fecha: 2026-05-13
-- =============================================================

-- Enunciado:
-- Table: Person
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | email       | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.

-- Each row of this table contains an email. The emails will not contain 
-- uppercase letters.
-- Write a solution to delete all duplicate emails, keeping only one unique 
-- email with the smallest id.
-- For SQL users, please note that you are supposed to write a DELETE 
-- statement and not a SELECT one.

-- =============================================================
-- Solución (MySQL)
-- =============================================================
-- Se resuelve con un Self Join y teniendo en cuenta la sintaxis de DELETE.
DELETE A 
FROM Person A JOIN Person B 
ON A.email=B.email 
WHERE A.id > B.id;