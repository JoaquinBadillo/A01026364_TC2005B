USE olympics;

-- Apellidos y nombre de los participantes de nacionalidad mexicana.
SELECT apellidos, nombre FROM deportista 
WHERE id_pais = 1;

-- Apellidos, nombre y puntos acumulados de los participantes de USA.
SELECT apellidos, nombre, SUM(prueba.puntos_aportados) FROM deportista
INNER JOIN clasificacion ON deportista.matricula_deportista = clasificacion.matricula_deportista
INNER JOIN prueba ON clasificacion.id_prueba = prueba.id_prueba
WHERE deportista.id_pais = 2
GROUP BY deportista.matricula_deportista;

-- Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.
SELECT apellidos, nombre FROM deportista
WHERE matricula_deportista
IN (SELECT DISTINCT(matricula_deportista) 
    FROM clasificacion 
    WHERE rango = 1);

-- Nombre de las competencias en las que intervinieron los participantes mexicanos.
SELECT DISTINCT(disciplina.nombre) FROM clasificacion
INNER JOIN prueba ON clasificacion.id_prueba = prueba.id_prueba
INNER JOIN deportista ON clasificacion.matricula_deportista = deportista.matricula_deportista
INNER JOIN disciplina ON prueba.id_disciplina = disciplina.id_disciplina
WHERE deportista.id_pais = 1;

-- Apellidos y nombre de los participantes que nunca se clasificaron en primer lugar en alguna competencia.
SELECT apellidos, nombre FROM deportista
WHERE matricula_deportista
NOT IN (SELECT DISTINCT(matricula_deportista)
    FROM clasificacion 
    WHERE rango = 1);

-- Apellidos y nombre de los participantes siempre se clasificaron en alguna competencia.
SELECT apellidos, nombre FROM deportista
WHERE matricula_deportista
IN (SELECT DISTINCT(matricula_deportista) FROM clasificacion);

-- Nombre de la competencia que aporta el máximo de puntos. 
SELECT disciplina.nombre, MAX(prueba.puntos_aportados) FROM prueba
INNER JOIN disciplina ON prueba.id_disciplina = disciplina.id_disciplina;

-- Encuentra los países (nacionalidades) que participaron en todas las competencias
SELECT pais.nombre
FROM pais
INNER JOIN deportista ON pais.id_pais = deportista.id_pais
INNER JOIN clasificacion ON deportista.matricula_deportista = clasificacion.matricula_deportista
INNER JOIN prueba ON clasificacion.id_prueba = prueba.id_prueba
INNER JOIN disciplina ON prueba.id_disciplina = disciplina.id_disciplina
GROUP BY pais.nombre
HAVING COUNT(DISTINCT(disciplina.nombre)) = (SELECT COUNT(*) FROM disciplina);

-- Porpongan una consulta que involucre una sola tabla con  alguna funcion como MIN, AVG
--- Encontrar el mínimo de puntos aportados por una competencia
SELECT MIN(prueba.puntos_aportados) FROM prueba
INNER JOIN disciplina ON prueba.id_disciplina = disciplina.id_disciplina;

-- Porpongan una consulta que involucre dos tabla con GROUP BY
--- Encontrar el número de participantes por país
SELECT pais.nombre, COUNT(deportista.matricula_deportista) FROM pais
INNER JOIN deportista ON pais.id_pais = deportista.id_pais
GROUP BY pais.nombre;

-- Porpongan una consulta que involucre tres tablas con las sentencias LEFT JOIN, ORDER BY, GROUP BY Y LIMIT
--- Encontrar a los 5 deportistas que obtuvieron la mayor cantidad de puntos
SELECT deportista.nombre, SUM(prueba.puntos_aportados) FROM deportista
LEFT JOIN clasificacion ON deportista.matricula_deportista = clasificacion.matricula_deportista
LEFT JOIN prueba ON clasificacion.id_prueba = prueba.id_prueba
GROUP BY deportista.nombre
ORDER BY SUM(prueba.puntos_aportados) DESC
LIMIT 5;

-- Porpongan una consulta que involucre tres tablas con las sentencias INNER JOIN y LIKE
--- Encontrar a los primeros lugares en las competencias de natación
SELECT deportista.nombre FROM deportista
INNER JOIN clasificacion ON deportista.matricula_deportista = clasificacion.matricula_deportista
INNER JOIN prueba ON clasificacion.id_prueba = prueba.id_prueba
INNER JOIN disciplina ON prueba.id_disciplina = disciplina.id_disciplina
WHERE disciplina.disciplina LIKE '%Natación%' AND clasificacion.rango = 1;