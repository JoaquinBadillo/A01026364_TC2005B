-- Olympiads Sample Database Data

SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE olympics;

--
-- Dumping data for table pais
--
SET AUTOCOMMIT=0;
INSERT INTO pais (`nombre`, `num_participantes`) VALUES 
('México', 2),
('Estados Unidos', 2),
('Canadá', 2),
('Alemania', 2),
('España', 2),
('Francia', 2),
('Inglaterra', 2),
('Argentina', 2),
('Venezuela', 2),
('Colombia', 2);
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO deportista (`id_pais`, `nombre`, `apellidos`, `sexo`) VALUES (1, 'Juan', 'Pérez', 'M'),
(1, 'María', 'Peréz', 'F'),
(2, 'John', 'Doe', 'M'),
(2, 'Jane', 'Doe', 'M'),
(3, 'Mary', 'Anne', 'F'),
(3, 'James', 'Bond', 'M'),
(4, 'Erika', 'Ding', 'F'),
(4, 'Hans', 'Müller', 'M'),
(5, 'María', 'García', 'F'),
(5, 'José', 'García', 'M'),
(6, 'Jean', 'Dupont', 'M'),
(6, 'Anne', 'Dupont', 'F'),
(7, 'James', 'Bond', 'M'),
(7, 'Mary', 'Poppins', 'F'),
(8, 'Leonel', 'Messi', 'M'),
(8, 'Lola', 'González', 'F'),
(9, 'Carlos', 'Rodrgíguez', 'M'),
(9, 'Carla', 'Rodrgíguez', 'F'),
(10, 'Andrés', 'Ramos', 'M'),
(10, 'Ana', 'Ramos', 'F');
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO disciplina (`nombre`, `disciplina`) VALUES ('100M Nado Libre', 'Natación'),
('200M Nado Libre', 'Natación'),
('400M Nado Libre', 'Natación'),
('800M Nado Libre', 'Natación'),
('100M Velocidad', 'Atletismo'),
('200M Velocidad', 'Atletismo'),
('400M Velocidad', 'Atletismo'),
('800M Velocidad', 'Atletismo'),
('100M Vallas', 'Atletismo'),
('400M Vallas', 'Atletismo');
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO prueba (`id_disciplina`, `fecha`, `lugar`, `num_deportistas`, `naturaleza`) VALUES 
(1, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Eliminatoria'),
(2, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Eliminatoria'),
(3, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Eliminatoria'),
(4, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Eliminatoria'),
(5, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Eliminatoria'),
(6, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Eliminatoria'),
(7, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Eliminatoria'),
(8, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Eliminatoria'),
(9, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Eliminatoria'),
(10, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Eliminatoria'),
(1, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Final'),
(2, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Final'),
(3, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Final'),
(4, CURRENT_TIME(), 'Alberca Olímpica', 4, 'Final'),
(5, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Final'),
(6, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Final'),
(7, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Final'),
(8, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Final'),
(9, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Final'),
(10, CURRENT_TIME(), 'Pista de Atletismo', 4, 'Final');
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO clasificacion (`matricula_deportista`, `id_prueba`, `rango`) VALUES (1, 11, 1),
(2, 11, 2),
(3, 11, 3),
(4, 11, 4),
(5, 12, 1),
(6, 12, 3),
(7, 12, 4),
(8, 12, 2),
(9, 13, 4),
(10, 13, 1),
(1, 13, 3),
(2, 13, 2),
(3, 14, 3),
(4, 14, 1),
(5, 14, 3),
(6, 14, 2),
(7, 15, 3),
(8, 15, 2),
(9, 15, 1),
(10, 15, 4);
COMMIT;

SET AUTOCOMMIT=0;
INSERT INTO resultado (`id_disciplina`, `matricula_oro`, `matricula_plata`, `matricula_bronce`) VALUES (1, 1, 2, 3),
(2, 5, 8, 6),
(3, 10, 2, 1),
(4, 4, 6, 1),
(5, 3, 1, 1),
(1, 9, 8, 7),
(2, 4, 5, 6),
(3, 3, 2, 1),
(4, 10, 9, 8),
(5, 7, 6, 5);
COMMIT;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- SET autocommit=@old_autocommit;
