# 4.2. Architectural Drivers

Los *drivers* arquitectónicos son las entradas que justifican cada iteración ADD en la sección 4.3: no toda funcionalidad ni todo requisito califica como driver, sino aquellos que afectan la **estructura** del sistema. Esta sección identifica el propósito del diseño, selecciona del catálogo de 88 User Stories (sección 3.2) las que son arquitectónicamente significativas, define escenarios de atributos de calidad medibles, documenta las restricciones reales del proyecto y deja constancia explícita de las preocupaciones/riesgos abiertos.

## 4.2.1. Design Purpose

El propósito del proceso de diseño de AniTec es asegurar que el sistema pueda evolucionar desde su línea base actual — un monolito modular con 12 bounded contexts sobre una única base de datos MySQL (sección 4.1) — hacia las capacidades que el Product Backlog ya compromete (sincronización móvil sin conexión, extracción de servicios críticos, seguridad reforzada) **sin requerir una reescritura**. Cada decisión de diseño tomada en las iteraciones ADD debe:

1. Trazarse a un driver concreto de esta sección (una Quality Attribute Scenario, una restricción o una preocupación), nunca a una preferencia tecnológica no justificada.
2. Mantenerse coherente con las vistas C4/UML y el modelo de datos ya documentados en la sección 4.1 — si una iteración cambia una vista, esa vista se actualiza en el mismo paso (4.3.X.6), no se deja desincronizada.
3. Distinguir explícitamente entre diseño **as-built** (lo que ya corre en producción/desarrollo) y diseño **to-be** (lo que el backlog pide pero aún no tiene código, como la app móvil) — ambos son válidos como objeto de una iteración ADD, pero deben etiquetarse como tal.

## 4.2.2. Primary Functionality (Primary User Stories)

Subconjunto curado del catálogo completo (88 User Stories / 32 Technical Enablers, sección 3.2): no se listan las 88 historias, solo las que efectivamente presionan sobre la estructura del sistema (nuevas relaciones de datos, nuevos atributos de calidad, nuevas dependencias externas).

**User Stories con impacto estructural**

| ID | Título | Por qué es un driver arquitectónico |
|---|---|---|
| US-010 | Registrar animal indicando finca y corral | Introduce una relación obligatoria nueva (`Animal` → `Corral` → `Herd`) que toda la cadena de validación y persistencia debe soportar. |
| US-080 | Registrar corral | Agrega un agregado nuevo (`Corral`) al bounded context Livestock — afecta el modelo de datos y el diagrama de componentes. |
| US-082 | Registrar varios animales en un mismo corral | Requiere una transacción que crea hasta 500 filas en una sola operación — driver de rendimiento/agrupación de operaciones. |
| US-083 | Aplicar acciones masivas sobre animales seleccionados | Mismo driver de rendimiento aplicado a actualización/eliminación en lote. |
| US-086 | Adjuntar fotografía al registrar un animal o un lote | Introduce el primer flujo de carga de archivos binarios del sistema — nuevo tipo de artefacto (almacenamiento de archivos) no cubierto por el patrón CRUD/JSON existente. |
| US-016 | Registrar diagnóstico y tratamiento como veterinario | Ancla BG-03 (Continuidad clínica); exige que el registro sanitario quede disponible para consulta casi inmediata por otro actor (el propio ganadero). |
| US-018 | Rectificar o anular un registro sanitario | Requiere versionado/no-destrucción de historial clínico — driver de integridad de datos. |
| US-019 | Consultar historial clínico por animal | Consulta cruzada entre bounded contexts (Sanitary lee sobre `Animal` de Livestock) — valida el patrón de referencia por ID entre contextos. |
| US-053 / US-055 | Iniciar sesión / Restringir rutas según rol | Ancla el driver de seguridad (autenticación + autorización) que atraviesa todos los bounded contexts. |
| US-071 / US-072 / US-074 | Revisar, revocar y auditar accesos de veterinarios | Introduce control de acceso de grano fino (por recurso, no solo por rol) y trazabilidad de auditoría — drivers de seguridad y de gobierno de datos. |
| US-065 – US-069 | Acceder desde Android; guardar sin conexión; estado, reintento y conflictos de sincronización | Ancla BG-04 (Confianza en campo); es la funcionalidad **to-be** más exigente estructuralmente: requiere un cliente offline-first y un protocolo de sincronización que hoy no existe. |
| US-032 | Registrar movimiento financiero | Bounded context Financial, sin dependencias externas — driver de línea base (contraste con Subscriptions). |
| US-062 | Realizar pago simulado de suscripción | Depende de un sistema externo real (Stripe) — driver de integración de terceros. |
| US-035 / US-064 | Visualizar analíticas del ganadero / Consumir dashboards desde el backend | Requiere agregación de datos de múltiples bounded contexts (Livestock, Sanitary, Financial) en un solo resultado — driver de acoplamiento de lectura entre contextos. |

**Technical Enablers con impacto estructural**

| ID | Título | Por qué es un driver arquitectónico |
|---|---|---|
| TS-005 / TS-006 | Configuración base de microservicios con ASP.NET Core / Persistencia delimitada por servicio | Documentan la intención original de aislar cada bounded context — hoy solo se cumple a nivel de código (carpetas), no de despliegue ni de base de datos (sección 4.1.5 confirma una única base de datos compartida). |
| TS-008 | Extracción incremental de bounded contexts | Driver directo de la Iteración 3 (sección 4.3.3): el propio backlog ya pide evolucionar el monolito hacia servicios extraídos. |
| TS-025 | API Gateway y contratos versionados | Hoy no existe ningún gateway — driver de la Iteración 3. |
| TS-007 | Autenticación backend con JWT y BCrypt | Ya implementado; línea base de seguridad para la Iteración 2. |
| TS-028 | Autorización de mínimo privilegio y auditoría | Aún no implementado a nivel de recurso (hoy es autorización por rol únicamente) — driver de la Iteración 2. |
| TS-016 / TS-017 | Integración backend/frontend con Stripe | Único sistema externo real integrado — constraint y driver de la línea base (4.2.4). |
| TS-023 / TS-024 | Base de la aplicación Android / Persistencia local y cola transaccional móvil | Cero líneas de código a la fecha (confirmado en la sección 4.1) — driver **to-be** central de la Iteración 4. |
| TS-026 / TS-027 | Procesamiento idempotente de sincronización / Eventos asíncronos para integración | Hoy no existe ningún mecanismo de idempotencia ni de eventos — drivers de la Iteración 4. |
| TS-029 / TS-030 | Observabilidad distribuida / Pruebas de contratos, seguridad y sincronización | Sin implementar; drivers de la Iteración 7 (capstone de confiabilidad operativa). |
| TS-032 | Endpoint de carga de imágenes para animales | Ya implementado este ciclo; primer precedente de manejo de archivos binarios en la API. |

## 4.2.3. Quality Attribute Scenarios

Cada escenario sigue las seis partes exigidas: fuente del estímulo, estímulo, ambiente, artefacto, respuesta y medida de respuesta. Los primeros cuatro se derivan directamente de los Business Goals del Impact Map (sección 3.3); los últimos cuatro documentan atributos de calidad evidenciados durante este ciclo de desarrollo.

**QAS-01 — Disponibilidad en campo sin conexión** *(deriva de BG-04, to-be)*
- **Fuente:** un ganadero en el campo, usando la aplicación móvil.
- **Estímulo:** registra un evento (animal, sanitario) sin señal de datos.
- **Ambiente:** operación normal, conectividad intermitente.
- **Artefacto:** la cola de sincronización local del cliente móvil.
- **Respuesta:** el sistema acepta y persiste la operación localmente sin bloquear al usuario.
- **Medida:** 100 % de las operaciones aceptadas localmente se conservan; al menos 95 % se sincronizan con el servidor dentro de los 5 minutos posteriores a recuperar una conexión estable.

**QAS-02 — Continuidad clínica entre actores** *(deriva de BG-03)*
- **Fuente:** un veterinario.
- **Estímulo:** registra diagnóstico y tratamiento tras una visita.
- **Ambiente:** operación normal, con conexión.
- **Artefacto:** el registro sanitario (`health_events`) y su relación con `animals`.
- **Respuesta:** el registro queda disponible para que el ganadero propietario lo consulte.
- **Medida:** al menos 80 % de las visitas registradas tiene una atención documentada visible al propietario dentro de las 12 horas posteriores.

**QAS-03 — Seguimiento sanitario oportuno** *(deriva de BG-02)*
- **Fuente:** el sistema (temporizador/regla de negocio), no un actor humano.
- **Estímulo:** una alerta sanitaria alcanza su fecha de vencimiento sin confirmación.
- **Ambiente:** operación normal.
- **Artefacto:** el calendario de actividades/alertas.
- **Respuesta:** la alerta permanece visible y priorizada hasta ser confirmada, pospuesta o cerrada explícitamente.
- **Medida:** reducción del 30 % en la proporción de alertas que vence sin atención, respecto de la línea base del piloto.

**QAS-04 — Modificabilidad ante un nuevo concepto de dominio** *(evidenciado este ciclo, as-built)*
- **Fuente:** el equipo de desarrollo.
- **Estímulo:** se requiere introducir el concepto `Corral` como sub-unidad de `Herd`, sin romper el registro de animales ya existente.
- **Ambiente:** desarrollo, con datos de producción/pruebas ya existentes.
- **Artefacto:** el bounded context Livestock (entidades, migraciones, endpoints, frontend).
- **Respuesta:** `Corral` se agrega como agregado nuevo con relación opcional inicial y luego obligatoria hacia `Animal`, sin requerir cambios en Sanitary, Financial, Devices ni ningún otro contexto.
- **Medida:** el cambio se implementó y desplegó (una migración EF Core aditiva) sin modificar ningún otro bounded context — validado directamente este ciclo.

**QAS-05 — Usabilidad ante errores de validación** *(evidenciado este ciclo, as-built)*
- **Fuente:** un ganadero.
- **Estímulo:** intenta registrar un animal o un lote con campos inválidos o incompletos.
- **Ambiente:** operación normal.
- **Artefacto:** el endpoint de registro (`POST /animals`, `POST /animals/bulk`) y el formulario del frontend.
- **Respuesta:** el sistema rechaza la operación y devuelve la lista específica de campos inválidos, no un mensaje genérico.
- **Medida:** el usuario identifica y corrige el campo inválido en un solo reintento (mecanismo verificado en vivo este ciclo, corrigiendo un defecto previo donde solo se mostraba un mensaje genérico).

**QAS-06 — Seguridad ante acceso no autorizado**
- **Fuente:** un usuario autenticado con rol Veterinario.
- **Estímulo:** intenta acceder a una ruta o recurso exclusivo del rol Ganadero (o de un ganadero que no es su cliente).
- **Ambiente:** operación normal.
- **Artefacto:** el middleware de autorización (`[Authorize]`) y las rutas protegidas del frontend.
- **Respuesta:** el sistema bloquea la operación y redirige al panel correspondiente a su propio rol.
- **Medida:** 0 accesos no autorizados exitosos — validado por los atributos `[Authorize]` presentes en cada controlador (sección 4.1.7).

**QAS-07 — Rendimiento del registro por lote**
- **Fuente:** un ganadero.
- **Estímulo:** registra un lote de 500 animales (el máximo permitido) en un corral.
- **Ambiente:** operación normal, carga típica de un solo usuario.
- **Artefacto:** el endpoint `POST /animals/bulk` y la transacción de base de datos subyacente.
- **Respuesta:** el sistema crea las 500 filas en una sola transacción (`UnitOfWork.CompleteAsync()`), no en 500 round-trips.
- **Medida:** una sola transacción de base de datos por operación de lote, independiente de la cantidad (1 a 500).

## 4.2.4. Constraints

| Categoría | Restricción real |
|---|---|
| Topología de red | El SPA (GitHub Pages) y la API (Render) están en dominios distintos → toda comunicación depende de CORS habilitado explícitamente; hoy configurado como `AllowAllPolicy` (permisivo — ver 4.2.5). |
| Base de datos | Una única instancia MySQL compartida por los 12 bounded contexts, sin *sharding* ni bases de datos separadas por contexto (confirmado en 4.1.5). |
| Entorno web | HTTPS es obligatorio en producción (Render lo impone); en desarrollo local el redirect a HTTPS se omite explícitamente (`!app.Environment.IsProduction()`). |
| Servidores | API desplegada en el nivel gratuito/básico de Render (cómputo y memoria limitados, *cold starts* posibles tras inactividad); SPA servida como contenido estático puro en GitHub Pages (sin capacidad de cómputo en servidor). |
| Software de terceros | Stripe integrado únicamente en modo de prueba (`sk_test_*`), sin cuenta *live*; no existe *message broker* ni API Gateway como dependencia de terceros. |
| Cumplimiento de normas | Proyecto académico, sin auditoría de cumplimiento formal (no aplica HIPAA/GDPR de forma vinculante); se sigue buena práctica de hashing de contraseñas (BCrypt) como mínimo razonable para datos de cuenta de usuario. |
| Equipo y tiempo | Equipo de 3 integrantes, desarrollo organizado en sprints de un ciclo académico — limita cuántas iteraciones ADD pueden llevarse a implementación real dentro del curso. |

## 4.2.5. Architectural Concerns

**¿Qué es una preocupación de arquitectura?** En AniTec se tratan como preocupaciones tanto los requisitos ya capturados en el Product Backlog (sección 3.4), como solicitudes de función no priorizadas aún, como los riesgos identificados durante el desarrollo. Un riesgo es, en particular, una preocupación **gestionada**: se documenta, se asigna una iteración o se deja explícitamente fuera de alcance, pero no se ignora.

Preocupaciones y riesgos reales identificados a la fecha de este informe:

1. **Inversión de backlog sin implementación (riesgo alto).** EP-014 concentra 10 User Stories y 8 Technical Enablers (US-065–069, US-076, US-078, TS-023–030) sobre sincronización móvil offline-first, y a la fecha **no existe ningún código** de aplicación móvil en el workspace. La Iteración 4 (sección 4.3.4) diseña para este objetivo, pero el riesgo de que el diseño no pueda validarse contra una implementación real dentro del ciclo del curso queda explícitamente abierto.
2. **Telemetría IoT sin conectividad real (riesgo medio).** Los bounded contexts Devices y Metrics son CRUD puro sobre datos sembrados manualmente; no existe cliente de protocolo de dispositivo (MQTT, CoAP, socket) en ningún punto del backend. Si el negocio comunica "monitoreo IoT en tiempo real" a los ganaderos, hay una brecha entre la promesa y la implementación. La Iteración 6 (sección 4.3.6) diseña un canal de ingesta real para esta capacidad (QAS-11).
3. **Acoplamiento físico por base de datos compartida (riesgo medio).** Los 12 bounded contexts comparten una sola base de datos MySQL. Esto es coherente con un monolito modular, pero es un obstáculo directo si la Iteración 3 (extracción de servicios) avanza sin antes decidir cómo particionar o replicar los datos que cada servicio extraído necesitaría poseer.
4. **Política CORS permisiva (riesgo medio, mitigable).** `AllowAllPolicy` acepta cualquier origen — razonable en desarrollo, pero es una superficie de riesgo de seguridad si se mantiene igual en producción; debe restringirse a los orígenes reales del SPA y la landing page antes de un lanzamiento fuera del contexto académico.
5. **Integridad referencial no garantizada hacia `users` (riesgo bajo, decisión consciente).** Ningún `owner_id`/`veterinarian_id`/`rancher_id`/`user_id` en Livestock, Financial, Activities, Clients o Subscriptions tiene una *foreign key* real hacia `users` (sección 4.1.5) — es la contraparte del principio de aislamiento por contexto (4.1.1), pero también significa que la base de datos, por sí sola, no impide una referencia a un usuario inexistente.
6. **Sin restricción de unicidad en `users.username` (riesgo bajo).** No hay índice único sobre `username` a nivel de base de datos; la unicidad, si existe, depende enteramente de la lógica de aplicación. La Iteración 2 (sección 4.3.2) diseña esta corrección junto con el resto de sus ajustes de seguridad.
7. **Brecha entre el Context Diagram y la integración real de mensajería (riesgo bajo, ya documentado en 4.1.3).** El sistema externo "Resend" aparece en el diagrama de contexto pero no tiene integración real — se re-menciona aquí como preocupación de gobierno de la documentación, no solo de arquitectura: cualquier vista C4 nueva debe distinguir explícitamente as-built de to-be, como ya se hace en este informe. La Iteración 5 (sección 4.3.5) diseña esta integración junto con el mecanismo de alertas que la necesita (QAS-03).
