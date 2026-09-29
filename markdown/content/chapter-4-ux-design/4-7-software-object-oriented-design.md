# 4.7. Software Object-Oriented Design.

El diseño orientado a objetos de AniTec representa las principales clases, entidades, relaciones y responsabilidades que permiten implementar la lógica de la aplicación. Para mantener coherencia con la arquitectura del backend, el diseño se organiza tomando como referencia los bounded contexts definidos en la solución: IAM, Profiles, Livestock, Sanitary, Activities, Financial, Analytics, Devices, Subscriptions y Shared.

El objetivo de esta sección es mostrar cómo los conceptos principales del dominio se transforman en clases del sistema, considerando entidades persistentes, servicios de aplicación, repositorios y componentes compartidos. De esta manera, el diseño orientado a objetos mantiene relación directa con la arquitectura por capas utilizada en el backend de AniTec.

## 4.7.1. Class Diagrams.

El Class Diagram de AniTec presenta una vista general de las clases principales utilizadas para representar usuarios, perfiles, animales, hatos, eventos sanitarios, actividades, registros financieros, métricas, dispositivos, suscripciones y pagos. Este diagrama permite visualizar la relación entre los elementos principales del dominio y sirve como base para comprender la estructura lógica de la solución.

<div align="center">
  <p>
    <b>Class Diagram - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/Diagrama-Clases-Anitec.png" alt="Class Diagram - AniTec" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>

Enlace para acceder al https://lucid.app/lucidchart/2cf9b98f-737c-43ac-9833-a2e6a387c4af/edit?viewport_loc=-5835%2C-1184%2C9341%2C3780%2C0_0&invitationId=inv_26c88d5c-929c-4141-bbb1-e3a73b17aa13

## 4.7.2. Class Dictionary.

Diccionario de clases usado para el desarrollo de AniTec.

| Clase | Bounded Context | Descripción |
| --- | --- | --- |
| **User** | IAM | Entidad que representa a un usuario de la plataforma. Almacena credenciales, rol y datos necesarios para autenticar a ganaderos y veterinarios. |
| **UserAudit** | IAM | Clase asociada al seguimiento de información de auditoría del usuario, permitiendo registrar datos relacionados con su creación o actualización. |
| **SignInCommand** | IAM | Comando utilizado para procesar el inicio de sesión de un usuario mediante nombre de usuario y contraseña. |
| **SignUpCommand** | IAM | Comando utilizado para crear usuarios dentro de la plataforma cuando el backend requiere registrar nuevas cuentas. |
| **Profile** | Profiles | Entidad que almacena la información personal y de contacto asociada a un usuario de AniTec. |
| **ProfileAudit** | Profiles | Clase relacionada con la auditoría de los perfiles registrados en la plataforma. |
| **PersonName** | Profiles | Value Object que representa el nombre de una persona dentro del perfil. |
| **EmailAddress** | Profiles | Value Object que representa y valida el correo electrónico asociado al perfil. |
| **StreetAddress** | Profiles | Value Object que representa la dirección registrada para un perfil. |
| **Herd** | Livestock | Entidad que representa un hato o grupo ganadero. Permite organizar animales por propietario, ubicación y tipo principal. |
| **Animal** | Livestock | Entidad que representa un animal registrado en la plataforma. Incluye datos como identificador, nombre, especie, raza, género, fecha de nacimiento, peso, estado y hato asociado. |
| **HealthEvent** | Sanitary | Entidad que representa un evento sanitario del animal, como vacunas, tratamientos, diagnósticos, incidencias, prescripciones o seguimientos. |
| **FarmActivity** | Activities | Entidad que representa una actividad operativa de la finca, incluyendo título, tipo, fecha, prioridad, estado y responsables asociados. |
| **FinancialRecord** | Financial | Entidad que representa un ingreso o egreso de la operación ganadera. Registra monto, categoría, fecha, descripción y propietario. |
| **ReportMetric** | Analytics | Entidad utilizada para almacenar métricas o indicadores que apoyan la generación de reportes y dashboards. |
| **Device** | Devices | Entidad que representa un dispositivo IoT registrado, como balanzas, collares inteligentes, cámaras térmicas, aretes de identificación, estaciones meteorológicas o sensores ambientales. |
| **DeviceMetric** | Metrics | Entidad que representa una lectura o métrica capturada por un dispositivo IoT. Permite registrar valores asociados al monitoreo de animales o hatos. |
| **SubscriptionPlan** | Subscriptions | Entidad que representa un plan disponible dentro de la plataforma, incluyendo nombre, precio, beneficios y características generales. |
| **Subscription** | Subscriptions | Entidad que representa la suscripción activa o histórica de un usuario a un plan determinado. |
| **Payment** | Subscriptions | Entidad que representa un pago de prueba registrado dentro del flujo de suscripciones de AniTec. |
| **VeterinarianClient** | Clients | Entidad que representa la relación entre un veterinario y un ganadero cliente, permitiendo gestionar clientes asignados y pacientes asociados. |
| **Result** | Shared | Clase de apoyo usada para representar resultados de operaciones de aplicación, permitiendo comunicar éxito, error o información adicional. |
| **Error** | Shared | Clase base para representar errores del dominio o de aplicación de forma consistente. |
| **IBaseRepository** | Shared | Interfaz base que define operaciones comunes de persistencia para los repositorios del sistema. |
| **BaseRepository** | Shared | Implementación base de repositorio que centraliza operaciones comunes de acceso a datos mediante Entity Framework Core. |
| **IUnitOfWork** | Shared | Interfaz que define la operación para confirmar cambios realizados por los repositorios. |
| **UnitOfWork** | Shared | Clase que coordina la persistencia de cambios en la base de datos mediante AppDbContext. |
| **AppDbContext** | Shared | Clase de Entity Framework Core que configura las entidades, relaciones y acceso a la base de datos MySQL. |
