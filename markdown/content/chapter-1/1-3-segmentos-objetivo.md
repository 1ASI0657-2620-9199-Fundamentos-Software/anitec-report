# 1.3. Segmentos objetivo

AniTec se dirige inicialmente a dos segmentos relacionados dentro del dominio ganadero: pequeños y medianos ganaderos y veterinarios que atienden animales de campo. Ambos necesitan información trazable, pero realizan tareas distintas y presentan diferentes niveles de experiencia técnica, condiciones de uso y responsabilidades sobre los datos.

El tamaño y composición del sector justifican este enfoque. El [Ministerio de Desarrollo Agrario y Riego (2023)](https://www.gob.pe/institucion/midagri/noticias/771209-midagri-impulsa-a-los-pequenos-ganaderos-para-mejorar-la-produccion-de-leche) informó que el Perú contaba con 452 218 productores de ganado vacuno lechero y que 85,9 % eran pequeños productores con menos de diez cabezas. Esta distribución muestra que una parte considerable del mercado necesita soluciones cuyo costo, complejidad y operación sean compatibles con unidades productivas pequeñas.

La conectividad también delimita el diseño. De acuerdo con el [Instituto Nacional de Estadística e Informática (2025)](https://www.inei.gob.pe/media/MenuRecursivo/boletines/informe-tecnico_tecnologiasdelainformacion_ene_feb_mar2025.pdf), en el primer trimestre de 2025 el 52,4 % de la población rural de seis o más años utilizó Internet, mientras el promedio nacional alcanzó 79,0 %. Esta diferencia sustenta la necesidad de interfaces móviles ligeras, manejo explícito de errores de red y sincronización diferida para las operaciones prioritarias.

## Pequeños y medianos ganaderos

Son productores responsables del cuidado cotidiano de hatos de escala familiar o comercial pequeña y mediana. Administran animales, coordinan vacunaciones y tratamientos, registran gastos e ingresos y toman decisiones productivas. Parte de este segmento mantiene la información en cuadernos, hojas sueltas, archivos de cálculo o conversaciones de mensajería.

| Dimensión | Características del segmento inicial |
|---|---|
| **Ubicación** | Zonas rurales y semiurbanas del Perú, con prioridad inicial en localidades donde la ganadería constituye una actividad familiar o de pequeña escala. |
| **Ocupación** | Propietarios, administradores o responsables directos del manejo del hato. |
| **Escala productiva** | Hatos pequeños y medianos; como referencia de mercado, MIDAGRI considera pequeños productores lecheros a quienes poseen menos de diez cabezas. |
| **Experiencia** | Conocimiento práctico del manejo animal, adquirido mediante trabajo familiar, asistencia técnica y experiencia de campo. |
| **Perfil digital** | Uso frecuente del teléfono y de mensajería, con niveles variables de alfabetización digital y acceso no siempre estable a Internet. |
| **Necesidades** | Registro simple de animales, historial sanitario, alertas, actividades, indicadores básicos y acceso controlado para el veterinario. |
| **Frustraciones** | Pérdida de apuntes, duplicidad, fechas olvidadas, información incompleta y herramientas difíciles de aprender. |
| **Criterios de adopción** | Facilidad de uso, utilidad inmediata, confianza, soporte ante errores, funcionamiento con conectividad limitada y precio accesible. |

La investigación exploratoria existente incluye tres ganaderos de 54, 62 y 65 años, ubicados en Lima y Canta. Los tres describieron el uso de registros manuales o dispersos y señalaron al teléfono como un canal habitual de comunicación o consulta. Debido al tamaño de la muestra, estos resultados sirven para formular hipótesis y construir arquetipos, pero no representan estadísticamente a todos los ganaderos del país. La caracterización deberá ampliarse y validarse durante el curso.

## Veterinarios que atienden animales de campo

Son profesionales que brindan atención clínica o sanitaria a animales pertenecientes a distintos productores. Necesitan revisar antecedentes, registrar diagnósticos y tratamientos, programar seguimientos y comunicar indicaciones al responsable del animal.

| Dimensión | Características del segmento inicial |
|---|---|
| **Ubicación y contexto** | Atención en unidades ganaderas rurales o semiurbanas, consultorios y campañas sanitarias; pueden desplazarse entre varios clientes. |
| **Ocupación** | Médicos veterinarios y, cuando el alcance lo permita, técnicos agropecuarios autorizados. |
| **Experiencia digital** | Uso de smartphone y computadora para mensajería, consulta técnica, hojas de cálculo y documentos compartidos. |
| **Necesidades** | Acceso autorizado a clientes y pacientes, historial clínico, registro rápido de atenciones y seguimiento de eventos pendientes. |
| **Frustraciones** | Historiales incompletos, información distribuida entre diferentes medios, demoras para identificar antecedentes y falta de continuidad entre visitas. |
| **Criterios de adopción** | Rapidez, precisión, disponibilidad, permisos claros, protección de datos y reducción del tiempo administrativo. |

La investigación exploratoria existente incluye dos veterinarios de 24 y 27 años que trabajan en la sierra sur y la selva central del Perú. Ambos reportaron el uso de smartphone y laptop, así como dificultades ocasionadas por historiales inexistentes o distribuidos entre cuadernos, archivos y conversaciones. Al igual que en el segmento ganadero, estos resultados deben tratarse como evidencia cualitativa inicial y ampliarse con nuevas entrevistas.

## Relación entre los segmentos

Los dos segmentos participan en un mismo flujo de información, pero no poseen las mismas responsabilidades. El ganadero conserva el control sobre los animales y autoriza el acceso; el veterinario consulta únicamente los clientes y pacientes asignados y registra información sanitaria dentro de los permisos concedidos. Esta relación influye directamente en los requisitos de identidad, autorización, auditoría, consistencia y disponibilidad de AniTec.

## Segmento institucional posterior

Las asociaciones y cooperativas ganaderas representan un segmento potencial para etapas posteriores. Podrían facilitar capacitación, adopción y seguimiento agregado, pero su incorporación requiere validar reglas de privacidad, propiedad de los datos, reportes consolidados y un modelo comercial institucional. Por esta razón no forman parte del segmento inicial de validación.

## Stakeholders relacionados

- **Internos:** integrantes de Titan responsables del diseño, implementación, pruebas, despliegue y evolución del producto.
- **Externos:** ganaderos, veterinarios, técnicos autorizados, trabajadores de campo, asociaciones ganaderas, proveedores cloud y entidades relacionadas con sanidad y trazabilidad animal.
