# Usar una imagen base oficial de Python
FROM python:3.11-slim

# Establecer variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Crear usuario no-root
RUN useradd -m -s /bin/bash django

# Instalar dependencias del sistema
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        netcat-traditional \
    && rm -rf /var/lib/apt/lists/*

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de requerimientos
COPY requirements/ /app/requirements/

# Instalar dependencias de Python
RUN pip install --no-cache-dir -r requirements/dev.txt

# Copiar el proyecto
COPY src/ /app/

# Script de inicio
COPY docker/django/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Cambiar propietario de los archivos
RUN chown -R django:django /app

# Cambiar al usuario no-root
USER django

# Puerto
EXPOSE 8000

# Comando por defecto
ENTRYPOINT ["/entrypoint.sh"]
