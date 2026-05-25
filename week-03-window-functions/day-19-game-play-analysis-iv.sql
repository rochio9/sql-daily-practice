-- =============================================================
-- Ejercicio: Game Play Analysis IV: Finding User Purchases
-- Plataforma:leetcode (medium)
-- URL:https://leetcode.com/problems/game-play-analysis-iv/description/
-- Fecha: 2026-05-21
-- =============================================================

-- Enunciado:
-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with 
-- unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of 
-- games (possibly 0) before logging out on someday using some device.

-- Write a solution to report the fraction of players that logged in again 
-- on the day after the day they first logged in, rounded to 2 decimal 
-- places. In other words, you need to determine the number of players who 
-- logged in on the day immediately following their initial login, and 
-- divide it by the number of total players.


-- =============================================================
-- Solución (PostgreSQL):
-- =============================================================
-- La solución implementada fue 
SELECT 
    ROUND(
        1.0*COUNT(C.player_log_again)/
        (SELECT 
            COUNT(DISTINCT A.player_id)
        FROM Activity A),2)
AS fraction
FROM 
    (SELECT  
        B.player_id AS player_log_again
    FROM
        (SELECT 
            A.player_id, MIN(event_date) AS first_log 
        FROM 
            Activity A
        GROUP BY 
            A.player_id) B
    JOIN 
        Activity A
    ON 
        A.player_id=B.player_id   
    WHERE
        A.event_date= DATE_ADD(B.first_log , INTERVAL 1 DAY)) C;

-- Pero podía ser optimizada como sige:
SELECT
    ROUND(
        COUNT(DISTINCT A.player_id) /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
    2) AS fraction
FROM Activity A
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) B
ON A.player_id = B.player_id
AND A.event_date = B.first_login + INTERVAL 1 DAY;
-- De est forma se elimina una de las subconsultas.
-- Se considerará para futuros ejercicios.
