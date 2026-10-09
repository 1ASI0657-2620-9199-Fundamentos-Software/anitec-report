<br>
<br>

<div align="center">
    <img src="../../assets/chapter-5/capitulo-5.png" alt="Capitulo 5" />
</div>

<br>
<br>

# 5.2. Landing Page, Services & Applications Implementation.

## 5.2.3. Sprint 3.

En el Sprint 3, el equipo de AniTec se enfocó en la construcción del backend real y en la integración progresiva de la solución completa. El backend permitió reemplazar la dependencia inicial de servicios mock por una API REST desarrollada con ASP.NET Core, Entity Framework Core y MySQL, mientras que el frontend comenzó a consumir datos reales desde dicha API. Además, se incorporaron mejoras en la landing page para presentar los videos About the Team y About the Product dentro de la página About Us.

Durante este Sprint se desarrolló el proyecto `anitec-platform-main`, organizado mediante bounded contexts y siguiendo una arquitectura por capas. El backend implementa autenticación, gestión de usuarios, perfiles, fincas, animales, eventos sanitarios, actividades, registros financieros, reportes, clientes veterinarios, dispositivos, métricas de dispositivos y suscripciones. En paralelo, el frontend de AniTec fue ajustado para consumir endpoints reales, agregar los apartados de dispositivos IoT y suscripciones, y mantener una navegación coherente con los nuevos servicios disponibles. La landing page también fue actualizada con contenido audiovisual orientado a explicar el equipo y el producto.

### 5.2.3.1. Sprint Planning 3.

El Sprint Planning del Sprint 3 tuvo como objetivo definir el alcance para la implementación del backend de AniTec y su integración inicial con la solución web existente. A partir de lo avanzado en el Sprint 2, donde el frontend consumía datos desde `my-json-server`, el equipo identificó la necesidad de desarrollar una API propia que permita manejar reglas de negocio, persistencia real y una integración más cercana al funcionamiento final del producto.

Se decidió construir el backend utilizando ASP.NET Core y Entity Framework Core, ya que estas tecnologías fueron trabajadas durante las clases del curso. Además, se eligió MySQL como sistema gestor de base de datos porque fue la tecnología indicada para el desarrollo de backend en esta etapa del curso. De forma complementaria, se planificó actualizar el frontend para consumir la API real y extender la aplicación con los módulos de dispositivos IoT y suscripciones.

Durante la planificación se definieron los bounded contexts principales, las responsabilidades de cada integrante y las funcionalidades mínimas necesarias para que el backend pueda reemplazar progresivamente al servicio mock utilizado en el Sprint 2. También se incluyeron ajustes en la landing page para incorporar los videos About the Team y About the Product dentro de la sección About Us.

<table align="center" border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;">
    <tbody>
        <tr>
            <td><b>Sprint #</b></td>
            <td>Sprint 3</td>
        </tr>
        <tr>
            <td colspan="2"><b>Sprint Planning Background</b></td>
        </tr>
        <tr>
            <td>Date</td>
            <td>2026-06-05</td>
        </tr>
        <tr>
            <td>Time</td>
            <td>10:00 AM</td>
        </tr>
        <tr>
            <td>Location</td>
            <td>Reunión virtual via Discord - Canal #sprint-planning</td>
        </tr>
        <tr>
            <td>Prepared by</td>
            <td>Melgarejo Quiroz, Josep Eliu</td>
        </tr>
        <tr>
            <td>Attendees (to planning meeting)</td>
            <td>Jorge Ayala, Bruno Huaman, Josep Melgarejo, Nadhim Raymundo, Luciana Sanchez</td>
        </tr>
        <tr>
            <td>Sprint 2 Review Summary</td>
            <td>El Sprint 2 permitió construir la aplicación web frontend de AniTec con Vue 3, PrimeVue, Pinia, Vue Router, módulos por bounded context y consumo de datos mediante una API REST mock con my-json-server.</td>
        </tr>
        <tr>
            <td>Sprint 2 Retrospective Summary</td>
            <td>El equipo identificó que el uso de datos mock permitió avanzar rápidamente en el frontend, pero limitaba la validación de reglas de negocio, persistencia real, autenticación segura y operaciones entre módulos. Por ello, se priorizó el desarrollo del backend en el Sprint 3.</td>
        </tr>
        <tr>
            <td colspan="2"><b>Sprint Goal / User Stories</b></td>
        </tr>
        <tr>
            <td>Sprint 3 Goal</td>
            <td>Nuestro enfoque está en ofrecer servicios backend reales e integración con la aplicación web para que ganaderos y veterinarios trabajen con información persistente en AniTec, habilitando a Backend Developers y Frontend Developers mediante endpoints documentados, migraciones y contratos de API. Creemos que esto entrega una experiencia más confiable a los ganaderos, porque sus hatos, animales, finanzas, actividades, dispositivos IoT y suscripciones dejan de depender de datos mock; y entrega mayor continuidad a los veterinarios, porque pueden consultar clientes, pacientes, eventos sanitarios y analíticas desde datos expuestos por la API. Esto se confirmará cuando el frontend consuma endpoints reales, la API documente sus servicios en Swagger, los usuarios puedan acceder a módulos IoT y suscripciones, y la landing page comunique el producto mediante los videos About the Team y About the Product.</td>
        </tr>
        <tr>
            <td>Sprint 3 Velocity</td>
            <td>El equipo estimó un velocity de 57 Story Points, considerando la construcción del backend, configuración de persistencia, implementación de bounded contexts, endpoints REST, documentación de servicios, integración frontend-backend y mejoras en la landing page.</td>
        </tr>
        <tr>
            <td>Sprint of Story Points</td>
            <td>Total: 57 SP - Distribuidos en 45 SP para backend y servicios REST, 5 SP para integración frontend-backend, 5 SP para módulos frontend de dispositivos IoT y suscripciones, y 2 SP para actualización de landing page con videos About the Team y About the Product.</td>
        </tr>
    </tbody>
</table>

El Sprint Planning Meeting del Sprint 3 duró aproximadamente 2.5 horas. El equipo revisó la estructura del backend usado como referencia en clase, definió los bounded contexts necesarios para AniTec y acordó mantener patrones conocidos como Repository, Unit of Work, Command Services, Query Services, REST Resources y Entity Framework Core para la persistencia.

**Technical Stories incluidas en el Sprint 3:**

| ID     | Technical Story                                                     | Prioridad   | Story Points |
| ------ | ------------------------------------------------------------------- | ----------- | ------------ |
| TS-005 | Configuración inicial del backend con ASP.NET Core                  | Must Have   | 5            |
| TS-006 | Persistencia con Entity Framework Core y MySQL                      | Must Have   | 8            |
| TS-007 | Autenticación backend con JWT y BCrypt                              | Must Have   | 8            |
| TS-008 | Implementación de bounded contexts de gestión ganadera              | Must Have   | 8            |
| TS-009 | Servicios backend para analíticas y clientes veterinarios           | Should Have | 6            |
| TS-010 | Servicios backend para dispositivos, métricas y suscripciones       | Should Have | 6            |
| TS-011 | Documentación y pruebas de API con Swagger                          | Should Have | 4            |
| TS-012 | Integración del frontend con backend real                           | Must Have   | 5            |
| TS-013 | Módulos frontend para IoT y suscripciones                           | Should Have | 5            |
| TS-014 | Videos About the Team y About the Product en landing page           | Should Have | 2            |

La selección de estas Technical Stories responde a la necesidad de construir la base de datos y la lógica principal del sistema, pero también de validar que la aplicación web pueda consumir servicios reales y presentar las nuevas funcionalidades al usuario. El equipo priorizó primero la configuración del backend, IAM y persistencia, y luego la integración del frontend con los endpoints disponibles, incluyendo dispositivos IoT, suscripciones y pagos de prueba.

**Distribución de Trabajo por Componente:**

- **Backend ASP.NET Core:** 45 Story Points - Enfocados en la creación del proyecto `anitec-platform-main`, organización por bounded contexts, configuración de MySQL, migraciones, endpoints REST, autenticación JWT, seed de datos y documentación Swagger.
- **Frontend Web Application:** 10 Story Points - Enfocados en consumir la API real, configurar endpoints mediante `.env.development`, ajustar stores, APIs y assemblers, y añadir los apartados de dispositivos IoT y suscripciones.
- **Landing Page:** 2 Story Points - Enfocados en incorporar los videos About the Team y About the Product dentro de la página About Us.

### 5.2.3.2. Aspects Leaders and Collaborators.

En esta sección el equipo elabora el artefacto Leadership-and-Collaboration Matrix (LACX) para el Sprint 3, indicando por cada aspecto dentro del alcance del Sprint quién es el líder y quiénes son colaboradores.

Para este tercer Sprint, los aspectos están centrados principalmente en el desarrollo del backend de AniTec, pero también incluyen la integración inicial del frontend con la API real y la actualización de la landing page con contenido audiovisual. De esta manera, el Sprint no solo cubre la implementación de servicios, persistencia con MySQL y documentación técnica, sino también la conexión de la aplicación web con dichos servicios.

**Aspectos del Sprint 3:**

1. **Backend - Configuración y Arquitectura Base:** Creación de la solución ASP.NET Core, configuración de Swagger, CORS, inyección de dependencias, Entity Framework Core y estructura de carpetas.
2. **Backend - IAM y Profiles:** Implementación de usuarios básicos.
3. **Backend - Livestock, Sanitary y Activities:** Implementación de fincas, animales, eventos sanitarios y actividades de granja mediante entidades, comandos, consultas, servicios y controladores REST.
4. **Backend - Financial y Analytics:** Implementación de registros financieros, report metrics y endpoints de dashboard para ganaderos y veterinarios.
5. **Backend - Clients, Devices y Metrics:** Implementación de clientes veterinarios, dispositivos ganaderos y métricas generadas por dispositivos.
6. **Backend - Subscriptions y Payments:** Implementación de planes, suscripciones, pagos mock y preparación de campos para una futura integración con Stripe.
7. **Base de Datos, Migraciones y Seed:** Configuración de MySQL, migraciones de Entity Framework Core y datos iniciales para pruebas.
8. **Frontend - Integración con Backend Real:** Configuración de `.env.development`, BaseApi, endpoints reales y stores para consumir la API.
9. **Frontend - IoT y Subscriptions:** Implementación de vistas, rutas, stores, APIs y assemblers para dispositivos IoT, métricas, planes, suscripciones y pagos de prueba.
10. **Landing Page - About Videos:** Incorporación de videos About the Team y About the Product en la página About Us.
11. **Documentación:** Documentación técnica del Sprint, endpoints disponibles y evidencias de ejecución.

<table align="center" border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;">
    <tbody>
        <tr>
            <td><b>Team Member (Last Name, First Name)</b></td>
            <td><b>GitHub Username</b></td>
            <td><b>Config/Arq Backend / L or C</b></td>
            <td><b>IAM & Profiles / L or C</b></td>
            <td><b>Livestock/Sanitary/Activities / L or C</b></td>
            <td><b>Financial/Analytics / L or C</b></td>
            <td><b>Clients/Devices/Metrics / L or C</b></td>
            <td><b>Subscriptions / L or C</b></td>
            <td><b>Documentación / L or C</b></td>
        </tr>
        <tr>
            <td>Ayala Fernandez, Jorge Brayan</td>
            <td>jorgeayaladev</td>
            <td>L</td>
            <td>L</td>
            <td>C</td>
            <td>C</td>
            <td>-</td>
            <td>C</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Huaman Gallardo, Bruno Aldair</td>
            <td>BrunoHG10</td>
            <td>C</td>
            <td>C</td>
            <td>L</td>
            <td>C</td>
            <td>L</td>
            <td>-</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Melgarejo Quiroz, Josep Eliu</td>
            <td>Melga1502</td>
            <td>L</td>
            <td>C</td>
            <td>C</td>
            <td>L</td>
            <td>C</td>
            <td>L</td>
            <td>L</td>
        </tr>
        <tr>
            <td>Raymundo Villarroel, Nadhim Abigail</td>
            <td>AbigailRV</td>
            <td>C</td>
            <td>C</td>
            <td>L</td>
            <td>C</td>
            <td>C</td>
            <td>-</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Sanchez Silva, Luciana Celeste</td>
            <td>Luccsss</td>
            <td>C</td>
            <td>C</td>
            <td>C</td>
            <td>C</td>
            <td>L</td>
            <td>C</td>
            <td>C</td>
        </tr>
    </tbody>
</table>

**Aspectos complementarios de frontend y landing page:**

Los aspectos de frontend y landing page se presentan en una tabla complementaria para evitar saturar la matriz principal de backend, manteniendo de forma explícita los líderes y colaboradores de estos trabajos.

| Aspecto | Líder | Colaboradores |
| ------- | ----- | ------------- |
| Landing Page - About Videos | Ayala Fernandez, Jorge Brayan | Sanchez Silva, Luciana Celeste; Melgarejo Quiroz, Josep Eliu |
| Frontend - Backend Integration | Melgarejo Quiroz, Josep Eliu | Ayala Fernandez, Jorge Brayan; Huaman Gallardo, Bruno Aldair |
| Frontend - IoT and Subscriptions | Huaman Gallardo, Bruno Aldair | Melgarejo Quiroz, Josep Eliu; Raymundo Villarroel, Nadhim Abigail |

**Distribución detallada de responsabilidades:**

- **Ayala Fernandez, Jorge Brayan (Configuración & IAM Lead):** Responsable de la configuración inicial del backend, autenticación, generación de tokens JWT, manejo de credenciales y endpoints de usuarios.

- **Huaman Gallardo, Bruno Aldair (Livestock & Devices Lead):** Responsable de los módulos relacionados con la gestión ganadera, incluyendo fincas, animales, dispositivos y métricas asociadas.

- **Melgarejo Quiroz, Josep Eliu (Financial, Analytics & Documentation Lead):** Responsable de registros financieros, reportes, dashboards, suscripciones, pagos mock y documentación del Sprint.

- **Raymundo Villarroel, Nadhim Abigail (Sanitary & Activities Lead):** Responsable de eventos sanitarios, actividades de granja y seguimiento de información clínica del ganado.

- **Sanchez Silva, Luciana Celeste (Clients Lead):** Responsable de la relación entre veterinarios y ganaderos, incluyendo clientes asignados, ganaderos disponibles y operaciones de asociación.

- **Frontend - Backend Integration:** Responsable de conectar la aplicación Vue con los endpoints reales mediante `.env.development`, BaseApi, APIs de infraestructura, stores Pinia y assemblers por bounded context.

- **Frontend - IoT and Subscriptions:** Responsable de incorporar las rutas `/iot` y `/subscriptions`, así como las vistas para dispositivos, métricas, planes, suscripciones, historial de pagos y flujo de pago de prueba.

- **Landing Page - About Videos:** Responsable de añadir los videos About the Team y About the Product en la página About Us mediante iframes de YouTube, manteniendo la estructura responsive de la landing page.

### 5.2.3.3. Sprint Backlog 3.

El Sprint Backlog 3 tiene como objetivo principal implementar el backend de AniTec con una estructura modular y mantenible, y conectar progresivamente la aplicación web con los servicios reales. Este backend permite centralizar la lógica de negocio, persistir datos en MySQL y exponer endpoints REST que serán consumidos por el frontend. Además, el Sprint incluye mejoras en la landing page para presentar los videos About the Team y About the Product.

El Sprint Backlog fue elaborado considerando las dependencias entre módulos. Primero se priorizó la configuración base del proyecto y la persistencia; luego se implementaron los bounded contexts principales; finalmente se añadieron endpoints de analítica, dispositivos, suscripciones, datos iniciales para pruebas, consumo desde el frontend y actualización de la landing page.

**Trello Board:**
El equipo utiliza un Trello Board para gestionar visualmente el Sprint Backlog. El Board contiene las listas estándar de Scrum: "Sprint Goal", "To Do", "In Progress", "To Review" y "Done".

Enlace al tablero del Sprint Backlog 3: https://tinyurl.com/TrelloSprint3Anitec 

<div align="center">
    <img src="../../assets/chapter-5/trello-sprint3.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

**Estructura del Trello Board:**

- **Sprint Goal:** Lista que contiene el objetivo principal del Sprint.
- **To Do:** Lista con las tareas pendientes por iniciar.
- **In Progress:** Lista con las tareas que se encuentran en desarrollo.
- **To Review:** Lista con tareas completadas pendientes de revisión.
- **Done:** Lista con tareas aprobadas e integradas al backend.

A continuación, la tabla de control de estado para el Sprint 3:

<table align="center" border="1" cellpadding="8" cellspacing="0" style="border-collapse: collapse; width: 100%; font-family: Arial, sans-serif;">
    <tbody>
        <tr>
            <td><b>Sprint #</b></td>
            <td colspan="7">Sprint 3</td>
        </tr>
        <tr>
            <td colspan="2">User Story</td>
            <td colspan="6">Work-Item / Task</td>
        </tr>
        <tr>
            <td>Id</td>
            <td>Title</td>
            <td>Id</td>
            <td>Title</td>
            <td>Description</td>
            <td>Estimation (Hours)</td>
            <td>Assigned to</td>
            <td>Status</td>
        </tr>
        <tr>
            <td>TS-005</td>
            <td>Configuración inicial del backend con ASP.NET Core</td>
            <td>T001</td>
            <td>Configurar solución backend</td>
            <td>Crear la solución anitec-platform, configurar proyecto ASP.NET Core, Swagger, CORS, appsettings, estructura base y paquetes NuGet necesarios.</td>
            <td>5</td>
            <td>Ayala Fernandez, Jorge Brayan</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-006</td>
            <td>Persistencia con Entity Framework Core y MySQL</td>
            <td>T002</td>
            <td>Configurar persistencia con Entity Framework Core</td>
            <td>Crear AppDbContext, configurar conexión a MySQL, repositorio base, Unit of Work, convenciones de nombres, migraciones y seed de datos iniciales.</td>
            <td>8</td>
            <td>Melgarejo Quiroz, Josep Eliu</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-007</td>
            <td>Autenticación backend con JWT y BCrypt</td>
            <td>T003</td>
            <td>Implementar usuarios, sign-in y sign-up</td>
            <td>Crear entidades, comandos, consultas, servicios, recursos REST y controladores para autenticación, registro de usuarios, hashing de contraseñas y generación de JWT.</td>
            <td>8</td>
            <td>Ayala Fernandez, Jorge Brayan</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-008</td>
            <td>Implementación de bounded contexts de gestión ganadera</td>
            <td>T004</td>
            <td>Implementar Livestock</td>
            <td>Crear bounded context para fincas y animales, incluyendo entidades Herd y Animal, repositorios, servicios de comando/consulta y controladores REST.</td>
            <td>4</td>
            <td>Huaman Gallardo, Bruno Aldair</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-008</td>
            <td>Implementación de bounded contexts de gestión ganadera</td>
            <td>T005</td>
            <td>Implementar Sanitary y Activities</td>
            <td>Crear endpoints para eventos sanitarios y actividades de granja, siguiendo la estructura de commands, queries, resources y assemblers.</td>
            <td>4</td>
            <td>Raymundo Villarroel, Nadhim Abigail</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-009</td>
            <td>Servicios backend para analíticas y clientes veterinarios</td>
            <td>T006</td>
            <td>Implementar Analytics y Clients</td>
            <td>Crear endpoints para dashboards, resúmenes sanitarios/financieros, clientes asignados al veterinario y ganaderos disponibles.</td>
            <td>6</td>
            <td>Sanchez Silva, Luciana Celeste</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-010</td>
            <td>Servicios backend para dispositivos, métricas y suscripciones</td>
            <td>T007</td>
            <td>Implementar Devices, Metrics y Subscriptions</td>
            <td>Crear endpoints para dispositivos, métricas generadas por sensores, planes de suscripción, suscripciones, pagos mock y mock checkout.</td>
            <td>6</td>
            <td>Huaman Gallardo, Bruno Aldair</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-011</td>
            <td>Documentación y pruebas de API con Swagger</td>
            <td>T008</td>
            <td>Documentar y probar endpoints REST</td>
            <td>Verificar Swagger, compilar el proyecto, ejecutar la API, probar endpoints principales y documentar evidencias del Sprint.</td>
            <td>4</td>
            <td>Melgarejo Quiroz, Josep Eliu</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-012</td>
            <td>Integración del frontend con backend real</td>
            <td>T009</td>
            <td>Configurar consumo de API real en frontend</td>
            <td>Actualizar configuración de endpoints mediante `.env.development`, BaseApi y APIs por bounded context para consumir servicios del backend.</td>
            <td>5</td>
            <td>Melgarejo Quiroz, Josep Eliu</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-013</td>
            <td>Módulos frontend para IoT y suscripciones</td>
            <td>T010</td>
            <td>Implementar vistas y stores de IoT y Subscriptions</td>
            <td>Crear y ajustar rutas `/iot` y `/subscriptions`, stores, APIs, assemblers y vistas para dispositivos, métricas, planes, suscripciones y pagos de prueba.</td>
            <td>5</td>
            <td>Huaman Gallardo, Bruno Aldair</td>
            <td>Done</td>
        </tr>
        <tr>
            <td>TS-014</td>
            <td>Videos About the Team y About the Product en landing page</td>
            <td>T011</td>
            <td>Agregar videos en About Us</td>
            <td>Insertar iframes de YouTube para About the Team y About the Product, manteniendo diseño responsive e integración con la página About Us.</td>
            <td>2</td>
            <td>Ayala Fernandez, Jorge Brayan</td>
            <td>Done</td>
        </tr>
    </tbody>
</table>

El Sprint Backlog refleja 11 tareas principales, con aproximadamente 57 horas estimadas de tareas, alineadas con 57 Story Points. Cada tarea fue planificada considerando la complejidad técnica, las dependencias entre bounded contexts, la necesidad de mantener una estructura similar al backend trabajado en clase, la integración del frontend con la API real y la actualización de la landing page.

### 5.2.3.4. Development Evidence for Sprint Review.

En esta sección se presentan los avances de implementación realizados durante el Sprint 3 con relación al backend de AniTec, la integración inicial del frontend con la API real y la actualización de la landing page. La evidencia muestra que el equipo logró construir una API funcional conectada a MySQL, ajustar la aplicación web para consumir servicios reales e incorporar contenido audiovisual en la página About Us.

Durante el Sprint 3, el equipo completó la implementación del proyecto `anitec-platform-main`. El backend fue construido utilizando ASP.NET Core, Entity Framework Core, MySQL, JWT y BCrypt. La estructura interna sigue una organización por bounded contexts con capas de dominio, aplicación, infraestructura e interfaces REST. En paralelo, el frontend fue preparado para consumir endpoints reales mediante configuración de ambiente, servicios API y stores por módulo.

**Resumen de Avances Implementados:**

- **Creación del proyecto backend:** Solución `anitec-platform.sln` con proyecto principal `Anitec.Platform`.
- **Configuración de ASP.NET Core:** Uso de controladores REST, Swagger/OpenAPI, CORS, configuración por ambiente y middleware de errores.
- **Persistencia con MySQL:** Configuración de `AppDbContext`, repositorios, Unit of Work y migraciones de Entity Framework Core.
- **Autenticación JWT:** Implementación de sign-in, sign-up, hashing de contraseñas con BCrypt y emisión de token.
- **Arquitectura por bounded contexts:** Implementación de Shared, IAM, Profiles, Livestock, Sanitary, Activities, Financial, Analytics, Clients, Devices, Metrics y Subscriptions.
- **Servicios de aplicación:** Uso de Command Services y Query Services para separar operaciones de escritura y lectura.
- **REST Resources:** Uso de recursos y assemblers para transformar entidades de dominio en respuestas de API.
- **Seed de datos:** Carga inicial de usuarios, fincas, animales, eventos, dispositivos, planes y suscripciones para pruebas.
- **Migraciones automáticas:** Configuración para aplicar migraciones pendientes al ejecutar la API.
- **Integración frontend-backend:** Configuración de `.env.development`, uso de `BaseApi`, APIs por bounded context, stores Pinia y assemblers para adaptar respuestas del backend.
- **Módulos frontend nuevos:** Incorporación de rutas `/iot` y `/subscriptions`, junto con vistas para dispositivos IoT, métricas, planes, suscripciones, historial de pagos y pago de prueba.
- **Landing page:** Incorporación de videos About the Team y About the Product mediante iframes de YouTube en la página About Us.

**Frontend - Integración con Backend Real:**

- Se configuró `.env.development` para apuntar al backend local mediante `http://localhost:5191/api/v1`.
- Se mantuvo el uso de `BaseApi` para centralizar las peticiones HTTP realizadas con Axios.
- Se ajustaron stores y APIs por bounded context para consumir endpoints reales de usuarios, hatos, animales, sanidad, finanzas, actividades, analíticas, clientes veterinarios, dispositivos y suscripciones.
- Se usaron assemblers para transformar respuestas del backend en objetos usados por las vistas del frontend.
- Se incorporaron las rutas `/iot` y `/subscriptions` dentro de la navegación principal de la aplicación.

<div align="center">
    <p><b>Frontend - Consumo de API real y nuevas vistas</b></p>
    <img src="../../assets/chapter-5/login.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

**Landing Page - Videos About the Team y About the Product:**

- En la página About Us de la landing page se incorporó un video About the Team para presentar al equipo de AniTec.
- También se agregó el video About the Product para explicar el modelo de negocio, la propuesta de valor y las funciones principales de la solución.
- Ambos videos fueron integrados mediante iframes de YouTube, manteniendo la estructura responsive de la landing page.

<div align="center">
    <p><b>Landing Page - Video About the Product</b></p>
    <img src="../../assets/chapter-5/video-about-the-product-landingpage.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <p><b>Landing Page - Video About the Team</b></p>
    <img src="../../assets/chapter-5/video-about-the-team-landingpage.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

**Estructura principal del backend:**

```text
anitec-platform-main/
├── Anitec.Platform/
│   ├── Activities/
│   ├── Analytics/
│   ├── Clients/
│   ├── Devices/
│   ├── Financial/
│   ├── Iam/
│   ├── Livestock/
│   ├── Metrics/
│   ├── Profiles/
│   ├── Sanitary/
│   ├── Shared/
│   └── Subscriptions/
├── anitec-platform.sln
└── README.md
```

**Commits del repositorio anitec-backend:**

| Repository           | Branch | Commit id | Commit Message                            | Commit Message Body                                           | Committed on (Date) |
| -------------------- | ------ | --------- | ----------------------------------------- | ------------------------------------------------------------- | ------------------- |
| anitec-platform-main | develop | a7f3c91 | chore: initial-folder-structure | Creación de la estructura base del backend ASP.NET Core, carpetas por bounded context y configuración inicial de dependencias. | 01/06/2026 |
| anitec-platform-main | feature/get-all-herds | 4b83e0d | feat: create herds controller | Creación del controlador REST para exponer operaciones principales de hatos. | 02/06/2026 |
| anitec-platform-main | feature/get-all-users | 74b5e23 | feat: implement get all users endpoint | Implementación del endpoint `GET /users` para consultar usuarios registrados en la plataforma. | 02/06/2026 |
| anitec-platform-main | feature/get-all-herds | e41fc9a | feat: add herds query service | Implementación del servicio de consultas para listar hatos desde la base de datos. | 03/06/2026 |
| anitec-platform-main | feature/get-all-animals | 39eb2fd | feat: map animal resource response | Definición de recursos REST y assembler para devolver animales con especie, raza, peso, estado y hato asociado. | 03/06/2026 |
| anitec-platform-main | develop | 0a9d8bf | Merge pull request #33 from upc-1asi0730-2610-12206-titan-team-4/feature/get-all-herds | Integración del listado de hatos al branch de desarrollo. | 04/06/2026 |
| anitec-platform-main | feature/get-user-by-id | d24ab70 | feat: implement get user by id endpoint | Implementación del endpoint `GET /users/{id}` para consultar un usuario específico mediante su identificador. | 04/06/2026 |
| anitec-platform-main | feature/add-new-health-event | d80a2bf | feat: create health event command | Creación del comando de aplicación para registrar vacunas, diagnósticos, tratamientos y seguimientos. | 05/06/2026 |
| anitec-platform-main | feature/get-all-animals | 5a73b6e | feat: implement get all animals endpoint | Implementación del endpoint `GET /animals` para consultar animales registrados. | 05/06/2026 |
| anitec-platform-main | feature/add-new-herd | 92d7ac1 | feat: implement add new herd endpoint | Implementación del endpoint `POST /herds` para registrar nuevos hatos o unidades productivas. | 06/06/2026 |
| anitec-platform-main | feature/get-all-financial-records | e7b30f1 | feat: add financial record repository | Implementación del repositorio para consultar ingresos y egresos persistidos en MySQL. | 06/06/2026 |
| anitec-platform-main | feature/get-all-health-events | b6d14ca | feat: implement get all health events endpoint | Implementación del endpoint `GET /health-events` para consultar vacunas, tratamientos e incidencias. | 07/06/2026 |
| anitec-platform-main | develop | 21d9f5e | Merge pull request #36 from upc-1asi0730-2610-12206-titan-team-4/feature/get-all-animals | Integración del listado de animales al branch de desarrollo. | 07/06/2026 |
| anitec-platform-main | feature/get-rancher-dashboard | 2ed4b73 | feat: build rancher dashboard summary | Implementación del resumen de animales, hatos, eventos sanitarios y métricas principales para ganaderos. | 08/06/2026 |
| anitec-platform-main | feature/add-new-health-event | 11ae7d9 | feat: expose add health event endpoint | Exposición del endpoint `POST /health-events` para registrar eventos sanitarios desde la aplicación web. | 08/06/2026 |
| anitec-platform-main | feature/get-all-farm-events | 1c7d80e | feat: implement get all farm events endpoint | Implementación del endpoint `GET /farm-events` para consultar actividades, visitas y tareas programadas. | 09/06/2026 |
| anitec-platform-main | feature/get-clients-by-veterinarian | 6fa28c0 | feat: create veterinarian clients resource | Creación de recursos REST para representar clientes asignados a un veterinario. | 09/06/2026 |
| anitec-platform-main | develop | 63fa0dd | Merge pull request #39 from upc-1asi0730-2610-12206-titan-team-4/feature/get-all-health-events | Integración de la consulta de eventos sanitarios al branch de desarrollo. | 10/06/2026 |
| anitec-platform-main | feature/get-all-devices | 58d14e7 | feat: implement get all devices endpoint | Implementación del endpoint `GET /devices` para listar dispositivos IoT asociados a animales o hatos. | 10/06/2026 |
| anitec-platform-main | feature/get-veterinarian-dashboard | cb8a3e5 | feat: implement veterinarian dashboard endpoint | Implementación del endpoint `GET /analytics/veterinarians/{veterinarianId}/dashboard` para mostrar clientes, pacientes y eventos sanitarios. | 11/06/2026 |
| anitec-platform-main | feature/get-clients-by-veterinarian | 47bd918 | feat: implement get clients by veterinarian endpoint | Implementación del endpoint `GET /veterinarian/{veterinarianId}/clients` para listar ganaderos asignados. | 11/06/2026 |
| anitec-platform-main | feature/get-active-subscription-by-user | 71ad8e0 | feat: implement active subscription query | Implementación de consulta para obtener la suscripción activa de un usuario. | 12/06/2026 |
| anitec-platform-main | develop | a4b9df0 | Merge pull request #43 from upc-1asi0730-2610-12206-titan-team-4/feature/get-rancher-dashboard | Integración del dashboard de ganadero al branch de desarrollo. | 12/06/2026 |
| anitec-platform-main | feature/get-device-latest-metric | f0e2a69 | feat: implement latest device metric endpoint | Implementación del endpoint `GET /devices/{id}/latest-metric` para obtener la última lectura registrada. | 13/06/2026 |
| anitec-platform-main | feature/add-client-to-veterinarian | bf5a127 | feat: implement add client to veterinarian endpoint | Implementación del endpoint `POST /veterinarian/{veterinarianId}/clients/{rancherId}` para asociar un ganadero a un veterinario. | 13/06/2026 |
| anitec-platform-main | feature/get-all-subscription-plans | 87a0d6c | feat: create subscription plan resource | Creación de recursos REST para representar planes de suscripción. | 14/06/2026 |
| anitec-platform-main | feature/get-all-subscription-plans | e314ac7 | feat: implement get all subscription plans endpoint | Implementación del endpoint `GET /subscription-plans` para listar planes disponibles. | 14/06/2026 |
| anitec-platform-main | feature/get-available-ranchers-for-veterinarian | 2a0fca9 | feat: implement available ranchers endpoint | Implementación del endpoint `GET /veterinarian/{veterinarianId}/available-ranchers` para consultar ganaderos disponibles. | 15/06/2026 |
| anitec-platform-main | develop | 47f8c2d | Merge pull request #69 from upc-1asi0730-2610-12206-titan-team-4/feature/get-clients-by-veterinarian | Integración de la consulta de clientes asignados al branch de desarrollo. | 15/06/2026 |
| anitec-platform-main | feature/get-payments-by-user | 4f2bc8a | feat: implement get payments by user endpoint | Implementación del endpoint `GET /subscriptions/users/{userId}/payments` para consultar pagos asociados a un usuario. | 16/06/2026 |
| anitec-platform-main | feature/mock-checkout | 9b8e430 | feat: create mock checkout command | Creación del flujo de comando para simular checkout y generar pagos de prueba. | 16/06/2026 |
| anitec-platform-main | feature/mock-checkout | 5e64a1d | feat: implement mock checkout endpoint | Implementación del endpoint `POST /subscriptions/mock-checkout` para validar pagos mock durante el Sprint. | 17/06/2026 |
| anitec-platform-main | feature/remove-client-from-veterinarian | 3fe60ab | feat: implement remove client from veterinarian endpoint | Implementación del endpoint `DELETE /veterinarian/{veterinarianId}/clients/{rancherId}` para retirar un cliente asignado. | 17/06/2026 |
| anitec-platform-main | develop | 92e03bf | Merge pull request #71 from upc-1asi0730-2610-12206-titan-team-4/feature/get-all-devices | Integración de dispositivos IoT y lectura de últimas métricas al branch de desarrollo. | 18/06/2026 |
| anitec-platform-main | hotfix/fix-dateonly-mysql-converters | c6a01de | fix: configure dateonly converters for mysql | Corrección de conversores DateOnly para evitar errores de persistencia y lectura en MySQL. | 18/06/2026 |
| anitec-platform-main | hotfix/fix-dateonly-mysql-converters | e0b71ac | fix: update migration snapshot dates | Ajuste del snapshot de migraciones para mantener consistencia con las columnas de fecha. | 18/06/2026 |
| anitec-platform-main | develop | d0af82c | Merge pull request #73 from upc-1asi0730-2610-12206-titan-team-4/hotfix/fix-dateonly-mysql-converters | Integración del hotfix de conversión de fechas al branch de desarrollo. | 19/06/2026 |
| anitec-platform-main | develop | 8f6d1be | Merge pull request #72 from upc-1asi0730-2610-12206-titan-team-4/feature/mock-checkout | Integración del flujo de pagos mock y suscripciones al branch de desarrollo. | 19/06/2026 |
| anitec-platform-main | main | 7e9c4b2 | Merge pull request #74 from upc-1asi0730-2610-12206-titan-team-4/develop | Integración final del Sprint 3 desde `develop` hacia `main`, consolidando endpoints, migraciones, seed de datos y documentación Swagger. | 19/06/2026 |

**Commits del repositorio anitec-frontend:**

| Repository      | Branch | Commit id | Commit Message                            | Commit Message Body                                           | Committed on (Date) |
| --------------- | ------ | --------- | ----------------------------------------- | ------------------------------------------------------------- | ------------------- |
| anitec-frontend | develop | 3b7a91d | chore: configure backend api environment | Configuracion de `.env.development` para consumir la API real de AniTec desde `http://localhost:5191/api/v1`. | 13/06/2026 |
| anitec-frontend | feature/backend-integration | 9c2f4a8 | feat: connect livestock views to backend | Ajuste de servicios API, stores y assemblers de Livestock para consumir hatos y animales desde el backend real. | 14/06/2026 |
| anitec-frontend | feature/backend-integration | f61d0be | feat: connect health financial and activity stores | Integracion de Sanitary, Financial y Activities con endpoints reales mediante `BaseApi` y stores Pinia. | 15/06/2026 |
| anitec-frontend | develop | 24ea6f3 | Merge pull request #18 from upc-1asi0730-2610-12206-titan-team-4/feature/backend-integration | Integracion del consumo de API real al branch de desarrollo del frontend. | 15/06/2026 |
| anitec-frontend | feature/iot-module | c80a42f | feat: add devices bounded context frontend | Creacion del bounded context frontend de Devices con API, store, assemblers y rutas para visualizar dispositivos IoT. | 16/06/2026 |
| anitec-frontend | feature/iot-module | 7d5b8a1 | feat: implement iot dashboard metrics | Implementacion de la vista `/iot` para mostrar dispositivos, estado, asociacion con animales o hatos y ultimas metricas. | 16/06/2026 |
| anitec-frontend | feature/subscriptions-module | e34c79b | feat: add subscriptions bounded context frontend | Creacion del bounded context frontend de Subscriptions con API, store, assemblers, rutas y vista de planes. | 17/06/2026 |
| anitec-frontend | feature/subscriptions-module | a8f03cd | feat: implement test payments view | Implementacion del historial de pagos de prueba y visualizacion de suscripcion activa usando datos del backend. | 18/06/2026 |
| anitec-frontend | develop | 5f29b6e | Merge pull request #21 from upc-1asi0730-2610-12206-titan-team-4/feature/iot-module | Integracion del modulo IoT al branch de desarrollo del frontend. | 18/06/2026 |
| anitec-frontend | develop | b14c8d2 | Merge pull request #22 from upc-1asi0730-2610-12206-titan-team-4/feature/subscriptions-module | Integracion del modulo de suscripciones, planes y pagos de prueba al branch de desarrollo. | 19/06/2026 |
| anitec-frontend | main | 0d91f4c | Merge pull request #23 from upc-1asi0730-2610-12206-titan-team-4/develop | Integracion final del Sprint 3 desde `develop` hacia `main`, consolidando consumo de backend, IoT y suscripciones. | 19/06/2026 |

**Commits del repositorio anitec-landing-page:**

| Repository          | Branch | Commit id | Commit Message                            | Commit Message Body                                           | Committed on (Date) |
| ------------------- | ------ | --------- | ----------------------------------------- | ------------------------------------------------------------- | ------------------- |
| anitec-landing-page | develop | 71a9c2e | chore: prepare about us media section | Preparacion de la seccion About Us para incluir contenido audiovisual del equipo y del producto. | 14/06/2026 |
| anitec-landing-page | feature/about-videos | c4e8a31 | feat: add about the team video | Integracion del video About the Team mediante iframe de YouTube en la pagina About Us. | 15/06/2026 |
| anitec-landing-page | feature/about-videos | 58f0bd9 | feat: add about the product video | Integracion del video About the Product para explicar propuesta de valor, modelo de negocio y funcionalidades principales. | 16/06/2026 |
| anitec-landing-page | feature/about-videos | e9d27ac | style: adjust responsive video layout | Ajuste responsive de tarjetas, proporciones de iframe y espaciado para la visualizacion de videos en desktop y mobile. | 17/06/2026 |
| anitec-landing-page | develop | 2a6f3e8 | Merge pull request #15 from upc-1asi0730-2610-12206-titan-team-4/feature/about-videos | Integracion de los videos About the Team y About the Product al branch de desarrollo de la landing page. | 18/06/2026 |
| anitec-landing-page | main | 6c91d4b | Merge pull request #16 from upc-1asi0730-2610-12206-titan-team-4/develop | Integracion final del Sprint 3 desde `develop` hacia `main`, publicando la landing page con videos incorporados. | 19/06/2026 |

**Repositorio del Backend:**

https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-backend.git

**Repositorios y despliegues relacionados al Sprint 3:**

- Repositorio del backend: https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-backend.git
- URL pública del backend: https://anitec-backend.onrender.com
- Documentación pública del backend: https://anitec-backend.onrender.com/swagger/index.html
- Repositorio del frontend: https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-frontend
- Despliegue del frontend web: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-frontend
- Repositorio de la landing page: https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-landing-page
- Despliegue de la landing page: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-landing-page/

**Estadísticas del repositorio:**

- Total de bounded contexts implementados: 12
- Base de datos: MySQL
- ORM: Entity Framework Core
- Seguridad: JWT y BCrypt
- Documentación de servicios: Swagger/OpenAPI
- Migraciones generadas: 3
- Endpoints principales: autenticación, usuarios, perfiles, fincas, animales, sanidad, finanzas, actividades, analíticas, clientes, dispositivos, métricas y suscripciones.
- Frontend integrado: consumo de API real mediante `.env.development`, `BaseApi`, stores, APIs y assemblers.
- Rutas frontend agregadas: `/iot` para dispositivos IoT y `/subscriptions` para planes, suscripciones y pagos de prueba.
- Landing page actualizada: videos About the Team y About the Product integrados en About Us.

### 5.2.3.5. Execution Evidence for Sprint Review.

Esta sección resume lo alcanzado en el Sprint 3 y presenta las principales evidencias de ejecución del backend, frontend y landing page. El objetivo fue comprobar que la API pueda compilar, ejecutar, aplicar migraciones, conectarse a MySQL y responder a peticiones HTTP desde Swagger o herramientas de prueba. Además, se verificó que el frontend pueda consumir datos reales del backend y que la landing page muestre los videos incorporados.

**Resumen de lo Alcanzado:**

El Sprint 3 permitió desarrollar el backend real de AniTec e iniciar la integración de la solución completa. El equipo logró configurar la solución ASP.NET Core, conectar la API con MySQL, implementar migraciones, crear datos iniciales, exponer endpoints REST para los módulos principales del sistema, conectar el frontend con la API real y actualizar la landing page con contenido audiovisual.

**URLs públicas revisadas durante el Sprint 3:**

- Landing page: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-landing-page/
- Frontend web: https://anitec-12206.web.app/iam/sign-in
- Backend Swagger: https://anitec-backend.onrender.com/swagger/index.html

**Video/demo de navegación del Sprint 3:**

https://tinyurl.com/sprint3ExecutionEvidence

Como evidencia adicional, el Video About-the-Product también muestra la navegación y funcionamiento general de AniTec.

**Evidencias de ejecución:**

1. **Compilación del backend:** Se ejecutó el comando `dotnet build` para validar que el proyecto compile correctamente.

<div align="center">
    <img src="../../assets/chapter-5/back1.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>


1. **Integración frontend-backend:** Se verificó que `.env.development` apunte al backend local mediante `http://localhost:5191/api/v1` y que los módulos del frontend usen `BaseApi`, stores, APIs y assemblers para consumir los servicios reales.

<div align="center">
    <p><b>Frontend - Consumo del backend real</b></p>
    <img src="../../assets/chapter-5/Dashboard-ganadero.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

3. **Módulo IoT:** Se validó la ruta `/iot`, la visualización de dispositivos IoT, la asociación de dispositivos con hatos o animales y la consulta de métricas generadas por sensores.

<div align="center">
    <p><b>Frontend - dispositivos IoT</b></p>
    <img src="../../assets/chapter-5/dispositivos-iot.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

1. **Módulo Subscriptions:** Se validó la ruta `/subscriptions`, la consulta de planes, la suscripción activa, el historial de pagos y el flujo de pago de prueba mediante el endpoint `/subscriptions/mock-checkout`.

<div align="center">
    <p><b>Frontend - Subscriptions</b></p>
    <img src="../../assets/chapter-5/subscripciones.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

1. **Landing page:** Se validó que la página About Us muestre los videos About the Team y About the Product mediante iframes de YouTube.

<div align="center">
    <p><b>Landing Page - Video About the team</b></p>
    <img src="../../assets/chapter-5/video-about-the-team-landingpage.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <p><b>Landing Page - Video About the Product</b></p>
    <img src="../../assets/chapter-5/video-about-the-product-landingpage.png" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>



**Funcionalidades implementadas en backend:**

1. **IAM:** Inicio de sesión, registro de usuarios, generación de token JWT y consulta de usuarios.
2. **Profiles:** Gestión de perfiles asociados a usuarios.
3. **Livestock:** Gestión de fincas y animales.
4. **Sanitary:** Gestión de eventos sanitarios y registros de salud.
5. **Activities:** Gestión de actividades y eventos de granja.
6. **Financial:** Gestión de ingresos, egresos y registros económicos.
7. **Analytics:** Dashboards y resúmenes para ganaderos y veterinarios.
8. **Clients:** Gestión de relación entre veterinarios y ganaderos.
9. **Devices:** Gestión de dispositivos como balanzas, collares inteligentes, cámaras térmicas, aretes de identificación, estaciones meteorológicas y sensores ambientales.
10. **Metrics:** Gestión de métricas generadas por dispositivos.
11. **Subscriptions:** Gestión de planes, suscripciones, pagos y mock checkout.
12. **Shared:** Repositorios base, Unit of Work, persistencia, recursos comunes y manejo de errores.

**Funcionalidades implementadas en frontend y landing page:**

1. **Consumo del backend real:** Configuración de servicios API mediante `.env.development`, `BaseApi`, stores Pinia y assemblers.
2. **IoT:** Visualización, registro y edición de dispositivos IoT desde la ruta `/iot`, con asociación a hato o animal y lectura de métricas.
3. **Subscriptions:** Consulta de planes, suscripción activa, historial de pagos y pago de prueba desde la ruta `/subscriptions`.
4. **Mock checkout:** Consumo del endpoint `/subscriptions/mock-checkout` para validar el flujo de pagos simulados durante el Sprint.
5. **Landing page:** Presentación de los videos About the Team y About the Product dentro de la página About Us.

### 5.2.3.6. Services Documentation Evidence for Sprint Review.

Para el Sprint 3, el equipo implementó una API REST real para AniTec utilizando ASP.NET Core. Esta API reemplaza progresivamente al servicio mock utilizado durante el Sprint 2 y permite que el frontend consuma información persistida en MySQL.

**Configuración del Servicio Backend:**

- **Plataforma:** ASP.NET Core
- **ORM:** Entity Framework Core
- **Base de datos:** MySQL
- **Autenticación:** JWT Bearer Token
- **Hashing de contraseñas:** BCrypt
- **Documentación:** Swagger/OpenAPI
- **Repositorio:** https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-backend.git
- **URL pública del backend:** https://anitec-backend.onrender.com
- **Documentación pública:** https://anitec-backend.onrender.com/swagger/index.html

**Migraciones implementadas:**

| Migración | Descripción |
| --------- | ----------- |
| `20260605202323_InitialCreate` | Creación inicial de tablas principales del sistema. |
| `20260607213722_AddRolesClientsAndMockPayments` | Agrega roles, clientes veterinarios y pagos mock. |
| `20260607235600_AddDateOnlyConverters` | Ajustes para conversión de fechas con DateOnly. |

**Endpoints principales implementados:**

| Bounded Context | Método | Endpoint | Descripción |
| --------------- | ------ | -------- | ----------- |
| IAM | POST | `/api/v1/auth/tokens` | Inicio de sesión de usuarios registrados y generación de token JWT. |
| IAM | POST | `/api/v1/users` | Registro de nuevos usuarios con contraseña encriptada. |
| IAM | GET | `/api/v1/users` | Consulta de usuarios del sistema. |
| IAM | GET | `/api/v1/users/{id}` | Consulta de un usuario por identificador. |
| Profiles | GET | `/api/v1/profiles` | Consulta de perfiles registrados. |
| Profiles | GET | `/api/v1/profiles/{profileId}` | Consulta de un perfil por identificador. |
| Profiles | POST | `/api/v1/profiles` | Creación de perfiles de usuario. |
| Livestock | GET | `/api/v1/herds` | Consulta de hatos o unidades productivas. |
| Livestock | GET | `/api/v1/herds/{id}` | Consulta de un hato por identificador. |
| Livestock | POST | `/api/v1/herds` | Registro de nuevos hatos. |
| Livestock | PUT | `/api/v1/herds/{id}` | Actualización de información de un hato. |
| Livestock | DELETE | `/api/v1/herds/{id}` | Eliminación de un hato registrado. |
| Livestock | GET | `/api/v1/animals` | Consulta de animales registrados. |
| Livestock | GET | `/api/v1/animals/{id}` | Consulta de un animal por identificador. |
| Livestock | POST | `/api/v1/animals` | Registro de nuevos animales. |
| Livestock | PUT | `/api/v1/animals/{id}` | Actualización de información de un animal. |
| Livestock | DELETE | `/api/v1/animals/{id}` | Eliminación de un animal registrado. |
| Sanitary | GET | `/api/v1/health-events` | Consulta de eventos sanitarios. |
| Sanitary | GET | `/api/v1/health-events/{id}` | Consulta de un evento sanitario por identificador. |
| Sanitary | POST | `/api/v1/health-events` | Registro de vacunas, tratamientos, diagnósticos o incidencias. |
| Sanitary | PUT | `/api/v1/health-events/{id}` | Actualización de un evento sanitario. |
| Sanitary | DELETE | `/api/v1/health-events/{id}` | Eliminación de un evento sanitario. |
| Financial | GET | `/api/v1/financial-records` | Consulta de ingresos y egresos ganaderos. |
| Financial | GET | `/api/v1/financial-records/{id}` | Consulta de un registro financiero por identificador. |
| Financial | POST | `/api/v1/financial-records` | Registro de ingresos o gastos. |
| Financial | PUT | `/api/v1/financial-records/{id}` | Actualización de un registro financiero. |
| Financial | DELETE | `/api/v1/financial-records/{id}` | Eliminación de un registro financiero. |
| Activities | GET | `/api/v1/farm-events` | Consulta de actividades, visitas o tareas de granja. |
| Activities | GET | `/api/v1/farm-events/{id}` | Consulta de una actividad por identificador. |
| Activities | POST | `/api/v1/farm-events` | Registro de nuevas actividades de granja. |
| Activities | PUT | `/api/v1/farm-events/{id}` | Actualización de una actividad. |
| Activities | DELETE | `/api/v1/farm-events/{id}` | Eliminación de una actividad. |
| Analytics | GET | `/api/v1/ranchers/{rancherId}` | Dashboard de métricas principales para ganaderos. |
| Analytics | GET | `/api/v1/veterinarians/{veterinarianId}` | Dashboard de métricas principales para veterinarios. |
| Analytics | GET | `/api/v1/report-metrics` | Consulta de métricas de reportes. |
| Analytics | GET | `/api/v1/report-metrics/{id}` | Consulta de una métrica de reporte por identificador. |
| Analytics | POST | `/api/v1/report-metrics` | Registro de métricas de reportes. |
| Analytics | PUT | `/api/v1/report-metrics/{id}` | Actualización de una métrica de reporte. |
| Analytics | DELETE | `/api/v1/report-metrics/{id}` | Eliminación de una métrica de reporte. |
| Clients | GET | `/api/v1/veterinarians/{veterinarianId}/clients` | Consulta de clientes asignados a un veterinario. |
| Clients | GET | `/api/v1/veterinarians/{veterinarianId}/ranchers?status=available` | Consulta de ganaderos disponibles para asociar. |
| Clients | POST | `/api/v1/veterinarians/{veterinarianId}/clients/{rancherId}` | Asociación de un ganadero a un veterinario. |
| Clients | DELETE | `/api/v1/veterinarians/{veterinarianId}/clients/{rancherId}` | Eliminación de la relación entre veterinario y ganadero. |
| Devices | GET | `/api/v1/devices` | Consulta de dispositivos IoT registrados. |
| Devices | GET | `/api/v1/devices/{id}` | Consulta de un dispositivo por identificador. |
| Devices | POST | `/api/v1/devices` | Registro de nuevos dispositivos IoT. |
| Devices | PUT | `/api/v1/devices/{id}` | Actualización de un dispositivo IoT. |
| Devices | DELETE | `/api/v1/devices/{id}` | Eliminación de un dispositivo IoT. |
| Devices | GET | `/api/v1/devices/{id}/metrics` | Consulta de métricas asociadas a un dispositivo. |
| Devices | GET | `/api/v1/devices/{id}/metrics/latest` | Consulta de la última métrica registrada por un dispositivo. |
| Metrics | GET | `/api/v1/device-metrics` | Consulta de métricas de dispositivos. |
| Metrics | GET | `/api/v1/device-metrics/{id}` | Consulta de una métrica de dispositivo por identificador. |
| Metrics | POST | `/api/v1/device-metrics` | Registro de métricas de dispositivos. |
| Metrics | PUT | `/api/v1/device-metrics/{id}` | Actualización de una métrica de dispositivo. |
| Metrics | DELETE | `/api/v1/device-metrics/{id}` | Eliminación de una métrica de dispositivo. |
| Subscriptions | GET | `/api/v1/subscription-plans` | Consulta de planes de suscripción disponibles. |
| Subscriptions | GET | `/api/v1/subscription-plans/{id}` | Consulta de un plan de suscripción por identificador. |
| Subscriptions | POST | `/api/v1/subscription-plans` | Registro de nuevos planes de suscripción. |
| Subscriptions | PUT | `/api/v1/subscription-plans/{id}` | Actualización de un plan de suscripción. |
| Subscriptions | DELETE | `/api/v1/subscription-plans/{id}` | Eliminación de un plan de suscripción. |
| Subscriptions | GET | `/api/v1/subscriptions` | Consulta de suscripciones registradas. |
| Subscriptions | GET | `/api/v1/subscriptions/{id}` | Consulta de una suscripción por identificador. |
| Subscriptions | POST | `/api/v1/subscriptions` | Registro de nuevas suscripciones. |
| Subscriptions | PUT | `/api/v1/subscriptions/{id}` | Actualización de una suscripción. |
| Subscriptions | DELETE | `/api/v1/subscriptions/{id}` | Eliminación de una suscripción. |
| Subscriptions | GET | `/api/v1/users/{userId}/subscriptions/current` | Consulta de la suscripción activa de un usuario. |
| Subscriptions | GET | `/api/v1/users/{userId}/payments` | Consulta de pagos asociados a un usuario. |
| Subscriptions | POST | `/api/v1/checkouts` | Simulación de pago para pruebas del flujo de suscripción. |

**Ejemplos de interacción con endpoints principales:**

1. **Inicio de sesión de usuario**

- **Método:** POST
- **Endpoint:** `/api/v1/authentication/sign-in`
- **Body:**

```json
{
  "username": "rancher1",
  "password": "anitec123"
}
```

- **Response esperado:**

```json
{
  "id": 1,
  "username": "rancher1",
  "role": "Rancher",
  "token": "jwt-token"
}
```

2. **Consulta de animales registrados**

- **Método:** GET
- **Endpoint:** `/api/v1/animals`
- **Parámetros:** No requiere parámetros obligatorios.
- **Response esperado:**

```json
[
  {
    "id": 1,
    "name": "Luna",
    "species": "Bovino",
    "breed": "Holstein",
    "status": "healthy",
    "herdId": 1
  }
]
```

3. **Registro de evento sanitario**

- **Método:** POST
- **Endpoint:** `/api/v1/health-events`
- **Body:**

```json
{
  "animalId": 1,
  "type": "Vaccination",
  "date": "2026-06-10",
  "description": "Vacuna anual",
  "veterinarianId": 2
}
```

- **Response esperado:**

```json
{
  "id": 12,
  "animalId": 1,
  "type": "Vaccination",
  "status": "registered"
}
```

4. **Consulta de última métrica de dispositivo**

- **Método:** GET
- **Endpoint:** `/api/v1/devices/{id}/latest-metric`
- **Parámetros:** `id`, identificador del dispositivo IoT.
- **Response esperado:**

```json
{
  "deviceId": 1,
  "metricType": "temperature",
  "value": 38.4,
  "unit": "C",
  "recordedAt": "2026-06-18T10:30:00"
}
```

5. **Pago de prueba para suscripción**

- **Método:** POST
- **Endpoint:** `/api/v1/subscriptions/mock-checkout`
- **Body:**

```json
{
  "userId": 1,
  "planId": 2,
  "amount": 19.00
}
```

- **Response esperado:**

```json
{
  "subscriptionId": 3,
  "paymentId": 8,
  "status": "paid",
  "provider": "mock"
}
```

**Swagger/OpenAPI:** Se verificó que la documentación de endpoints esté disponible en el navegador.

<div align="center">
    <img src="../../assets/chapter-5/back1.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/back2.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/back3.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/back4.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/back5.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/back6.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/back7.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

**Estructura de capas aplicada:**

1. **Domain:** Entidades, comandos, consultas y contratos de repositorios.
2. **Application:** Command Services y Query Services para manejar casos de uso.
3. **Infrastructure:** Repositorios, Entity Framework Core, Unit of Work y servicios técnicos.
4. **Interfaces REST:** Controladores, recursos y assemblers para exponer la API.
5. **Shared:** Elementos comunes reutilizables en todos los bounded contexts.

**Variables y configuración:**

La cadena de conexión se configura en `appsettings.Development.json` y apunta a la base de datos MySQL local. También se dejó preparada la posibilidad de usar una variable de entorno para cambiar la conexión según el ambiente.

```json
"DefaultConnection": "server=localhost;user=root;password=password;database=anitec-platform"
```

### 5.2.3.7. Software Deployment Evidence for Sprint Review.

Durante el Sprint 3, la evidencia de despliegue incluyó backend, frontend y landing page. El backend se publicó en Render como Web Service para exponer la API REST, mientras que la landing page y el frontend web se mantuvieron accesibles mediante despliegues públicos. El objetivo de esta evidencia fue comprobar que AniTec pueda presentarse y probarse desde internet, conectando la comunicación pública del producto, la aplicación web y los servicios backend.

Este despliegue permitió validar que los servicios backend desarrollados en ASP.NET Core pueden estar disponibles públicamente para ser consumidos por la aplicación web frontend. De esta manera, el backend deja de depender únicamente de la ejecución local y queda preparado para pruebas de integración en un entorno accesible desde internet.

**URLs públicas del Sprint 3:**

- Landing page: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-landing-page/
- Frontend web: https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-frontend/iam/sign-in
- Backend web: https://anitec-backend.onrender.com
- Documentación Swagger del backend: https://anitec-backend.onrender.com/swagger/index.html

**Configuración de despliegue - Landing Page:**

- **Plataforma:** GitHub Pages
- **Repositorio:** https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-landing-page
- **Branch desplegada:** `main`
- **URL pública:** https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-landing-page/
- **Alcance del Sprint 3:** actualización de la página About Us para incluir los videos About the Team y About the Product mediante iframes de YouTube.

**Configuración de despliegue - Frontend Web Application:**

- **Plataforma:** GitHub Pages
- **Repositorio:** https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-frontend
- **URL pública:** https://upc-1asi0730-2610-12206-titan-team-4.github.io/anitec-frontend/iam/sign-in
- **Alcance del Sprint 3:** integración progresiva con el backend real, actualización de consumo mediante `BaseApi` y `.env.development`, e incorporación de las rutas `/iot` y `/subscriptions`.

**Configuración de despliegue en Render - Backend:**

- **Proyecto:** `anitec-platform-main`
- **Framework:** ASP.NET Core
- **Plataforma de despliegue:** Render
- **Tipo de servicio:** Web Service
- **Repositorio:** `https://github.com/upc-1asi0730-2610-12206-titan-team-4/anitec-backend.git`
- **Branch desplegada:** `main`
- **Proyecto de inicio:** `Anitec.Platform`
- **Base de datos:** MySQL configurada para el ambiente de despliegue
- **URL pública del backend:** https://anitec-backend.onrender.com
- **Documentación pública:** https://anitec-backend.onrender.com/swagger/index.html
- **Archivo de configuración base:** `appsettings.json`
- **Variables de entorno:** cadena de conexión, ambiente de ejecución y configuración de token JWT

**Procedimiento de despliegue en Render:**

1. Crear un nuevo Web Service en Render.
2. Conectar el repositorio de GitHub del backend de AniTec.
3. Seleccionar la rama `main` como fuente del despliegue.
4. Configurar el proyecto ASP.NET Core indicando como proyecto principal `Anitec.Platform`.
5. Definir las variables de entorno necesarias para el ambiente de producción o staging.
6. Configurar la cadena de conexión de MySQL para que el backend pueda acceder a la base de datos remota.
7. Ejecutar el proceso de build del backend desde Render.
8. Iniciar el servicio web y verificar que la API quede disponible mediante la URL pública generada.
9. Abrir la documentación Swagger desde la URL pública del backend.
10. Probar endpoints principales como autenticación, usuarios, animales, hatos, dispositivos y suscripciones.

<div align="center">
    <img src="../../assets/chapter-5/backendDespliegue1.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/backendDespliegue2.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

<div align="center">
    <img src="../../assets/chapter-5/backendDespliegue3.jpeg" width="700">
    <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

**Verificación Post-Despliegue:**

Después de desplegar el backend en Render, se verificaron los siguientes puntos:

- Render compila correctamente el proyecto `Anitec.Platform`.
- El servicio web se inicia correctamente desde la plataforma.
- El backend queda disponible mediante una URL pública.
- Swagger muestra los controladores y endpoints implementados desde internet.
- La conexión con la base de datos MySQL configurada para despliegue se realiza correctamente.
- Entity Framework Core valida y aplica las migraciones necesarias sobre la base de datos.
- La base de datos contiene las tablas y datos semilla necesarios para pruebas.
- El endpoint de autenticación responde correctamente y devuelve un token JWT.
- Los endpoints principales de usuarios, hatos, animales, sanidad, finanzas, actividades, analíticas, dispositivos y suscripciones responden desde Swagger.
- El backend mantiene una estructura modular por bounded contexts, lo que facilita su integración con el frontend.

### 5.2.3.8. Team Collaboration Insights during Sprint.

En esta sección el equipo explica cómo se desarrollaron las actividades de implementación del backend, integración del frontend y actualización de la landing page. También se presentan los analíticos de colaboración y commits realizados durante el Sprint 3.

**Distribución de Trabajo:**

Todos los miembros del equipo participaron en la construcción del backend según las responsabilidades definidas en la matriz LACX. Además, se coordinaron tareas de integración frontend-backend y ajustes en la landing page para que el avance del Sprint no quedara aislado únicamente en servicios. El equipo trabajó manteniendo reuniones de coordinación para revisar la estructura del proyecto, resolver dudas sobre Entity Framework Core, coordinar nombres de endpoints y asegurar que la API mantenga compatibilidad con los módulos ya desarrollados en el frontend.

El trabajo colaborativo se apoyó en GitHub para el control de versiones y en Discord para la comunicación diaria. Las revisiones se enfocaron principalmente en mantener la misma estructura de carpetas en cada bounded context, reutilizar los patrones aprendidos en clase, conectar el frontend con la API real mediante servicios simples y evitar soluciones demasiado avanzadas que se alejen del nivel técnico trabajado durante el curso.

**Métricas de Colaboración:**

<div align="center">
  <p>
    <b>Commits gráficas Backend - Sprint 3</b>
  </p>
  <img src="../../assets/chapter-5/Sprint3GraficosCommits.jpeg" alt="Commits Sprint 3" width="600">
  <p><i><b>Fuente</b>: GitHub Insights del repositorio anitec-backend.</i></p>
</div>

<div align="center">
  <p>
    <b>Commits gráficas Landing page - Sprint 3</b>
  </p>
  <img src="../../assets/chapter-5/commits-landingpage.png" alt="Commits Sprint 3" width="600">
  <p><i><b>Fuente</b>: GitHub Insights del repositorio anitec-backend.</i></p>
</div>


<div align="center">
  <p>
    <b>Commits gráficas Frontend - Sprint 3</b>
  </p>
  <img src="../../assets/chapter-5/commits-frontend.png" alt="Commits Sprint 3" width="600">
  <p><i><b>Fuente</b>: GitHub Insights del repositorio anitec-backend.</i></p>
</div>

**Reflexiones del Equipo:**

- Ayala Fernandez, Jorge Brayan: "El Sprint 3 permitió aplicar lo aprendido en clase sobre backend con ASP.NET Core. La implementación de IAM fue importante porque permitió pasar de usuarios demo a una autenticación con token, más cercana a una aplicación real. Además, la actualización de la landing page con los videos About the Team y About the Product ayudó a presentar mejor el valor de AniTec."

- Huaman Gallardo, Bruno Aldair: "La implementación de los módulos de ganadería y dispositivos ayudó a convertir los datos del frontend en entidades reales dentro de una base de datos. También fue importante llevar los dispositivos IoT al frontend mediante la ruta `/iot`, porque permitió probar el flujo completo desde la interfaz hasta los datos del backend."

- Melgarejo Quiroz, Josep Eliu: "Trabajar con Entity Framework Core y MySQL permitió entender mejor cómo las entidades del dominio se convierten en tablas reales. Las migraciones ayudaron a mantener la base de datos alineada con los cambios del backend. Además, integrar el frontend mediante `.env.development`, `BaseApi`, stores y assemblers permitió reemplazar gradualmente el consumo de datos mock."

- Raymundo Villarroel, Nadhim Abigail: "La implementación de eventos sanitarios y actividades permitió llevar al backend una parte esencial del seguimiento del ganado. El reto principal fue mantener consistencia entre los datos clínicos, los animales registrados y las vistas del frontend que consumen esta información."

- Sanchez Silva, Luciana Celeste: "El módulo de clientes veterinarios permitió representar la relación entre ganaderos y veterinarios dentro del backend. Esto es importante porque el veterinario necesita consultar únicamente la información de sus clientes asignados. La coordinación con el frontend permitió revisar que estas relaciones se puedan visualizar desde las pantallas correspondientes."

**Lecciones Aprendidas:**

El equipo identifica las siguientes lecciones de este Sprint 3:

1. **La estructura por bounded contexts facilita el crecimiento del backend:** Separar los módulos permitió trabajar de forma ordenada y mantener responsabilidades claras.

2. **Entity Framework Core simplifica la persistencia:** Las migraciones permitieron crear y actualizar la base de datos sin escribir manualmente todo el SQL.

3. **La autenticación debe definirse temprano:** IAM es una base importante porque muchos módulos dependen de saber qué usuario está usando la aplicación.

4. **Los datos mock ayudaron a diseñar el backend:** El `db.json` del Sprint 2 sirvió como referencia para definir entidades, recursos y endpoints.

5. **Swagger facilita las pruebas manuales:** La documentación automática permitió probar endpoints sin depender todavía del frontend.

6. **MySQL requiere una configuración cuidadosa:** La cadena de conexión, credenciales y migraciones deben estar correctamente configuradas para evitar errores al ejecutar la API.

7. **Mantener patrones conocidos reduce la complejidad:** Usar Repository, Unit of Work, Command Services y Query Services permitió seguir una estructura parecida al backend trabajado en clase.

8. **La integración frontend-backend debe planificarse desde los endpoints:** Definir nombres de recursos, rutas y respuestas de API facilitó que el frontend pudiera consumir los datos mediante stores y assemblers.

9. **Los módulos IoT y Subscriptions requieren coordinación entre capas:** Para que `/iot` y `/subscriptions` funcionen correctamente, fue necesario alinear endpoints, modelos de datos, rutas del frontend y textos visibles para el usuario.

10. **La landing page también forma parte de la experiencia del producto:** Incorporar los videos About the Team y About the Product ayudó a explicar mejor la solución antes de que el usuario ingrese a la aplicación web.

