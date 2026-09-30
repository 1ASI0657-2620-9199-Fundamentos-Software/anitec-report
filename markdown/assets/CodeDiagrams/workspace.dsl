workspace "AniTec" "Plataforma de gestión ganadera — modelo C4 (Structurizr DSL). Archivo único: todas las vistas comparten un solo modelo, organizado por comentarios de sección según la iteración/sección del capítulo 4 a la que pertenece cada elemento." {

    !identifiers hierarchical

    model {

        # ============================================================================
        # 4.1 — Design Concepts, ViewPoints & ER Diagrams (as-built)
        # Personas, sistemas externos ya reales, y el sistema AniTec base.
        # ============================================================================

        rancher = person "Ganadero (Rancher)" "Gestiona su operación: hatos, corrales, animales, finanzas." "Usuario"
        veterinarian = person "Veterinario (Veterinarian)" "Emite diagnósticos, prescribe tratamientos, valida historiales clínicos." "Usuario"

        stripe = softwareSystem "Stripe" "Pasarela de pagos (modo de prueba). Integración real vía Stripe.net / SessionService." "Sistema Externo"
        resend = softwareSystem "Resend" "Mensajería de correo planeada para notificaciones. SIN integración real en el backend a la fecha de este informe (4.1.3)." "Sistema Externo, To-Be"

        # ---- 4.3.6 — Integración Real con Dispositivos IoT (to-be) ----
        iotDevice = softwareSystem "Dispositivo IoT" "Collar GPS, sensor de corral u otro dispositivo de campo. Reporta telemetría periódica autenticado por API key propia, no por JWT de usuario (Iteración 6, 4.3.6). NO existe ningún mecanismo de ingesta real a la fecha de este informe." "Sistema Externo, To-Be"

        anitec = softwareSystem "AniTec" "Plataforma de gestión ganadera para Latinoamérica." {

            # ---- 4.1.4 — Contenedores as-built ----
            landingPage = container "Landing Page" "Sitio estático de marketing (HTML/CSS/JS, i18n EN/ES)." "HTML/CSS/JS"
            webApplication = container "Web Application" "Sirve los archivos estáticos del SPA." "Static Hosting (GitHub Pages)"
            spa = container "Single Page Application" "Interfaz de usuario de AniTec. Autenticación stateless vía JWT." "Vue 3 + Vite"
            database = container "Database" "Almacena hatos, corrales, animales, registros sanitarios, financieros, suscripciones, etc. Una sola base compartida por los 12 bounded contexts (4.1.1.1)." "MySQL" "Database"

            apiApplication = container "API Application" "Expone la lógica de negocio de AniTec vía API REST. Monolito modular ASP.NET Core, un solo Program.cs, un solo .csproj (4.1.2)." "ASP.NET Core / C#" {

                # ---- 4.1.4 — Iam ----
                group "Iam" {
                    iam_UsersController = component "UsersController" "Expone api/v1/users." "ASP.NET Core REST Controller"
                    iam_AuthenticationController = component "AuthenticationController" "Expone api/v1/authentication (sign-in, sign-up)." "ASP.NET Core REST Controller"
                    iam_IUserRepository = component "IUserRepository" "Persistencia de User." "Repository Interface"
                    iam_IUserCommandService = component "IUserCommandService" "Comandos sobre User." "Command Service Interface"
                    iam_IUserQueryService = component "IUserQueryService" "Consultas sobre User." "Query Service Interface"
                    iam_IamContextFacade = component "IamContextFacade" "Fachada ACL — superficie de integración sancionada para que otros contextos consulten Iam sin acoplarse a su dominio interno." "C# Facade" "ACL Facade"
                    iam_TokenService = component "ITokenService" "Emisión/validación de JWT (ClaimTypes.Sid, ClaimTypes.Role)." "Outbound Service"
                    iam_HashingService = component "IHashingService" "Hashing BCrypt de contraseñas." "Outbound Service"

                    iam_UsersController -> iam_IUserCommandService "usa"
                    iam_UsersController -> iam_IUserQueryService "usa"
                    iam_AuthenticationController -> iam_IUserCommandService "usa"
                    iam_AuthenticationController -> iam_TokenService "usa"
                    iam_AuthenticationController -> iam_HashingService "usa"
                    iam_IUserCommandService -> iam_IUserRepository "usa"
                    iam_IUserQueryService -> iam_IUserRepository "usa"
                    iam_IamContextFacade -> iam_IUserQueryService "usa"
                }

                # ---- 4.1.4 — Profiles ----
                group "Profiles" {
                    profiles_ProfilesController = component "ProfilesController" "Expone api/v1/profiles." "ASP.NET Core REST Controller"
                    profiles_IProfileRepository = component "IProfileRepository" "Persistencia de Profile." "Repository Interface"
                    profiles_IProfileCommandService = component "IProfileCommandService" "Comandos sobre Profile." "Command Service Interface"
                    profiles_IProfileQueryService = component "IProfileQueryService" "Consultas sobre Profile." "Query Service Interface"
                    profiles_ProfilesContextFacade = component "ProfilesContextFacade" "Fachada ACL de Profiles." "C# Facade" "ACL Facade"

                    profiles_ProfilesController -> profiles_IProfileCommandService "usa"
                    profiles_ProfilesController -> profiles_IProfileQueryService "usa"
                    profiles_IProfileCommandService -> profiles_IProfileRepository "usa"
                    profiles_IProfileQueryService -> profiles_IProfileRepository "usa"
                }

                # ---- 4.1.4 — Livestock ----
                group "Livestock" {
                    livestock_AnimalsController = component "AnimalsController" "Expone api/v1/animals (incluye registro individual y por lote)." "ASP.NET Core REST Controller"
                    livestock_CorralsController = component "CorralsController" "Expone api/v1/corrals." "ASP.NET Core REST Controller"
                    livestock_HerdsController = component "HerdsController" "Expone api/v1/herds." "ASP.NET Core REST Controller"
                    livestock_IAnimalRepository = component "IAnimalRepository" "Persistencia de Animal." "Repository Interface"
                    livestock_ICorralRepository = component "ICorralRepository" "Persistencia de Corral." "Repository Interface"
                    livestock_IHerdRepository = component "IHerdRepository" "Persistencia de Herd." "Repository Interface"
                    livestock_IAnimalCommandService = component "IAnimalCommandService" "Comandos sobre Animal (incluye alta por lote)." "Command Service Interface"
                    livestock_ICorralCommandService = component "ICorralCommandService" "Comandos sobre Corral." "Command Service Interface"
                    livestock_IHerdCommandService = component "IHerdCommandService" "Comandos sobre Herd." "Command Service Interface"
                    livestock_IAnimalQueryService = component "IAnimalQueryService" "Consultas sobre Animal — SIN filtrado por propietario hoy (QAS-08, 4.3.2)." "Query Service Interface"
                    livestock_ICorralQueryService = component "ICorralQueryService" "Consultas sobre Corral." "Query Service Interface"
                    livestock_IHerdQueryService = component "IHerdQueryService" "Consultas sobre Herd." "Query Service Interface"

                    livestock_AnimalsController -> livestock_IAnimalCommandService "usa"
                    livestock_AnimalsController -> livestock_IAnimalQueryService "usa"
                    livestock_CorralsController -> livestock_ICorralCommandService "usa"
                    livestock_CorralsController -> livestock_ICorralQueryService "usa"
                    livestock_HerdsController -> livestock_IHerdCommandService "usa"
                    livestock_HerdsController -> livestock_IHerdQueryService "usa"
                    livestock_IAnimalCommandService -> livestock_IAnimalRepository "usa"
                    livestock_IAnimalQueryService -> livestock_IAnimalRepository "usa"
                    livestock_ICorralCommandService -> livestock_ICorralRepository "usa"
                    livestock_ICorralQueryService -> livestock_ICorralRepository "usa"
                    livestock_IHerdCommandService -> livestock_IHerdRepository "usa"
                    livestock_IHerdQueryService -> livestock_IHerdRepository "usa"
                }

                # ---- 4.1.4 — Sanitary ----
                group "Sanitary" {
                    sanitary_HealthEventsController = component "HealthEventsController" "Expone api/v1/health-events." "ASP.NET Core REST Controller"
                    sanitary_IHealthEventRepository = component "IHealthEventRepository" "Persistencia de HealthEvent." "Repository Interface"
                    sanitary_IHealthEventCommandService = component "IHealthEventCommandService" "Comandos sobre HealthEvent. NO soporta borrador/rectificación/anulación hoy (US-017/018, diseño to-be en 4.4.1)." "Command Service Interface"
                    sanitary_IHealthEventQueryService = component "IHealthEventQueryService" "Consultas sobre HealthEvent — SIN filtrado por propietario hoy (QAS-08, 4.3.2)." "Query Service Interface"

                    sanitary_HealthEventsController -> sanitary_IHealthEventCommandService "usa"
                    sanitary_HealthEventsController -> sanitary_IHealthEventQueryService "usa"
                    sanitary_IHealthEventCommandService -> sanitary_IHealthEventRepository "usa"
                    sanitary_IHealthEventQueryService -> sanitary_IHealthEventRepository "usa"
                }

                # ---- 4.1.4 — Financial ----
                group "Financial" {
                    financial_FinancialRecordsController = component "FinancialRecordsController" "Expone api/v1/financial-records." "ASP.NET Core REST Controller"
                    financial_IFinancialRecordRepository = component "IFinancialRecordRepository" "Persistencia de FinancialRecord." "Repository Interface"
                    financial_IFinancialRecordCommandService = component "IFinancialRecordCommandService" "Comandos sobre FinancialRecord." "Command Service Interface"
                    financial_IFinancialRecordQueryService = component "IFinancialRecordQueryService" "Consultas sobre FinancialRecord." "Query Service Interface"

                    financial_FinancialRecordsController -> financial_IFinancialRecordCommandService "usa"
                    financial_FinancialRecordsController -> financial_IFinancialRecordQueryService "usa"
                    financial_IFinancialRecordCommandService -> financial_IFinancialRecordRepository "usa"
                    financial_IFinancialRecordQueryService -> financial_IFinancialRecordRepository "usa"
                }

                # ---- 4.1.4 — Activities ----
                group "Activities" {
                    activities_FarmActivitiesController = component "FarmActivitiesController" "Expone api/v1/farm-events (nota: el slug de ruta no coincide con el nombre de la clase/entidad)." "ASP.NET Core REST Controller"
                    activities_IFarmActivityRepository = component "IFarmActivityRepository" "Persistencia de FarmActivity." "Repository Interface"
                    activities_IFarmActivityCommandService = component "IFarmActivityCommandService" "Comandos sobre FarmActivity." "Command Service Interface"
                    activities_IFarmActivityQueryService = component "IFarmActivityQueryService" "Consultas sobre FarmActivity." "Query Service Interface"

                    activities_FarmActivitiesController -> activities_IFarmActivityCommandService "usa"
                    activities_FarmActivitiesController -> activities_IFarmActivityQueryService "usa"
                    activities_IFarmActivityCommandService -> activities_IFarmActivityRepository "usa"
                    activities_IFarmActivityQueryService -> activities_IFarmActivityRepository "usa"
                }

                # ---- 4.1.4 — Analytics ----
                group "Analytics" {
                    analytics_ReportMetricsController = component "ReportMetricsController" "Expone api/v1/report-metrics." "ASP.NET Core REST Controller"
                    analytics_DashboardAnalyticsController = component "DashboardAnalyticsController" "Expone api/v1/analytics — agregador cruzado: compone dashboards a partir de otros bounded contexts." "ASP.NET Core REST Controller"
                    analytics_IReportMetricRepository = component "IReportMetricRepository" "Persistencia de ReportMetric." "Repository Interface"
                    analytics_IReportMetricCommandService = component "IReportMetricCommandService" "Comandos sobre ReportMetric." "Command Service Interface"
                    analytics_IReportMetricQueryService = component "IReportMetricQueryService" "Consultas sobre ReportMetric." "Query Service Interface"

                    analytics_ReportMetricsController -> analytics_IReportMetricCommandService "usa"
                    analytics_ReportMetricsController -> analytics_IReportMetricQueryService "usa"
                    analytics_IReportMetricCommandService -> analytics_IReportMetricRepository "usa"
                    analytics_IReportMetricQueryService -> analytics_IReportMetricRepository "usa"
                }

                # ---- 4.1.4 — Devices (base — la extensión IoT to-be vive en 4.3.6) ----
                group "Devices" {
                    devices_DevicesController = component "DevicesController" "Expone api/v1/devices." "ASP.NET Core REST Controller"
                    devices_IDeviceRepository = component "IDeviceRepository" "Persistencia de Device." "Repository Interface"
                    devices_IDeviceCommandService = component "IDeviceCommandService" "Comandos sobre Device." "Command Service Interface"
                    devices_IDeviceQueryService = component "IDeviceQueryService" "Consultas sobre Device." "Query Service Interface"

                    devices_DevicesController -> devices_IDeviceCommandService "usa"
                    devices_DevicesController -> devices_IDeviceQueryService "usa"
                    devices_IDeviceCommandService -> devices_IDeviceRepository "usa"
                    devices_IDeviceQueryService -> devices_IDeviceRepository "usa"
                }

                # ---- 4.1.4 — Metrics ----
                group "Metrics" {
                    metrics_DeviceMetricsController = component "DeviceMetricsController" "Expone api/v1/device-metrics." "ASP.NET Core REST Controller"
                    metrics_IDeviceMetricRepository = component "IDeviceMetricRepository" "Persistencia de DeviceMetric." "Repository Interface"
                    metrics_IDeviceMetricCommandService = component "IDeviceMetricCommandService" "Comandos sobre DeviceMetric." "Command Service Interface"
                    metrics_IDeviceMetricQueryService = component "IDeviceMetricQueryService" "Consultas sobre DeviceMetric." "Query Service Interface"

                    metrics_DeviceMetricsController -> metrics_IDeviceMetricCommandService "usa"
                    metrics_DeviceMetricsController -> metrics_IDeviceMetricQueryService "usa"
                    metrics_IDeviceMetricCommandService -> metrics_IDeviceMetricRepository "usa"
                    metrics_IDeviceMetricQueryService -> metrics_IDeviceMetricRepository "usa"
                }

                # ---- 4.1.4 — Subscriptions ----
                group "Subscriptions" {
                    subscriptions_SubscriptionsController = component "SubscriptionsController" "Expone api/v1/subscriptions — incluye checkout Stripe real y MockCheckout local." "ASP.NET Core REST Controller"
                    subscriptions_SubscriptionPlansController = component "SubscriptionPlansController" "Expone api/v1/subscription-plans." "ASP.NET Core REST Controller"
                    subscriptions_ISubscriptionRepository = component "ISubscriptionRepository" "Persistencia de Subscription." "Repository Interface"
                    subscriptions_ISubscriptionPlanRepository = component "ISubscriptionPlanRepository" "Persistencia de SubscriptionPlan." "Repository Interface"
                    subscriptions_IPaymentRepository = component "IPaymentRepository" "Persistencia de Payment." "Repository Interface"
                    subscriptions_ISubscriptionCommandService = component "ISubscriptionCommandService" "Comandos sobre Subscription." "Command Service Interface"
                    subscriptions_ISubscriptionPlanCommandService = component "ISubscriptionPlanCommandService" "Comandos sobre SubscriptionPlan. `max_animals` se persiste pero NO se aplica hoy (4.2.5)." "Command Service Interface"
                    subscriptions_IPaymentCommandService = component "IPaymentCommandService" "Comandos sobre Payment." "Command Service Interface"
                    subscriptions_ISubscriptionQueryService = component "ISubscriptionQueryService" "Consultas sobre Subscription." "Query Service Interface"
                    subscriptions_ISubscriptionPlanQueryService = component "ISubscriptionPlanQueryService" "Consultas sobre SubscriptionPlan." "Query Service Interface"
                    subscriptions_IPaymentQueryService = component "IPaymentQueryService" "Consultas sobre Payment." "Query Service Interface"

                    subscriptions_SubscriptionsController -> subscriptions_ISubscriptionCommandService "usa"
                    subscriptions_SubscriptionsController -> subscriptions_ISubscriptionQueryService "usa"
                    subscriptions_SubscriptionsController -> subscriptions_ISubscriptionPlanQueryService "usa"
                    subscriptions_SubscriptionsController -> subscriptions_IPaymentCommandService "usa"
                    subscriptions_SubscriptionsController -> subscriptions_IPaymentQueryService "usa"
                    subscriptions_SubscriptionPlansController -> subscriptions_ISubscriptionPlanCommandService "usa"
                    subscriptions_SubscriptionPlansController -> subscriptions_ISubscriptionPlanQueryService "usa"
                    subscriptions_ISubscriptionCommandService -> subscriptions_ISubscriptionRepository "usa"
                    subscriptions_ISubscriptionQueryService -> subscriptions_ISubscriptionRepository "usa"
                    subscriptions_ISubscriptionPlanCommandService -> subscriptions_ISubscriptionPlanRepository "usa"
                    subscriptions_ISubscriptionPlanQueryService -> subscriptions_ISubscriptionPlanRepository "usa"
                    subscriptions_IPaymentCommandService -> subscriptions_IPaymentRepository "usa"
                    subscriptions_IPaymentQueryService -> subscriptions_IPaymentRepository "usa"
                }

                # ---- 4.1.4 — Clients ----
                group "Clients" {
                    clients_VeterinarianClientsController = component "VeterinarianClientsController" "Expone api/v1/veterinarian. HOY crea la relación ya 'Accepted' — sin flujo de aprobación real (diseño to-be en 4.3.2)." "ASP.NET Core REST Controller"
                    clients_IVeterinarianClientRepository = component "IVeterinarianClientRepository" "Persistencia de VeterinarianClient." "Repository Interface"
                    clients_IVeterinarianClientCommandService = component "IVeterinarianClientCommandService" "Comandos sobre VeterinarianClient." "Command Service Interface"
                    clients_IVeterinarianClientQueryService = component "IVeterinarianClientQueryService" "Consultas sobre VeterinarianClient." "Query Service Interface"

                    clients_VeterinarianClientsController -> clients_IVeterinarianClientCommandService "usa"
                    clients_VeterinarianClientsController -> clients_IVeterinarianClientQueryService "usa"
                    clients_IVeterinarianClientCommandService -> clients_IVeterinarianClientRepository "usa"
                    clients_IVeterinarianClientQueryService -> clients_IVeterinarianClientRepository "usa"
                }

                # ---- 4.3.5 — Notifications (Iteración 5, to-be) ----
                group "Notifications" {
                    notifications_AlertsController = component "AlertsController" "Expone api/v1/alerts (confirmar/posponer/cerrar). NO existe hoy — diseño to-be (Iteración 5, 4.3.5)." "ASP.NET Core REST Controller" "To-Be"
                    notifications_IAlertRepository = component "IAlertRepository" "Persistencia de Alert." "Repository Interface" "To-Be"
                    notifications_IAlertCommandService = component "IAlertCommandService" "Comandos sobre Alert." "Command Service Interface" "To-Be"
                    notifications_IAlertQueryService = component "IAlertQueryService" "Consultas sobre Alert, filtradas por propietario (reutiliza el patrón QAS-08)." "Query Service Interface" "To-Be"
                    notifications_DueDateScanningService = component "DueDateScanningService" "BackgroundService — primer worker en segundo plano del sistema (4.4.3). Escanea vencimientos sin confirmar en Sanitary/Activities." "IHostedService" "To-Be"
                    notifications_IEmailNotificationService = component "IEmailNotificationService" "Envía notificación de alerta vía Resend, mismo patrón que ITokenService/IHashingService en Iam." "Outbound Service" "To-Be"

                    notifications_AlertsController -> notifications_IAlertCommandService "usa"
                    notifications_AlertsController -> notifications_IAlertQueryService "usa"
                    notifications_IAlertCommandService -> notifications_IAlertRepository "usa"
                    notifications_IAlertQueryService -> notifications_IAlertRepository "usa"
                    notifications_IAlertCommandService -> notifications_IEmailNotificationService "invoca al crear una alerta"
                    notifications_DueDateScanningService -> notifications_IAlertCommandService "crea alertas nuevas"
                    notifications_DueDateScanningService -> sanitary_IHealthEventQueryService "consulta vencimientos"
                    notifications_DueDateScanningService -> activities_IFarmActivityQueryService "consulta vencimientos"
                }

                # ---- 4.3.6 — Devices - IoT Ingestion (Iteración 6, to-be) ----
                group "Devices - IoT Ingestion" {
                    devices_DeviceApiKeyAuthenticationHandler = component "DeviceApiKeyAuthenticationHandler" "Esquema de autenticación independiente del JWT de usuario — valida X-Device-Api-Key contra Device.ApiKeyHash (Iteración 6, 4.3.6.5). NO existe hoy." "ASP.NET Core AuthenticationHandler" "To-Be"
                    devices_TelemetryEndpoint = component "POST .../telemetry" "Ingesta de lecturas de dispositivo, autenticado por API key, delega en IDeviceMetricCommandService (Iteración 6). NO existe hoy." "ASP.NET Core REST Endpoint" "To-Be"

                    devices_TelemetryEndpoint -> devices_DeviceApiKeyAuthenticationHandler "se autentica vía"
                    devices_TelemetryEndpoint -> metrics_IDeviceMetricCommandService "usa (reutiliza, no duplica)"
                }

                # ---- 4.1.4 — Shared ----
                group "Shared" {
                    shared_AppDbContext = component "AppDbContext" "DbContext único de EF Core, compartido por los 12 bounded contexts." "EF Core DbContext"
                    shared_BaseRepository = component "BaseRepository / IUnitOfWork" "Implementación base de repositorio + unidad de trabajo, reutilizada por todos los contextos." "Infrastructure"
                    shared_AuditableEntityInterceptor = component "AuditableEntityInterceptor" "Rellena CreatedAt/UpdatedAt para entidades IAuditableEntity (hoy: solo User y Profile)." "EF Core Interceptor"
                    shared_GlobalExceptionHandlerMiddleware = component "GlobalExceptionHandlerMiddleware" "Middleware transversal de manejo de errores no controlados." "Middleware"
                    shared_ProblemDetailsFactory = component "ProblemDetailsFactory" "Construye respuestas de error RFC 7807 consistentes entre contextos." "Infrastructure"
                }

                # ---- 4.3.7 — Shared - Auditoría (Iteración 7, to-be) ----
                group "Shared - Auditoría" {
                    shared_AuditLogger = component "AuditLogger" "Registra una fila en audit_log por operación sensible (rectificar/anular sanitario, aprobar/rechazar/revocar veterinario-cliente), enlazada al X-Correlation-Id de la petición. NO existe hoy — diseño to-be (4.3.7.5)." "Application Service" "To-Be"

                    shared_AuditLogger -> shared_AppDbContext "usa"
                    sanitary_IHealthEventCommandService -> shared_AuditLogger "invoca al rectificar/anular (US-018)"
                    clients_IVeterinarianClientCommandService -> shared_AuditLogger "invoca al aprobar/rechazar/revocar"
                }

                # ---- 4.1.4 — Relaciones cruzadas entre bounded contexts (verificadas en Program.cs / constructores) ----
                analytics_DashboardAnalyticsController -> activities_IFarmActivityQueryService "usa (agregador de dashboard)"
                analytics_DashboardAnalyticsController -> clients_IVeterinarianClientQueryService "usa (agregador de dashboard)"
                analytics_DashboardAnalyticsController -> devices_IDeviceQueryService "usa (agregador de dashboard)"
                analytics_DashboardAnalyticsController -> financial_IFinancialRecordQueryService "usa (agregador de dashboard)"
                analytics_DashboardAnalyticsController -> livestock_IAnimalQueryService "usa (agregador de dashboard)"
                analytics_DashboardAnalyticsController -> sanitary_IHealthEventQueryService "usa (agregador de dashboard)"

                clients_VeterinarianClientsController -> iam_IUserQueryService "usa"
                clients_VeterinarianClientsController -> livestock_IHerdQueryService "usa"
                clients_VeterinarianClientsController -> livestock_IAnimalQueryService "usa"

                devices_DevicesController -> metrics_IDeviceMetricQueryService "usa"

                # ---- Todas las implementaciones de Repository dependen de la infraestructura compartida ----
                iam_IUserRepository -> shared_BaseRepository "implementa vía"
                profiles_IProfileRepository -> shared_BaseRepository "implementa vía"
                livestock_IAnimalRepository -> shared_BaseRepository "implementa vía"
                livestock_ICorralRepository -> shared_BaseRepository "implementa vía"
                livestock_IHerdRepository -> shared_BaseRepository "implementa vía"
                sanitary_IHealthEventRepository -> shared_BaseRepository "implementa vía"
                financial_IFinancialRecordRepository -> shared_BaseRepository "implementa vía"
                activities_IFarmActivityRepository -> shared_BaseRepository "implementa vía"
                analytics_IReportMetricRepository -> shared_BaseRepository "implementa vía"
                devices_IDeviceRepository -> shared_BaseRepository "implementa vía"
                metrics_IDeviceMetricRepository -> shared_BaseRepository "implementa vía"
                subscriptions_ISubscriptionRepository -> shared_BaseRepository "implementa vía"
                subscriptions_ISubscriptionPlanRepository -> shared_BaseRepository "implementa vía"
                subscriptions_IPaymentRepository -> shared_BaseRepository "implementa vía"
                clients_IVeterinarianClientRepository -> shared_BaseRepository "implementa vía"
                shared_BaseRepository -> shared_AppDbContext "usa"
                shared_AppDbContext -> shared_AuditableEntityInterceptor "aplica"
            }

            # ============================================================================
            # 4.3.3 — Iteration 3: Extracción de Servicios Críticos y API Gateway (to-be)
            # ============================================================================
            apiGateway = container "API Gateway" "Único punto de entrada del SPA/Mobile App. Enruta por prefijo de ruta hacia Core API o Subscriptions Service. NO existe hoy — diseño to-be (4.3.3)." "YARP" "To-Be"
            subscriptionsService = container "Subscriptions Service" "Subscriptions extraído como servicio independientemente desplegable, con su propia base de datos. NO existe hoy — diseño to-be (4.3.3)." "ASP.NET Core / C#" "To-Be"
            subscriptionsDatabase = container "Subscriptions Database" "Base de datos exclusiva del Subscriptions Service (subscription_plans, subscriptions, payments). NO existe hoy — diseño to-be (4.3.3)." "MySQL" "Database, To-Be"

            # ============================================================================
            # 4.3.4 — Iteration 4: Sincronización Edge-to-Cloud (to-be)
            # ============================================================================
            mobileApp = container "AniTec Mobile App" "Cliente offline-first (Room/SQLite, WorkManager). NO existe ningún código a la fecha de este informe — diseño to-be (4.3.4, EP-014)." "Kotlin, Android, Room" "To-Be"
        }

        # ============================================================================
        # 4.1.4 — Relaciones as-built a nivel de contenedor/sistema
        # ============================================================================
        rancher -> anitec.spa "Usa" "HTTPS"
        veterinarian -> anitec.spa "Usa" "HTTPS"
        rancher -> anitec.landingPage "Visita" "HTTPS"
        veterinarian -> anitec.landingPage "Visita" "HTTPS"

        anitec.webApplication -> anitec.spa "Sirve" "HTTPS"
        anitec.spa -> anitec.apiApplication "Hace llamadas a" "JSON/HTTPS"
        anitec.apiApplication -> anitec.database "Lee y escribe en" "Entity Framework Core / MySQL"
        anitec.apiApplication -> stripe "Crea sesiones de checkout, consulta suscripciones" "HTTPS/REST (Stripe.net)"
        anitec.apiApplication -> resend "Envía notificaciones (TO-BE — sin integración real)" "HTTPS/REST"

        # ---- 4.1.4 — SPA -> controladores por bounded context (borde de entrada de cada diagrama de componentes) ----
        anitec.spa -> anitec.apiApplication.iam_UsersController "Consulta usuarios" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.iam_AuthenticationController "Inicia sesión / se registra" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.profiles_ProfilesController "Gestiona perfiles" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.livestock_AnimalsController "Gestiona animales" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.livestock_CorralsController "Gestiona corrales" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.livestock_HerdsController "Gestiona hatos" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.sanitary_HealthEventsController "Gestiona registros sanitarios" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.financial_FinancialRecordsController "Gestiona movimientos financieros" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.activities_FarmActivitiesController "Gestiona actividades" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.analytics_ReportMetricsController "Consulta métricas" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.analytics_DashboardAnalyticsController "Consulta dashboards" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.devices_DevicesController "Gestiona dispositivos" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.metrics_DeviceMetricsController "Consulta métricas de dispositivo" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.subscriptions_SubscriptionsController "Gestiona suscripciones/pagos" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.subscriptions_SubscriptionPlansController "Consulta planes" "JSON/HTTPS"
        anitec.spa -> anitec.apiApplication.clients_VeterinarianClientsController "Gestiona relaciones veterinario-ganadero" "JSON/HTTPS"

        # ---- 4.1.4 — AppDbContext -> Database (borde de salida de cada diagrama de componentes) ----
        anitec.apiApplication.shared_AppDbContext -> anitec.database "Lee y escribe en" "EF Core / MySQL"

        # ---- 4.1.4 — SubscriptionsController -> Stripe (borde de salida específico de Subscriptions) ----
        anitec.apiApplication.subscriptions_SubscriptionsController -> stripe "Crea sesiones de checkout, consulta suscripciones" "HTTPS/REST (Stripe.net)"

        # ============================================================================
        # 4.3.3 — Relaciones TO-BE (Gateway + Subscriptions extraído)
        # ============================================================================
        anitec.spa -> anitec.apiGateway "Hace llamadas a (reemplaza la llamada directa a apiApplication)" "JSON/HTTPS"
        anitec.apiGateway -> anitec.apiApplication "Enruta /api/v1/* (excepto subscriptions)" "JSON/HTTPS"
        anitec.apiGateway -> anitec.subscriptionsService "Enruta /api/v1/subscriptions*, /api/v1/subscription-plans*, /api/v1/payments*" "JSON/HTTPS"
        anitec.subscriptionsService -> anitec.subscriptionsDatabase "Lee y escribe en" "Entity Framework Core / MySQL"
        anitec.subscriptionsService -> stripe "Crea sesiones de checkout, consulta suscripciones" "HTTPS/REST (Stripe.net)"

        # ============================================================================
        # 4.3.4 — Relaciones TO-BE (Mobile App + sync)
        # ============================================================================
        rancher -> anitec.mobileApp "Usa en campo, sin conexión" ""
        veterinarian -> anitec.mobileApp "Usa en campo, sin conexión" ""
        anitec.mobileApp -> anitec.apiGateway "Sincroniza lote de operaciones pendientes" "JSON/HTTPS (POST /api/v1/sync/batch)"

        # ============================================================================
        # 4.3.6 — Relación TO-BE (Integración Real con Dispositivos IoT)
        # ============================================================================
        iotDevice -> anitec.apiApplication "Envía telemetría periódica, autenticado por API key (no JWT de usuario)" "HTTPS/REST (POST /devices/{id}/telemetry)"

        # ============================================================================
        # 4.4.4 — Physical View / Deployment — verificado contra Dockerfile,
        # .env.production y Program.cs (GetConnectionString).
        # ============================================================================
        prod = deploymentEnvironment "Production" {
            deploymentNode "Cliente" "Navegador del usuario" "Web Browser" {
                containerInstance anitec.spa
            }
            deploymentNode "GitHub Pages" "Hosting estático (gh-pages -d dist)" "Static Site Hosting" {
                containerInstance anitec.webApplication
                containerInstance anitec.landingPage
            }
            deploymentNode "Render" "Contenedor Docker — build multi-stage sobre mcr.microsoft.com/dotnet/sdk:10.0 y aspnet:10.0, puerto interno 8080 (anitec-backend.onrender.com)" "Docker Container" {
                containerInstance anitec.apiApplication
            }
            deploymentNode "Servidor MySQL" "Proveedor físico exacto no verificable desde el repositorio — la cadena de conexión se inyecta por variable de entorno DefaultConnection (4.4.4), no está versionada en el código." "MySQL 8.x" {
                containerInstance anitec.database
            }
        }
    }

    views {

        # ---- 4.1.3 / 4.1.4 ----
        systemContext anitec "01-SystemContext" "Diagrama de Contexto — AniTec (corresponde a 4.1.3)." {
            include *
            autoLayout lr
        }

        container anitec "02-Containers-AsBuilt" "Diagrama de Contenedores — sistema real hoy (corresponde a 4.1.4, con MySQL corregido y tecnologías completas). Excluye Gateway, Subscriptions Service/DB y Mobile App (to-be)." {
            include rancher veterinarian anitec.landingPage anitec.webApplication anitec.spa anitec.apiApplication anitec.database stripe resend
            autoLayout lr
        }

        # ---- 4.3.3 ----
        container anitec "03-Containers-Iteration3-Gateway" "Diagrama de Contenedores — TO-BE tras la Iteración 3: extracción de Subscriptions + API Gateway (corresponde a 4.3.3.6)." {
            include rancher veterinarian anitec.landingPage anitec.webApplication anitec.spa anitec.apiGateway anitec.apiApplication anitec.database anitec.subscriptionsService anitec.subscriptionsDatabase stripe resend
            autoLayout lr
        }

        # ---- 4.3.4 ----
        container anitec "04-Containers-Iteration4-MobileSync" "Diagrama de Contenedores — TO-BE tras la Iteración 4: se agrega AniTec Mobile App (corresponde a 4.3.4.6). Estado objetivo del sistema hasta esta iteración." {
            include rancher veterinarian anitec.landingPage anitec.webApplication anitec.spa anitec.apiGateway anitec.apiApplication anitec.database anitec.subscriptionsService anitec.subscriptionsDatabase anitec.mobileApp stripe resend
            autoLayout lr
        }

        # ---- 4.1.4 — Componentes base (12 bounded contexts) ----
        component anitec.apiApplication "05-Components-Iam" "Diagrama de Componentes — Iam (corresponde a 4.1.4)." {
            include anitec.spa anitec.apiApplication.iam_UsersController anitec.apiApplication.iam_AuthenticationController anitec.apiApplication.iam_IUserRepository anitec.apiApplication.iam_IUserCommandService anitec.apiApplication.iam_IUserQueryService anitec.apiApplication.iam_IamContextFacade anitec.apiApplication.iam_TokenService anitec.apiApplication.iam_HashingService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "06-Components-Profiles" "Diagrama de Componentes — Profiles (corresponde a 4.1.4)." {
            include anitec.spa anitec.apiApplication.profiles_ProfilesController anitec.apiApplication.profiles_IProfileRepository anitec.apiApplication.profiles_IProfileCommandService anitec.apiApplication.profiles_IProfileQueryService anitec.apiApplication.profiles_ProfilesContextFacade anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "07-Components-Livestock" "Diagrama de Componentes — Livestock (corresponde a 4.1.4; incluye Corral, agregado este ciclo)." {
            include anitec.spa anitec.apiApplication.livestock_AnimalsController anitec.apiApplication.livestock_CorralsController anitec.apiApplication.livestock_HerdsController anitec.apiApplication.livestock_IAnimalRepository anitec.apiApplication.livestock_ICorralRepository anitec.apiApplication.livestock_IHerdRepository anitec.apiApplication.livestock_IAnimalCommandService anitec.apiApplication.livestock_ICorralCommandService anitec.apiApplication.livestock_IHerdCommandService anitec.apiApplication.livestock_IAnimalQueryService anitec.apiApplication.livestock_ICorralQueryService anitec.apiApplication.livestock_IHerdQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "08-Components-Sanitary" "Diagrama de Componentes — Sanitary (corresponde a 4.1.4)." {
            include anitec.spa anitec.apiApplication.sanitary_HealthEventsController anitec.apiApplication.sanitary_IHealthEventRepository anitec.apiApplication.sanitary_IHealthEventCommandService anitec.apiApplication.sanitary_IHealthEventQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "09-Components-Financial" "Diagrama de Componentes — Financial (corresponde a 4.1.4)." {
            include anitec.spa anitec.apiApplication.financial_FinancialRecordsController anitec.apiApplication.financial_IFinancialRecordRepository anitec.apiApplication.financial_IFinancialRecordCommandService anitec.apiApplication.financial_IFinancialRecordQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "10-Components-Activities" "Diagrama de Componentes — Activities (corresponde a 4.1.4)." {
            include anitec.spa anitec.apiApplication.activities_FarmActivitiesController anitec.apiApplication.activities_IFarmActivityRepository anitec.apiApplication.activities_IFarmActivityCommandService anitec.apiApplication.activities_IFarmActivityQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "11-Components-Analytics" "Diagrama de Componentes — Analytics (corresponde a 4.1.4; DashboardAnalyticsController agrega datos de otros 6 contextos)." {
            include anitec.spa anitec.apiApplication.analytics_ReportMetricsController anitec.apiApplication.analytics_DashboardAnalyticsController anitec.apiApplication.analytics_IReportMetricRepository anitec.apiApplication.analytics_IReportMetricCommandService anitec.apiApplication.analytics_IReportMetricQueryService anitec.apiApplication.activities_IFarmActivityQueryService anitec.apiApplication.clients_IVeterinarianClientQueryService anitec.apiApplication.devices_IDeviceQueryService anitec.apiApplication.financial_IFinancialRecordQueryService anitec.apiApplication.livestock_IAnimalQueryService anitec.apiApplication.sanitary_IHealthEventQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "12-Components-Devices" "Diagrama de Componentes — Devices (corresponde a 4.1.4; el canal de ingesta IoT to-be tiene su propio diagrama, ver 18)." {
            include anitec.spa anitec.apiApplication.devices_DevicesController anitec.apiApplication.devices_IDeviceRepository anitec.apiApplication.devices_IDeviceCommandService anitec.apiApplication.devices_IDeviceQueryService anitec.apiApplication.metrics_IDeviceMetricQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "13-Components-Metrics" "Diagrama de Componentes — Metrics (corresponde a 4.1.4; cierra el vacío de documentación señalado en la Iteración 1, 4.3.1.5)." {
            include anitec.spa anitec.apiApplication.metrics_DeviceMetricsController anitec.apiApplication.metrics_IDeviceMetricRepository anitec.apiApplication.metrics_IDeviceMetricCommandService anitec.apiApplication.metrics_IDeviceMetricQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "14-Components-Subscriptions" "Diagrama de Componentes — Subscriptions (corresponde a 4.1.4; candidato de extracción de la Iteración 3)." {
            include anitec.spa anitec.apiApplication.subscriptions_SubscriptionsController anitec.apiApplication.subscriptions_SubscriptionPlansController anitec.apiApplication.subscriptions_ISubscriptionRepository anitec.apiApplication.subscriptions_ISubscriptionPlanRepository anitec.apiApplication.subscriptions_IPaymentRepository anitec.apiApplication.subscriptions_ISubscriptionCommandService anitec.apiApplication.subscriptions_ISubscriptionPlanCommandService anitec.apiApplication.subscriptions_IPaymentCommandService anitec.apiApplication.subscriptions_ISubscriptionQueryService anitec.apiApplication.subscriptions_ISubscriptionPlanQueryService anitec.apiApplication.subscriptions_IPaymentQueryService stripe anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "15-Components-Clients" "Diagrama de Componentes — Clients (corresponde a 4.1.4; cierra el vacío de documentación señalado en la Iteración 1, 4.3.1.5)." {
            include anitec.spa anitec.apiApplication.clients_VeterinarianClientsController anitec.apiApplication.clients_IVeterinarianClientRepository anitec.apiApplication.clients_IVeterinarianClientCommandService anitec.apiApplication.clients_IVeterinarianClientQueryService anitec.apiApplication.iam_IUserQueryService anitec.apiApplication.livestock_IHerdQueryService anitec.apiApplication.livestock_IAnimalQueryService anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AppDbContext anitec.database
            autoLayout lr
        }

        component anitec.apiApplication "16-Components-Shared" "Diagrama de Componentes — Shared (infraestructura transversal, corresponde a 4.1.4; incluye AuditLogger to-be de la Iteración 7, 4.3.7)." {
            include anitec.apiApplication.shared_AppDbContext anitec.apiApplication.shared_BaseRepository anitec.apiApplication.shared_AuditableEntityInterceptor anitec.apiApplication.shared_GlobalExceptionHandlerMiddleware anitec.apiApplication.shared_ProblemDetailsFactory anitec.apiApplication.shared_AuditLogger anitec.database
            autoLayout lr
        }

        # ---- 4.3.5 ----
        component anitec.apiApplication "17-Components-Notifications" "Diagrama de Componentes — Notifications, bounded context nuevo (to-be, corresponde a la Iteración 5, 4.3.5)." {
            include anitec.apiApplication.notifications_AlertsController anitec.apiApplication.notifications_IAlertRepository anitec.apiApplication.notifications_IAlertCommandService anitec.apiApplication.notifications_IAlertQueryService anitec.apiApplication.notifications_DueDateScanningService anitec.apiApplication.notifications_IEmailNotificationService anitec.apiApplication.sanitary_IHealthEventQueryService anitec.apiApplication.activities_IFarmActivityQueryService resend
            autoLayout lr
        }

        # ---- 4.3.6 ----
        component anitec.apiApplication "18-Components-Devices-IoT" "Diagrama de Componentes — canal de ingesta IoT (to-be, corresponde a la Iteración 6, 4.3.6)." {
            include anitec.apiApplication.devices_DeviceApiKeyAuthenticationHandler anitec.apiApplication.devices_TelemetryEndpoint anitec.apiApplication.metrics_IDeviceMetricCommandService iotDevice
            autoLayout lr
        }

        # ---- 4.4.4 ----
        deployment anitec "Production" "19-Deployment-Production" "Diagrama de Despliegue — Physical View (corresponde a 4.4.4)." {
            include *
            autoLayout lr
        }

        styles {
            element "Usuario" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Sistema Externo" {
                background #999999
                color #ffffff
            }
            element "To-Be" {
                background #ffffff
                color #d04a02
                stroke #d04a02
                strokeWidth 3
            }
            element "Database" {
                shape Cylinder
            }
            element "ACL Facade" {
                background #6db33f
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
        }
    }

}
