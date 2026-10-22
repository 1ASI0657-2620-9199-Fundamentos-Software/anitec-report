# Guion de 20 segundos por slide: Capítulo V (AniTec)

Versión mínima del guion del capítulo V para las 8 diapositivas: **unos 20 segundos por slide**, de 2 a 3 frases (unas 40 palabras). Duración total: **2 a 2 min 30 s**. Solo lleva lo imprescindible de cada diapositiva.

---

**Slide 1. Suite de pruebas del backend**
"Creamos el proyecto de pruebas del backend: **48 pruebas, todas superadas**, 32 unitarias y 16 escenarios BDD. Cubren el núcleo compartido y los servicios de Iam y Livestock. Los límites: 3 de 12 contextos y cobertura aún sin medir."

**Slide 2. BDD con Gherkin**
"Escribimos en Gherkin la historia **US-053, Iniciar sesión**: 8 escenarios, entre ellos token válido, contraseña incorrecta, usuario duplicado y roles. Los pasos ejecutan el servicio real y el reporte de Reqnroll sale en verde."

**Slide 3. Patrones y refactorización**
"El backend usa 8 patrones, entre ellos DDD, CQRS ligero, Repository con Unit of Work y Result, con una biblioteca interna `Shared`. Al revisarlo hallamos **8 hallazgos**; el más serio es R6, las imágenes en un disco efímero. Identificados 8, aplicados 0."

**Slide 4. Gestión de configuración**
"Trabajamos con 4 repositorios, GitFlow, versionado semántico, Conventional Commits y una guía de estilo por lenguaje. Aclaración: **hoy solo existe la rama `main`**; `develop` y las ramas `feature` empiezan en el Sprint 2."

**Slide 5. Sprint 1**
"El objetivo fue poner AniTec en línea: **10 User Stories, 32 Story Points y 18 tareas**. Según el Trello real, las 18 terminaron en Done, con 0 pendientes."

**Slide 6. Despliegue en producción**
"Desplegamos MySQL en **Aiven**, el backend y el frontend en **Render**, y la landing en **GitHub Pages**; cada uno tiene su evidencia. Resolvimos 4 problemas reales, y el plan gratuito de Render se suspende a los 15 minutos."

**Slide 7. Ejecución de punta a punta**
"Recorrimos landing, inicio de sesión y panel con datos de Aiven. En la API, sin token responde **401**, con el inicio de sesión se obtiene un JWT y con ese token responde **200**."

**Slide 8. Conclusiones y recomendaciones**
"Lo verificado son los requisitos y el sistema desplegado; lo solo diseñado son las iteraciones 2 a 7; y falta validar con usuarios reales: 0 de 5 hipótesis. Dejamos **14 recomendaciones** a corto, mediano y largo plazo. Muchas gracias."

---

## Notas rápidas

- **Total:** unos 2 a 2 min 30 s. Si algo se corta, la frase que no puede faltar de cada slide es la cifra en **negrita**.
- **Reparto sugerido:** Baldeon 1 a 3 · Melgarejo 4 y 6 · Castro 5, 7 y 8.
- Para más detalle, usa el guion de 5 a 6 minutos (`guion-explicacion-capitulo-5-corto.md`) o el completo (`guion-explicacion-capitulo-5.md`).
