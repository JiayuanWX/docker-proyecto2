-- Crear el usuario 'admin' con la contraseña 'admin' en localhost
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

-- Crear la base de datos 'proyecto2' si no existe
CREATE DATABASE IF NOT EXISTS proyecto2;

-- Otorgar todos los privilegios sobre la base de datos 'summary' al usuario 'admin'
GRANT ALL PRIVILEGES ON messages.* TO 'admin'@'localhost';

USE proyecto2;

-- Crear la tabla 'summary' si no existe
CREATE TABLE IF NOT EXISTS summary (
    country VARCHAR(255),
    numUsuarios BIGINT
);

