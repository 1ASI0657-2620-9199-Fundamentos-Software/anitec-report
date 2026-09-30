-- ============================================================================
-- AniTec — Subscriptions Service: esquema aislado (TO-BE, Iteración 3)
-- ============================================================================
-- Diseño propuesto en anitec-report/markdown/content/chapter-4/
--   4-3-3-iteration-3-extraccion-de-servicios-y-api-gateway.md (4.3.3.5)
--
-- Estado: TO-BE. Hoy estas 3 tablas viven en la base de datos compartida
-- (ver anitec-schema.sql). Este script representa el esquema que resulta
-- de extraer Subscriptions a su propio servicio desplegable con su propia
-- base de datos MySQL (patrón Database-per-service, aplicado SOLO a este
-- contexto — justificación completa en 4.3.3.2: es el único de los 12
-- bounded contexts con cero referencias entrantes reales desde otros
-- contextos, verificado por grep sobre el código).
--
-- Diferencia con anitec-schema.sql: son las MISMAS 3 tablas, columna por
-- columna — la extracción es de despliegue/infraestructura (una base de
-- datos separada), no un cambio de modelo de datos.
-- ============================================================================

CREATE TABLE subscription_plans (
    id                  INT             NOT NULL AUTO_INCREMENT,
    name                VARCHAR(80)     NOT NULL,
    price               DECIMAL(10,2)   NOT NULL,
    stripe_price_id     VARCHAR(120)    NOT NULL,
    max_animals         INT             NOT NULL,
    is_active           TINYINT(1)      NOT NULL,
    CONSTRAINT p_k_subscription_plans PRIMARY KEY (id)
);

CREATE TABLE subscriptions (
    id                          INT             NOT NULL AUTO_INCREMENT,
    user_id                     INT             NOT NULL,  -- referencia lógica a users.id (Iam), servicio distinto: sin FK real ni de esquema
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
    user_id                 INT             NOT NULL,      -- referencia lógica a users.id (Iam), sin FK real
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
