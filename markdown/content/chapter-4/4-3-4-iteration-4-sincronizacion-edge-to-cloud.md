# 4.3.4. Iteration 4: Sincronización Edge-to-Cloud para Campo sin Conexión

Cuarta iteración ADD v3. A diferencia de las iteraciones 1 a 3 — que refinan un sistema que ya corre — esta iteración es explícitamente **to-be**: diseña para una capacidad que el Product Backlog compromete en profundidad (EP-014: 10 User Stories, TS-023 a TS-027) pero de la cual **no existe ningún código** en el workspace actual (confirmado al preparar el capítulo 4, sección 4.1 y preocupación 4.2.5 #1). El objetivo de esta iteración no es describir algo construido, sino dejar un diseño lo bastante concreto para que la implementación futura no tenga que redescubrir las decisiones difíciles (idempotencia, conflictos, qué pasa si el dispositivo se pierde).

## 4.3.4.1. Architectural Design Backlog 4

| # | Ítem | Tipo | Prioridad |
|---|---|---|---|
| 1 | Diseñar la persistencia local del cliente móvil (qué se guarda, dónde). | Diseño (to-be) | Alta |
| 2 | Diseñar el protocolo de sincronización: idempotencia, para no duplicar al reintentar. | Diseño (to-be) | Alta |
| 3 | Diseñar la detección y presentación de conflictos, sin sobrescribir silenciosamente. | Diseño (to-be) | Alta |
| 4 | Diseñar el endpoint de sincronización del lado del servidor, reutilizando los *command services* ya existentes. | Diseño (to-be) | Alta |
| 5 | Documentar explícitamente el límite de esta capacidad: qué pasa si el dispositivo falla antes de sincronizar. | Documentación de riesgo | Media |

## 4.3.4.2. Establish Iteration Goal by Selecting Drivers

**Driver principal:** QAS-01 (sección 4.2.3), derivada directamente de BG-04 "Confianza en campo": *"conservar 100 % de las operaciones aceptadas localmente y sincronizar al menos 95 % dentro de los cinco minutos posteriores al retorno de una conexión estable."* Es un objetivo SMART ya escrito en el Impact Map (sección 3.3) — esta iteración es la que efectivamente diseña cómo cumplirlo.

**Drivers secundarios:** TS-023/024 (base de la app y persistencia local — el punto de partida del diseño), TS-026 (procesamiento idempotente — condición necesaria para el "100 % conservado" de QAS-01), y el remanente de TS-027 (eventos asíncronos) trasladado desde la Iteración 3 — aquí se aborda su versión **cliente–servidor** (distinta de la versión servicio–servicio que quedó pendiente en 4.3.3.7).

**Justificación de la priorización:** la persistencia local y la idempotencia se priorizan antes que el diseño de conflictos, porque un conflicto solo puede ocurrir sobre una operación que ya se guardó e intentó sincronizar correctamente — el orden de diseño sigue el orden real en que las fallas pueden aparecer.

**Meta de la iteración:** diseñar un cliente móvil *offline-first* y un protocolo de sincronización servidor-side que cumplan QAS-01 sin depender de infraestructura que el proyecto no tiene (sin *message broker* — restricción 4.2.4), reutilizando los *command services* de los bounded contexts ya existentes en vez de duplicar lógica de negocio en el móvil.

## 4.3.4.3. Choose One or More Elements of the System to Refine

- **Nuevo contenedor:** AniTec Mobile App (Android/Kotlin) — no existe hoy, se diseña desde cero.
- **Nuevo componente en el backend:** un orquestador de sincronización, ubicado en `Shared` (no en un bounded context de dominio propio — no posee un concepto de negocio nuevo, solo coordina llamadas a *command services* ya existentes de Livestock y Sanitary).
- El **API Gateway** de la Iteración 3 — el tráfico de sincronización móvil se enruta a través de él igual que el resto.
- Las entidades `Animal` y `HealthEvent` — ganan un marcador de concurrencia optimista necesario para detectar conflictos.

## 4.3.4.4. Choose One or More Design Concepts That Satisfy the Selected Drivers

- **Cliente *offline-first*:** toda escritura se guarda primero en una base de datos local del dispositivo (Room/SQLite en Android) y se muestra como exitosa de inmediato al usuario; la sincronización con el servidor ocurre después, en segundo plano.
- **Idempotencia vía identificador de operación generado en el cliente:** cada operación en cola lleva un `OperationId` (UUID) generado **en el dispositivo** al momento de crearla — no asignado por el servidor. Si una petición de sincronización se reintenta (por ejemplo, la conexión se cae justo después de que el servidor procesó la operación pero antes de que la respuesta llegara), el servidor reconoce el `OperationId` ya procesado y no duplica el registro.
- **Concurrencia optimista para detectar conflictos, reutilizando un patrón ya existente:** en vez de inventar un mecanismo nuevo, se propone extender `IAuditableEntity` (ya usado por `User` y `Profile` para `UpdatedAt`, sección 4.1.5) a `Animal` y `HealthEvent`. El cliente guarda el `UpdatedAt` que vio por última vez; si al sincronizar el `UpdatedAt` del servidor ya no coincide, alguien más modificó el registro primero — el servidor responde conflicto en vez de sobrescribir.
- **Sincronización por lote sobre REST, no un *message broker* nuevo:** un único endpoint `POST /api/v1/sync/batch` que recibe un arreglo de operaciones pendientes y las procesa una por una de forma idempotente. Esto resuelve la sincronización cliente→servidor sin requerir la infraestructura de eventos servicio→servicio que la Iteración 3 dejó fuera de alcance — son dos problemas relacionados pero distintos, y este diseño resuelve solo el primero.

## 4.3.4.5. Instantiate Architectural Elements, Allocate Responsibilities, and Define Interfaces

**Cliente móvil (Android/Kotlin) — capas propuestas:**

| Módulo | Responsabilidad |
|---|---|
| `data/local` (Room) | Entidades espejo de `Animal`, `Herd`, `Corral`, `HealthEvent` (el subconjunto necesario para trabajo de campo) + una tabla `OutboxOperation` (`OperationId` UUID, `EntityType`, `OperationType` Create/Update, `PayloadJson`, `ClientTimestamp`, `Status`: Pendiente / Sincronizando / Sincronizado / Conflicto). |
| `data/sync` (WorkManager) | `SyncWorker` en segundo plano: al recuperar conectividad, agrupa las operaciones `Pendiente` y las envía en lote; procesa la respuesta por operación y actualiza `Status`. |
| `data/remote` (Retrofit) | Cliente HTTP hacia el API Gateway (Iteración 3) — mismas rutas versionadas `/api/v1/...`, más el nuevo `/api/v1/sync/batch`. |

**Backend — orquestador de sincronización (`Shared`):**

| Elemento | Responsabilidad |
|---|---|
| `SyncController` (`POST /api/v1/sync/batch`, `[Authorize]`) | Recibe el lote de `SyncOperation`, delega cada una según `EntityType` a los *command services* **ya existentes** (`IAnimalCommandService`, `IHealthEventCommandService`, etc.) — no reimplementa lógica de negocio. |
| Tabla `processed_sync_operations` (nueva, `OperationId` PK, `ProcessedAt`, `ResultStatus`) | Registro de idempotencia: antes de aplicar una operación, se verifica si su `OperationId` ya fue procesado. |
| Marcador de concurrencia optimista en `Animal`/`HealthEvent` | Extiende `IAuditableEntity` (patrón ya usado por `User`/`Profile`) para exponer `UpdatedAt` y compararlo contra el valor que el cliente envía. |

## 4.3.4.6. Sketch Views (C4 & UML) and Record Design Decisions

**Fragmento nuevo del Diagrama de Contenedores** (se agrega sobre la versión ya extendida en la Iteración 3, sección 4.3.3.6):

- **Nuevo:** AniTec Mobile App `[Container: Kotlin, Android, Room]` — se conecta al **API Gateway** por JSON/HTTPS, igual que el SPA.
- **Nuevo componente dentro de Core API:** Sync Orchestration Component (en `Shared`) — depende de los *command services* de Livestock y Sanitary, no introduce un bounded context de dominio nuevo.

**Flujo de sincronización (secuencia, notación textual):**

1. El usuario de campo registra un evento sanitario sin conexión → se guarda en Room con un `OperationId` nuevo, `Status = Pendiente`.
2. Vuelve la conectividad → `SyncWorker` despierta → envía el lote pendiente a `POST /sync/batch`.
3. Por cada operación, el servidor evalúa: ¿`OperationId` ya procesado? → si sí, responde "ya sincronizado" sin duplicar. Si no: ¿el `UpdatedAt` que el cliente conoce coincide con el actual del servidor? → si no coincide, responde conflicto (409) con ambas versiones, sin aplicar el cambio. Si coincide, aplica el comando existente correspondiente, registra el `OperationId` como procesado y responde éxito.
4. El cliente actualiza el estado local: `Sincronizado` o `Conflicto` — nunca sobrescribe silenciosamente (US-069).
5. Si queda en `Conflicto`, la resolución la decide el usuario manualmente; el diseño de esa pantalla de resolución queda fuera del alcance de este informe (se documenta como requerimiento de UI pendiente, no como diseño arquitectónico).

**Decisiones de diseño registradas:**

1. El orquestador de sincronización **reutiliza** los *command services* existentes por tipo de entidad, en vez de duplicar reglas de negocio en un nuevo bounded context — consistente con el principio de no fragmentar el dominio innecesariamente (4.1.1).
2. La idempotencia se resuelve con un `OperationId` generado en el cliente, no con una clave generada por el servidor — es la única forma de que un reintento tras una respuesta perdida sea seguro.
3. Los conflictos se **exponen**, nunca se resuelven automáticamente con "el último que escribe gana" — decisión explícita para datos clínicos, donde sobrescribir silenciosamente un diagnóstico sería inaceptable.
4. **Riesgo aceptado y documentado explícitamente:** una operación que nunca superó el estado `Pendiente` (el dispositivo se pierde, se daña o se reinstala antes de sincronizar) **se pierde** — es una limitación inherente de cualquier diseño *offline-first* sin respaldo local redundante, y no se resuelve en esta iteración. Lo que sí se preserva (consistente con US-076) es la información que ya alcanzó `Sincronizado`: al reinstalar la aplicación, se puede volver a descargar desde el servidor sin reconstruir el historial manualmente.

## 4.3.4.7. Analysis of Current Design and Review Iteration Goal (Kanban Board)

| Backlog Item | Estado |
|---|---|
| 1. Persistencia local del cliente móvil | ✅ Diseño completo (to-be) |
| 2. Protocolo de sincronización idempotente | ✅ Diseño completo (to-be) |
| 3. Detección y presentación de conflictos | ✅ Diseño completo (to-be) |
| 4. Endpoint de sincronización en el servidor | ✅ Diseño completo (to-be) |
| 5. Documentar el límite ante fallo de dispositivo | ✅ Done |

**Revisión de la meta:** cumplida a nivel de diseño — existe un protocolo concreto y trazable a componentes específicos que satisface QAS-01/BG-04, reutilizando patrones ya vigentes en el backend (auditoría, *command services*) en vez de inventar mecanismos nuevos donde no hace falta. Se reitera explícitamente: **no existe código de la aplicación móvil ni del endpoint de sincronización a la fecha de este informe** — esta iteración es un diseño para una implementación futura, coherente con la preocupación 4.2.5 #1.

**Riesgo que se traslada:** el diseño de pruebas para este protocolo (idempotencia, conflictos, recuperación) corresponde a TS-030 y se retoma en la Iteración 5 (Observabilidad y Confiabilidad Operativa).
