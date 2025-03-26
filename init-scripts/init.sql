-- Crear el usuario 'root' con la contraseña 'root' en localhost
CREATE USER 'root'@'localhost' IDENTIFIED BY 'root';

-- Crear la base de datos 'summary' si no existe
CREATE DATABASE IF NOT EXISTS proyecto2;

-- Otorgar todos los privilegios sobre la base de datos 'summary' al usuario 'admin99'
GRANT ALL PRIVILEGES ON proyecto2.* TO 'root'@'localhost';

USE proyecto2;

-- Crear la tabla 'summary' si no existe
CREATE TABLE IF NOT EXISTS summary (
    country VARCHAR(255),
    numUsuarios INT
);
