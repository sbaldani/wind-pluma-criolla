# Requerimientos - Pluma Criolla (plumacriolla.com)

## 1. Descripción General

**Pluma Criolla** es una plataforma web diseñada específicamente para adultos mayores que desean compartir contenido literario propio. La aplicación priorizará la simplicidad, accesibilidad y facilidad de uso para usuarios con conocimientos tecnológicos básicos, celebrando la sabiduría y creatividad de nuestros escritores mayores.

## 2. Principios de Diseño

### 2.1 Accesibilidad para Adultos Mayores
- **Tamaño de texto ajustable** con opciones de zoom
- **Alto contraste** en colores para mejor legibilidad
- **Botones grandes** y bien espaciados (mínimo 44px)
- **Navegación simple** sin menús emergentes complejos
- **Confirmaciones claras** antes de acciones importantes
- **Breadcrumbs visibles** para orientación
- **Guardado automático** de borradores

### 2.2 Usabilidad
- Interfaz limpia y minimalista
- Mensajes de error claros y comprensibles
- Tutorial inicial opcional con pasos básicos
- Tiempo de sesión extendido

## 3. Autenticación y Gestión de Usuario

### 3.1 Inicio de Sesión
- **Login con Google** únicamente (fase inicial)
- Proceso de autenticación simplificado
- Sesión persistente con opción de "Recordarme"

### 3.2 Configuración de Perfil
- **Selección de avatar**: elegir entre galería predefinida de imágenes
- **Nombre público**: 
  - Máximo 60 caracteres
  - Sin espacios al inicio/final
  - Únicos en la plataforma
  - Filtro anti-insultos
- **Modificación posterior**: permitir cambios de avatar y nombre

### 3.3 Perfil Público
- Página de perfil visible para otros usuarios
- Muestra todos los posts del usuario
- Estadísticas básicas (total de posts, seguidores, seguidos)
- Botón para seguir/dejar de seguir

## 4. Sistema de Posts

### 4.1 Creación de Posts
- **Título**: obligatorio para publicar, opcional para borradores
- **Contenido**: editor de texto enriquecido con:
  - Alineación de texto (izquierda, centro, derecha, justificado)
  - Tipos de fuente
  - Negrita, cursiva, subrayado
  - Listas (ordenadas y no ordenadas)
  - Emojis
- **Imagen representativa**: selección entre galería predefinida
- **Tags**: hasta 10 etiquetas por post
- **Estados del post**:
  - **Borrador**: no visible públicamente, editable
  - **Publicado**: visible para todos los usuarios
- **Sistema de guardado**:
  - **Guardado automático** cada 30 segundos mientras se escribe
  - **Botón "Guardar borrador"** manual
  - **Botón "Publicar"** (convierte borrador a público)
- **Gestión de borradores**:
  - Lista de borradores en perfil personal
  - Fecha de última modificación
  - Previsualización del contenido
  - Opción de eliminar borradores

### 4.2 Límites de Contenido
- **Título**: límite generoso (500 caracteres)
- **Contenido**: límite muy amplio (50,000 caracteres)
- **Comentarios**: límite moderado (1,000 caracteres)

## 5. Página Principal (Home)

### 5.1 Visualización de Posts
- **Paginación**: 30 posts por página
- **Ordenamiento**:
  - Posts más nuevos
  - Posts más populares (por likes y comentarios)
- **Vista previa**: título, imagen, primeras líneas del contenido, autor, fecha

### 5.2 Sistema de Filtros
- **Por tags**: filtros múltiples disponibles
- **Por fecha**: más recientes, más antiguos
- **Por popularidad**: más likes, más comentarios
- **Búsqueda**: por título, autor y tags

## 6. Interacciones Sociales

### 6.1 Sistema de Reacciones
- **"Me gusta"** (👍)
- **"Me encanta"** (❤️)
- **Contador de visualizaciones**
- Botones grandes y claramente etiquetados

### 6.2 Sistema de Comentarios
- **Comentarios principales** en cada post
- **Respuestas** a comentarios (un nivel)
- **"Me gusta"** en comentarios
- **Emojis** disponibles en comentarios
- Orden cronológico (más recientes primero)

### 6.3 Sistema de Seguimiento
- Seguir/dejar de seguir usuarios
- Lista de seguidos/seguidores en perfil
- Feed opcional con posts de usuarios seguidos

## 7. Sistema de Notificaciones

### 7.1 Tipos de Notificaciones
- **Comentarios**: cuando alguien comenta en tu post
- **Likes acumulados**: 
  - A los 5, 10, 15, 20... likes (incrementos de 5)
  - Mensaje: "Recibiste X me gusta en tu publicación [Título]"
  - Enlace directo al post
- **Nuevos seguidores**
- **Respuestas a comentarios**

### 7.2 Centro de Notificaciones
- **Página dedicada** para ver todas las notificaciones
- **Indicador visual** de notificaciones no leídas
- **Filtros**: por tipo, por fecha
- **Marcar como leída/no leída**
- Sin notificaciones por email (solo internas)

## 8. Panel de Administración

### 8.1 Acceso
- **URL**: `/admin`
- **Autenticación**: flag `is_admin` en base de datos
- **Redirección**: usuarios no-admin van a home

### 8.2 Funcionalidades de Moderación
- **Reportes de contenido**:
  - Lista de posts/comentarios reportados
  - Razón del reporte
  - Acciones: aprobar, eliminar, advertir usuario
- **Gestión de usuarios**:
  - Lista de usuarios registrados
  - Suspender/reactivar cuentas
  - Ver historial de reportes por usuario
- **Gestión de contenido**:
  - Ver todos los posts
  - Eliminar contenido inapropiado
  - Estadísticas generales de la plataforma

## 9. Stack Tecnológico Definido

### 9.1 Arquitectura General
**Stack seleccionado basado en análisis comparativo:**
- 🖥️ **Frontend**: Django Templates + HTMX + Alpine.js
- 🔧 **Backend**: Django + DRF (APIs específicas)
- 🎨 **Styling**: Tailwind CSS + Custom CSS
- 🗄️ **Database**: PostgreSQL
- 🔐 **Auth**: django-allauth (Google OAuth)
- 📊 **Admin**: Django Admin (customizado)
- 💰 **Ads**: Google AdSense + Facebook Audience Network
- 📱 **Responsive**: Mobile-first design
- 🧪 **Testing**: pytest-django + playwright (E2E)

### 9.2 Frontend Detallado
- **Django Templates**: Renderizado server-side para SEO y estabilidad
- **HTMX**: Interactividad moderna sin JavaScript complejo
  - Actualizaciones parciales de contenido
  - Formularios dinámicos
  - Paginación sin recarga
  - Sistema de likes/comentarios en tiempo real
- **Alpine.js**: Interacciones UI locales (dropdowns, modales simples)
- **Responsive Design**: 
  - Mobile: 320px - 767px
  - Tablet: 768px - 1023px  
  - Desktop: 1024px - 1919px
  - Large Desktop: 1920px+
- **PWA**: Instalación opcional para usuarios frecuentes
- **Accesibilidad**: WCAG 2.1 AA compliance

### 9.3 Backend y Base de Datos
- **Django Framework**: Python web framework robusto
- **Django REST Framework**: APIs específicas cuando necesario
- **PostgreSQL**: 
  - Full-text search nativo para contenido literario
  - JSON fields para metadatos flexibles
  - Excelente performance para reads/writes
- **Redis**: Caching y sesiones (opcional para escalabilidad)

### 9.4 Autenticación y Seguridad
- **django-allauth**: 
  - Google OAuth integration
  - Manejo de perfiles sociales
  - Email verification opcional
- **Seguridad integrada**:
  - CSRF protection automática
  - SQL injection prevention
  - XSS protection built-in
  - Rate limiting con django-ratelimit
  - Validación de entrada en todos los formularios
  - Sanitización de contenido HTML con bleach
  - Filtros anti-profanidad automáticos

### 9.5 Justificación del Stack
**¿Por qué Django + HTMX vs React?**
- ✅ **Mejor para adultos mayores**: Mayor estabilidad, menos bugs JS
- ✅ **SEO nativo**: Crucial para contenido literario
- ✅ **Monetización óptima**: AdSense funciona mejor con SSR
- ✅ **Desarrollo más rápido**: MVP en 2-3 meses vs 4-6 con React
- ✅ **Mantenimiento simple**: Un solo stack tecnológico
- ✅ **Admin panel gratuito**: Django Admin para moderación

## 10. Funcionalidades Adicionales

### 10.1 Sistema de Tags
- **Tags predefinidos** comunes (poesía, cuento, memoria, reflexión, etc.)
- **Tags personalizados** creados por usuarios
- **Autocompletado** al escribir tags
- **Límite**: 10 tags por post

### 10.2 Búsqueda Avanzada
- **Búsqueda por texto** en títulos y contenido
- **Búsqueda por autor**
- **Filtros combinados**: tags + fecha + popularidad
- **Resultados paginados** (20 por página)

### 10.3 Reportes y Moderación
- **Botón de reporte** en posts y comentarios
- **Categorías de reporte**: spam, contenido inapropiado, acoso, otros
- **Comentario opcional** del usuario que reporta

## 11. Experiencia de Usuario

### 11.1 Onboarding
- **Tutorial opcional** de 3-4 pasos
- **Tooltips informativos** en primera visita
- **Ejemplos visuales** de cómo crear posts

### 11.2 Gestión de Contenido Personal
- **Página "Mis Posts"**: 
  - Posts publicados
  - Borradores guardados
  - Estadísticas por post (views, likes, comentarios)
- **Editor de borradores**:
  - Continuar escribiendo desde donde se dejó
  - Previsualización antes de publicar
  - Historial de cambios (opcional)
- **Organización**:
  - Filtro por estado (publicados/borradores)
  - Ordenar por fecha de creación o modificación
  - Búsqueda en contenido propio
- **Confirmaciones**: "Post publicado exitosamente"
- **Errores amigables**: evitar jerga técnica
- **Estados de carga** claros con indicadores visuales

### 11.4 Navegación
- **Menú principal simple**: Home, Mis Posts, Mis Borradores, Perfil, Notificaciones
- **Breadcrumbs** en páginas internas
- **Botón "Volver"** siempre visible

## 12. Métricas y Analíticas

### 12.1 Métricas de Usuario
- Posts creados por usuario
- Interacciones recibidas (likes, comentarios)
- Usuarios seguidos/seguidores

### 12.2 Métricas de Plataforma (Admin)
- Usuarios activos diarios/mensuales
- Posts publicados por período
- Reportes de moderación
- Tags más utilizados

## 13. Consideraciones de Implementación

### 13.1 Fases de Desarrollo
1. **Fase 1**: Setup Django + HTMX, configuración Docker, autenticación Google, creación de posts básica, responsive design base
2. **Fase 2**: Sistema de comentarios con HTMX, interacciones (likes), testing unitario, documentación README
3. **Fase 3**: Notificaciones dinámicas, sistema de seguimiento, integración publicitaria
4. **Fase 4**: Panel de administración completo, moderación avanzada, optimizaciones performance, deployment en producción

### 13.2 Testing y Calidad de Código
- **Unit Tests**: cobertura mínima del 80% para todas las funciones atómicas
  - Tests para funciones de validación (nombres, contenido, tags)
  - Tests para lógica de negocio (likes, comentarios, notificaciones)
  - Tests para utilidades (formateo de fechas, contadores, filtros)
  - Tests para componentes de UI críticos
  - Framework recomendado: Jest + React Testing Library
- **Tests de integración** para flujos completos de usuario
- **Tests de usabilidad** con adultos mayores reales
- **Tests de accesibilidad** con herramientas automatizadas (axe-core)
- **Tests de carga** para múltiples usuarios concurrentes
- **Tests E2E** con Cypress o Playwright para flujos críticos

## 14. Sistema de Monetización

### 14.1 Publicidad Programática - Argentina
- **Google AdSense**: 
  - Integración principal para display ads
  - Optimizado para audiencia argentina
  - Formatos: banner, sidebar, native ads
- **Facebook Audience Network**:
  - Complemento a AdSense
  - Mejor targeting para adultos mayores
- **Taboola/Outbrain**:
  - Content discovery ads
  - Apropiado para contenido literario

### 14.2 Posicionamiento de Anuncios
- **Entre posts**: cada 10 posts en el feed
- **Sidebar**: anuncios discretos en desktop
- **Footer de posts**: después del contenido principal
- **Evitar**: pop-ups y anuncios intrusivos
- **Consideración**: anuncios relevantes para adultos mayores (salud, hobbies, cultura)

### 14.3 Configuración de Ads
- **AdSense Auto Ads**: configuración automática inicial
- **Manual placement**: ubicaciones específicas optimizadas
- **Responsive ads**: se adaptan a todos los dispositivos
- **Native ads**: integrados naturalmente con el contenido

## 15. Responsive Design Detallado

### 15.1 Breakpoints Específicos
```css
/* Mobile First Approach */
- Mobile: 320px - 767px
- Tablet Portrait: 768px - 1023px  
- Desktop: 1024px - 1919px
- Large Desktop: 1920px+
```

### 15.2 Componentes Responsivos
- **Navegación**:
  - Mobile: hamburger menu
  - Tablet/Desktop: barra horizontal
- **Posts grid**:
  - Mobile: 1 columna
  - Tablet: 2 columnas
  - Desktop: 3 columnas
- **Editor de texto**:
  - Toolbar colapsable en mobile
  - Botones más grandes en touch devices
- **Comentarios**:
  - Indentación reducida en mobile
  - Stack vertical en pantallas pequeñas

### 15.3 Consideraciones Mobile para Adultos Mayores
- **Botones táctiles**: mínimo 44px x 44px
- **Espaciado generoso**: evitar toques accidentales
- **Zoom habilitado**: hasta 200% sin scroll horizontal
- **Orientación flexible**: portrait y landscape funcionales