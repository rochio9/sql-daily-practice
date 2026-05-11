-- =============================================================
-- Ejercicio: Customers Who Never Order
-- Plataforma: LeetCode (Easy)
-- URL: https://leetcode.com/problems/customers-who-never-order/
-- Fecha: 2026-05-10
-- =============================================================

-- Enunciado:
-- Table: Customers
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID and name of a customer.
--  Table: Orders
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- customerId is a foreign key (reference columns) of the ID from the 
-- Customers table.
-- Each row of this table indicates the ID of an order and the ID of the 
--customer who ordered it.
-- Write a solution to find all customers who never order anything.

-- Return the result table in any order.

-- The result format is in the following example.
-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+

-- =============================================================
-- Solución (MySQL)
-- =============================================================
-- Existen dos formas de resolver este ejercicio. La primera es utilizando 
-- una subconsulta como se describe:
SELECT name AS Customers 
FROM Customers 
WHERE id 
  NOT IN (SELECT customerId FROM Orders);

-- La segunda forma es utilizando un LEFT JOIN entre las tablas Customers y 
-- Orders, y luego filtrando aquellos registros donde no exista una coincidencia.

SELECT C.name AS Customers
FROM Customers C
LEFT JOIN Orders O 
ON C.id = O.customerId 
WHERE O.customerId IS NULL;