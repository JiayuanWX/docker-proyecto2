from pyhive import hive
import mysql.connector
import pandas as pd

# Configuración de la conexión a Hive
hive_conn = hive.Connection(
    host="hive",    # Nombre del contenedor o IP del servidor Hive
    port=10000,     # Puerto por defecto de HiveServer2
    database="default"  # Base de datos de Hive
)

# Consulta para extraer datos de Hive
query = """
    SELECT country, COUNT(*) as numUsuarios
    FROM usuarios
    GROUP BY country
    ORDER BY numUsuarios DESC
    LIMIT 10;
"""

# Ejecutar la consulta en Hive
df = pd.read_sql(query, hive_conn)

# Configuración de la conexión a MySQL
mysql_conn = mysql.connector.connect(
    host="mysql",  # Nombre del contenedor o IP del servidor MySQL
    user="root",   # Usuario de MySQL
    password="root",  # Contraseña de MySQL
    database="testdb"  # Base de datos en MySQL
)
cursor = mysql_conn.cursor()

# Crear la tabla en MySQL (si no existe)
cursor.execute("""
    CREATE TABLE IF NOT EXISTS summary (
        country VARCHAR(255),
        numUsuarios BIGINT
    );
""")

# Insertar datos en MySQL
for _, row in df.iterrows():
    cursor.execute("""
        INSERT INTO summary (country, numUsuarios) VALUES (%s, %s)
    """, (row["country"], row["numUsuarios"]))

# Guardar cambios y cerrar conexiones
mysql_conn.commit()
cursor.close()
mysql_conn.close()
hive_conn.close()

print("Datos exportados exitosamente a MySQL.")
