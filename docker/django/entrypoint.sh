#!/bin/bash

# Esperar a que PostgreSQL esté disponible
echo "Esperando a PostgreSQL..."
while ! nc -z $DB_HOST $DB_PORT; do
  sleep 0.1
done
echo "PostgreSQL disponible"

# Crear directorios necesarios si no existen
mkdir -p static media

# Recolectar archivos estáticos
python manage.py collectstatic --noinput

# Aplicar migraciones
python manage.py migrate

# Crear superusuario si no existe
python manage.py shell << END
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists():
    User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', 
                                '$DJANGO_SUPERUSER_EMAIL', 
                                '$DJANGO_SUPERUSER_PASSWORD')
    print('Superusuario creado')
else:
    print('Superusuario ya existe')
END

# Crear sitio por defecto para django-allauth si no existe
python manage.py shell << END
from django.contrib.sites.models import Site
if not Site.objects.exists():
    Site.objects.create(domain='localhost:8000', name='Pluma Criolla')
    print('Sitio por defecto creado')
else:
    print('Sitio por defecto ya existe')
END

# Iniciar servidor de desarrollo
python manage.py runserver 0.0.0.0:8000
