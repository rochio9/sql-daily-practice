-- =============================================================
-- Ejercicio: Nth Highest Salary
-- Plataforma:  (medium)
-- URL:https://leetcode.com/problems/nth-highest-salary/description/
-- Fecha: 2026-05-18
-- =============================================================

-- Enunciado:
-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of 
-- an employee.
-- Write a solution to find the nth highest distinct salary from the 
-- Employee table. If there are less than n distinct salaries, return null.

-- =============================================================
-- Solución (PostgreSQL):
-- =============================================================
-- Se crea la función getNthHighestSalary que toma un entero N como 
-- argumento y devuelve el enésimo salario más alto distinto de la 
-- tabla Employee. La función utiliza una subconsulta para asignar 
-- un ranking a cada salario utilizando la función DENSE_RANK() 
-- ordenada de forma descendente. Luego, se selecciona el salario 
-- que corresponde al ranking N.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

  RETURN (
      # Write your MySQL query statement below.
    SELECT DISTINCT A.salary 
    FROM (SELECT id,salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS ranking FROM Employee) A
    WHERE ranking=N
  );
END