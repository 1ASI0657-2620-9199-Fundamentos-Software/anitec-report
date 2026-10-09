# 5.1. Testing Suites & General Patterns

Esta sección documenta la suite de pruebas del backend de AniTec y los patrones de diseño sobre los que está construido. Todo lo descrito fue **verificado directamente contra el código** del repositorio [anitec-backend](https://github.com/1ASI0657-2620-9199-Fundamentos-Software/anitec-backend.git) y, en el caso de las pruebas, **ejecutado**: el resultado que se cita proviene de una corrida real de `dotnet test`. Donde el sistema todavía no cubre algo (pruebas de integración contra MySQL, pruebas del frontend, medición de cobertura), se indica de forma explícita en vez de presentarlo como logrado.

## 5.1.1. Backend Application Core Testing Suite

La suite de pruebas del núcleo del backend vive en el proyecto `Anitec.Platform.Tests`, dentro de la misma solución (`anitec-platform.sln`) que la API. Combina dos niveles de prueba:

- **Pruebas unitarias** sobre el núcleo compartido (`Shared`) y sobre los servicios de aplicación de dos bounded contexts (Iam y Livestock).
- **Pruebas de aceptación BDD**, escritas como archivos `.feature` en lenguaje Gherkin y ejecutadas con Reqnroll, que expresan el comportamiento esperado desde la perspectiva de un User Story.

### Herramientas

| Herramienta | Versión | Rol en la suite |
|---|---|---|
| .NET SDK | 10.0.300 (`net10.0`) | Plataforma de compilación y ejecución. |
| xUnit | 2.9.3 | Framework de pruebas unitarias (`[Fact]`, `[Theory]`). |
| Microsoft.NET.Test.Sdk | 17.14.1 | Integración con `dotnet test`. |
| NSubstitute | 6.2.0 | Dobles de prueba para servicios salientes (por ejemplo `ITokenService`). |
| Microsoft.EntityFrameworkCore.InMemory | 10.0.8 | Contexto EF Core en memoria para probar repositorios, *Unit of Work* e interceptor. |
| Reqnroll.xUnit | 3.3.4 | Ejecución de los escenarios Gherkin de los archivos `.feature`. |
| coverlet.collector | 6.0.4 | Instalado por la plantilla de xUnit; **la cobertura aún no se mide ni se reporta**. |

### Estructura del proyecto de pruebas

```
anitec-backend/
├── Anitec.Platform/                      (API: código de producción)
└── Anitec.Platform.Tests/
    ├── Shared/
    │   ├── ResultTests.cs
    │   ├── RepositoryAndUnitOfWorkTests.cs
    │   └── AuditableEntityInterceptorTests.cs
    ├── Livestock/
    │   └── AnimalCommandServiceTests.cs
    ├── Iam/
    │   └── UserCommandServiceTests.cs
    ├── Features/
    │   ├── Authentication.feature
    │   ├── BulkAnimalRegistration.feature
    │   └── StepDefinitions/
    │       ├── AuthenticationSteps.cs
    │       └── BulkAnimalRegistrationSteps.cs
    └── Support/
        ├── TestDb.cs                     (base EF Core en memoria)
        ├── InMemoryRepository.cs         (repositorios y Unit of Work de prueba)
        └── FakeLocalizer.cs
```

### Relación de pruebas diseñadas

| Nivel | Archivo | Qué valida | Pruebas |
|---|---|---|---|
| Unitaria | `Shared/ResultTests.cs` | Patrón `Result<T>` / `Result`: éxito con valor, fallo con error y mensaje, y la variante sin valor. | 4 |
| Unitaria | `Shared/RepositoryAndUnitOfWorkTests.cs` | `BaseRepository` y `UnitOfWork` sobre EF Core en memoria: nada se persiste hasta `CompleteAsync`, un lote de 50 entidades se guarda junto, búsqueda por id, actualización y borrado. | 5 |
| Unitaria | `Shared/AuditableEntityInterceptorTests.cs` | `AuditableEntityInterceptor`: asigna `CreatedAt` y `UpdatedAt` al crear, y en una actualización refresca `UpdatedAt` conservando `CreatedAt`. | 2 |
| Unitaria | `Livestock/AnimalCommandServiceTests.cs` | `AnimalCommandService`: crear, actualizar inexistente, eliminar; registro por lote (cantidad fuera de 1–500, corral inexistente, etiquetas secuenciales, continuidad de secuencia, un solo `CompleteAsync` para 500 animales); cambio masivo de estado. | 12 |
| Unitaria | `Iam/UserCommandServiceTests.cs` | `UserCommandService`: inicio de sesión válido, contraseña errónea, usuario inexistente (mismo error), registro con contraseña *hasheada*, usuario repetido, rol no soportado y normalización del rol. | 9 |
| BDD | `Features/Authentication.feature` | Inicio de sesión y registro (US-053). | 8 escenarios |
| BDD | `Features/BulkAnimalRegistration.feature` | Registro de varios animales en un corral y cambio masivo de estado (US-082). | 8 escenarios |
| | | **Total** | **48** |

### Código de los archivos `.feature` del núcleo

El escenario de autenticación (US-053) se presenta junto a su evidencia en la sección 5.3.1.3. A continuación, el archivo de registro por lote, que respalda la funcionalidad de corrales y registro masivo implementada en este ciclo (US-082):

```gherkin
Feature: Bulk animal registration in a corral
  As a rancher
  I want to register several animals of the same corral without repeating the form for each one
  So that I can organize my livestock quickly (US-082)

  Background:
    Given a corral named "Corral 1" exists in herd 1

  Scenario: Several animals are registered with sequential tags
    When I register 3 animals in that corral
    Then 3 animals are stored
    And their tags are "Corral1-001, Corral1-002, Corral1-003"

  Scenario: The tag sequence continues when the corral already has animals
    Given 2 animals were already registered in that corral
    When I register 2 animals in that corral
    Then their tags are "Corral1-003, Corral1-004"

  Scenario: The whole batch is saved in a single transaction
    When I register 500 animals in that corral
    Then 500 animals are stored
    And the changes were saved in 1 transaction

  Scenario Outline: A quantity outside the allowed range is rejected
    When I register <quantity> animals in that corral
    Then the registration fails
    And no animals are stored

    Examples:
      | quantity |
      | 0        |
      | -1       |
      | 501      |

  Scenario: A corral that does not exist is rejected
    When I register 3 animals in the corral with id 99
    Then the registration fails with the error "CorralNotFound"
    And no animals are stored

  Scenario: Several animals can be marked as sold at once
    Given 3 animals were already registered in that corral
    When I mark the animals 1, 2 and 3 as "Vendido"
    Then all 3 animals have the status "Vendido"
```

### Decisiones de diseño de las pruebas

- **Los servicios de aplicación se prueban contra sus interfaces.** `AnimalCommandService` y `UserCommandService` reciben sus repositorios y su `IUnitOfWork` por constructor, por lo que la suite los reemplaza por repositorios en memoria escritos a mano (`InMemoryRepository<T>`). Esto es consecuencia directa de aplicar los patrones Repository y Unit of Work (sección 5.1.2).
- **Los escenarios BDD reutilizan esos mismos servicios reales**, no una copia de su lógica: cada paso (`When I register 3 animals in that corral`) invoca el `Handle` del servicio de producción.
- **NSubstitute se limita a los servicios salientes** (`ITokenService`), donde importa verificar que *no* se emitió un token ante credenciales inválidas.
- **EF Core en memoria** se usa para el núcleo de persistencia (`BaseRepository`, `UnitOfWork`, interceptor), porque ahí lo que se prueba es el comportamiento del `DbContext`.

### Ejecución de la suite

```bash
dotnet test Anitec.Platform.Tests/Anitec.Platform.Tests.csproj
```

Resultado de la corrida del 09/10/2026:

```
Correctas! - Con error: 0, Superado: 48, Omitido: 0, Total: 48, Duración: 3 s
```

<div align="center">
  <!-- PLACEHOLDER: captura de la terminal con la ejecución de `dotnet test` (48 pruebas superadas) -->
  <img src="../../assets/chapter-5/Pruebas/dotnet-test-resultado.png" alt="Resultado de dotnet test: 48 pruebas superadas" width="700">
  <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>

Cada ejecución también genera un **reporte HTML de los escenarios Gherkin** (formateador HTML de Reqnroll, configurado en `Anitec.Platform.Tests/reqnroll.json`), con los pasos y el resultado de cada escenario. Sus capturas se presentan en la sección 5.3.1.3.

### Alcance y limitaciones reconocidas

| Limitación | Consecuencia |
|---|---|
| El proveedor EF Core en memoria **no aplica restricciones relacionales** (llaves foráneas, `ON DELETE`). | Las pruebas de persistencia validan el comportamiento del `DbContext`, no el esquema MySQL real. Faltan pruebas de integración contra MySQL (por ejemplo con contenedores). |
| No hay pruebas a nivel de controlador HTTP (`WebApplicationFactory`). | La autorización por rol (`[Authorize("Rancher")]`) y la serialización de respuestas se verificaron manualmente en Swagger (sección 5.3.1.4), no de forma automatizada. |
| Solo se cubren 2 de los 12 bounded contexts con pruebas de servicio (Livestock e Iam). | Sanitary, Financial, Activities, Analytics, Devices, Metrics, Subscriptions, Clients y Profiles quedan para próximos sprints. |
| El frontend (Vue 3) no tiene pruebas automatizadas. | Pendiente: pruebas de *stores* de Pinia y de componentes. |
| La cobertura de código no se mide. | `coverlet.collector` está instalado pero no se ha ejecutado ni se reporta ningún porcentaje. |

## 5.1.2. Pattern Based Backend Application(s)

El backend de AniTec (`Anitec.Platform`, ASP.NET Core sobre .NET 10, MySQL) está construido como un **monolito modular de 12 bounded contexts** (Activities, Analytics, Clients, Devices, Financial, Iam, Livestock, Metrics, Profiles, Sanitary, Shared y Subscriptions). Los contextos de negocio repiten la misma estructura de cuatro capas (`Domain`, `Application`, `Infrastructure`, `Interfaces`), y sobre ella se aplican los patrones de la siguiente tabla. La columna *Ubicación* permite verificar cada uno en el código.

| Patrón | Dónde se aplica | Para qué sirve en AniTec |
|---|---|---|
| **Domain-Driven Design / Bounded Contexts** | Carpetas de primer nivel (`Livestock/`, `Iam/`, `Sanitary/`, ...). | Aísla cada área de negocio; entre contextos solo se referencian identificadores, sin llaves foráneas reales. |
| **Arquitectura en capas** | `Domain/`, `Application/`, `Infrastructure/`, `Interfaces/` dentro de cada contexto. | Separa reglas de negocio, casos de uso, persistencia y API REST. |
| **CQRS ligero** | `IAnimalCommandService` / `IAnimalQueryService`; comandos y consultas como `record` (`CreateAnimalCommand`, `GetAllAnimalsQuery`). | Separa escritura (devuelve `Result`) de lectura. |
| **Repository** | `IAnimalRepository : IBaseRepository<Animal>` implementado por `AnimalRepository : BaseRepository<Animal>`. | Oculta el acceso a datos tras una interfaz de dominio. |
| **Unit of Work** | `IUnitOfWork` / `UnitOfWork.CompleteAsync()`. | Agrupa los cambios en una transacción (un lote de hasta 500 animales se guarda de una vez). |
| **Result** | `Result<T>` y `Result` en `Shared/Application/Model`. | Expresa éxito o fallo de negocio con un enum de error y un mensaje, sin usar excepciones. |
| **Assembler / Resource (DTO)** | `AnimalResourceFromEntityAssembler`, `CreateAnimalCommandFromResourceAssembler`. | Traduce entre el dominio y el contrato REST; nunca se serializa una entidad directamente. |
| **Outbound Service (adaptador)** | `ITokenService` → `TokenService` (JWT), `IHashingService` → `HashingService` (BCrypt). | Mantiene la lógica de negocio independiente de las librerías de seguridad. |
| **Interceptor (aspecto transversal)** | `AuditableEntityInterceptor` + `IAuditableEntity`. | Completa `CreatedAt`/`UpdatedAt` automáticamente al guardar. |
| **Middleware (manejo global de errores)** | `GlobalExceptionHandlerMiddleware`, registrado con `app.UseGlobalExceptionHandler()`. | Convierte excepciones no controladas en respuestas `ProblemDetails`. |
| **Convención de rutas** | `KebabCaseRouteNamingConvention`. | Rutas coherentes en `kebab-case` (`/api/v1/health-events`). |
| **Autorización declarativa por rol** | Atributo propio `[Authorize("Rancher", "Veterinarian")]`. | Restringe cada endpoint a los roles permitidos. |
| **Inyección de dependencias** | Registro de servicios y repositorios en `Program.cs`. | Permite sustituir implementaciones, y es lo que hace posibles las pruebas de 5.1.1. |

La relación entre estos patrones y los atributos de calidad del capítulo 4 está en 4.1.2 (estilo y patrones) y 4.1.6 (patrones de diseño); aquí se verifica que cada uno existe en el código.

## 5.1.3. Pattern Based Custom Software Library

AniTec no publica una biblioteca como paquete independiente (por ejemplo, en NuGet). Lo que cumple ese rol es el **núcleo compartido interno** `Shared`, un módulo reutilizable por los 12 bounded contexts, construido íntegramente sobre patrones de diseño. Se documenta aquí como la biblioteca propia del backend, con la precisión de que **vive en el mismo ensamblado que la API** y no se versiona ni se distribuye por separado.

| Componente | Patrón | Responsabilidad | Reutilizado por |
|---|---|---|---|
| `Result<T>`, `Result` | Result | Resultado explícito de comandos de aplicación. | Todos los `CommandService`. |
| `IBaseRepository<T>`, `BaseRepository<T>` | Repository | CRUD genérico (`AddAsync`, `FindByIdAsync`, `Update`, `Remove`, `ListAsync`). | Todos los repositorios de contexto. |
| `IUnitOfWork`, `UnitOfWork` | Unit of Work | Confirma los cambios de una operación. | Todos los `CommandService`. |
| `IAuditableEntity`, `AuditableEntityInterceptor` | Interceptor | Marcas de auditoría automáticas. | Entidades que implementan la interfaz (hoy los agregados de usuario y de perfil). |
| `GlobalExceptionHandlerMiddleware` | Middleware | Respuesta uniforme ante excepciones. | Toda la API. |
| `KebabCaseRouteNamingConvention` | Convención | Nombres de ruta uniformes. | Todos los controladores. |
| `AppDbContext`, `ModelBuilderExtensions` | Unit of Work / configuración por contexto | Un `DbContext` único que aplica la configuración de cada contexto (`ApplyLivestockConfiguration()`, etc.) y la convención `snake_case`. | Persistencia de los 12 contextos. |
| `ProblemDetailsFactory`, `ErrorMessages`, `CommonMessages` | Fábrica / recursos | Errores localizados (es/en). | API y servicios de Iam. |

Este núcleo es la parte mejor cubierta por la suite de pruebas de 5.1.1: `Result`, `BaseRepository`, `UnitOfWork` y `AuditableEntityInterceptor` tienen pruebas directas (11 de las 48).

## 5.1.4. Framework Pattern Driven Refactoring Report

Este reporte revisa el backend frente a los patrones de 5.1.2 y registra los puntos donde el código **se aparta de ellos** o los deja incompletos. Cada hallazgo se verificó leyendo el código fuente o la salida del compilador; ninguno es una suposición. **Estado de este reporte: los hallazgos están identificados y priorizados, pero todavía no se aplicó ninguna refactorización** (la columna *Estado* lo indica).

| ID | Hallazgo verificado | Patrón o principio afectado | Refactorización propuesta | Riesgo | Estado |
|---|---|---|---|---|---|
| R1 | `AnimalCommandService` devuelve `LivestockError.AnimalNotFound` cuando la cantidad del lote está fuera de 1–500. El código de error no corresponde al problema. | Result (error explícito y significativo) | Añadir un valor `InvalidQuantity` a `LivestockError` y usarlo en esa validación. | Bajo | Identificado |
| R2 | `CreateBatch` carga **todos** los animales (`ListAsync`) para contar los de un corral. | Repository (consulta a medida) | Agregar a `IAnimalRepository` un método de conteo por corral que filtre en la base de datos. | Medio | Identificado |
| R3 | `UpdateAnimalsStatus` y `DeleteAnimals` buscan cada id con una consulta individual dentro de un bucle. | Repository / Unit of Work | Agregar una consulta por lista de ids y modificar en bloque. | Medio | Identificado |
| R4 | `UserCommandService.SignUp` captura `Exception` y devuelve `InternalServerError`, pero su propio comentario indica que no registra el detalle ("Log the exception details here if an ILogger is injected"). | Middleware de errores / observabilidad | Inyectar `ILogger` y registrar la excepción antes de devolver el resultado. | Bajo | Identificado |
| R5 | Cortex.Mediator está registrado en `Program.cs` y existe `LoggingCommandBehavior`, pero ningún comando implementa `ICommand` y el comportamiento solo contiene el comentario `// Log before/after`: el pipeline no se ejecuta ni registra nada. | Mediator / Pipeline Behavior | Decidir: o bien despachar los comandos por el mediador y completar el *behavior*, o bien retirar el paquete y el registro. | Bajo | Identificado |
| R6 | Las imágenes de animales se guardan en el disco local del contenedor (`wwwroot/uploads/animals`). En el plan gratuito de Render el sistema de archivos es efímero: **las imágenes se pierden al reiniciar o redesplegar**. | Outbound Service (almacenamiento) | Definir una interfaz de almacenamiento y usar un servicio de objetos externo. | Alto (afecta producción) | Identificado |
| R7 | El build del backend reporta la advertencia NU1903: `Microsoft.OpenApi 2.4.1` tiene una vulnerabilidad de severidad alta conocida (dependencia de Swashbuckle). | Mantenimiento de dependencias | Actualizar Swashbuckle / `Microsoft.OpenApi` a una versión corregida. | Bajo | Identificado |
| R8 | La política CORS `AllowAllPolicy` acepta cualquier origen (ya registrada como preocupación en 4.2.5). | Seguridad por configuración | Restringir a los dominios reales del frontend y de la landing (diseño en 4.3.2). | Medio | Identificado |

Los hallazgos R1, R2, R3 y R4 son los de menor costo y mayor claridad: se pueden resolver añadiendo código y pruebas sin modificar contratos REST. R6 es el de mayor impacto para los usuarios, y se considera la primera refactorización a ejecutar cuando el Sprint lo permita.
