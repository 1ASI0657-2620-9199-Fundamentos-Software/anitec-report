# 4.3.1. Iteration 1: Estructura Global del Sistema

Primera iteración ADD v3. Formaliza y valida la línea base estructural del sistema (el monolito modular de 12 bounded contexts documentado en 4.1) antes de que las iteraciones 2 a 5 introduzcan cambios sobre ella. No se diseña algo nuevo desde cero: se confirma que el estilo y los patrones ya vigentes (4.1.2, 4.1.6) se sostienen de forma consistente en **todo** el sistema, cerrando los vacíos de documentación detectados en 4.1.4 (los bounded contexts Clients y Metrics no tenían diagrama de componentes).

## 4.3.1.1. Architectural Design Backlog 1

| # | Ítem | Tipo | Prioridad |
|---|---|---|---|
| 1 | Confirmar que el patrón de 4 capas (Domain/Application/Infrastructure/Interfaces) + Repository/CQRS/Assembler/Result se cumple sin excepción en los 12 bounded contexts. | Validación | Alta |
| 2 | Documentar la asignación de responsabilidades del bounded context **Clients** (sin diagrama de componentes previo). | Documentación/Diseño | Alta |
| 3 | Documentar la asignación de responsabilidades del bounded context **Metrics** (sin diagrama de componentes previo). | Documentación/Diseño | Alta |
| 4 | Confirmar que el componente Livestock ya refleja el agregado `Corral` introducido este ciclo. | Validación | Media |
| 5 | Registrar como decisión arquitectónica explícita que esta etapa del proyecto se mantiene como monolito modular (no se extraen servicios todavía). | Decisión arquitectónica (ADR) | Alta |

## 4.3.1.2. Establish Iteration Goal by Selecting Drivers

**Drivers seleccionados** (sección 4.2): **QAS-04 — Modificabilidad ante un nuevo concepto de dominio** (prioridad alta) y la **preocupación #3 — acoplamiento físico por base de datos compartida** (4.2.5, prioridad media, se documenta pero no se resuelve aquí).

**Justificación de la priorización:** modificabilidad se prioriza primero porque es una precondición para todo lo demás — antes de decidir *cómo* evolucionar el sistema (extraer servicios en la Iteración 3, reforzar seguridad en la Iteración 2, diseñar sincronización offline en la Iteración 4), es necesario confirmar que la estructura actual **ya** absorbe cambios de dominio sin fugas entre contextos. El acoplamiento por base de datos compartida se reconoce como un driver real pero se posterga deliberadamente: resolverlo aquí adelantaría trabajo de la Iteración 3 sin haber completado antes la extracción de servicios que lo motiva.

**Meta de la iteración:** formalizar y validar la estructura modular actual como línea base estable — cerrando los vacíos de documentación de componentes (Clients, Metrics) y confirmando que el aislamiento por bounded context sigue vigente tras introducir `Corral` — antes de que las iteraciones 2 a 5 modifiquen esa estructura.

## 4.3.1.3. Choose One or More Elements of the System to Refine

- El contenedor **API Application** en su totalidad (los 12 componentes de bounded context que lo forman).
- En particular, los componentes **Clients** y **Metrics**, sin diagrama de componentes previo (vacío detectado en 4.1.4).
- El componente **Livestock**, para validar que ya incluye el agregado `Corral`.

## 4.3.1.4. Choose One or More Design Concepts That Satisfy the Selected Drivers

No se introduce un concepto nuevo: se **reafirma y aplica de forma explícita** el concepto ya vigente (documentado en 4.1.2 y 4.1.6) a los dos componentes sin documentar, como prueba de que el estilo es realmente uniforme y no solo una intención de diseño:

- Un `I<Contexto>Repository` por agregado, heredando de `BaseRepository<T>`.
- Un `I<Contexto>CommandService` (escritura, devuelve `Result`/`Result<T>`) y un `I<Contexto>QueryService` (lectura) separados.
- Un `Assembler` por transformación entidad↔recurso.
- Un `Controller` REST que no serializa entidades directamente.

Este concepto es el que satisface el driver de modificabilidad: si Clients y Metrics —dos contextos pequeños y con necesidades distintas (relación veterinario–ganadero vs. series de tiempo de sensores)— caben en el mismo patrón sin fricción, el patrón es sólido como línea base para crecer.

## 4.3.1.5. Instantiate Architectural Elements, Allocate Responsibilities, and Define Interfaces

**Componente: Clients** (relación veterinario–ganadero)

| Elemento | Responsabilidad |
|---|---|
| `VeterinarianClientsController` (`api/v1/veterinarian`, `[Authorize("Veterinarian")]`) | Expone `GET {veterinarianId}/clients`, `GET {veterinarianId}/available-ranchers`, `POST {veterinarianId}/clients/{rancherId}`, `DELETE {veterinarianId}/clients/{rancherId}`. |
| `IVeterinarianClientCommandService` / `VeterinarianClientCommandService` | Crea y elimina la relación veterinario–ganadero (asignar/desasignar cliente). |
| `IVeterinarianClientQueryService` / `VeterinarianClientQueryService` | Lista clientes asignados a un veterinario y ganaderos disponibles para asignar. |
| `IVeterinarianClientRepository` / `VeterinarianClientRepository : BaseRepository<VeterinarianClient>` | Persiste `VeterinarianClient` (tabla `veterinarian_clients`, índice único `(veterinarian_id, rancher_id)`, sección 4.1.5). |

**Componente: Metrics** (lecturas de dispositivos IoT)

| Elemento | Responsabilidad |
|---|---|
| `DeviceMetricsController` (`api/v1/device-metrics`, `[Authorize("Rancher", "Veterinarian")]`) | CRUD completo: `GET`, `GET {id}`, `POST`, `PUT {id}`, `DELETE {id}`. |
| `IDeviceMetricCommandService` / `DeviceMetricCommandService` | Crea, actualiza y elimina lecturas de métricas. |
| `IDeviceMetricQueryService` / `DeviceMetricQueryService` | Lista y consulta lecturas por dispositivo. |
| `IDeviceMetricRepository` / `DeviceMetricRepository : BaseRepository<DeviceMetric>` | Persiste `DeviceMetric` (tabla `device_metrics`, FK a `devices.id` con borrado en cascada, sección 4.1.5). |

**Componente: Livestock — validación del agregado `Corral`**

Confirmado contra el diccionario de tablas (4.1.5) y el código real: `Corral` ya existe como agregado propio (`ICorralRepository`, `ICorralCommandService`, `ICorralQueryService`, `CorralsController` en `api/v1/corrals`), con `Animal.CorralId` como relación opcional a nivel de negocio pero obligatoria a nivel de validación de entrada (sección 4.2.2, US-010). El componente cumple el mismo patrón que Clients y Metrics — no se requiere ningún ajuste estructural.

## 4.3.1.6. Sketch Views (C4 & UML) and Record Design Decisions

Se reutiliza el Diagrama de Contenedores de la sección 4.1.4 sin cambios (esta iteración no modifica contenedores, solo confirma componentes). Como parte de esta iteración se registra la asignación de responsabilidades de Clients y Metrics en las tablas de 4.3.1.5 — sustituyendo, en notación textual, al diagrama de componentes C4 que el equipo aún no ha redibujado en Visual Paradigm para estos dos contextos.

**Decisiones de diseño registradas:**

1. Se **mantiene el monolito modular** como estilo arquitectónico para esta etapa del proyecto — no se extraen servicios en esta iteración; esa decisión se evalúa explícitamente en la Iteración 3 (sección 4.3.3), con sus propios drivers y trade-offs.
2. Clients y Metrics **adoptan sin variación** el patrón de 4 capas + Repository/CQRS/Assembler/Result — no se introduce una excepción por ser contextos pequeños.
3. La deuda de documentación de componentes para Clients y Metrics se considera **cerrada a nivel de contenido** (tablas de responsabilidades e interfaces en 4.3.1.5); la producción del diagrama C4 formal en la herramienta del equipo queda como pendiente operativo, igual que las correcciones ya señaladas en 4.1.4 para el diagrama de contenedores y el de clases.

## 4.3.1.7. Analysis of Current Design and Review Iteration Goal (Kanban Board)

| Backlog Item | Estado |
|---|---|
| 1. Confirmar patrón de 4 capas en los 12 contextos | ✅ Done |
| 2. Documentar responsabilidades de Clients | ✅ Done |
| 3. Documentar responsabilidades de Metrics | ✅ Done |
| 4. Validar que Livestock incluye `Corral` | ✅ Done |
| 5. Registrar decisión de mantener el monolito modular | ✅ Done |
| — Redibujar en Visual Paradigm los diagramas de Clients/Metrics/Contenedores/Clases | 🔲 Backlog (pendiente operativo del equipo, fuera del alcance de esta iteración) |

**Revisión de la meta:** la meta de la iteración se cumplió — la estructura modular quedó formalizada y validada, incluyendo los dos componentes que carecían de documentación. El driver de modificabilidad (QAS-04) ya contaba con evidencia directa (la introducción de `Corral` este ciclo no afectó a ningún otro bounded context) y esta iteración confirma que esa propiedad se sostiene también en Clients y Metrics.

**Riesgo que se traslada a la siguiente iteración:** el acoplamiento por base de datos compartida (preocupación 4.2.5 #3) permanece sin resolver, tal como se decidió en 4.3.1.2 — queda como entrada directa para la Iteración 3 (Extracción de Servicios Críticos y API Gateway).
