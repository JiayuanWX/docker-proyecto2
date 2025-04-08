import mysql.connector
from pyhive import hive

# Conectar a Hive
try:
    hive_conn = hive.Connection(host="hive", port=10000, database="default")
    cursor_hive = hive_conn.cursor()
    cursor_hive.execute("SELECT * FROM summary")
except Exception as e:
    print(f" Error conectando a Hive: {e}")
    exit(1)

config = {
  'user': 'admin',
  'password': 'admin',
  'host': 'db',
  'database': 'proyecto2'
}
connection = mysql.connector.connect(**config)
cursor = connection.cursor()

for row in cursor_hive.fetchall():
    cursor.execute("INSERT INTO summary (country, numUsuarios) VALUES (%s, %s)", row)

# Confirmar cambios
connection.commit()
cursor_hive.close()
cursor.close()
hive_conn.close()
connection.close()
print("Datos exportados a MySQL.")
