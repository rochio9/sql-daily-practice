-- =============================================================
-- Ejercicio: Higher than 75 marks
-- Plataforma: HackerRank (Easy)
-- URL: https://www.hackerrank.com/challenges/more-than-75-marks/problem
-- Fecha: 2026-05-08
-- =============================================================

-- Enunciado:
-- Query the Name of any student in STUDENTS who scored higher than 75. 
-- Order your output by the last three characters of each name. If two or more 
-- students both have names ending in the same last three characters (i.e.: 
-- Bobby, Robby, etc.), secondary sort them by ascending ID.

-- Schema:
-- STUDENTS(ID, Name, Marks)

-- =============================================================
-- Solución (MySQL)
-- =============================================================
SELECT Name 
FROM STUDENTS 
WHERE Marks > 75 
ORDER BY RIGHT(Name,3), ID ASC;

-- Existen múltiples formas de resolver este ejercicio:
-- 1. Usando RIGHT() para obtener las últimas tres letras ordenar alfabeticamente.
-- 2. Usando SUBSTR() para extraer las últimas tres letras. Este caso tiene dos 
-- formas dependiendo del motor SQL:
--    a. SUBSTR(Name, -3) para MySQL y Oracle.
--    b. SUBSTR(Name, LENGTH(Name) - 2) para SQL Server.
-- 3. Con REGEXP para extraer las últimas tres letras.

