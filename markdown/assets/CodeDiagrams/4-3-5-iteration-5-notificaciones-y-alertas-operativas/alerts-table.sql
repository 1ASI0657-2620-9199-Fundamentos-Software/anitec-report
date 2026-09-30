-- ============================================================================
-- AniTec — Iteración 5 (4.3.5.5): Notificaciones y Alertas Operativas (TO-BE)
-- ============================================================================
-- Responde a QAS-03. Alerta derivada de HealthEvent.NextDueDate /
-- FarmActivity.Date vencidos sin confirmar. No copia el dato de origen, solo
-- lo referencia (source_type + source_id) — bounded context nuevo:
-- Notifications. No existe hoy en el backend real.
-- ============================================================================

CREATE TABLE alerts (
    id              INT             NOT NULL AUTO_INCREMENT,
    source_type     VARCHAR(20)     NOT NULL,              -- "HealthEvent" | "FarmActivity"
    source_id       INT             NOT NULL,
    owner_id        INT             NOT NULL,              -- referencia lógica a users.id, sin FK real
    message         VARCHAR(300)    NOT NULL,
    due_date        DATETIME(6)     NOT NULL,
    status          VARCHAR(20)     NOT NULL,              -- "Pending" | "Confirmed" | "Snoozed" | "Closed"
    created_at      DATETIME(6)     NOT NULL,
    CONSTRAINT p_k_alerts PRIMARY KEY (id),
    INDEX i_x_alerts_source_type_source_id (source_type, source_id),
    INDEX i_x_alerts_owner_id (owner_id)
);
