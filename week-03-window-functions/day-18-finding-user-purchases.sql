-- =============================================================
-- Ejercicio: Finding the User Purchases
-- Plataforma:stratascratch (medium)
-- URL:https://platform.stratascratch.com/coding/10322-finding-user-purchases
-- Fecha: 2026-05-21
-- =============================================================

-- Enunciado:
-- Table: amazon_transactions
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | id           | int     |
-- | user_id      | int     |
-- | item         | varchar |
-- | created_at   | datetime|
-- | revenue      | int     |
-- +--------------+---------+

-- Identify returning active users by finding users who made a second 
-- purchase within 1 to 7 days after their first purchase. Ignore 
-- same-day purchases. Output a list of these user_ids.

-- =============================================================
-- Solución (PostgreSQL):
-- =============================================================
-- Lo importante es identificar la primera compra de cada usuario y 
-- luego buscar si hay una segunda compra dentro del rango de tiempo 
-- especificado. Para esto, se puede usar una subconsulta para obtener 
-- la fecha de la primera compra de cada usuario y luego hacer un JOIN 
-- con la tabla original para encontrar las compras que cumplen con el 
-- criterio.

SELECT DISTINCT 
    A.user_id  
FROM 
    (SELECT
        user_id, MIN(created_at) AS first_p
    FROM amazon_transactions 
    GROUP BY user_id) A
JOIN amazon_transactions B
ON A.user_id=B.user_id
WHERE B.created_at 
    BETWEEN A.first_p + INTERVAL '1 day' AND A.first_p + INTERVAL '7 days' ;