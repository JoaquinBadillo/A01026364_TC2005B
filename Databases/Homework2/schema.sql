-- Olympiads Database Schema

SET NAMES utf8mb4; 

-- Disable checks to create schema and tables
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- Create schema and use it)
DROP SCHEMA IF EXISTS olympics;
CREATE SCHEMA olympics;
USE olympics;

CREATE TABLE pais (
    id_pais SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    num_participantes SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    num_medallas SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (id_pais)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE deportista (
    matricula_deportista SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_pais SMALLINT UNSIGNED NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    PRIMARY KEY (matricula_deportista),
    CONSTRAINT fk_deportista_pais FOREIGN KEY (id_pais) REFERENCES pais (id_pais) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE disciplina (
    id_disciplina SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    disciplina VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_disciplina)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE prueba (
    id_prueba SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_disciplina SMALLINT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(50) NOT NULL,
    num_deportistas SMALLINT UNSIGNED NOT NULL DEFAULT 0,
    naturaleza ENUM('Eliminatoria', 'Final') NOT NULL,
    puntos_aportados SMALLINT NOT NULL DEFAULT 10,
    PRIMARY KEY (id_prueba),
    CONSTRAINT fk_prueba_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE clasificacion (
    id_clasificacion SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    matricula_deportista SMALLINT UNSIGNED NOT NULL,
    id_prueba SMALLINT UNSIGNED NOT NULL,
    rango SMALLINT NOT NULL,
    PRIMARY KEY (id_clasificacion),
    CONSTRAINT fk_clasificacion_deportista FOREIGN KEY (matricula_deportista) REFERENCES deportista (matricula_deportista) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_clasificacion_prueba FOREIGN KEY (id_prueba) REFERENCES prueba (id_prueba) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE resultado (
    id_resultado SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_disciplina SMALLINT UNSIGNED NOT NULL,
    matricula_oro SMALLINT UNSIGNED NOT NULL,
    matricula_plata SMALLINT UNSIGNED NOT NULL,
    matricula_bronce SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_resultado),
    CONSTRAINT fk_resultado_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_resultado_oro FOREIGN KEY (matricula_oro) REFERENCES deportista (matricula_deportista) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_resultado_plata FOREIGN KEY (matricula_plata) REFERENCES deportista (matricula_deportista) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_resultado_bronce FOREIGN KEY (matricula_bronce) REFERENCES deportista (matricula_deportista) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SHOW TABLES;

-- Enable checks again
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;