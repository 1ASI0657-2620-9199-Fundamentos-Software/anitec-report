-- ============================================================================
-- AniTec — Iteración 4 (4.3.4): Sincronización Edge-to-Cloud (TO-BE)
-- ============================================================================
-- Ninguna de estas tablas/columnas existe hoy. Diseño propuesto para
-- QAS-01/BG-04 — idempotencia de sincronización y detección de conflictos.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 4.3.4.5 — Idempotencia de sincronización móvil
-- Servidor: registro de operaciones ya procesadas, para que reintentar un
-- envío de sincronización (por ejemplo tras perder la conexión justo después
-- de que el servidor ya aplicó el cambio) no duplique el efecto.
-- ----------------------------------------------------------------------------
CREATE TABLE processed_sync_operations (
    operation_id    CHAR(36)        NOT NULL,              -- UUID generado en el cliente móvil
    entity_type     VARCHAR(40)     NOT NULL,               -- "Animal" | "HealthEvent" | ...
    processed_at    DATETIME(6)     NOT NULL,
    result_status   VARCHAR(20)     NOT NULL,                -- "Applied" | "Conflict" | "Rejected"
    CONSTRAINT p_k_processed_sync_operations PRIMARY KEY (operation_id)
);

-- Nota (4.3.4.4): la concurrencia optimista (created_at/updated_at agregados
-- a Animal y HealthEvent) NO se incluye aquí como tabla/diagrama aparte —
-- son 2 columnas sobre tablas que ya existen completas en
-- 4-1-design-concepts-viewpoints-er-diagrams/anitec-schema.sql. El diseño
-- está documentado en el texto de 4.3.4.4; no amerita un diagrama propio.

-- ============================================================================
-- Cliente móvil — persistencia LOCAL en el dispositivo (Room/SQLite, Android).
-- No es parte de ninguna base de datos del servidor; se incluye aquí en
-- dialecto SQL genérico solo como referencia de esquema para el diagrama de
-- la app móvil (to-be, cero código existente).
-- ============================================================================
CREATE TABLE outbox_operation (
    operation_id        CHAR(36)        NOT NULL,          -- UUID generado en el dispositivo
    entity_type         VARCHAR(40)     NOT NULL,           -- "Animal" | "HealthEvent" | ...
    operation_type      VARCHAR(20)     NOT NULL,           -- "Create" | "Update"
    payload_json        LONGTEXT        NOT NULL,
    client_timestamp    DATETIME(6)     NOT NULL,
    status               VARCHAR(20)     NOT NULL,          -- "Pending" | "Syncing" | "Synced" | "Conflict"
    PRIMARY KEY (operation_id)
);
