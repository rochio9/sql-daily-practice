-- =============================================================
-- Ejercicio: Find Customer Referee
-- Plataforma: LeetCode (Easy)
-- URL: https://leetcode.com/problems/find-customer-referee/description/
-- Fecha: 2026-05-09
-- =============================================================

-- Enunciado:
-- In SQL, id is the primary key column for this table.
-- Each row of this table indicates the id of a customer, their 
-- name, and the id of the customer who referred them.
-- Find the names of the customer that are either:
--    referred by any customer with id != 2.
--    not referred by any customer.

-- Schema:
-- CUSTOMERS(id, name, referee_id)

-- =============================================================
-- Solución (MySQL)
-- =============================================================
SELECT name 
FROM Customer 
WHERE referee_id!=2 
   OR referee_id IS NULL;

-- Se trabajó con el tratamiento de NULL para identificar a los clientes 
-- que no fueron referidos por ningún otro cliente. 
