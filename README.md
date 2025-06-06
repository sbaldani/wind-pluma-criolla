# Pluma Criolla

Plataforma de publicación literaria desarrollada con Django y Docker. Diseñada para ser accesible y fácil de usar, con un enfoque en la experiencia del usuario.

## Estructura del Proyecto

```
wind-pluma-criolla/
├── compose/                # Configuración Docker por ambiente
│   ├── local/             # Ambiente de desarrollo
│   │   ├── django/        # Configuración Django
│   │   └── postgres/      # Configuración PostgreSQL
├── requirements/          # Requerimientos Python por ambiente
│   ├── base.txt          # Requerimientos base
│   ├── dev.txt           # Requerimientos desarrollo
│   └── prod.txt          # Requerimientos producción
└── src/                  # Código fuente Django
    ├── pluma_criolla/    # Aplicación principal
    ├── static/           # Archivos estáticos
    └── templates/        # Templates HTML
```

## Requisitos

- Docker y Docker Compose
- Git

## Configuración Inicial

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/sbaldani/wind-pluma-criolla.git
   cd wind-pluma-criolla
   ```

2. Copiar el archivo de variables de entorno:
   ```bash
   cp .env.example .env
   ```

3. Configurar las variables en `.env`:
   - `DJANGO_SECRET_KEY`: Generar una clave secreta de 50 caracteres
   - `GOOGLE_OAUTH_CLIENT_ID` y `GOOGLE_OAUTH_SECRET`: Obtener de Google Cloud Console

## Ejecución del Proyecto

1. Iniciar los contenedores:
   ```bash
   docker compose up -d
   ```

2. Verificar los logs:
   ```bash
   docker compose logs -f
   ```

3. Acceder a la aplicación:
   - Web: http://localhost:8000
   - Admin: http://localhost:8000/admin

### Credenciales por Defecto

- **Admin Django**:
  - Usuario: admin
  - Email: admin@plumacriolla.com
  - Contraseña: pluma_admin_pass

## Mantenimiento

### Base de Datos

- **Backup**:
  ```bash
  docker compose exec postgres backup
  ```

- **Listar backups**:
  ```bash
  docker compose exec postgres backups
  ```

- **Restaurar backup**:
  ```bash
  docker compose exec postgres restore <backup-name>
  ```

### Desarrollo

- **Ver logs Django**:
  ```bash
  docker compose logs django
  ```

- **Shell Django**:
  ```bash
  docker compose exec django python manage.py shell
  ```

- **Crear migraciones**:
  ```bash
  docker compose exec django python manage.py makemigrations
  ```

## Tecnologías Principales

- Django 4.2
- PostgreSQL
- django-allauth (Autenticación y OAuth)
- Tailwind CSS
- HTMX
- CKEditor

## Características

- Autenticación con Google OAuth
- Editor WYSIWYG para publicaciones
- Diseño responsive con Tailwind CSS
- Interacciones dinámicas con HTMX
- Sistema de usuarios y perfiles
- Panel de administración Django

## Licencia

Copyright © 2025 Pluma Criolla. Todos los derechos reservados.
