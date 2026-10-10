# Guion corto: Capítulo V (AniTec, 5 a 6 minutos)

Versión condensada del guion completo, para las 8 diapositivas del capítulo V. Son unos **40 segundos por diapositiva** (3 a 5 frases cada una). La idea no es correr: es decir menos, pero con las cifras clave.

---

**Slide 1. Suite de pruebas del backend (≈ 40 s)**
"Creamos el proyecto de pruebas del backend y hoy tiene **48 pruebas, todas superadas**: 32 unitarias con xUnit y 16 escenarios BDD en Gherkin. Cubren el núcleo compartido y los servicios de Iam y Livestock. Aquí está la captura real de `dotnet test` y el reporte HTML de Reqnroll con el 100 % de los escenarios. Los límites también están a la vista: 3 de 12 contextos, a nivel de servicio y sin medir cobertura."

**Slide 2. BDD con Gherkin (≈ 40 s)**
"Escribimos en Gherkin la historia **US-053, Iniciar sesión**: 8 escenarios, entre ellos inicio válido con token, contraseña incorrecta, usuario duplicado rechazado con 409 y roles válidos e inválido. Los pasos en C# ejecutan el **servicio real**; solo se simulan el repositorio y el token. A la derecha, el reporte de Reqnroll, todo en verde."

**Slide 3. Patrones y refactorización (≈ 45 s)**
"El backend aplica ocho patrones: DDD con 12 contextos, cuatro capas, CQRS ligero, Repository con Unit of Work, Result, Assemblers, interceptor de auditoría y middleware de errores; casi todos viven en la biblioteca interna `Shared`. Al revisarlo encontramos **8 hallazgos, de R1 a R8**. El más serio es R6: las imágenes se guardan en el disco de Render, que es efímero. Sinceramente: **8 identificados, 0 aplicados**."

**Slide 4. Gestión de configuración (≈ 40 s)**
"El código está en **4 repositorios**. Definimos GitFlow, versionado semántico, Conventional Commits y una guía de estilo por lenguaje, y abajo se ven commits reales de cada tipo. Una aclaración importante: **hoy solo existe la rama `main`**; `develop` y las ramas `feature` empiezan en el Sprint 2."

**Slide 5. Sprint 1 (≈ 35 s)**
"El objetivo del Sprint 1 fue poner AniTec en línea. Cubrimos **10 User Stories y 32 Story Points**: la landing y el inicio de sesión. Se bajaron a **18 tareas** y, como muestra el Trello real, terminaron las 18 en Done: 0 pendientes, 0 en proceso, 0 en revisión."

**Slide 6. Despliegue en producción (≈ 55 s)**
"Desplegamos en este orden: base de datos **MySQL en Aiven**, backend en **Render con Docker**, frontend como **Static Site en Render** y la landing en **GitHub Pages**. Cada tarjeta tiene su evidencia: *Running*, *Live*, *Live* y *Success*. Tuvimos cuatro problemas reales, como el 404 de Pages o la base sin usuarios porque el seeder solo corre en Development, y los resolvimos. Y recordamos el límite del plan gratuito: Render se duerme a los 15 minutos."

**Slide 7. Ejecución de punta a punta (≈ 55 s)**
"Verificamos el recorrido de un usuario: landing, inicio de sesión, y el panel del ganadero con **datos que vienen de Aiven**. Después probamos la API protegida: sin token, `GET /animals` responde **401**; con el inicio de sesión en Postman obtenemos un **JWT**; y con ese token la misma consulta responde **200** con los animales. El resultado es el mismo en Swagger y en Postman."

**Slide 8. Conclusiones y recomendaciones (≈ 55 s)**
"De siete conclusiones, lo **verificado** es la trazabilidad de requisitos y el sistema desplegado. Lo **solo diseñado** son las iteraciones ADD 2 a 7. Lo **sin validar** es el problema con usuarios reales: **0 de 5 hipótesis** validadas y **0 de 4 Business Goals** medidos. Dejamos **14 recomendaciones**: a corto plazo, trabajar con ramas y CI, mover las imágenes a almacenamiento externo y ampliar pruebas; a mediano, validar con usuarios y construir la app Android; y a largo, IoT, observabilidad y mejor hosting. Muchas gracias."

---

## Notas rápidas

- **Total:** unos 5 min 30 s a ritmo tranquilo. Si te pasas, recorta las slides 3 y 4 a una sola frase cada una ("8 patrones, 8 hallazgos, 0 aplicados"; "4 repositorios, GitFlow definido, solo `main` hoy").
- **Reparto sugerido:** Baldeon 1 a 3 · Melgarejo 4 y 6 · Castro 5, 7 y 8.
- **Si preguntan por algo no implementado:** "está diseñado y documentado, pero no implementado; es la prioridad del siguiente sprint".
- **Si preguntan por la landing** (cifras "+500" y testimonios): "los heredamos del trabajo anterior y no los hemos podido verificar; es una recomendación de corto plazo".
- **Antes de exponer:** corregir la landing (tarea T-07) y rotar la contraseña de Aiven.
