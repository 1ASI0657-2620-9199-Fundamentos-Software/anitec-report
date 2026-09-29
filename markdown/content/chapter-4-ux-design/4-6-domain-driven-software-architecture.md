# 4.6. Domain-Driven Software Architecture.

El Domain-Driven Design (DDD) tiene como objetivo central establecer un entendimiento mutuo sobre el dominio del negocio, promoviendo la sinergia entre el equipo técnico y los expertos del área a través de un lenguaje ubicuo. Este marco de trabajo trasciende el vocabulario técnico al integrar patrones estratégicos, metodologías de diseño y diagramas arquitectónicos que garantizan que el software evolucione en total sintonía con las prioridades empresariales. De esta forma, se logra una solución técnica robusta, profundamente ligada al conocimiento del negocio y capaz de resolver problemas complejos de manera eficiente.

Para ilustrar la aplicación práctica de estos conceptos en el proyecto, se detallan a continuación los primeros tres niveles del modelo C4, implementados mediante Structurizr, los cuales brindan una visión clara y estructurada del sistema en desarrollo.

## 4.6.1. Design Level EventStorming

El Design-Level EventStorming de AniTec se presenta desde el paso 4 porque los primeros pasos del proceso, correspondientes a la exploración general del dominio mediante Big Picture EventStorming, fueron desarrollados previamente en la sección de Needfinding. Por ello, esta sección continúa con los pasos orientados al diseño del dominio, la identificación de comandos, políticas, modelos de lectura, sistemas externos, agregados y bounded contexts.

**Paso 4:** Pivotal Events, el equipo busca eventos de negocio significativos que marquen un cambio de fase o una transición importante en el contexto del proceso. Estos se identifican trazando una barra vertical en la superficie de modelado para separar los flujos anteriores y posteriores al evento crucial. Identificar estos hitos es fundamental, ya que funcionan como indicadores clave para definir los límites de los posibles Bounded Contexts dentro del dominio.

<div align="center">
  <p>
    <b>Step 4: Pivotal Events</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso4.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

**Paso 5:** Commands, el enfoque cambia de lo que ya sucedió a lo que desencadena esos eventos, introduciendo los commands (comandos) formulados en modo imperativo. Estos se representan con notas adhesivas de color azul claro y se colocan antes de los eventos que producen; además, si un usuario específico ejecuta la acción, se añade una pequeña nota amarilla para representar al actor o rol del negocio.

<div align="center">
  <p>
    <b>Step 5: Commands</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso5.jpeg" alt="Step5" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

**Paso 6:** Policies, se identifican las automation policies (políticas de automatización), que son escenarios donde un evento de dominio activa automáticamente la ejecución de un comando sin intervención directa de un actor. Estas reglas se representan con notas adhesivas de color púrpura que conectan el evento con el comando resultante, permitiendo especificar criterios de decisión o condiciones lógicas necesarias para que la acción se dispare.

<div align="center">
  <p>
    <b>Step 6: Policies </b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso6.jpeg" alt="Step6" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

**Paso 7:** Read Models, se introducen las vistas de datos o fuentes de información que un actor necesita consultar para tomar la decisión de ejecutar un comando. Estos se representan con notas adhesivas verdes y pueden ser pantallas del sistema, informes o notificaciones que sirven de base para la acción del usuario. En la superficie de modelado, los modelos de lectura se posicionan estratégicamente justo antes de los comandos para ilustrar el flujo de información hacia la toma de decisiones.

<div align="center">
  <p>
    <b>Step 7: Read Models </b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso7.jpeg" alt="Step7" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

**Paso 8:** External Systems, el modelo se aumenta con sistemas externos, definidos como cualquier sistema ajeno al dominio que se está explorando. Estos se representan con notas adhesivas rosas y pueden actuar de dos formas: activando la ejecución de comandos (entrada) o recibiendo notificaciones sobre eventos de dominio (salida). Al finalizar este paso, se debe verificar que todos los comandos del modelo sean ejecutados por actores, activados por políticas o llamados por estos sistemas externos.

<div align="center">
  <p>
    <b>Step 8: External Systems</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso8.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

**Paso 9:** Aggregates, los participantes organizan los conceptos relacionados en Aggregates (Agregados), que actúan como las unidades lógicas que reciben los comandos y producen los eventos resultantes. Estos se representan con notas adhesivas amarillas grandes, posicionándose físicamente en medio del flujo: con los comandos a su izquierda y los eventos a su derecha. Esta etapa es crucial para definir la consistencia y las fronteras de los datos dentro del modelo de dominio.

<div align="center">
  <p>
    <b>Step 9: Aggregates</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso9.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

**Paso 10:** Bounded Contexts, se concluye la sesión de EventStorming buscando grupos de agregados que estén estrechamente relacionados entre sí. Esta relación puede darse porque los agregados representan funcionalidades similares o porque están acoplados mediante políticas de automatización. Estos grupos identificados forman los límites naturales para los Bounded Contexts (contextos delimitados), definiendo así las fronteras lógicas y técnicas de los diferentes módulos del sistema dentro del dominio de negocio.

<div align="center">
  <p>
    <b>Step 10 - bounded context canvas</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso10.1.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

<div align="center">
  <p>
    <b>Step 10 - bounded context canvas </b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso10.2.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

<div align="center">
  <p>
    <b>Step 10 - bounded context canvas</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso10.3.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

<div align="center">
  <p>
    <b>Step 10 - bounded context canvas</b>
  </p>
  <img src="../../assets/chapter-2/EventStormingPaso10.4.jpeg" alt="Step4" width="600">
  <p>
    <i><b>Fuente</b>: Elaboracion Propia</i>
  </p>
</div>

Enlace para acceder al miro https://tinyurl.com/EventSorming

## 4.6.2. Software Architecture Context Diagram.

El Software Architecture Context Level Diagram presenta una vista general del sistema Anitec y sus interacciones con usuarios y sistemas externos. Este diagrama permite identificar los principales actores de la plataforma, así como los servicios externos utilizados para funcionalidades como procesamiento de pagos y envío de correos electrónicos.

<div align="center">
  <p>
    <b>Diagrama de Contexto C4 - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/DiagramaContextoAnitec.png" alt="Diagrama de Contexto C4 - AniTec" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

## 4.6.3. Software Architecture Container Diagrams.

El Software Architecture Container Diagram permite visualizar la descomposición interna del sistema de gestión ganadera en unidades técnicas desplegables. Se presenta una infraestructura donde el Rancher y el Veterinarian interactúan con una Single Page Application (SPA) de Vue.js y Vite, la cual es entregada por una Web Application y complementada por una Landing Page informativa. Esta estructura se explica mediante el flujo de datos hacia una API Application que procesa la lógica del negocio, gestiona módulos como IAM, perfiles, ganadería, sanidad, actividades, finanzas, analíticas, dispositivos y suscripciones, y almacena la información en una base de datos MySQL.

<div align="center">
  <p>
    <b>Diagrama de Contenedores C4 - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/DiagramaContenedoresAnitec.png" alt="Diagrama de Contenedores C4 - AniTec" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

## 4.6.4. Software Architecture Components Diagrams.

Los Software Architecture Component Diagrams presentan la descomposición interna del contenedor API Application de AniTec. Estos diagramas permiten identificar los principales bounded contexts, sus responsabilidades, los controladores REST, servicios de aplicación, repositorios, componentes compartidos y la interacción con la base de datos MySQL.

<br>

El AniTec API Application Component Diagram muestra la vista general de la API y sus bounded contexts principales. En esta vista se observa cómo la aplicación web consume servicios REST organizados en IAM, Profiles, Livestock, Sanitary, Activities, Financial, Analytics, Devices, Subscriptions y Shared. La API fue implementada con ASP.NET Core, Entity Framework Core, patrones de repositorio, Unit of Work y persistencia en MySQL.

<div align="center">
  <p>
    <b>Component Diagram - API Application - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/ApiApplicationComponents.png" alt="AniTec API Application Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El IAM Component Diagram presenta la estructura interna del bounded context encargado de la identidad y acceso de los usuarios. Incluye controladores para autenticación y usuarios, servicios de comandos y consultas, repositorio de usuarios, generación de tokens JWT, hashing de contraseñas y middleware de autorización.

<div align="center">
  <p>
    <b>Component Diagram - IAM - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/IamComponents.png" alt="AniTec IAM Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Profiles Component Diagram describe los componentes responsables de gestionar la información de perfil de los usuarios de AniTec. Este bounded context utiliza controladores REST, servicios de aplicación, repositorios y una fachada ACL para exponer información de perfiles hacia otros contextos cuando es necesario.

<div align="center">
  <p>
    <b>Component Diagram - Profiles - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/ProfilesComponents.png" alt="AniTec Profiles Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Livestock Component Diagram presenta la estructura del bounded context encargado de la gestión ganadera. Incluye componentes para administrar hatos y animales, controladores REST, servicios de comandos y consultas, repositorios específicos y acceso a la persistencia mediante AppDbContext.

<div align="center">
  <p>
    <b>Component Diagram - Livestock - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/LivestockComponents.png" alt="AniTec Livestock Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Sanitary Component Diagram muestra el bounded context responsable de los eventos sanitarios. Sus componentes permiten registrar y consultar vacunas, tratamientos, diagnósticos e incidencias asociadas al ganado, manteniendo una separación entre controladores, servicios de aplicación y repositorio.

<div align="center">
  <p>
    <b>Component Diagram - Sanitary - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/SanitaryComponents.png" alt="AniTec Sanitary Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Activities Component Diagram presenta los componentes encargados de la gestión de actividades de finca. Este bounded context permite crear, consultar, actualizar y eliminar actividades operativas mediante controladores REST, servicios de comandos, servicios de consultas y repositorio.

<div align="center">
  <p>
    <b>Component Diagram - Activities - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/ActivitiesComponents.png" alt="AniTec Activities Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Financial Component Diagram muestra la estructura del bounded context encargado de los registros financieros. Incluye el controlador de registros financieros, servicios de comandos y consultas, repositorio y persistencia en MySQL para registrar ingresos y egresos asociados a la operación ganadera.

<div align="center">
  <p>
    <b>Component Diagram - Financial - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/FinancialComponents.png" alt="AniTec Financial Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Analytics Component Diagram presenta los componentes responsables de reportes, métricas y dashboards. Este bounded context consulta información de otros módulos, como ganadería, sanidad y finanzas, para construir resúmenes útiles para ganaderos y veterinarios.

<div align="center">
  <p>
    <b>Component Diagram - Analytics - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/AnalyticsComponents.png" alt="AniTec Analytics Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Devices Component Diagram describe la estructura del bounded context orientado a dispositivos IoT. Incluye componentes para gestionar dispositivos, métricas capturadas, servicios de aplicación y repositorios que permiten asociar información tecnológica con animales o hatos.

<div align="center">
  <p>
    <b>Component Diagram - Devices - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/DevicesComponents.png" alt="AniTec Devices Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Subscriptions Component Diagram muestra los componentes relacionados con planes, suscripciones y pagos de prueba. Este bounded context permite consultar planes, gestionar suscripciones activas y registrar pagos simulados para la validación del flujo de la aplicación.

<div align="center">
  <p>
    <b>Component Diagram - Subscriptions - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/SubscriptionsComponents.png" alt="AniTec Subscriptions Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

El Shared Component Diagram presenta los componentes transversales utilizados por la API. Incluye AppDbContext, Unit of Work, BaseRepository, middleware de autorización, manejo global de excepciones y ProblemDetailsFactory, los cuales ayudan a mantener una estructura común entre los bounded contexts.

<div align="center">
  <p>
    <b>Component Diagram - Shared - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/SharedComponents.png" alt="AniTec Shared Component Diagram" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>
