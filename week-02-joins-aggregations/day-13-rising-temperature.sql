-- =============================================================
-- Ejercicio: Rising Temperature
-- Plataforma: LeetCode (easy -> medium)
-- URL:https://leetcode.com/problems/rising-temperature/description/
-- Fecha: 2026-05-16
-- =============================================================

-- Enunciado:
-- Table: Weather
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | recordDate    | date    |
-- | temperature   | int     |
-- +---------------+---------+
-- id is the column with unique values for this table.
-- There are no different rows with the same recordDate.
-- This table contains information about the temperature on a certain day.
-- Write a solution to find all dates' id with higher temperatures compared 
-- to its previous dates (yesterday).
-- Return the result table in any order.


-- =============================================================
-- Solución (MySQL)
-- =============================================================
-- Se resuelve con un JOIN en la tabla Weather 
-- utilizando una condición que permite unir el día de hoy con el 
-- día anterior.
SELECT A.id 
FROM Weather A Join Weather B 
ON B.recordDate= subdate(A.recordDate, 1) 
WHERE A.temperature>B.temperature;
