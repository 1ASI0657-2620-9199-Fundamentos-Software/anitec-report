# 5.1. Software Configuration Management.

En esta sección se detallan todas las reglas y procesos que hemos seguido en el proyecto al momento de crear y desplegar la Landing Page y Aplicación Web de AniTec. El objetivo de estas reglas y procesos es garantizar la integridad y consistencia del software, desde el inicio hasta el despliegue y mantenimiento.

## 5.1.1. Software Development Environment Configuration.

En este apartado se describe la configuración del entorno de desarrollo de AniTec, establecida para garantizar la correcta integración, colaboración y trazabilidad de las actividades realizadas por los miembros del equipo. Se definen las herramientas, plataformas y productos de software utilizados a lo largo del ciclo de vida de la ejecución, desde la gestión del proyecto hasta el despliegue y la documentación técnica.

**Project Management**

Esta categoría agrupa las herramientas a utilizar para la planificación, organización y seguimiento del trabajo del equipo durante el desarrollo del proyecto.

| Plataforma / Herramienta | Propósito en el proyecto                                                                                                       | Enlace             |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------ | ------------------ |
| Trello                   | Gestión del backlog del proyecto AniTec, planificación de sprints y seguimiento del progreso de tareas e historias de usuario. | https://trello.com |

**Requirements Management**

Incluye herramientas orientadas a la identificación, análisis y definición de los requerimientos funcionales y no funcionales del sistema.

| Plataforma / Herramienta | Propósito en el proyecto                                                                                    | Enlace                            |
| ------------------------ | ----------------------------------------------------------------------------------------------------------- | --------------------------------- |
| Gherkin                  | Definición estructurada de criterios de aceptación de las user stories mediante el formato Given-When-Then. | https://cucumber.io/docs/gherkin/ |
| Miro                     | Ejecución de dinámicas como Event Storming para identificar procesos, eventos y flujos del sistema AniTec.  | https://miro.com/                 |

**Product UX/UI Design**

Comprende las herramientas a utilizar para el diseño de la experiencia de usuario, interfaces y validación visual del producto digital.

| Plataforma / Herramienta | Propósito en el proyecto                                                                                                     | Enlace                      |
| ------------------------ | ---------------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| Figma                    | Diseño de wireframes, mockups y prototipos de la landing page y la aplicación web de AniTec.                                 | https://www.figma.com       |
| Canva                    | Creación de recursos visuales como banners, íconos e imágenes para la identidad visual del producto.                         | https://www.canva.com       |
| UXPressia                | Elaboración de User Personas y Customer Journey Maps para comprender el comportamiento y necesidades del usuario.            | https://uxpressia.com       |
| Lucidchart               | Aplicación para crear diagramas. Se utilizará para diseñar flujos de usuario, wireflows y el diagrama de clases del sistema. | https://www.lucidchart.com/ |

**Software Development**

Incluye herramientas que serán destinadas a la implementación técnica del sistema, desarrollo del código y control de versiones.

| Plataforma / Herramienta | Propósito en el proyecto                                                                                                                                                                                     | Enlace                              |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------- |
| GitHub                   | Gestión del repositorio del proyecto AniTec, control de versiones, manejo de ramas y colaboración entre desarrolladores.                                                                                     | https://github.com                  |
| Visual Studio Code       | Entorno de desarrollo utilizado para la redacción y gestión del informe mediante archivos en formato Markdown (.md), facilitando la organización, edición estructurada y control de versiones del contenido. | https://code.visualstudio.com/      |
| WebStorm                 | Entorno especializado para el desarrollo del frontend de la aplicación web AniTec, aprovechando su soporte avanzado para JavaScript y frameworks modernos.                                                   | https://www.jetbrains.com/webstorm/ |
| Rider                    | Entorno especializado para el desarrollo del backend ASP.NET Core de AniTec, permitiendo implementar controladores, servicios, repositorios y configuración del proyecto .NET.                               | https://www.jetbrains.com/rider/    |
| MySQL                    | Sistema gestor de base de datos relacional utilizado para persistir la información del backend de AniTec.                                                                                                    | https://www.mysql.com/              |
| MySQL Workbench          | Herramienta utilizada para consultar, administrar y revisar visualmente la base de datos MySQL durante el desarrollo.                                                                                        | https://www.mysql.com/products/workbench/ |

**Software Deployment**

Se incluyen las herramientas a utilizar para la publicación y disponibilidad del sistema en entornos accesibles para los usuarios.

| Plataforma / Herramienta | Propósito en el proyecto                                                                                 | Enlace                      |
| ------------------------ | -------------------------------------------------------------------------------------------------------- | --------------------------- |
| GitHub Pages             | Despliegue de la landing page de AniTec mediante hosting estático accesible a través de una URL pública. | https://pages.github.com    |
| GitHub Pages             | Despliegue del frontend web de AniTec como aplicación SPA accesible desde una URL pública.               | https://pages.github.com    |
| Render                   | Despliegue del backend web de AniTec mediante un Web Service público para exponer la API REST.           | https://render.com/         |
| My JSON Server           | Herramienta utilizada en una etapa previa para datos de prueba del frontend antes de integrar el backend real. | https://my-json-server.typicode.com/ |

**Software Documentation**

Agrupa herramientas a emplear para documentar la arquitectura, procesos, modelos y estructura del sistema.

| Plataforma / Herramienta | Propósito en el proyecto                                                                               | Enlace                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------ | ----------------------- |
| Lucidchart               | Elaboración de diagramas de flujo, wireflows y diagramas de clases del sistema.                        | https://lucidchart.com  |
| Structurizr              | Modelado de la arquitectura del sistema mediante el enfoque C4 (contexto, contenedores y componentes). | https://structurizr.com |
| Vertabelo                | Diseño y documentación del modelo de base de datos relacional del sistema AniTec.                      | https://vertabelo.com   |

## 5.1.2. Source Code Management.

En esta sección, el equipo de desarrollo de AniTec define los mecanismos y la estructura organizativa utilizados para el control de versiones y el seguimiento de cambios, empleando **GitHub** como plataforma principal.

Para ello, se configuraron repositorios remotos donde se almacena el código fuente, se documentan las modificaciones y se facilita la colaboración eficiente entre los miembros del equipo a lo largo de todo el ciclo de desarrollo de la aplicación.

Se utiliza GitHub como sistema centralizado para el versionado y la gestión colaborativa.
Los repositorios oficiales del proyecto AniTec son los siguientes:

- AniTec Documentation: https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-report
- Landing Page: https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-landing-page
- Aplicación Web (frontend de AniTec): https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-frontend
- Backend / Servicios Web (API del sistema): https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-backend

**Workflow de Control de Versiones (GitFlow)**

Para la gestión del desarrollo, se implementa el modelo GitFlow, el cual establece una estructura de ramas que permite organizar el trabajo del equipo de forma controlada y escalable.

**Estructura de branches (Ramas)**

**Ramas base:**

- _main_: Contiene la versión estable y productiva del sistema.
- _develop_: Rama de integración donde se consolidan las funcionalidades en desarrollo antes de su liberación a main.

**Feature branches:** <br> Cada funcionalidad específica contará con una rama independiente. Al completarse su desarrollo, se integrará a la rama principal de desarrollo. La nomenclatura seguirá el formato "feature/descripción-funcionalidad" para garantizar claridad y unicidad.

**Release branches:** <br> Estas bifurcaciones representarán versiones candidatas de la rama develop, preparadas para su eventual incorporación a main. Su identificación se basará en el Versionamiento Semántico estándar.

**Hotfix branches:** <br> Se implementarán para resolver de manera ágil errores críticos detectados en producción que afecten directamente la funcionalidad del sistema.

La estructura básica será: `git commit -m "<type>[optional scope]:<title>" -m"<description">`

1._Versionamiento Semántico:_ El control de versiones aplicará estrictamente los principios del Versionamiento Semántico 2.0.0 (SemVer), siguiendo el formato `MAJOR.MINOR.PATCH`, lo que permite mantener coherencia entre las versiones del sistema y asegurar la compatibilidad entre actualizaciones. 

| Parte  | Significado |
|--------|-------------|
| **MAJOR** | Cambios incompatibles o refactorizaciones críticas que alteran el funcionamiento del sistema existente. |
| **MINOR** | Implementación de nuevas funcionalidades retrocompatibles dentro del sistema. |
| **PATCH** | Corrección de errores o mejoras menores que no afectan la funcionalidad existente. |

<br>

2._Convenciones de Commits:_ Los mensajes de confirmación seguirán el estándar Conventional Commits, con el objetivo de mantener un historial de cambios claro, consistente y trazable a lo largo del desarrollo del proyecto AniTec.

**Tipos de commits utilizados:**

- **feat**: implementación de nuevas funcionalidades o módulos del sistema.
- **fix**: corrección de errores en el código o en la funcionalidad.
- **docs**: modificaciones o mejoras en la documentación del proyecto.
- **style**: cambios de formato o estilo que no afectan la lógica del sistema.
- **refactor**: reestructuración del código sin modificar su comportamiento funcional.
- **test**: creación o actualización de pruebas unitarias o de integración.
- **chore**: tareas de mantenimiento, configuración o actualización de dependencias.

## 5.1.3. Source Code Style Guide & Conventions.

En esta sección, el equipo de desarrollo de AniTec define las convenciones de nomenclatura y estilo de código adoptadas para garantizar consistencia, legibilidad y mantenibilidad en todos los componentes del sistema. Estas convenciones aplican a la Landing Page, la Web Application frontend y los Web Services backend, manteniendo coherencia entre HTML, CSS, JavaScript, Vue, PrimeVue, ASP.NET Core y la API REST.

El equipo procura que el estilo de código sea consistente con las tecnologías trabajadas durante el curso, evitando soluciones innecesariamente complejas y priorizando una estructura clara por componentes, módulos y bounded contexts.

**Convenciones Generales**

- Uso obligatorio del idioma inglés en todo el código fuente.
- Nombres descriptivos y semánticos.
- Evitar abreviaciones innecesarias.
- Mantener consistencia en estilos a lo largo del proyecto.
- Código estructurado, modular y reutilizable.
- Uso de nomenclatura `kebab-case` para clases y nombres de archivos.

---

**HTML y CSS**

Se adoptan las recomendaciones de:

- Google HTML/CSS Style Guide
- HTML Style Guide and Coding Conventions

**Convenciones aplicadas:**

- Uso de etiquetas semánticas (`<header>`, `<section>`, `<article>`, etc.).
- Indentación de 2 espacios.
- Uso de clases en formato `kebab-case` (ej. `animal-card`, `main-header`).
- Separación clara entre estructura (HTML) y estilo (CSS).
- Evitar estilos en línea (inline styles).

---

**JavaScript**

Se adoptan las guías:

- Google JavaScript Style Guide
- MDN JavaScript Guidelines

**Convenciones aplicadas:**

- Uso de `camelCase` para variables y funciones (ej. `getAnimalData`).
- Uso de `PascalCase` para clases (ej. `AnimalService`).
- Uso de `const` y `let` en lugar de `var`.
- Funciones pequeñas y con una única responsabilidad.
- Manejo adecuado de promesas (`async/await`).
- Uso de módulos para organizar el código.

---

**Framework Frontend**

Se adopta:

- Vue Style Guide
- PrimeVue Component Guidelines
- Material Design principles para organización visual, jerarquía, formularios y navegación.

**Convenciones aplicadas:**

- Componentes en `PascalCase` (ej. `AnimalCard.vue`).
- Separación de lógica, template y estilos dentro del componente.
- Props claramente tipadas y documentadas.
- Reutilización de componentes.
- Uso consistente de componentes PrimeVue para formularios, tablas, botones, diálogos y navegación.
- Organización del frontend por bounded contexts y capas `domain`, `application`, `infrastructure` y `presentation`.

---

**C# / Backend (.NET)**

Se adoptan:

- C# Coding Conventions
- Microsoft ASP.NET Core Coding Guidelines

**Convenciones aplicadas:**

- Uso de `PascalCase` para clases, métodos y propiedades.
- Uso de `camelCase` para variables locales y parámetros.
- Prefijo `_` para variables privadas (ej. `_animalRepository`).
- Métodos con nombres verbales (ej. `GetAnimals`, `CreateAnimal`).
- Separación en capas (Controllers, Services, Repositories).
- Uso de inyección de dependencias.

---

**REST API**

Se adoptan convenciones simples para mantener endpoints claros y coherentes con la arquitectura RESTful trabajada en clase.

**Convenciones aplicadas:**

- Uso de rutas en plural para recursos principales, por ejemplo `/animals`, `/herds`, `/devices` y `/subscriptions`.
- Uso de verbos HTTP según la acción: `GET` para consulta, `POST` para creación, `PUT` para actualización y `DELETE` para eliminación.
- Uso de resources y assemblers para separar entidades de dominio de respuestas REST.
- Respuestas orientadas a datos necesarios para el frontend, evitando exponer detalles internos de persistencia.
- Documentación de endpoints mediante Swagger/OpenAPI.

## 5.1.4. Software Deployment Configuration.

En esta sección se describe la configuración y el proceso de despliegue de los distintos componentes del sistema AniTec, detallando los pasos necesarios para publicar cada producto digital a partir de sus respectivos repositorios de código fuente.

El despliegue se ha estructurado de forma independiente para cada componente: Landing Page, Aplicación Web (Frontend) y Web Services (Backend), permitiendo una gestión modular, escalable y mantenible.

### Despliegue de Landing Page

La Landing Page se despliega utilizando **GitHub Pages**, permitiendo la publicación de sitios web estáticos directamente desde el repositorio.

**Repositorio:** https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-landing-page

**URL pública:** https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-landing-page/

**Pasos de despliegue:**

1. Subir el código fuente (HTML, CSS, JavaScript) al repositorio.
2. Configurar la rama `main` como fuente de despliegue en GitHub Pages.
3. Activar la opción **Pages** en la configuración del repositorio.
4. GitHub genera automáticamente una URL pública para acceder al sitio.

**Resultado:**

La Landing Page queda disponible en una URL accesible desde cualquier navegador. Link: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-landing-page/

<div align="center">
    <img src="../../assets/chapter-5/landing-page-evidence.png" width="500">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

### Despliegue de Frontend Web

La aplicación Frontend de AniTec se despliega utilizando **GitHub Pages**, permitiendo publicar la versión compilada de la SPA de Vue desde el repositorio del proyecto.

**Repositorio:** https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-frontend

**Pasos de despliegue:**

1. Compilar el frontend con Vite para generar los archivos estáticos de producción.
2. Configurar GitHub Pages en el repositorio del frontend.
3. Publicar la versión generada para que la aplicación quede disponible mediante una URL pública.
4. Verificar que las rutas principales de la aplicación carguen correctamente desde el navegador.

**Resultado:**

La aplicación Frontend queda disponible en una URL accesible desde cualquier navegador. Link: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-frontend

Para el ambiente de desarrollo, el frontend consume el backend real mediante variables de entorno configuradas en `.env.development`. Para producción, se debe mantener la misma estrategia de configuración mediante variables de entorno, de modo que la aplicación desplegada pueda apuntar progresivamente a la API real publicada sin cambiar el código fuente de los stores ni de las vistas.

<div align="center">
    <img src="../../assets/chapter-5/frontend-evidence.png" width="500">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/frontend-evidence2.png" width="500">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/frontend-evidence3.png" width="500">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

### Despliegue de Backend Web

El backend de AniTec se despliega utilizando **Render**, mediante un Web Service que permite exponer la API REST desarrollada con ASP.NET Core en un entorno accesible desde internet.

**Repositorio:** https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-backend

**Pasos de despliegue:**

1. Crear un Web Service en Render.
2. Conectar el repositorio del backend desde GitHub.
3. Configurar la rama de despliegue y el proyecto de inicio de ASP.NET Core.
4. Definir las variables de entorno requeridas, incluyendo cadena de conexión y configuración JWT.
5. Ejecutar el build en Render y verificar el inicio correcto del servicio.
6. Validar la documentación Swagger desde la URL pública.

**Resultado:**

El backend queda disponible públicamente para la integración con el frontend. Link: https://anitec-backend.onrender.com/swagger/index.html

**URL pública del backend:** https://anitec-backend.onrender.com

**Documentación Swagger:** https://anitec-backend.onrender.com/swagger/index.html

<div align="center">
    <img src="../../assets/chapter-5/sprint3-render-deployment.png" width="500">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>
