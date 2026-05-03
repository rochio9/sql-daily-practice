-- =============================================================
-- Ejercicio: Revising the Select Query I
-- Plataforma: HackerRank (Easy)
-- URL: https://www.hackerrank.com/challenges/revising-the-select-query/problem
-- Fecha: 2026-05-03
-- Tiempo invertido: __ min
-- =============================================================

-- Enunciado:
-- Devolver todos los atributos de CITY donde el país sea USA
-- y la población supere 100,000.

-- Schema:
-- CITY(ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)

-- =============================================================
-- Solución (MySQL)
-- =============================================================
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA'
  AND POPULATION  > 100000;

