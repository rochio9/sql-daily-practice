-- =============================================================
-- Ejercicio: The Report
-- Plataforma: HackerRank
-- URL: https://www.hackerrank.com/challenges/the-report/problem
-- Fecha: 2026-05-13
-- =============================================================

-- Enunciado:
-- Ketty gives Eve a task to generate a report containing three columns:
-- Name, Grade and Mark.
--
-- Ketty doesn't want the names of those students who received a
-- grade lower than 8. The report must be in descending order by grade.
--
-- If there is more than one student with the same grade (8-10),
-- order those students alphabetically by name.
--
-- If the grade is lower than 8, use NULL as the name and order
-- those students by marks in ascending order.
--
-- =============================================================
-- Solución (MySQL)
-- =============================================================

-- Se realiza un JOIN entre Students y Grades utilizando BETWEEN,
-- ya que cada nota pertenece a un rango de calificaciones.
--
-- CASE se utiliza para ocultar el nombre de estudiantes con grade < 8.
--
-- El ORDER BY primero ordena por Grade de forma descendente.
-- Luego:
--   - Para grades >= 8, se ordena alfabéticamente por Name.
--   - Para grades < 8, se ordena por Marks ascendente.

SELECT
    CASE
        WHEN Grade < 8 THEN NULL
        ELSE Name
    END AS Name,
    Grade,
    Marks
FROM Students
JOIN Grades
ON Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY
    Grade DESC,
    CASE
        WHEN Grade >= 8 THEN Name
    END ASC,
    CASE
        WHEN Grade < 8 THEN Marks
    END ASC;