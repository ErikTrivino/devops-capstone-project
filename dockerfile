# Usar la imagen Python:3.9-slim como base
FROM python:3.9-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo de requisitos e instalarlos
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código de la aplicación
COPY . .

# Crear un usuario no raíz y cambiar los permisos
# Esto cumple con el requisito de "No debe ejecutarse como root"
RUN useradd -U appuser && chown -R appuser:appuser /app
USER appuser

# Exponer el puerto en el que corre la aplicación (Flask por defecto usa el 5000 o 8080 en entornos cloud)
EXPOSE 8080

# Punto de entrada usando gunicorn
# service:app asume que tu archivo principal es service/__init__.py o similar
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "service:app"]