-- =============================================================
-- Ejercicio: Big Countries
-- Plataforma: HackerRank (Easy)
-- URL: https://leetcode.com/problems/big-countries/description/
-- Fecha: 2026-05-06
-- =============================================================

-- Enunciado:
-- Name table: `World`
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | name        | varchar |
-- | continent   | varchar |
-- | area        | int     |
-- | population  | int     |
-- | gdp         | bigint  |
-- +-------------+---------+
-- name is the primary key (column with unique values) for this
--table. Each row of this table gives information about the name 
-- of a country, the continent to which it belongs, its area, 
--the population, and its GDP value.
-- A country is big if:

--     it has an area of at least three million (i.e., 3000000 km2), or
--     it has a population of at least twenty-five million (i.e., 25000000).

-- Write a solution to find the name, population, and area of the 
-- big countries.

-- Return the result table in any order.

-- =============================================================
-- Solución (MySQL)
-- =============================================================

SELECT name, population, area 
FROM World 
WHERE population >= 25000000 
   OR area >= 3000000; 

-- Se aplicó un WHERE compuesto para filtrar ambas condiciones 
--(área o población) y se seleccionaron las columnas requeridas 
--(nombre, población y área).