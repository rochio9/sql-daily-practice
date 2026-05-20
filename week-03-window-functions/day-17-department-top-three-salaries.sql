-- =============================================================
-- Ejercicio: Department Top Three Salaries
-- Plataforma:LeetCode (medium)
-- URL:https://leetcode.com/problems/department-top-three-salaries/
-- Fecha: 2026-05-20
-- =============================================================

-- Enunciado:
-- Table: Employee
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | name         | varchar |
-- | salary       | int     |
-- | departmentId | int     |
-- +--------------+---------+
-- id is the primary key (column with unique values) for this table.
-- departmentId is a foreign key (reference column) of the ID from the 
-- Department table.
-- Each row of this table indicates the ID, name, and salary of an
-- employee. It also contains the ID of their department.

-- Table: Department
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the ID of a department and its name.


-- =============================================================
-- Solución (PostgreSQL):
-- =============================================================
-- Para resolver este problema, utilicé la función DENSE_RANK() para 
-- asignar un ranking a los empleados dentro de cada departamento basado 
-- en su salario. Luego, filtramos los resultados para obtener solo 
-- aquellos empleados que están en el top 3 de salarios por departamento.

SELECT 
    A.Department,
    A.Employee,
    A.Salary
FROM
    (SELECT 
        D.name AS Department, 
        E.name AS Employee, 
        E.salary AS Salary,
        DENSE_RANK() OVER
            (PARTITION BY D.name ORDER BY E.salary DESC) 
            AS ranking 
    FROM 
        Employee E JOIN Department D 
        ON E.departmentId=D.id) A
WHERE 
    Ranking IN (1,2,3);