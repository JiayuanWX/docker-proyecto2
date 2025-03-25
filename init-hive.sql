CREATE EXTERNAL TABLE IF NOT EXISTS usuarios (
    registration_dttm STRING,
    id BIGINT,
    first_name STRING,
    last_name STRING,
    email STRING,
    gender STRING,
    ip_address STRING,
    cc BIGINT,
    country STRING,
    birthdate STRING,
    salary DOUBLE,
    title STRING,
    comments STRING
)
STORED AS AVRO --Formato de almacenamiento
LOCATION '/userdata' -- Ubicacion de los ficheros Avro en HDFS
TBLPROPERTIES ('avro.schema.url'='/userdata/userdata.avsc');
 