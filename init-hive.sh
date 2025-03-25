#!/bin/bash

echo "Esperando a que HiveServer2 esté listo..."
sleep 40  # Aumentamos el tiempo de espera

echo "Ejecutando script de inicialización en Beeline..."
beeline -u jdbc:hive2://hive:10000 -n hive -f /docker-entrypoint-initdb.d/init-hive.sql

echo "Script ejecutado correctamente."