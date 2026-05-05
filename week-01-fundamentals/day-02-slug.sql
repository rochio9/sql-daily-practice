-- Query the list of CITY names starting with vowels 
-- (i.e., a, e, i, o, or u) from STATION. Your result cannot 
-- contain duplicates.

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U');

-- Existen múltiples formas de resolver este ejercicio:
-- 1. Usando LIKE con 5 condiciones (fuerza bruta)
-- 2. Usando LEFT() para obtener la primera letra y luego IN() para comparar (forma intuitiva)
-- 3. Usando SUBSTR() para obtener la primera letra y luego IN() para comparar (similar a LEFT() pero más general)