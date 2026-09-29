# 4.2. Information Architecture

La arquitectura de información de AniTec organiza el contenido de la landing page y de la aplicación web para que visitantes, ganaderos y veterinarios encuentren con facilidad las secciones que necesitan. La propuesta considera que los usuarios pueden tener distintos niveles de experiencia digital, por lo que se priorizan etiquetas claras, recorridos simples y una separación de módulos según el rol.

En la landing page, la información se organiza para presentar la propuesta de valor, beneficios, segmentos, testimonios, planes y llamadas a la acción. En la aplicación web, la información se organiza por tareas operativas: gestión de fincas, animales, sanidad, actividades, finanzas, clientes veterinarios, pacientes, analíticas, IoT y suscripciones.

## 4.2.1. Organization Systems

- **Organización jerárquica:** Se aplica en dashboards, landing page y vistas principales para destacar primero los datos más importantes. Por ejemplo, el dashboard del ganadero prioriza indicadores de animales, fincas, alertas y actividades; mientras que el dashboard veterinario prioriza clientes, pacientes, eventos sanitarios y seguimientos.

- **Organización secuencial:** Se usa en formularios y flujos donde el usuario debe completar pasos de forma ordenada, como registrar un animal, crear una finca, registrar un evento sanitario, agregar un cliente veterinario o realizar un pago de prueba de suscripción.

- **Organización por audiencia:** La landing page separa mensajes para visitantes generales, ganaderos y veterinarios. Dentro de la aplicación, la navegación cambia según el rol: el ganadero visualiza módulos relacionados con su operación productiva, mientras que el veterinario accede a clientes, pacientes, sanidad y analíticas.

- **Organización por tópicos:** Los módulos se agrupan según el tipo de información que gestionan: ganadería, sanidad, finanzas, actividades, IoT, analíticas y planes. Esto permite que el usuario ubique cada función por el tema que desea resolver.

- **Organización cronológica:** Se aplica en actividades, historial sanitario, pagos y métricas de dispositivos IoT, ya que estos registros dependen de fechas y seguimiento temporal.

- **Organización matricial:** Se utiliza en dashboards, reportes y analíticas, donde el usuario puede comparar indicadores por finca, animal, cliente, estado sanitario o tipo de evento.

## 4.2.2. Labeling Systems

El sistema de etiquetado de AniTec usa palabras breves y familiares para evitar confusión. Las etiquetas deben ser entendibles tanto para ganaderos con poca experiencia digital como para veterinarios que necesitan revisar información clínica con rapidez.

| Contexto | Etiqueta | Significado para el usuario |
|----------|----------|-----------------------------|
| Landing page | Inicio | Presenta la propuesta principal de AniTec. |
| Landing page | Beneficios | Resume el valor de la plataforma para los segmentos objetivo. |
| Landing page | Ganaderos | Explica funciones orientadas a la gestión del hato. |
| Landing page | Veterinarios | Explica funciones orientadas a clientes, pacientes y seguimiento sanitario. |
| Landing page | Planes | Presenta las opciones de suscripción. |
| Aplicación ganadero | Dashboard | Muestra el resumen general de la operación ganadera. |
| Aplicación ganadero | Fincas | Agrupa las unidades productivas del ganadero. |
| Aplicación ganadero | Animales | Permite consultar y registrar animales. |
| Aplicación ganadero | Sanidad | Reúne eventos sanitarios, incidencias y tratamientos. |
| Aplicación ganadero | Finanzas | Permite revisar ingresos, egresos y balance. |
| Aplicación ganadero | Actividades | Organiza tareas, visitas, controles y recordatorios. |
| Aplicación compartida | IoT | Muestra dispositivos, estado y métricas asociadas. |
| Aplicación compartida | Planes | Permite consultar suscripción activa, planes y pagos de prueba. |
| Aplicación veterinario | Clientes | Muestra ganaderos asignados al veterinario. |
| Aplicación veterinario | Pacientes | Muestra animales pertenecientes a clientes asignados. |
| Aplicación veterinario | Analíticas | Presenta reportes e indicadores para priorizar atenciones. |

Las etiquetas de acción también se mantienen simples: "Registrar", "Guardar", "Editar", "Eliminar", "Cancelar", "Buscar", "Agregar cliente" y "Ver historial". Estas palabras describen directamente la acción esperada y reducen la posibilidad de interpretación ambigua.

## 4.2.3. SEO Tags and Meta Tags

**Landing Page:**

- **Title:** AniTec - Plataforma Digital para Ganaderos y Veterinarios
- **Description:** AniTec es una plataforma web accesible para pequeños y medianos ganaderos y veterinarios de campo. Permite gestionar animales, fincas, sanidad, actividades, finanzas, dispositivos IoT, clientes, pacientes y planes de suscripción.
- **Keywords:** AniTec, gestión ganadera, plataforma para ganaderos, veterinarios, salud animal, historial clínico animal, trazabilidad ganadera, IoT ganadero, fincas, animales, sanidad, planes de suscripción, tecnología rural
- **Author:** AniTec

**Application Web:**

- **Title:** AniTec - Gestión Ganadera, Sanitaria e IoT
- **Description:** Aplicación web de AniTec para gestionar información ganadera y veterinaria mediante dashboards por rol, registro de animales, eventos sanitarios, actividades, finanzas, clientes veterinarios, pacientes, analíticas, dispositivos IoT y suscripciones.
- **Keywords:** AniTec app, dashboard ganadero, dashboard veterinario, gestión de animales, eventos sanitarios, clientes veterinarios, pacientes, finanzas ganaderas, analíticas ganaderas, métricas IoT, suscripciones AniTec
- **Author:** AniTec

## 4.2.4. Searching Systems

El sistema de búsqueda en AniTec ayuda a encontrar información dentro de módulos con muchos registros. Las opciones de búsqueda deben mostrar resultados filtrados de forma inmediata y acompañarse de estados vacíos cuando no existan coincidencias.

- **Búsqueda de animales:** Permite buscar por nombre, código, especie, raza, estado o finca.
- **Búsqueda de fincas:** Permite ubicar unidades productivas por nombre, ubicación o tipo principal.
- **Búsqueda de registros sanitarios:** Permite filtrar por animal, tipo de evento, fecha, diagnóstico, tratamiento o veterinario responsable.
- **Búsqueda de clientes veterinarios:** Permite encontrar ganaderos asignados o disponibles para agregar a la cartera del veterinario.
- **Búsqueda de pacientes:** Permite ubicar animales pertenecientes a clientes asignados.
- **Filtros por fecha:** Se aplican en actividades, pagos, métricas IoT y eventos sanitarios.
- **Filtros por estado:** Se aplican en animales, dispositivos IoT, actividades y suscripciones.

Después de una búsqueda, los datos deben mostrarse en tarjetas, listas o tablas según el módulo. Si no hay coincidencias, la interfaz debe mostrar mensajes claros como "No se encontraron animales" o "No hay registros disponibles".

## 4.2.5. Navigation Systems

Los sistemas de navegación de AniTec se diseñan para guiar a visitantes y usuarios autenticados de forma clara. La landing page utiliza navegación superior, mientras que la aplicación web utiliza menú lateral adaptado al rol.

**Navegación de Landing Page:**

- Inicio: Presenta el nombre del producto y su propuesta de valor.
- Beneficios: Explica cómo AniTec ayuda a organizar la gestión ganadera y veterinaria.
- Ganaderos: Muestra funciones orientadas a fincas, animales, sanidad, finanzas e IoT.
- Veterinarios: Muestra funciones orientadas a clientes, pacientes, historial clínico y seguimiento sanitario.
- Planes: Presenta opciones de suscripción.
- Contacto: Permite al visitante conocer cómo comunicarse o iniciar el uso de la plataforma.

**Navegación de aplicación para ganadero:**

- Login: El usuario ingresa credenciales básicas.
- Dashboard ganadero: El sistema muestra resumen de fincas, animales, sanidad, actividades y finanzas.
- Fincas y animales: El usuario registra y consulta unidades productivas y animales.
- Sanidad y actividades: El usuario registra eventos sanitarios, tratamientos, visitas o tareas.
- Finanzas: El usuario revisa ingresos, egresos y balance.
- IoT y planes: El usuario consulta dispositivos, métricas, suscripción activa y pagos de prueba.

**Navegación de aplicación para veterinario:**

- Login: El usuario ingresa credenciales básicas.
- Dashboard veterinario: El sistema muestra clientes, pacientes, seguimientos y registros clínicos.
- Clientes: El veterinario revisa ganaderos asignados o agrega nuevos clientes.
- Pacientes: El veterinario consulta animales de sus clientes.
- Sanidad: El veterinario registra diagnósticos, tratamientos, recetas y seguimientos.
- Analíticas: El veterinario revisa indicadores para priorizar atenciones.
- IoT y planes: El veterinario consulta dispositivos, métricas, suscripción activa y pagos de prueba.

La navegación por rol permite que cada usuario acceda solo a las secciones relevantes para su trabajo. Esto reduce la carga cognitiva, evita rutas innecesarias y mantiene una experiencia coherente entre la landing page, el inicio de sesión y los dashboards principales.
