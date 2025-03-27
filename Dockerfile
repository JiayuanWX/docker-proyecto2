# Usamos una imagen oficial de Python
FROM python:3.10-alpine

# Copiamos los archivos necesarios al contenedor
COPY requirements.txt . 
COPY export_hive_to_mysql.py .

# Instalamos las dependencias
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

# Definimos el comando de ejecución
CMD ["python", "export_hive_to_mysql.py"]
