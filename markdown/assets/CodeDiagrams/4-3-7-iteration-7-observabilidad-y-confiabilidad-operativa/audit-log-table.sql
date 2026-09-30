-- ============================================================================
-- AniTec — Iteración 7 (4.3.7.5): Observabilidad y Confiabilidad Operativa (TO-BE)
-- ============================================================================
-- Responde a US-074 y QAS-10. Registro append-only: una fila por operación
-- sensible, enlazada al X-Correlation-Id de la petición HTTP que la originó —
-- permite reconstruir tanto "qué pasó" como "por qué falló" con el mismo
-- dato. Vive en el bounded context Shared. No existe hoy en el backend real.
-- ============================================================================

CREATE TABLE audit_log (
    id                  INT             NOT NULL AUTO_INCREMENT,
    correlation_id      CHAR(36)        NOT NULL,
    actor_user_id       INT             NOT NULL,          -- referencia lógica a users.id, sin FK real (mismo principio 4.1.1.1)
    action              VARCHAR(80)     NOT NULL,           -- ej. "RectifyHealthEvent", "ApproveVeterinarianClient"
    entity_type         VARCHAR(40)     NOT NULL,
    entity_id           INT             NOT NULL,
    occurred_at         DATETIME(6)     NOT NULL,
    details_json        LONGTEXT        NULL,
    CONSTRAINT p_k_audit_log PRIMARY KEY (id),
    INDEX i_x_audit_log_correlation_id (correlation_id),
    INDEX i_x_audit_log_entity_type_entity_id (entity_type, entity_id)
);
