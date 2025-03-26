-- Crear la tabla externa summary en formato CSV en HDFS
CREATE EXTERNAL TABLE IF NOT EXISTS summary (
    pais STRING,
    numUsuarios BIGINT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 'user/hive/summary';  -- Ruta en HDFS

-- Insertar datos en summary
INSERT OVERWRITE TABLE summary
SELECT country, COUNT(*) as numUsuarios
FROM usuarios
GROUP BY country
ORDER BY numUsuarios DESC
LIMIT 10;
