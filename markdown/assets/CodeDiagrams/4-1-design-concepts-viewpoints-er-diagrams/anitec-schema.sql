-- ============================================================================
-- AniTec — Esquema relacional real (MySQL 8.x, Pomelo.EntityFrameworkCore.MySql)
-- ============================================================================
-- Fuente de verdad: extraído de AppDbContextModelSnapshot.cs (backend real),
-- documentado en anitec-report/markdown/content/chapter-4/
--   4-1-design-concepts-viewpoints-er-diagrams.md (sección 4.1.5).
--
-- Convenciones de nombrado (UseSnakeCaseNamingConvention, aplicada una sola
-- vez por EF Core, no mapeada a mano por entidad):
--   Primary Key  -> p_k_<tabla>
--   Foreign Key  -> f_k_<tabla>__<referencia>
--   Index        -> i_x_<tabla>_<columna>
--
-- IMPORTANTE — coherente con el principio arquitectónico 4.1.1.1 (aislamiento
-- por bounded context, incluso compartiendo base de datos): las referencias
-- HACIA la tabla `users` (owner_id, veterinarian_id, rancher_id, user_id)
-- son lógicas, NO llaves foráneas reales. Añadir esas FKs rompería el
-- aislamiento entre IAM y el resto de los 11 bounded contexts. Este script
-- las deja comentadas para que quede explícito en el diagrama por qué no
-- existen, en vez de omitirlas silenciosamente.
--
-- Uso previsto: importar este archivo en la herramienta de modelado (Visual
-- Paradigm / lo que se use para generar el .erd) para producir el Diagrama
-- Relacional de la sección 4.1.5. No se ejecuta contra una base de datos real
-- desde este repositorio de documentación.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Bounded Context: IAM
-- ----------------------------------------------------------------------------
CREATE TABLE users (
    id              INT             NOT NULL AUTO_INCREMENT,
    username        VARCHAR(80)     NOT NULL,
    full_name       VARCHAR(120)    NOT NULL,
    role            VARCHAR(40)     NOT NULL,
    password_hash   LONGTEXT        NOT NULL,           -- hash BCrypt
    created_at      DATETIME(6)     NULL,                -- IAuditableEntity
    updated_at      DATETIME(6)     NULL,                -- IAuditableEntity
    CONSTRAINT p_k_users PRIMARY KEY (id)
    -- Nota: no existe índice único sobre `username` hoy (riesgo documentado
    -- en 4.2.5, Architectural Concern #6).
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Profiles
-- ----------------------------------------------------------------------------
CREATE TABLE profiles (
    id                     INT           NOT NULL AUTO_INCREMENT,
    first_name             LONGTEXT      NOT NULL,       -- Value Object PersonName
    last_name              LONGTEXT      NOT NULL,       -- Value Object PersonName
    email_address          LONGTEXT      NOT NULL,       -- Value Object EmailAddress
    address_street         LONGTEXT      NOT NULL,       -- Value Object StreetAddress
    address_number         LONGTEXT      NOT NULL,
    address_city           LONGTEXT      NOT NULL,
    address_postal_code    LONGTEXT      NOT NULL,
    address_country        LONGTEXT      NOT NULL,
    created_at             DATETIME(6)   NULL,            -- IAuditableEntity
    updated_at             DATETIME(6)   NULL,            -- IAuditableEntity
    CONSTRAINT p_k_profiles PRIMARY KEY (id)
    -- user_id: no existe columna de referencia real en el esquema actual;
    -- la asociación Profile<->User se resuelve por convención de ID en la
    -- capa de aplicación, no por FK de base de datos.
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Livestock
-- ----------------------------------------------------------------------------
CREATE TABLE herds (
    id                  INT             NOT NULL AUTO_INCREMENT,
    name                VARCHAR(80)     NOT NULL,
    location            VARCHAR(80)     NOT NULL,
    owner               VARCHAR(80)     NOT NULL,
    owner_id            INT             NOT NULL,         -- referencia lógica a users.id, SIN FK real
    veterinarian_id     INT             NULL,              -- referencia lógica a users.id, SIN FK real
    main_type           VARCHAR(40)     NOT NULL,
    CONSTRAINT p_k_herds PRIMARY KEY (id)
);

CREATE TABLE corrals (
    id          INT             NOT NULL AUTO_INCREMENT,
    name        VARCHAR(80)     NOT NULL,
    herd_id     INT             NOT NULL,
    CONSTRAINT p_k_corrals PRIMARY KEY (id),
    CONSTRAINT f_k_corrals__herds FOREIGN KEY (herd_id) REFERENCES herds (id) ON DELETE RESTRICT,
    INDEX i_x_corrals_herd_id (herd_id)
);

CREATE TABLE animals (
    id          INT             NOT NULL AUTO_INCREMENT,
    tag         VARCHAR(30)     NOT NULL,
    name        VARCHAR(80)     NOT NULL,
    species     VARCHAR(40)     NOT NULL,                  -- texto simple, NO es FK
    breed       VARCHAR(60)     NOT NULL,                  -- texto simple, NO es FK
    gender      VARCHAR(20)     NOT NULL,
    birth_date  DATETIME(6)     NULL,
    weight      DECIMAL(18,2)   NOT NULL,
    status      VARCHAR(30)     NOT NULL,
    herd_id     INT             NOT NULL,
    corral_id   INT             NULL,
    source      VARCHAR(40)     NULL,
    age_range   VARCHAR(20)     NULL,
    image_url   VARCHAR(300)    NULL,
    CONSTRAINT p_k_animals PRIMARY KEY (id),
    CONSTRAINT f_k_animals__herds FOREIGN KEY (herd_id) REFERENCES herds (id) ON DELETE RESTRICT,
    CONSTRAINT f_k_animals__corrals FOREIGN KEY (corral_id) REFERENCES corrals (id) ON DELETE SET NULL,
    INDEX i_x_animals_herd_id (herd_id),
    INDEX i_x_animals_corral_id (corral_id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Sanitary
-- ----------------------------------------------------------------------------
CREATE TABLE health_events (
    id              INT             NOT NULL AUTO_INCREMENT,
    animal_id       INT             NOT NULL,
    type            VARCHAR(40)     NOT NULL,
    date            DATETIME(6)     NOT NULL,
    description     VARCHAR(500)    NOT NULL,
    veterinarian    VARCHAR(80)     NOT NULL,
    diagnosis       LONGTEXT        NOT NULL,
    treatment       LONGTEXT        NOT NULL,
    prescription    LONGTEXT        NOT NULL,
    follow_up       LONGTEXT        NOT NULL,
    next_due_date   DATETIME(6)     NULL,
    -- Columnas propuestas (to-be, sección 4.4.1) para soportar el ciclo de
    -- vida Borrador/Finalizado/Rectificado/Anulado (US-017/US-018).
    -- HOY NO EXISTEN en el backend real — se dejan comentadas para que el
    -- diagrama distinga explícitamente as-built de to-be, sin fabricar una
    -- columna que el código no tiene:
    -- status              VARCHAR(20)     NULL,   -- Draft | Finalized | Rectified | Annulled
    -- rectifies_event_id  INT             NULL,   -- FK -> health_events.id (auto-referencia)
    -- rectification_reason LONGTEXT       NULL,
    CONSTRAINT p_k_health_events PRIMARY KEY (id),
    CONSTRAINT f_k_health_events__animals FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE,
    INDEX i_x_health_events_animal_id (animal_id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Financial
-- ----------------------------------------------------------------------------
CREATE TABLE financial_records (
    id              INT             NOT NULL AUTO_INCREMENT,
    owner_id        INT             NOT NULL,              -- referencia lógica a users.id, SIN FK real
    type            VARCHAR(20)     NOT NULL,
    category        VARCHAR(80)     NOT NULL,
    amount          DECIMAL(10,2)   NOT NULL,
    date            DATETIME(6)     NOT NULL,
    description     LONGTEXT        NOT NULL,
    CONSTRAINT p_k_financial_records PRIMARY KEY (id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Activities
-- ----------------------------------------------------------------------------
CREATE TABLE farm_activities (
    id                  INT             NOT NULL AUTO_INCREMENT,
    owner_id            INT             NULL,              -- referencia lógica a users.id, SIN FK real
    veterinarian_id     INT             NULL,              -- referencia lógica a users.id, SIN FK real
    title               VARCHAR(120)    NOT NULL,
    type                VARCHAR(40)     NOT NULL,
    date                DATETIME(6)     NOT NULL,
    priority            VARCHAR(20)     NOT NULL,
    status              VARCHAR(30)     NOT NULL,
    CONSTRAINT p_k_farm_activities PRIMARY KEY (id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Analytics
-- ----------------------------------------------------------------------------
CREATE TABLE report_metrics (
    id      INT             NOT NULL AUTO_INCREMENT,
    label   VARCHAR(80)     NOT NULL,
    value   VARCHAR(40)     NOT NULL,
    trend   VARCHAR(80)     NOT NULL,
    CONSTRAINT p_k_report_metrics PRIMARY KEY (id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Devices
-- ----------------------------------------------------------------------------
CREATE TABLE devices (
    id              INT             NOT NULL AUTO_INCREMENT,
    name            VARCHAR(80)     NOT NULL,
    type            VARCHAR(60)     NOT NULL,
    serial_number   VARCHAR(80)     NOT NULL,
    status          VARCHAR(30)     NOT NULL,
    herd_id         INT             NULL,
    animal_id       INT             NULL,
    CONSTRAINT p_k_devices PRIMARY KEY (id),
    CONSTRAINT f_k_devices__herds FOREIGN KEY (herd_id) REFERENCES herds (id) ON DELETE SET NULL,
    CONSTRAINT f_k_devices__animals FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE SET NULL,
    INDEX i_x_devices_herd_id (herd_id),
    INDEX i_x_devices_animal_id (animal_id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Metrics
-- ----------------------------------------------------------------------------
CREATE TABLE device_metrics (
    id              INT             NOT NULL AUTO_INCREMENT,
    device_id       INT             NOT NULL,
    type            VARCHAR(60)     NOT NULL,
    value           DECIMAL(12,2)   NOT NULL,
    unit            VARCHAR(20)     NOT NULL,
    recorded_at     DATETIME(6)     NOT NULL,
    CONSTRAINT p_k_device_metrics PRIMARY KEY (id),
    CONSTRAINT f_k_device_metrics__devices FOREIGN KEY (device_id) REFERENCES devices (id) ON DELETE CASCADE,
    INDEX i_x_device_metrics_device_id (device_id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Subscriptions
-- ----------------------------------------------------------------------------
CREATE TABLE subscription_plans (
    id                  INT             NOT NULL AUTO_INCREMENT,
    name                VARCHAR(80)     NOT NULL,
    price               DECIMAL(10,2)   NOT NULL,
    stripe_price_id     VARCHAR(120)    NOT NULL,
    max_animals         INT             NOT NULL,          -- almacenado pero NO aplicado en el código (riesgo 4.2.5)
    is_active           TINYINT(1)      NOT NULL,
    CONSTRAINT p_k_subscription_plans PRIMARY KEY (id)
);

CREATE TABLE subscriptions (
    id                          INT             NOT NULL AUTO_INCREMENT,
    user_id                     INT             NOT NULL,  -- referencia lógica a users.id, SIN FK real
    plan_id                     INT             NOT NULL,
    stripe_customer_id          VARCHAR(120)    NOT NULL,
    stripe_subscription_id      VARCHAR(120)    NOT NULL,
    status                      VARCHAR(40)     NOT NULL,
    started_at                  DATETIME(6)     NOT NULL,
    ends_at                     DATETIME(6)     NULL,
    CONSTRAINT p_k_subscriptions PRIMARY KEY (id),
    CONSTRAINT f_k_subscriptions__subscription_plans FOREIGN KEY (plan_id) REFERENCES subscription_plans (id) ON DELETE RESTRICT,
    INDEX i_x_subscriptions_plan_id (plan_id)
);

CREATE TABLE payments (
    id                      INT             NOT NULL AUTO_INCREMENT,
    user_id                 INT             NOT NULL,      -- referencia lógica a users.id, SIN FK real
    subscription_id         INT             NOT NULL,
    amount                  DECIMAL(10,2)   NOT NULL,
    currency                VARCHAR(10)     NOT NULL,
    provider                VARCHAR(40)     NOT NULL,
    provider_payment_id     VARCHAR(120)    NOT NULL,
    status                  VARCHAR(40)     NOT NULL,
    paid_at                 DATETIME(6)     NOT NULL,
    CONSTRAINT p_k_payments PRIMARY KEY (id),
    CONSTRAINT f_k_payments__subscriptions FOREIGN KEY (subscription_id) REFERENCES subscriptions (id) ON DELETE CASCADE,
    INDEX i_x_payments_subscription_id (subscription_id)
);

-- ----------------------------------------------------------------------------
-- Bounded Context: Clients
-- ----------------------------------------------------------------------------
CREATE TABLE veterinarian_clients (
    id                  INT             NOT NULL AUTO_INCREMENT,
    veterinarian_id     INT             NOT NULL,          -- referencia lógica a users.id, SIN FK real
    rancher_id          INT             NOT NULL,          -- referencia lógica a users.id, SIN FK real
    status              VARCHAR(30)     NOT NULL,          -- hoy siempre nace "Accepted" (riesgo QAS-08/4.3.2)
    requested_at        DATETIME(6)     NOT NULL,
    accepted_at         DATETIME(6)     NULL,
    CONSTRAINT p_k_veterinarian_clients PRIMARY KEY (id),
    UNIQUE INDEX i_x_veterinarian_clients_veterinarian_id_rancher_id (veterinarian_id, rancher_id)
);

-- ============================================================================
-- Fin del esquema as-built (14 tablas, 12 bounded contexts).
-- Para el esquema to-be de Subscriptions ya extraído a su propia base de
-- datos (Iteración 3, sección 4.3.3), ver: anitec-subscriptions-service-schema.sql
-- ============================================================================
