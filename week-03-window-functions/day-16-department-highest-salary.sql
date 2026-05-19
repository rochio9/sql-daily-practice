-- =============================================================
-- Ejercicio: Department Highest Salary
-- Plataforma:LeetCode (medium)
-- URL:https://leetcode.com/problems/department-highest-salary/
-- Fecha: 2026-05-19
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
-- departmentId is a foreign key (reference columns) of the ID from 
-- the Department table.
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
-- It is guaranteed that department name is not NULL.
-- Each row of this table indicates the ID of a department and its name.

-- =============================================================
-- Solución (PostgreSQL):
-- =============================================================
-- Hay varias formas de resolver este problema, la primera es utilizando 
-- la función de ventana MAX() para obtener el salario máximo por 
-- departamento y luego filtrar los empleados que tienen ese salario. 
SELECT 
    A.Department, 
    A.name AS Employee, 
    A.Salary 
FROM (
    SELECT E.id, 
    D.name AS Department, 
    E.name,
    E.salary,
    MAX(salary) OVER ( 
            PARTITION BY D.name) 
            AS maxSalary }
    FROM Department D 
    JOIN Employee E 
    ON D.id=E.departmentId) A 
WHERE A.salary=A.MaxSalary;

-- La segunda forma es utilizando RANK() (también funciona DENSE_RANK()) 
-- para asignar un ranking a los empleados dentro de cada departamento 
-- basado en su salario, y luego seleccionar aquellos con ranking 1.
SELECT
    Department,
    Employee,
    Salary
FROM (
    SELECT
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        RANK() OVER (
            PARTITION BY D.id
            ORDER BY E.salary DESC
        ) AS ranking
    FROM Department D
    JOIN Employee E
    ON D.id = E.departmentId
) A
WHERE ranking = 1;