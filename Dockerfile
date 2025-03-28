# Usamos una imagen oficial de Python
FROM python:3.10-alpine

# Copiamos los archivos necesarios al contenedor
COPY requirements.txt . 
COPY hdfs_to_mysql.py .

# Instalamos las dependencias
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Definimos el comando de ejecución
