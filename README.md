# Pluma Criolla

Pluma Criolla es una plataforma web diseñada específicamente para adultos mayores que desean compartir contenido literario propio. La aplicación prioriza la simplicidad, accesibilidad y facilidad de uso.

## Estructura del Proyecto

```
wind-pluma-criolla/
├── docker/                  # Configuraciones de Docker
│   ├── django/             # Configuración de Django
│   └── postgres/           # Configuración de PostgreSQL
├── requirements/           # Dependencias de Python
│   ├── base.txt           # Dependencias base
│   ├── dev.txt            # Dependencias de desarrollo
│   └── prod.txt           # Dependencias de producción
└── src/                   # Código fuente
    └── pluma_criolla/     # Proyecto Django
```

## Requisitos Previos

- Docker
- Docker Compose
- Git

## Configuración Inicial

1. Clonar el repositorio:
   ```bash
   git clone https://github.com/sbaldani/wind-pluma-criolla.git
   cd wind-pluma-criolla
   ```

2. Crear archivo de variables de entorno:
   ```bash
   cp .env.example .env
   ```

3. Iniciar los servicios:
   ```bash
   docker-compose up -d
   ```

El comando anterior:
- Construye las imágenes necesarias
- Inicia los contenedores
- Ejecuta las migraciones de Django
- Crea un superusuario por defecto
- Configura los permisos necesarios

## Credenciales por Defecto

### Base de Datos (PostgreSQL)
- **Database**: pluma_criolla
- **User**: pluma_criolla
- **Password**: pluma_criolla_pass

### Django Admin
- **Username**: admin
- **Email**: admin@plumacriolla.com
- **Password**: pluma_admin_pass

Estas credenciales se pueden modificar en el archivo `.env` antes de iniciar los contenedores.

## Desarrollo Local

### Comandos Útiles

1. Iniciar servicios:
   ```bash
   docker-compose up -d
   ```

2. Ver logs:
   ```bash
   docker-compose logs -f
   ```

3. Ejecutar migraciones:
   ```bash
   docker-compose exec web python manage.py migrate
   ```

4. Crear superusuario:
   ```bash
   docker-compose exec web python manage.py createsuperuser
   ```

5. Detener servicios:
   ```bash
   docker-compose down
   ```

### Hot Reload
El código se actualiza automáticamente al guardar cambios en los archivos. No es necesario reiniciar los contenedores.

## Acceso a la Aplicación

- **Aplicación Web**: http://localhost:8000
- **Admin Django**: http://localhost:8000/admin

## Pruebas

```bash
docker-compose exec web python manage.py test
```

## Despliegue a Producción

Para despliegue a producción, asegúrate de:
1. Modificar las variables de entorno en `.env`
2. Usar contraseñas seguras
3. Configurar los servicios de Google OAuth

## Contribución

1. Crear una rama para tu feature
2. Realizar cambios siguiendo las guías de estilo
3. Enviar pull request

## Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo `LICENSE` para más detalles.
