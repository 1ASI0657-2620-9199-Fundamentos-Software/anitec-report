# Guion de explicación: Capítulo V (AniTec, equipo Titan)

Guion para las 8 diapositivas del capítulo V (imágenes `cap5-slide-01` a `cap5-slide-08`). Duración total estimada: **11 a 13 minutos** (unos 90 segundos por diapositiva; las 6 y 7 pueden tomar un poco más porque son las de evidencia).

Cómo usarlo: cada diapositiva tiene **qué señalar** (para guiar la mirada del público), **qué decir** (texto en voz natural, no para leerlo literal) y **si preguntan** (respuestas honestas a las dudas más probables del profesor). Las cifras salen del informe (secciones 5.1, 5.2 y 5.3.1), así que si cambia el informe, cambia el guion.

---

## Diapositiva 1. Suite de pruebas del backend (5.1.1)

**Duración:** 1 min 30 s

**Qué señalar:** las tres cifras de arriba (48, 32, 16), la salida real de `dotnet test` y el cuadro "Alcance y límites".

**Qué decir:**

"Empezamos el capítulo V con la suite de pruebas del backend. Creamos el proyecto `Anitec.Platform.Tests` y hoy tiene **48 pruebas, y las 48 pasan**. De ellas, 32 son pruebas unitarias con xUnit y 16 son escenarios BDD escritos en Gherkin con Reqnroll.

¿Qué probamos? El **núcleo compartido** (el `Result`, el repositorio, el Unit of Work y el interceptor de auditoría) con 11 pruebas; el **servicio de animales** de Livestock, sobre todo el registro por lote y los cambios de estado, con 12; el **servicio de Iam**, o sea inicio de sesión y registro, con 9; y los 16 escenarios Gherkin, ocho de autenticación y ocho de registro por lote.

Aquí a la derecha tienen la evidencia real: la captura de la ejecución de `dotnet test` en VS Code, con total 48 y cero errores, y debajo el reporte HTML de Reqnroll con el 100 % de los 16 escenarios superados.

Y quiero ser claro con los **límites**, porque están en la diapositiva: probamos 3 de los 12 bounded contexts; las pruebas son a nivel de servicio, con repositorios en memoria, no a nivel HTTP; y la cobertura de código todavía no la medimos. Eso lo dejamos como recomendación."

**Si preguntan:**

- *¿Por qué solo 3 de 12 contextos?* "Escribimos pruebas sobre el código existente, priorizando lo que sostiene el Sprint 1: autenticación, el núcleo compartido y el registro de animales. Los otros nueve contextos quedan para los siguientes sprints."
- *¿Por qué repositorios en memoria?* "Para que las pruebas sean rápidas y no dependan de la base de datos desplegada. Las pruebas de integración contra MySQL son una recomendación a mediano plazo."

---

## Diapositiva 2. BDD con Gherkin: autenticación (US-053)

**Duración:** 1 min 30 s

**Qué señalar:** el bloque de código de `Authentication.feature`, la cadena "Cómo se ejecuta" abajo a la izquierda y las dos capturas del reporte HTML a la derecha.

**Qué decir:**

"Para BDD elegimos la historia **US-053, Iniciar sesión**, porque es la que usamos como verificación del sistema desplegado. El archivo `Authentication.feature` está escrito en inglés, con la fórmula *As a, I want, So that* y el id de la historia, tal como lo definimos en la guía de estilo.

Tiene **8 escenarios**: inicio de sesión válido que devuelve un token; contraseña incorrecta sin token; usuario inexistente con el mismo error, para no revelar si el usuario existe; usuario duplicado rechazado con un 409; un registro seguido de un inicio de sesión; y un *Scenario Outline* que prueba los roles válidos y el inválido, en tres filas.

¿Cómo se ejecuta? Abajo: el archivo `.feature` se enlaza con **pasos en C#** de Reqnroll, y esos pasos llaman al **`UserCommandService` real**, el código de producción, que devuelve un `Result` de éxito o de error. Lo **real** es el servicio y el hash con BCrypt; lo **simulado** es el repositorio y el generador de token.

A la derecha, el reporte HTML que genera Reqnroll: el escenario exitoso y el de contraseña incorrecta, con el tiempo de cada paso, y el *Outline* de roles, donde `Admin` falla con `InvalidRole` porque no es un rol soportado. Todo en verde."

**Si preguntan:**

- *¿Por qué solo autenticación y registro por lote?* "Son las dos funcionalidades con más reglas de negocio verificables hoy. Los Gherkin son la base y se amplían con cada sprint."
- *¿Se prueba la API real?* "No a nivel HTTP; se prueba el servicio de aplicación. La prueba contra la API desplegada la hicimos a mano con Swagger y Postman, que es la diapositiva 7."

---

## Diapositiva 3. Patrones, biblioteca interna y refactorización (5.1.2 a 5.1.4)

**Duración:** 1 min 45 s

**Qué señalar:** la lista de patrones de la izquierda, el código del centro con las marcas rojas R1 y R2, y la tabla R1 a R8 de la derecha.

**Qué decir:**

"Esta diapositiva resume la revisión del backend en tres partes.

Primero, los **patrones que el backend ya usa**: DDD con 12 bounded contexts, arquitectura en cuatro capas, CQRS ligero, Repository con Unit of Work, el patrón *Result* para no lanzar excepciones de negocio, Assemblers para los DTO, un interceptor de auditoría y un middleware de errores global. En el centro se ve el servicio de animales y cómo aparecen varios patrones en un mismo método: el repositorio, el Unit of Work, el comando y el `Result`.

Segundo, la **biblioteca interna, `Shared`**: `Result`, `BaseRepository`, `UnitOfWork`, el interceptor, el middleware y el `AppDbContext`. La usan los 12 contextos y vive en el mismo ensamblado de la API; **no se publica como paquete**. Once de las 48 pruebas la cubren directamente.

Tercero, el **reporte de refactorización**: al revisar el código encontramos **8 hallazgos, R1 a R8**. Les marqué dos en el código: R1, que usa un error de dominio equivocado cuando la cantidad del lote es inválida, y R2, que carga todos los animales para contar los de un corral. El de mayor riesgo es **R6**: las imágenes subidas se guardan en el disco del contenedor, y en el plan gratuito de Render ese disco es efímero, así que se pierden al reiniciar. Es el primero que ejecutaríamos.

Y lo digo directamente: **identificamos 8, aplicamos 0**. Esta sección es el diagnóstico, y la ejecución es trabajo de los siguientes sprints."

**Si preguntan:**

- *¿Por qué no los corrigieron?* "Corregirlos cambiaría código que ya está desplegado y probado. Preferimos documentarlos con su riesgo y priorizarlos; R1 a R4 no cambian los contratos REST, por eso son los de menor costo."
- *¿Por qué `Shared` no es un paquete NuGet?* "Es un monolito modular: todos los contextos comparten ensamblado. Publicarlo como paquete tendría sentido cuando extraigamos servicios, que es la iteración 3 del diseño."

---

## Diapositiva 4. Gestión de configuración (5.2.1 a 5.2.3)

**Duración:** 1 min 30 s

**Qué señalar:** el cuadro de herramientas, los 4 repositorios, el diagrama de GitFlow, el historial real de commits y el aviso rojo "Estado real".

**Qué decir:**

"Aquí describimos cómo trabajamos. A la izquierda, el **entorno de desarrollo** por categoría: Trello para la gestión; Gherkin y Miro para requisitos; Figma, Structurizr y PlantUML para el diseño; Git, VS Code, Rider, .NET 10, Node 22, Vue 3 y MySQL para desarrollar; xUnit, NSubstitute, Reqnroll y Swagger para pruebas; y GitHub Pages, Render y Aiven para el despliegue.

El código está en **cuatro repositorios** dentro de la organización del curso: el informe, la landing, el frontend y el backend.

Al centro, el **flujo GitFlow** que definimos, con ramas `main`, `develop`, `feature`, `release` y `hotfix`; el **versionado semántico** (MAJOR, MINOR, PATCH) y **Conventional Commits**. Abajo hay commits reales: un `feat` para el cambio de miembros del equipo, un `fix` para los enlaces de la landing, un `chore` que disparó el despliegue y un `docs` del informe. En gris están los tipos que todavía no hemos usado.

A la derecha, la **guía de estilo** por lenguaje: C#, la API REST, JavaScript con Vue, HTML y CSS, y Gherkin. Con una regla general: código, ramas y commits en inglés.

Y el aviso en rojo, que es importante: **hoy solo existe la rama `main`**. GitFlow está definido, pero `develop` y las ramas `feature` empiezan en el Sprint 2."

**Si preguntan:**

- *¿Por qué solo existe `main`?* "En el Sprint 1 el trabajo fue incorporar, verificar y desplegar un sistema existente, y lo hicimos directamente sobre `main`. Reconocemos que eso no evidencia bien el trabajo individual; está como primera recomendación de corto plazo."
- *El statement cita la guía de TypeScript de Google.* "AniTec usa JavaScript, no TypeScript (el frontend tiene `jsconfig.json`), así que adoptamos la guía de JavaScript equivalente."

---

## Diapositiva 5. Sprint 1: backlog y Kanban (5.3.1.1 y 5.3.1.8)

**Duración:** 1 min 15 s

**Qué señalar:** las cuatro cifras de arriba, la tabla de User Stories y el tablero de Trello con el contador 0, 0, 0, 18.

**Qué decir:**

"El **objetivo del Sprint 1** fue poner AniTec en línea y verificar el inicio de sesión de punta a punta.

El Sprint cubrió **10 User Stories y 32 Story Points**: la landing (de US-044 a US-052, que incluye navegación, beneficios, páginas para ganaderos y veterinarios, página Nosotros, cambio de idioma y diseño móvil) y la historia **US-053, Iniciar sesión**. Están en el orden del Product Backlog, por valor de negocio.

Las historias se bajaron a **18 tareas con 50 horas estimadas**, repartidas entre los tres integrantes.

A la derecha, el **tablero real de Trello**: en la lista *Goal* el objetivo del Sprint, y abajo el estado final: **0 en To-do, 0 en In-Process, 0 en To-Review y 18 en Done**. La revisión del objetivo fue positiva: tres productos en línea, inicio de sesión verificado y las 10 historias en Done."

**Si preguntan:**

- *¿Por qué el Sprint 1 es la landing y el despliegue y no funcionalidades nuevas?* "El producto ya existía como monolito; la prioridad del primer sprint fue que los tres productos estuvieran accesibles en internet y verificados. Las funcionalidades nuevas del diseño ADD entran en los siguientes sprints."
- *¿Quién hizo cada tarea?* "La asignación está en la tabla de control del informe y reparte las horas equitativamente. El historial de GitHub sale de una sola cuenta, y eso lo reconocemos en las conclusiones."

---

## Diapositiva 6. Despliegue en producción (5.2.4 y 5.3.1.6)

**Duración:** 2 min

**Qué señalar:** el diagrama de despliegue, las cuatro tarjetas numeradas 1 a 4 de abajo y la tabla de "4 problemas reales".

**Qué decir:**

"Esta es la diapositiva más práctica. Arriba a la izquierda, el **diagrama de despliegue** de la vista física: la landing en GitHub Pages; la aplicación web como sitio estático en Render, que llama a la API; la API en un contenedor Docker en Render; y la base de datos MySQL en Aiven. Los tres productos se publican desde la rama `main` de su repositorio.

Abajo, **en el orden en que lo hicimos**, con evidencia real:

**Uno, la base de datos en Aiven**: un MySQL 8.4 en estado *Running*, con SSL obligatorio. Las tablas no se crean a mano: el backend aplica sus migraciones al arrancar.

**Dos, el backend en Render**, como Web Service con Docker: despliegue exitoso en 1 minuto 20 segundos, con el commit `0c7acdc`.

**Tres, el frontend en Render**, como Static Site, en 22 segundos, con el commit `0c0ec74`.

**Cuatro, la landing en GitHub Pages**: el flujo *pages build and deployment* terminó en 56 segundos.

A la derecha están los **cuatro problemas reales** que tuvimos. La landing daba 404 aunque Pages estaba activo, porque Pages no construye hasta un push posterior; lo resolvimos con un commit vacío. El inicio de sesión de demostración fallaba porque el *seeder* solo corre en modo Development y la base desplegada quedó sin usuarios; lo ejecutamos una vez contra Aiven. El frontend podía apuntar al backend anterior por un `.env.production` heredado; definimos las variables en Render, que tienen prioridad. Y los nombres de servicio estaban tomados, así que Render agregó un sufijo.

Debajo del diagrama dejé los **límites del plan gratuito**: Render se suspende a los 15 minutos sin tráfico, el disco es efímero y Aiven es de un solo nodo con 1 GB."

**Si preguntan:**

- *¿Por qué esas plataformas?* "Por tener plan gratuito y despliegue automático desde GitHub: Render y GitHub Pages redespliegan en cada push a `main`; Aiven ofrece MySQL administrado gratuito."
- *¿Qué pasa con la primera petición después de la inactividad?* "El servicio gratuito de Render se duerme y la primera petición tarda cerca de un minuto. Lo documentamos como limitación y en las recomendaciones de largo plazo evaluamos un plan sin suspensión."
- *¿Hay integración continua?* "Todavía no; Render y GitHub Pages despliegan solos, pero falta un flujo de GitHub Actions que corra `dotnet test` antes de aceptar cambios. Está en las recomendaciones."

---

## Diapositiva 7. Ejecución de punta a punta (5.3.1.4)

**Duración:** 2 min

**Qué señalar:** la fila de arriba (1, 2, 3, con las flechas), la fila de abajo (A, B, C) y la franja verde final.

**Qué decir:**

"Para cerrar el Sprint verificamos el sistema desplegado como lo haría un usuario.

**Arriba, el recorrido.** Uno: el usuario entra por la **landing** en GitHub Pages, y sus botones llevan a la aplicación. Dos: llega a la pantalla de **inicio de sesión** de la aplicación web en Render. Tres: entra al **panel del ganadero**, con Carlos Mendoza y sus cinco animales. Esos datos **vienen de la base de datos en Aiven**, no de datos de prueba locales: se demuestra la cadena completa landing, aplicación, API y base de datos.

**Abajo, la API protegida.** Probamos el mismo endpoint, `GET /api/v1/animals`, de tres maneras:

**A, sin token**: la API responde **401**, *Missing or invalid token*. Está protegida.

**B, inicio de sesión** con Postman: `POST /api/v1/authentication/sign-in` responde **200** con los datos del usuario y su **JWT**; un pequeño script de Postman guarda el token en una variable.

**C, con token**: la misma consulta, con el token en el encabezado *Bearer*, responde **200** y devuelve la lista de animales desde la base desplegada.

Y la franja final lo resume: sin token 401, con token 200, el JWT vale 7 días, y el resultado es el mismo en Swagger y en Postman."

**Si preguntan:**

- *¿Por qué Postman y Swagger?* "Swagger documenta y permite probar los endpoints directamente en el despliegue; Postman permite guardar el flujo y reutilizar el token. Ambos dieron el mismo resultado."
- *Veo contenido de marketing en la landing.* "Tienes razón en preguntarlo: la landing heredó del trabajo anterior cifras y testimonios que **no hemos podido verificar**. Lo registramos como lección del Sprint y como recomendación: usar casos ilustrativos y evitar cifras comerciales sin respaldo."
  *(Antes de exponer, conviene corregirlo en la landing: es la tarea T-07.)*

---

## Diapositiva 8. Conclusiones y recomendaciones

**Duración:** 1 min 45 s

**Qué señalar:** las tres cifras en rojo, las etiquetas de estado de la izquierda y los tres cuadros de recomendaciones.

**Qué decir:**

"Cerramos con las conclusiones de los capítulos I a V. En la izquierda están las **siete conclusiones**, cada una marcada por su estado real.

Lo **verificado**: los **requisitos son trazables de punta a punta** (16 Epics, 88 User Stories, 32 Technical Stories, vinculados a 4 Business Goals), y el **sistema está desplegado y verificado** en el Sprint 1.

Lo que está **solo en diseño**: la **arquitectura con ADD** sobre el código real, con 12 contextos, siete escenarios de calidad y siete iteraciones; **las iteraciones 2 a 7 son diseño completo, no implementación**.

Lo **sin validar**: el problema y la diferenciación se apoyan en entrevistas **mock**, que confirman la coherencia pero no validan el mercado.

Y lo **pendiente**: las **48 pruebas** superadas cubren una parte limitada, con 8 hallazgos de refactorización sin aplicar; y la **colaboración**, que está planificada pero cuyo historial sale de una sola cuenta y una sola rama.

Arriba a la derecha, tres cifras honestas: **0 de 5 hipótesis** validadas con usuarios, **0 de 4 Business Goals** medidos, y **6 de 7 iteraciones** ADD solo en diseño.

Las **14 recomendaciones** están por horizonte. A **corto plazo**, siete: trabajar con `develop` y ramas por funcionalidad, agregar integración continua, mover las imágenes a almacenamiento externo, aplicar los refactors más baratos, cerrar la deuda de seguridad y ampliar las pruebas. A **mediano plazo**, tres: validar con usuarios reales, construir la app Android *offline-first* e implementar las iteraciones 3 y 5. Y a **largo plazo**, cuatro: dispositivos IoT, observabilidad, una segunda ola de servicios con mejor hosting, y el canal institucional con asociaciones ganaderas.

En resumen: **definimos, diseñamos y desplegamos una base verificable**, y el trabajo principal que sigue es contrastar las hipótesis con usuarios reales. Muchas gracias."

**Si preguntan:**

- *¿Qué es lo primero que harían?* "Tres cosas: evidenciar la colaboración con `develop` y ramas por integrante; mover las imágenes fuera del disco efímero (R6), que es el riesgo más alto; y agregar integración continua con las pruebas."
- *¿Qué diferencia hay entre lo diseñado y lo implementado?* "Lo implementado es el monolito desplegado. Las iteraciones 2 a 7 (seguridad por recurso, gateway, sincronización offline, alertas, IoT, observabilidad) están completamente diseñadas con ADD, pero ninguna está implementada."

---

## Notas generales

- **Reparto sugerido** (ajústalo a lo que cada uno domina): Baldeon, diapositivas 1 a 3 (pruebas y refactorización); Melgarejo, 4 y 6 (configuración y despliegue); Castro, 5, 7 y 8 (Sprint, ejecución y cierre).
- **Frases puente** entre diapositivas: 1 → 2 "ahora veamos una de esas pruebas por dentro"; 2 → 3 "con las pruebas hechas, revisamos el código que probamos"; 3 → 4 "veamos cómo trabajamos"; 4 → 5 "con ese entorno ejecutamos el Sprint 1"; 5 → 6 "¿cómo llegamos a tenerlo en línea?"; 6 → 7 "ya desplegado, lo verificamos como usuario"; 7 → 8 "con todo esto, las conclusiones".
- **Si falta tiempo:** resume las diapositivas 3 y 4 en una frase cada una (patrones: "8 patrones, 8 hallazgos, 0 aplicados"; configuración: "4 repositorios, GitFlow definido, solo `main` hoy").
- **Respuesta estándar** si preguntan por algo que no existe todavía: "está diseñado y documentado, pero no implementado; lo dejamos como prioridad del siguiente sprint".
- **Antes de exponer:** corrige la landing (cifras "+500" y testimonios, tarea T-07) o prepárate para explicarlo, y confirma que la contraseña de la base de Aiven fue rotada.
