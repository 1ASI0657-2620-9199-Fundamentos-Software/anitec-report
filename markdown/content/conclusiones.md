# Conclusiones

## Conclusiones y recomendaciones

En esta sección el equipo Titan enuncia las conclusiones del trabajo realizado en AniTec entre los capítulos I y V, las contrasta con el proceso Lean UX planteado al inicio (Problem Statement, assumptions, hypotheses y criterios de éxito) y propone los siguientes pasos para el roadmap del producto. Las conclusiones distinguen de forma explícita lo que está **implementado y verificado**, lo que está **diseñado pero no implementado** y lo que **aún no se ha validado con usuarios reales**.

### Conclusiones

**1. El problema planteado es consistente con la evidencia reunida, pero esa evidencia es sintética.** El análisis del capítulo I y del capítulo II describe a ganaderos pequeños y medianos que registran sus datos en cuadernos y mensajes, y a veterinarios que reciben historiales fragmentados. Las diez entrevistas mock (cinco por segmento) apuntan en la misma dirección: los cinco ganaderos usan registros manuales y trabajan con conectividad limitada, los cinco consideran prioritarias las alertas y cuatro piden control de acceso por roles; los cinco veterinarios reciben historiales fragmentados y exigen permisos y auditoría. Sin embargo, son entrevistas académicas, no investigación de campo: confirman la coherencia del problema, pero no lo validan frente al mercado real.

**2. El análisis competitivo permitió definir una diferenciación, no competir en funciones.** La comparación con CattleMax, AgriWebb y BovControl mostró productos más maduros y amplios. La propuesta de AniTec se apoya en tres rasgos: simplicidad para el contexto local, colaboración sanitaria controlada entre ganadero y veterinario, y resiliencia ante conectividad intermitente. El precio de la suscripción sigue sin validarse.

**3. Los requisitos quedaron trazables de punta a punta.** El capítulo III produjo 16 Epics, 88 User Stories con criterios Given–When–Then y 32 Technical Stories, ordenadas por valor de negocio y vinculadas a cuatro Business Goals medibles (adopción del registro, seguimiento sanitario, continuidad clínica y confianza en campo). Esa trazabilidad permitió que cada decisión posterior se pudiera justificar hasta un objetivo de negocio.

**4. La arquitectura se diseñó con el método ADD y partiendo del código real.** En el capítulo IV se documentó la arquitectura existente (un monolito modular de 12 bounded contexts, 15 tablas y 15 entidades de dominio, con sus vistas C4 y UML verificadas contra el código) y se formalizaron siete escenarios de calidad, restricciones y preocupaciones. A partir de ellos se diseñaron siete iteraciones ADD: validación de la línea base, seguridad e identidad, extracción de Subscriptions detrás de un API Gateway, sincronización edge-to-cloud, notificaciones y alertas, integración de dispositivos IoT, y observabilidad y confiabilidad. El capítulo se cierra con las vistas 4+1 de Kruchten (lógica, desarrollo, proceso, física y escenarios). La revisión contra el código dejó hallazgos concretos, por ejemplo, que la autorización era solo por rol y no por recurso, y que el registro sanitario no tenía estados. **Las iteraciones 2 a 7 son diseño completo, no implementación.**

**5. El sistema quedó desplegado y verificado de punta a punta en el Sprint 1.** Los tres productos están en línea: la landing en GitHub Pages, el frontend como Static Site en Render y el backend como Web Service con Docker en Render, con una base de datos MySQL administrada en Aiven. El backend crea su esquema al arrancar mediante las seis migraciones de Entity Framework Core. Se verificó el inicio de sesión sobre el sistema publicado y la protección de los datos: `GET /api/v1/animals` responde 401 sin token y 200 con token. Todos los recursos usan planes gratuitos, lo que condiciona la disponibilidad (el backend se duerme tras 15 minutos sin tráfico).

**6. Las pruebas automatizadas existen, pero cubren una parte limitada.** Se creó el proyecto `Anitec.Platform.Tests` con 48 pruebas (32 unitarias y 16 escenarios BDD en Gherkin) y un reporte HTML de Reqnroll, todas superadas. Cubren el núcleo compartido y los servicios de Iam y Livestock (tres de los doce contextos), a nivel de servicio y no de API HTTP. La revisión del código bajo los patrones del backend produjo ocho hallazgos de refactorización (R1 a R8), **identificados pero no aplicados**; el de mayor impacto es que las imágenes de animales se guardan en el disco del contenedor, que en el plan gratuito de Render es efímero.

**7. El trabajo colaborativo está planificado y documentado, pero el historial de código no lo refleja todavía.** El reparto de capítulos y de tareas entre los tres integrantes está registrado en el Student Outcome, el registro de versiones, el performance report y la tabla de control del Sprint 1. Sin embargo, los commits de los repositorios de código provienen de una sola cuenta de GitHub, y hasta el Sprint 1 solo existe la rama `main`. El flujo GitFlow está definido, pero aún no practicado.

**Contraste con el proceso Lean UX**

| Elemento de Lean UX | Resultado frente a lo planteado | Evidencia y estado |
|---|---|---|
| **Problem Statement** | Se mantiene vigente. | Las entrevistas mock y el análisis competitivo coinciden con la brecha planteada: registros manuales, información dispersa y poca coordinación ganadero–veterinario. Falta confirmarlo con usuarios reales. |
| **Business Assumptions** | Parcialmente respaldadas. | Las entrevistas respaldan la necesidad de un registro confiable y del acceso autorizado del veterinario. La viabilidad de la suscripción (cuatro de cinco ganaderos y los cinco veterinarios dicen que pagarían si el valor es adecuado) no valida ningún precio. |
| **User Assumptions** | Parcialmente respaldadas. | Se confirman la conectividad limitada y la necesidad de interfaces simples. No se ha medido el comportamiento real de usuarios con la aplicación desplegada. |
| **Feature Assumptions (FA-01 a FA-06)** | Resultados distintos por funcionalidad. | FA-01 (registro): implementado en la aplicación web, incluido el registro por lote, sin aplicación móvil. FA-02 (alertas), FA-04 (acceso por roles, hoy solo por rol) y FA-05 (sincronización diferida): diseñados en las iteraciones 2, 4 y 5, no implementados. FA-03 (historial) y FA-06 (reportes): existen módulos base, sin medición de uso. |
| **Hypotheses H-01 a H-05** | **No validadas experimentalmente.** | Los experimentos propuestos (pruebas de usabilidad, prototipo de alertas, prueba del flujo ganadero–veterinario y piloto técnico de sincronización) no se han ejecutado. La H-05 tiene diseño completo (iteración 4) pero ninguna prueba con pérdida y recuperación de conexión. |
| **Criterios de éxito (Business Goals)** | **Sin medir.** | Los umbrales (por ejemplo, 70 % de ganaderos registrando tres eventos semanales, 95 % de sincronización en cinco minutos) requieren un piloto con usuarios reales; hoy el sistema solo está desplegado con datos de demostración. |

En síntesis, el ciclo de vida permitió **definir, diseñar y desplegar** una base verificable, pero la contrastación de las hipótesis con el comportamiento real de los segmentos queda como el trabajo principal pendiente.

**Student Outcome 7 (Aprendizaje continuo y autónomo).** A lo largo de los capítulos I a V cada integrante tuvo que actualizar o adquirir conocimientos nuevos: Lean UX y requirements engineering en los capítulos I a III, Attribute-Driven Design, notación C4 y UML en el capítulo IV, y pruebas BDD, configuración de entornos y despliegue cloud en el capítulo V. El aprendizaje más importante fue metodológico: verificar cada afirmación contra el código real, contra la documentación oficial o contra el sistema desplegado, y corregir la propia documentación cuando no coincidía.

### Recomendaciones

Las siguientes recomendaciones se ordenan por horizonte y se vinculan con los hallazgos documentados en los capítulos IV y V.

**Corto plazo (siguientes Sprints)**

1. **Evidenciar la colaboración real.** Crear la rama `develop` y trabajar con ramas `feature/*` por integrante y por User Story, con *pull requests* y cuentas individuales, de modo que el historial de GitHub muestre la participación de los tres.
2. **Integración continua.** Agregar un flujo de GitHub Actions que ejecute `dotnet test` en cada cambio, para que la suite proteja la rama `main`.
3. **Corregir el almacenamiento de imágenes (hallazgo R6).** Reemplazar el disco local del contenedor por un servicio de almacenamiento de objetos, ya que hoy las imágenes se pierden al reiniciar el servicio.
4. **Aplicar los refactors de menor costo (R1 a R4)**, que no cambian los contratos REST: un código de error propio para la cantidad inválida, consultas filtradas en la base de datos para el registro por lote y el cambio masivo de estado, y registro de excepciones en el registro de usuarios.
5. **Cerrar la deuda de seguridad conocida:** restringir la política CORS a los dominios reales (hoy acepta cualquier origen), actualizar la dependencia con vulnerabilidad reportada (`Microsoft.OpenApi`) e implementar la autorización por recurso diseñada en la iteración 2 para que el veterinario solo acceda a sus pacientes autorizados.
6. **Ampliar las pruebas.** Cubrir los demás bounded contexts y agregar pruebas a nivel HTTP (autorización por rol, códigos de respuesta) y de integración contra MySQL, además de medir la cobertura.
7. **Mantener la landing alineada con la evidencia del proyecto:** presentar los escenarios de uso como casos ilustrativos y evitar cifras comerciales que el trabajo no ha podido verificar.

**Mediano plazo**

8. **Validar con usuarios reales.** Ejecutar los experimentos de las hipótesis H-01 a H-04 con ganaderos y veterinarios sobre la aplicación desplegada, y medir los umbrales definidos. Validar también el precio de la suscripción antes de publicar tarifas.
9. **Implementar la aplicación Android offline-first** (EP-014) siguiendo la iteración 4: almacenamiento local, operaciones idempotentes y detección de conflictos de sincronización. Diseñar además la pantalla de resolución de conflictos, que el diseño actual solo detecta.
10. **Implementar las iteraciones 3 y 5:** extraer Subscriptions con su propia base de datos detrás de un API Gateway, y construir el servicio de alertas con un proceso en segundo plano, de modo que el sistema cumpla las alertas que hoy solo promete.

**Largo plazo (roadmap)**

11. **Integración real con dispositivos IoT** (iteración 6): autenticación por API key y un canal de ingesta, incluyendo el ciclo de vida de las credenciales (emisión, rotación y revocación), que el diseño actual deja pendiente.
12. **Observabilidad y confiabilidad** (iteración 7): auditoría, identificador de correlación, Circuit Breaker en las fronteras de red reales y un catálogo de pruebas.
13. **Segunda ola de servicios y alta disponibilidad.** Para extraer más contextos del monolito se requiere un mecanismo de eventos asíncronos que hoy el proyecto no tiene. Conviene también evaluar planes de hosting que no se duerman ni pierdan datos, antes de un piloto con usuarios reales.
14. **Canal institucional.** Explorar a las asociaciones ganaderas como canal de adopción y como clientes, tal como se planteó en las Business Assumptions.

---

## Video About The Team

<!-- PLACEHOLDER: esta sección debe describir el video About-The-Team del equipo Titan. Completarla cuando el video esté grabado y publicado. -->

El statement exige que esta sección incluya un resumen del video, la pauta de secuencias con el tiempo de inicio de cada sección (`hh:mm:ss`), un cuadro de video representativo y el enlace de la versión publicada en YouTube.

**Datos del video:**

| Elemento | Información |
|---|---|
| Título | _Por completar_ |
| Duración | _Por completar_ |
| Integrantes que participan | Castro Picón, Manuel Fernando Joao · Melgarejo Quiroz, Josep Eliu · Baldeon Vivar, Santiago Armando |
| URL publicado en YouTube | _Por completar_ |

**Resumen del video:** _Por completar._

**Pauta de secuencias del video:**

| Sección | Timing de inicio | Contenido |
|---|---|---|
| _Por completar_ | 00:00:00 | _Por completar_ |

<div align="center">
  <!-- PLACEHOLDER: cuadro de video representativo -->
  <img src="../assets/chapter-5/VideoAboutTheTeam/captura-video-about-the-team.png" alt="Cuadro representativo del video About The Team" width="700">
  <p><i><b>Fuente</b>: Elaboración propia.</i></p>
</div>
