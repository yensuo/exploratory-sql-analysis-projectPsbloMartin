-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;
-- ¿Cuáles son las primeras 10 observaciones registradas?
-- utiliza LIMIT para mostrar solo una parte de la tabla.
SELECT * FROM observations
LIMIT 10;

-- MISSION 2
-- Your query here;
-- ¿Qué identificadores de región (region_id) aparecen en los datos?
-- Usa SELECT DISTINCT para evitar repeticiones.
SELECT DISTINCT region_id FROM observations;

-- MISSION 3
-- Your query here;
-- ¿Cuántas especies distintas (species_id) se han observado?
-- Combina COUNT con DISTINCT para no contar duplicados.

SELECT COUNT(DISTINCT species_id) FROM observations;

-- MISSION 4
-- Your query here;
-- ¿Cuántas observaciones hay para la región con region_id = 2?
-- Aplica una condición con WHERE.

SELECT COUNT(region_id) FROM observations
WHERE region_id = 2;

-- MISSION 5
-- Your query here;
-- ¿Cuántas observaciones se registraron el día 1998-08-08?
-- Filtra por fecha exacta usando igualdad.

SELECT COUNT(*) FROM observations
WHERE  observation_date = '1998-08-08'

-- MISSION 6
-- Your query here;
-- ¿Cuál es el region_id con más observaciones?
-- Agrupa por región y cuenta cuántas veces aparece cada una.
SELECT region_id, COUNT(*) AS total_observations
FROM observations
GROUP BY region_id
ORDER BY total_observations DESC;

SELECT region_id, COUNT(id) 
FROM observations
GROUP BY region_id
ORDER BY COUNT(id) DESC;

-- MISSION 7
-- Your query here;
-- ¿Cuáles son los 5 species_id más frecuentes?
-- Agrupa, ordena por cantidad descendente y limita el resultado.

SELECT species_id, COUNT(id) 
FROM observations
GROUP BY species_id
ORDER BY COUNT(id) DESC
LIMIT 5;


-- MISSION 8
-- Your query here;
-- ¿Qué especies (species_id) tienen menos de 5 registros?
-- Agrupa por especie y usa HAVING para aplicar una condición.

SELECT species_id, COUNT(id)
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5
ORDER BY COUNT(*) DESC;


-- MISSION 9
-- Your query here;
-- ¿Qué observadores (observer) registraron más observaciones?
-- Agrupa por el nombre del observador y cuenta los registros.

SELECT observer, COUNT(*)
FROM observations
GROUP BY observer
ORDER BY COUNT(*) DESC
LIMIT 10;     --10 observadores con mas avistamientos, asi no sale una tabla demasiado grande

-- MISSION 10
-- Your query here;
-- Muestra el nombre de la región (regions.name) para cada observación.
-- Relaciona observations con regions usando region_id.

SELECT regions.name , observations.id FROM observations 
INNER JOIN regions 
ON observations.region_id = regions.id;

-- MISSION 11
-- Your query here;
-- Muestra el nombre científico de cada especie registrada (species.scientific_name).
-- Relaciona observations con species usando species_id.

