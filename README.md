# Procesamiento con Hive y visualización con Grafana

## Descripción del Proyecto

Este proyecto consiste en el procesamiento y visualización de datos utilizando diversas tecnologías de Big Data y bases de datos. A partir de archivos AVRO, se almacena la información en HDFS, se procesan datos en Hive, se resumen en formato CSV y se visualizan en Grafana tras ser cargados en MySQL.

## Objetivos de Aprendizaje

- **Almacenamiento en HDFS**
- **Uso del formato de archivo AVRO**
- **Consultas y manejo de tablas con Hive**
- **Integración con MySQL**
- **Visualización de datos con Grafana**

## Arquitectura y Tecnologías Utilizadas

El entorno se despliega utilizando Docker Compose e incluye los siguientes servicios:

- **HDFS (Hadoop Distributed File System)**: Para almacenamiento de archivos AVRO y CSV.
- **Hive con HiveServer2 y Beeline**: Para procesamiento de datos y generación de la tabla resumen.
- **MySQL**: Para almacenar los datos resumen extraídos desde Hive.
- **Grafana**: Para la visualización de los datos desde MySQL.
- **Python (script auxiliar)**: Para mover datos desde HDFS a MySQL.

## Flujo del Proyecto

### Carga de archivos AVRO en HDFS

- Se montan los archivos en el contenedor de Hive y se copian a HDFS.
- Se crean directorios en HDFS con permisos adecuados.

### Creación y consulta de tablas en Hive

- Se define una tabla externa `usuarios` basada en el esquema AVRO.
- Se genera una tabla `summary` con el número de usuarios por país (top 10).
- Los datos resumen se almacenan en formato CSV en HDFS.

### Transferencia de datos a MySQL

- Un script Python extrae el contenido de `summary` de HDFS y lo carga en MySQL.

### Visualización con Grafana

- Se configura MySQL como fuente de datos en Grafana.
- Se crea un panel que muestra el resumen de usuarios por país.

## Instalación y Ejecución

### Requisitos previos

- Docker y Docker Compose instalados en el sistema.
- Acceso a internet para descargar las imágenes necesarias.

### Pasos para la ejecución

1. Clonar el repositorio:

   ```bash
   git clone git@github.com:JiayuanWX/docker-proyecto2.git
   cd docker-proyecto2
   ```

2. Iniciar el entorno con Docker Compose:

   ```bash
   docker-compose up -d
   ```

3. Verificar que los servicios están corriendo:

   ```bash
   docker ps
   ```

4. Cargar archivos AVRO en HDFS:

   ```bash
   docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000 -n hive
   dfs -mkdir -p /user/hive/warehouse/usuarios;
   dfs -put /datos/*.avro /user/hive/warehouse/usuarios/;
   ```

5. Crear tablas en Hive y generar el resumen:

   ```sql
   CREATE EXTERNAL TABLE usuarios (...);
   CREATE TABLE summary AS SELECT country, COUNT(*) FROM usuarios GROUP BY country ORDER BY COUNT(*) DESC LIMIT 10;
   ```

6. Ejecutar el script de transferencia a MySQL:

   ```bash
   python transfer_to_mysql.py
   ```

7. Configurar la fuente de datos en Grafana y visualizar los resultados.

## Estructura del Proyecto

```
/
├── docker-compose.yml  # Definición de los servicios
├── scripts/
│   ├── transfer_to_mysql.py  # Script para mover datos de HDFS a MySQL
├── data/  # Archivos AVRO de entrada
├── config/
│   ├── hive-site.xml  # Configuración de Hive
│   ├── mysql-init.sql  # Script de inicialización de MySQL
└── README.md  # Este archivo
```

## Autores

Este proyecto fue realizado por **Jiayuan Wang** e **Iñigo Vilá** para la asignatura de Infraestructuras para el Procesamiento Masivo de Datos.
