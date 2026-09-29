# 4.8. Database Design.

El diseño de base de datos de AniTec se plantea sobre un modelo relacional implementado con MySQL. Esta decisión permite organizar la información principal de la aplicación en tablas relacionadas mediante primary keys y foreign keys, manteniendo consistencia entre los datos de usuarios, ganadería, sanidad, actividades, finanzas, analíticas, dispositivos IoT y suscripciones.

La persistencia se encuentra organizada de acuerdo con los bounded contexts definidos para la solución. IAM almacena los usuarios y credenciales de acceso; Profiles guarda la información personal de los usuarios; Livestock persiste hatos y animales; Sanitary registra eventos sanitarios; Activities almacena actividades de finca; Financial conserva ingresos y egresos; Analytics registra métricas de reportes; Devices y Metrics almacenan dispositivos IoT y sus lecturas; Subscriptions gestiona planes, suscripciones y pagos de prueba; y Clients representa la relación entre veterinarios y ganaderos.

El modelo relacional permite reflejar las dependencias entre estas áreas mediante claves primarias y foráneas. Por ejemplo, los animales pertenecen a un hato, los eventos sanitarios se asocian a animales, los dispositivos pueden relacionarse con hatos o animales, las métricas pertenecen a dispositivos y las suscripciones se vinculan con usuarios y planes.

## 4.8.1. Database Diagram.

El siguiente Database Diagram presenta las tablas, columnas principales, constraints y relaciones necesarias para la persistencia de información de AniTec. El diagrama muestra la estructura actualizada de la base de datos relacional utilizada por el backend de la aplicación.

<div align="center">
  <p>
    <b>Database Diagram - AniTec</b>
  </p>
  <img src="../../assets/chapter-4/database-diagrama-02-07.png" alt="Database Diagram - AniTec" width="600">
  <p>
    <i><b>Fuente</b>: Elaboración propia.</i>
  </p>
</div>
