-- Crear el usuario 'admin99' con la contraseña 'Admin9999' en localhost
CREATE USER 'admin99'@'localhost' IDENTIFIED BY 'Admin9999';

-- Crear la base de datos 'proyecto2' si no existe
CREATE DATABASE IF NOT EXISTS proyecto2;

-- Otorgar todos los privilegios sobre la base de datos 'summary' al usuario 'admin99'
GRANT ALL PRIVILEGES ON messages.* TO 'admin99'@'localhost';

USE proyecto2;

-- Crear la tabla 'summary' si no existe
CREATE TABLE IF NOT EXISTS summary (
    country VARCHAR(255),
    numUsuarios INT,
    PRIMARY KEY (country)
);
