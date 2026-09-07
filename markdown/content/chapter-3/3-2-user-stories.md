# 3.2. User Stories

Esta sección especifica los Epics, User Stories y Technical Enablers de AniTec. Los requisitos parten de las diez entrevistas mock, los User Personas María Quispe y Andrea Ramos, los escenarios As-Is/To-Be y el análisis competitivo. Las entrevistas son sintéticas y orientan el diseño académico; las hipótesis de adopción y negocio deberán validarse con usuarios reales.

Las User Stories describen resultados valiosos para ganaderos, veterinarios, colaboradores autorizados y visitantes. Los criterios de aceptación emplean Given–When–Then e incluyen, cuando corresponde, autorización, errores, conectividad y trazabilidad. Los Technical Enablers se mantienen separados conceptualmente: habilitan las historias, pero su prioridad y solución se validarán mediante ADD y no sustituyen requisitos centrados en el usuario.

## Trazabilidad desde Needfinding

| Hallazgo mock | Evidencia | Cambio To-Be | Epics e historias relacionadas |
|---|---|---|---|
| Registro manual o disperso | GAN-M01–GAN-M05 | Registrar y consultar por animal | EP-004, EP-005; US-008–US-019 |
| Conectividad limitada | GAN-M01–GAN-M05; VET-M01, VET-M02, VET-M04, VET-M05 | Guardar localmente, conocer el estado y reintentar | EP-014; US-065–US-069 |
| Necesidad de alertas y seguimiento | GAN-M01–GAN-M05; VET-M01–VET-M04 | Priorizar, confirmar y cerrar actividades | EP-007; US-027–US-030, US-070 |
| Acceso controlado y auditable | GAN-M01, GAN-M03–GAN-M05; VET-M01–VET-M05 | Solicitar, aprobar, limitar y revocar | EP-015; US-023, US-024, US-071–US-074 |
| Separación por propietario y paciente | VET-M01–VET-M05 | Consultar solo clientes y animales autorizados | EP-006, EP-015; US-021–US-026, US-073 |
| Confianza y propiedad de los datos | Ambos segmentos | Exportar, recuperar y conservar trazabilidad | EP-016; US-075–US-077 |
| Uso de Android en campo | GAN-M01–GAN-M05; VET-M01–VET-M05 | Completar tareas prioritarias desde la aplicación móvil | EP-014; US-065, US-066, US-078 |

## Catálogo de Epics, User Stories y Technical Enablers

<table>
  <thead>
    <tr>
      <th>Epic / Story ID</th>
      <th>Titulo</th>
      <th>Descripcion</th>
      <th>Criterios de Aceptacion</th>
      <th>Relacionado con</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><b>EP-001</b></td>
      <td>Gestion de acceso, sesion y roles</td>
      <td>Esta epica agrupa las funcionalidades necesarias para que los usuarios ingresen a AniTec con una identidad determinada y accedan a una experiencia diferenciada segun su rol de ganadero o veterinario.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-002</b></td>
      <td>Dashboard del ganadero</td>
      <td>Esta epica agrupa las funcionalidades del panel principal del ganadero, donde se resumen sus fincas, animales, alertas sanitarias, actividades y datos financieros.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-003</b></td>
      <td>Gestion de fincas del ganadero</td>
      <td>Esta epica agrupa las funcionalidades para registrar, consultar, editar y eliminar las fincas o unidades productivas del ganadero.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-004</b></td>
      <td>Gestion de animales</td>
      <td>Esta epica agrupa las funcionalidades para registrar y administrar animales de distintos tipos de ganado, como bovinos, ovinos, caprinos, porcinos, aves, patos, pollos, cuyes y otros.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-005</b></td>
      <td>Gestion sanitaria y clinica</td>
      <td>Esta epica agrupa las funcionalidades para registrar enfermedades, incidencias, diagnosticos, tratamientos, recetas y seguimientos sanitarios de los animales.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-006</b></td>
      <td>Gestion profesional del veterinario</td>
      <td>Esta epica agrupa las funcionalidades para que el veterinario administre su cartera de clientes ganaderos, consulte sus fincas, revise pacientes y mantenga seguimiento sanitario.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-007</b></td>
      <td>Calendario, actividades y recordatorios</td>
      <td>Esta epica agrupa las funcionalidades para registrar y consultar actividades productivas, sanitarias, financieras, reproductivas y visitas veterinarias.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-008</b></td>
      <td>Gestion financiera del ganadero</td>
      <td>Esta epica agrupa las funcionalidades financieras para que el ganadero registre ingresos, egresos y revise su balance.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-009</b></td>
      <td>Analiticas y estadisticas</td>
      <td>Esta epica agrupa las funcionalidades para visualizar metricas y graficos estadisticos basados en animales, fincas, clientes y registros sanitarios visibles para cada rol.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-010</b></td>
      <td>Navegacion y experiencia compartida</td>
      <td>Esta epica agrupa funcionalidades generales de navegacion, estructura visual, estados vacios y paginas compartidas por los usuarios.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-011</b></td>
      <td>Landing page publica de AniTec</td>
      <td>Esta epica agrupa las historias de usuario de la landing page publica de AniTec. Estas historias estan al final porque corresponden a la experiencia informativa y comercial previa al uso de la aplicacion web.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-012</b></td>
      <td>Dispositivos IoT y metricas</td>
      <td>Esta epica agrupa las funcionalidades para consultar dispositivos asociados a fincas o animales, asi como sus lecturas y metricas recientes.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-013</b></td>
      <td>Planes, suscripciones y pagos</td>
      <td>Esta epica agrupa las funcionalidades para visualizar planes de suscripcion, consultar el plan activo, revisar pagos y realizar pagos simulados dentro de la plataforma.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-014</b></td>
      <td>Experiencia móvil y sincronización edge-to-cloud</td>
      <td>Esta épica agrupa el registro y consulta desde Android, la persistencia local, la cola de sincronización, el reintento y la resolución segura de conflictos.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-015</b></td>
      <td>Colaboración, permisos y auditoría</td>
      <td>Esta épica permite que el propietario solicite, apruebe, limite y revoque accesos, y que las operaciones sensibles conserven autoría y trazabilidad.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>EP-016</b></td>
      <td>Propiedad, conservación y portabilidad de datos</td>
      <td>Esta épica agrupa la exportación, recuperación y conservación de información sanitaria y ganadera sin eliminar su historial.</td>
      <td>No aplica</td>
      <td>No aplica</td>
    </tr>
    <tr>
      <td><b>US-001</b></td>
      <td>Visualizar resumen operativo del ganadero</td>
      <td>Como ganadero, quiero ver un resumen de mis animales, fincas, alertas y actividades para conocer rapidamente el estado de mi operacion.</td>
      <td><b>Visualizacion de metricas del ganadero.</b><br>Given el ganadero tiene animales, fincas, actividades y registros sanitarios<br>When ingresa a su dashboard<br>Then el sistema muestra metricas calculadas con sus propios datos<br><br><b>Ganadero sin datos registrados.</b><br>Given el ganadero no tiene animales ni fincas registradas<br>When ingresa a su dashboard<br>Then el sistema muestra indicadores en cero o mensajes de estado vacio</td>
      <td>EP-002</td>
    </tr>
    <tr>
      <td><b>US-002</b></td>
      <td>Filtrar resumen por finca</td>
      <td>Como ganadero, quiero filtrar mi dashboard por finca para revisar el estado de una unidad productiva especifica.</td>
      <td><b>Seleccion de una finca.</b><br>Given el ganadero tiene mas de una finca registrada<br>When selecciona una finca especifica<br>Then el sistema actualiza los indicadores y listas usando solo los animales de esa finca<br><br><b>Seleccion de todas las fincas.</b><br>Given el ganadero esta revisando una finca especifica<br>When selecciona la opcion de todas las fincas<br>Then el sistema vuelve a mostrar la informacion agregada de todas sus fincas</td>
      <td>EP-002</td>
    </tr>
    <tr>
      <td><b>US-003</b></td>
      <td>Acceder a acciones rapidas del ganadero</td>
      <td>Como ganadero, quiero acceder rapidamente al registro de animales, incidencias y actividades para reducir pasos en tareas frecuentes.</td>
      <td><b>Registrar animal desde el dashboard.</b><br>Given el ganadero esta en su dashboard<br>When selecciona la accion de registrar animal<br>Then el sistema lo dirige al formulario de nuevo animal<br><br><b>Reportar incidencia desde el dashboard.</b><br>Given el ganadero detecta una enfermedad o problema sanitario<br>When selecciona la accion de reportar incidencia<br>Then el sistema lo dirige al formulario de evento sanitario<br><br><b>Programar visita desde el dashboard.</b><br>Given el ganadero necesita una visita o actividad futura<br>When selecciona la accion de programar visita<br>Then el sistema lo dirige al formulario de actividad</td>
      <td>EP-002</td>
    </tr>
    <tr>
      <td><b>US-004</b></td>
      <td>Visualizar listado de fincas en cartas</td>
      <td>Como ganadero, quiero ver mis fincas en cartas con informacion relevante para identificar facilmente cada unidad productiva.</td>
      <td><b>Fincas existentes.</b><br>Given el ganadero tiene fincas registradas<br>When ingresa al apartado de fincas<br>Then el sistema muestra cada finca en una carta<br>And muestra nombre, ubicacion, tipo principal y cantidad de animales<br><br><b>Sin fincas registradas.</b><br>Given el ganadero no tiene fincas registradas<br>When ingresa al apartado de fincas<br>Then el sistema muestra un mensaje indicando que no hay fincas</td>
      <td>EP-003</td>
    </tr>
    <tr>
      <td><b>US-005</b></td>
      <td>Registrar nueva finca</td>
      <td>Como ganadero, quiero registrar una nueva finca para organizar mis animales por ubicacion o unidad productiva.</td>
      <td><b>Registro con datos validos.</b><br>Given el ganadero se encuentra en el formulario de nueva finca<br>When ingresa nombre, ubicacion y tipo principal validos<br>Then el sistema registra la finca<br>And la muestra en el listado de fincas<br><br><b>Registro incompleto.</b><br>Given el ganadero deja campos requeridos vacios<br>When intenta guardar la finca<br>Then el sistema no completa el registro<br>And solicita completar la informacion requerida</td>
      <td>EP-003</td>
    </tr>
    <tr>
      <td><b>US-006</b></td>
      <td>Editar informacion de una finca</td>
      <td>Como ganadero, quiero editar los datos de una finca para mantener actualizada su informacion.</td>
      <td><b>Edicion exitosa.</b><br>Given existe una finca registrada<br>When el ganadero modifica su nombre, ubicacion o tipo principal<br>Then el sistema guarda los cambios<br>And muestra la informacion actualizada<br><br><b>Finca inexistente.</b><br>Given la finca solicitada no existe<br>When el ganadero intenta editarla<br>Then el sistema redirige al listado de fincas</td>
      <td>EP-003</td>
    </tr>
    <tr>
      <td><b>US-007</b></td>
      <td>Desactivar una finca</td>
      <td>Como ganadero, quiero desactivar una finca que ya no forma parte de mi operación para retirarla de las vistas activas sin perder sus registros históricos.</td>
      <td><b>Desactivación.</b><br>Given la finca pertenece al ganadero y no tiene procesos pendientes incompatibles<br>When confirma fecha y motivo<br>Then el sistema la marca como inactiva<br>And conserva animales y eventos históricos<br><br><b>Operación cancelada.</b><br>Given el ganadero abre la confirmación<br>When cancela<br>Then la finca conserva su estado</td>
      <td>EP-003</td>
    </tr>
    <tr>
      <td><b>US-008</b></td>
      <td>Visualizar animales en cartas</td>
      <td>Como ganadero, quiero ver mis animales en cartas para revisar rapidamente la informacion principal de cada uno.</td>
      <td><b>Animales existentes.</b><br>Given el ganadero tiene animales registrados<br>When ingresa al apartado de animales<br>Then el sistema muestra una carta por animal<br>And muestra codigo, nombre, especie, raza, sexo, peso, estado y finca<br><br><b>Sin animales registrados.</b><br>Given el ganadero no tiene animales registrados<br>When ingresa al apartado de animales<br>Then el sistema muestra un mensaje de lista vacia</td>
      <td>EP-004</td>
    </tr>
    <tr>
      <td><b>US-009</b></td>
      <td>Buscar animales por texto</td>
      <td>Como ganadero, quiero buscar animales por nombre, codigo, especie o raza para encontrarlos rapidamente cuando tenga muchos registros.</td>
      <td><b>Busqueda con coincidencias.</b><br>Given existen animales registrados<br>When el ganadero escribe un termino de busqueda que coincide con uno o mas animales<br>Then el sistema muestra solo las cartas coincidentes<br><br><b>Busqueda sin coincidencias.</b><br>Given existen animales registrados<br>When el ganadero escribe un termino sin coincidencias<br>Then el sistema muestra un mensaje indicando que no se encontraron animales</td>
      <td>EP-004</td>
    </tr>
    <tr>
      <td><b>US-010</b></td>
      <td>Registrar animal</td>
      <td>Como ganadero, quiero registrar un animal indicando su especie y raza para mantener trazabilidad de mi ganado.</td>
      <td><b>Registro con datos validos.</b><br>Given el ganadero tiene al menos una finca registrada<br>When ingresa codigo, nombre, especie, raza, sexo, fecha de nacimiento, peso, estado y finca<br>Then el sistema registra el animal<br>And lo muestra en el listado correspondiente<br><br><b>Registro sin finca.</b><br>Given el ganadero no selecciona una finca<br>When intenta guardar el animal<br>Then el sistema solicita asociar el animal a una finca</td>
      <td>EP-004</td>
    </tr>
    <tr>
      <td><b>US-011</b></td>
      <td>Editar animal</td>
      <td>Como ganadero, quiero editar los datos de un animal para actualizar su estado, peso o informacion general.</td>
      <td><b>Edicion exitosa.</b><br>Given existe un animal registrado<br>When el ganadero modifica sus datos y guarda<br>Then el sistema actualiza el animal<br>And muestra la informacion actualizada en su carta<br><br><b>Animal inexistente.</b><br>Given el animal no existe<br>When el ganadero intenta abrir su formulario de edicion<br>Then el sistema redirige al listado de animales</td>
      <td>EP-004</td>
    </tr>
    <tr>
      <td><b>US-012</b></td>
      <td>Cambiar el estado de un animal sin perder su historial</td>
      <td>Como ganadero, quiero marcar un animal como vendido, transferido, fallecido o inactivo para reflejar que ya no forma parte del hato activo y conservar su trazabilidad.</td>
      <td><b>Cambio de estado.</b><br>Given el ganadero es propietario de un animal activo<br>When selecciona un estado final, indica fecha y motivo y confirma la operación<br>Then el sistema retira el animal de la vista activa<br>And conserva su ficha e historial para consulta<br>And registra autor, fecha y estado anterior<br><br><b>Operación no autorizada.</b><br>Given el usuario no es propietario ni tiene permiso de administración<br>When intenta cambiar el estado del animal<br>Then el sistema rechaza la operación sin modificar información</td>
      <td>EP-004, EP-016</td>
    </tr>
    <tr>
      <td><b>US-013</b></td>
      <td>Consultar animales segun rol</td>
      <td>Como usuario, quiero que el sistema muestre animales segun mi rol para proteger la informacion de cada ganadero.</td>
      <td><b>Consulta como ganadero.</b><br>Given el usuario tiene rol de ganadero<br>When ingresa al apartado de animales<br>Then el sistema muestra solo los animales de sus fincas<br><br><b>Consulta como veterinario.</b><br>Given el usuario tiene rol de veterinario<br>When ingresa al apartado de animales o pacientes<br>Then el sistema muestra solo los animales de sus clientes asignados</td>
      <td>EP-004</td>
    </tr>
    <tr>
      <td><b>US-014</b></td>
      <td>Visualizar registros sanitarios en cartas</td>
      <td>Como usuario autorizado, quiero ver los registros sanitarios en cartas para revisar de forma clara la informacion clinica de los animales.</td>
      <td><b>Registros existentes.</b><br>Given existen registros sanitarios asociados a animales visibles para el usuario<br>When ingresa a gestion sanitaria<br>Then el sistema muestra cada registro en una carta<br>And presenta animal, tipo, fecha, descripcion, veterinario y proxima fecha<br><br><b>Sin registros sanitarios.</b><br>Given no existen registros sanitarios visibles para el usuario<br>When ingresa a gestion sanitaria<br>Then el sistema muestra un mensaje de estado vacio</td>
      <td>EP-005</td>
    </tr>
    <tr>
      <td><b>US-015</b></td>
      <td>Registrar incidencia sanitaria como ganadero</td>
      <td>Como ganadero, quiero registrar enfermedades o incidencias basicas de mis animales para dejar constancia y facilitar el seguimiento veterinario.</td>
      <td><b>Registro de incidencia valido.</b><br>Given el ganadero selecciona un animal propio<br>When ingresa tipo, fecha, descripcion y datos de seguimiento<br>Then el sistema registra el evento sanitario para ese animal<br><br><b>Animal no disponible.</b><br>Given el animal pertenece a otro ganadero<br>When el ganadero intenta registrarle una incidencia<br>Then el sistema no lo muestra como opcion disponible</td>
      <td>EP-005</td>
    </tr>
    <tr>
      <td><b>US-016</b></td>
      <td>Registrar diagnostico y tratamiento como veterinario</td>
      <td>Como veterinario, quiero registrar diagnostico, tratamiento, receta y seguimiento para documentar la atencion clinica de un animal.</td>
      <td><b>Registro clinico completo.</b><br>Given el veterinario atiende a un animal de un cliente asignado<br>When ingresa diagnostico, tratamiento, receta, seguimiento y proxima fecha<br>Then el sistema guarda el registro sanitario<br>And lo asocia al animal correspondiente<br><br><b>Animal fuera de cartera.</b><br>Given un animal pertenece a un ganadero no asignado al veterinario<br>When el veterinario intenta registrar atencion sanitaria<br>Then el sistema no muestra ese animal como opcion</td>
      <td>EP-005</td>
    </tr>
    <tr>
      <td><b>US-017</b></td>
      <td>Editar un borrador sanitario</td>
      <td>Como profesional autorizado, quiero editar una atención mientras permanece en borrador para completarla antes de incorporarla al historial clínico.</td>
      <td><b>Edición de borrador.</b><br>Given el profesional es autor de un registro no finalizado<br>When modifica datos válidos y guarda<br>Then el sistema conserva el borrador actualizado<br><br><b>Registro finalizado.</b><br>Given la atención ya fue finalizada<br>When intenta editarla directamente<br>Then el sistema impide sobrescribirla<br>And ofrece el flujo de rectificación de US-018</td>
      <td>EP-005</td>
    </tr>
    <tr>
      <td><b>US-018</b></td>
      <td>Rectificar o anular un registro sanitario</td>
      <td>Como profesional autorizado, quiero rectificar o anular un registro sanitario indicando el motivo para corregir errores sin borrar la historia clínica.</td>
      <td><b>Rectificación trazable.</b><br>Given el veterinario es autor del registro o posee permiso explícito de corrección<br>When ingresa el motivo y confirma los nuevos valores<br>Then el sistema crea una nueva versión vinculada a la anterior<br>And conserva autor y fecha de cada versión<br><br><b>Anulación.</b><br>Given un registro no debe considerarse vigente<br>When el profesional lo anula con un motivo válido<br>Then el sistema lo identifica como anulado sin eliminarlo<br><br><b>Sin permiso.</b><br>Given el usuario no tiene permiso de corrección<br>When intenta modificar o anular el registro<br>Then el sistema rechaza la operación y conserva el historial</td>
      <td>EP-005, EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>US-019</b></td>
      <td>Consultar historial clinico por animal</td>
      <td>Como veterinario, quiero consultar el historial clinico de un animal para tomar mejores decisiones durante una atencion.</td>
      <td><b>Animal con historial.</b><br>Given el animal tiene registros sanitarios previos<br>When el veterinario abre su historial clinico<br>Then el sistema muestra todos los registros asociados al animal<br><br><b>Animal sin historial.</b><br>Given el animal no tiene registros sanitarios previos<br>When el veterinario abre su historial clinico<br>Then el sistema muestra un estado vacio o sin registros</td>
      <td>EP-005</td>
    </tr>
    <tr>
      <td><b>US-020</b></td>
      <td>Visualizar dashboard profesional del veterinario</td>
      <td>Como veterinario, quiero ver un dashboard profesional para revisar clientes, pacientes activos, registros clinicos y seguimientos pendientes.</td>
      <td><b>Veterinario con clientes asignados.</b><br>Given el veterinario tiene ganaderos asignados<br>When ingresa a su dashboard<br>Then el sistema muestra clientes activos, pacientes, registros clinicos y seguimientos<br><br><b>Veterinario sin clientes asignados.</b><br>Given el veterinario no tiene ganaderos asignados<br>When ingresa a su dashboard<br>Then el sistema muestra metricas en cero y permite agregar clientes</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>US-021</b></td>
      <td>Seleccionar cliente en el dashboard veterinario</td>
      <td>Como veterinario, quiero seleccionar un cliente ganadero para revisar sus fincas y animales antes de realizar acciones clinicas.</td>
      <td><b>Seleccion de cliente valido.</b><br>Given el veterinario tiene clientes asignados<br>When selecciona un cliente en el panel<br>Then el sistema muestra las fincas de ese cliente<br>And muestra la cantidad de animales por finca<br><br><b>Cliente sin fincas.</b><br>Given el cliente seleccionado no tiene fincas registradas<br>When el veterinario lo selecciona<br>Then el sistema muestra un mensaje indicando que no hay fincas</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>US-022</b></td>
      <td>Visualizar clientes asignados en cartas</td>
      <td>Como veterinario, quiero ver mis clientes en cartas con informacion completa para entender rapidamente la situacion de cada ganadero.</td>
      <td><b>Clientes existentes.</b><br>Given el veterinario tiene clientes asignados<br>When ingresa a clientes asignados<br>Then el sistema muestra cartas con nombre, fincas, ubicacion, animales, especies, registros sanitarios y alertas<br><br><b>Sin clientes.</b><br>Given el veterinario no tiene clientes asignados<br>When ingresa a clientes asignados<br>Then el sistema muestra un mensaje indicando que no tiene clientes</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>US-023</b></td>
      <td>Solicitar acceso a un cliente ganadero</td>
      <td>Como veterinario, quiero solicitar acceso sanitario a un ganadero mediante un código o invitación para atender sus animales cuando el propietario lo apruebe.</td>
      <td><b>Solicitud pendiente.</b><br>Given el veterinario identifica al ganadero mediante un código o invitación<br>When envía una solicitud con alcance y duración<br>Then el sistema la registra como pendiente<br>And no permite consultar datos antes de la aprobación<br><br><b>Aprobación del propietario.</b><br>Given existe una solicitud pendiente<br>When el ganadero la aprueba<br>Then el veterinario obtiene únicamente los permisos concedidos<br>And la decisión queda auditada<br><br><b>Solicitud rechazada.</b><br>Given el ganadero rechaza la solicitud<br>When el sistema procesa la decisión<br>Then el veterinario no obtiene acceso</td>
      <td>EP-006, EP-015</td>
    </tr>
    <tr>
      <td><b>US-024</b></td>
      <td>Finalizar una relación veterinario-cliente</td>
      <td>Como veterinario, quiero finalizar una relación profesional para dejar de acceder a nuevos datos del cliente sin eliminar los registros clínicos ya emitidos.</td>
      <td><b>Finalización voluntaria.</b><br>Given el veterinario tiene acceso vigente a un cliente<br>When confirma la finalización de la relación<br>Then pierde acceso a los datos no necesarios para conservación profesional<br>And el sistema registra fecha, actor y motivo<br><br><b>Conservación.</b><br>Given la relación finalizó<br>When el propietario consulta su historial<br>Then las atenciones previamente registradas permanecen trazables</td>
      <td>EP-006, EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>US-025</b></td>
      <td>Consultar pacientes por ganadero</td>
      <td>Como veterinario, quiero seleccionar un cliente y ver sus animales para atenderlos de forma organizada.</td>
      <td><b>Cliente con animales.</b><br>Given el veterinario selecciona un cliente con animales registrados<br>When ingresa al apartado de pacientes<br>Then el sistema muestra las cartas de animales de ese cliente<br><br><b>Filtrado por finca.</b><br>Given el cliente tiene mas de una finca<br>When el veterinario selecciona una finca especifica<br>Then el sistema muestra solo los animales de esa finca</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>US-026</b></td>
      <td>Acceder al historial de un paciente</td>
      <td>Como veterinario, quiero abrir el historial clinico desde la carta del paciente para revisar sus atenciones anteriores.</td>
      <td><b>Acceso desde pacientes.</b><br>Given el veterinario esta visualizando los animales de un cliente<br>When selecciona ver historial en una carta de animal<br>Then el sistema abre el historial clinico del animal seleccionado<br><br><b>Paciente sin registros.</b><br>Given el animal no tiene registros clinicos<br>When el veterinario abre su historial<br>Then el sistema muestra que aun no existen atenciones registradas</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>US-027</b></td>
      <td>Visualizar calendario de actividades</td>
      <td>Como usuario, quiero ver mis actividades programadas para organizar tareas ganaderas y sanitarias.</td>
      <td><b>Actividades existentes.</b><br>Given existen actividades visibles para el usuario<br>When ingresa al apartado de actividades<br>Then el sistema muestra una lista cronologica con fecha, titulo, tipo, estado y prioridad<br><br><b>Sin actividades.</b><br>Given no existen actividades visibles para el usuario<br>When ingresa al apartado de actividades<br>Then el sistema muestra un mensaje indicando que no hay actividades programadas</td>
      <td>EP-007</td>
    </tr>
    <tr>
      <td><b>US-028</b></td>
      <td>Crear actividad o recordatorio</td>
      <td>Como usuario, quiero crear actividades para programar controles, visitas, tareas productivas o recordatorios financieros.</td>
      <td><b>Actividad valida.</b><br>Given el usuario ingresa titulo, tipo, fecha, prioridad y estado<br>When guarda la actividad<br>Then el sistema registra la actividad<br>And la muestra en el calendario<br><br><b>Actividad incompleta.</b><br>Given el usuario no ingresa titulo o fecha<br>When intenta guardar la actividad<br>Then el sistema solicita completar los datos requeridos</td>
      <td>EP-007</td>
    </tr>
    <tr>
      <td><b>US-029</b></td>
      <td>Editar evento</td>
      <td>Como usuario, quiero editar un evento para actualizar fecha, prioridad o estado.</td>
      <td><b>Edicion exitosa.</b><br>Given existe un evento registrado<br>When el usuario modifica sus datos y guarda<br>Then el sistema actualiza el evento en el calendario<br><br><b>Evento inexistente.</b><br>Given el evento no existe<br>When el usuario intenta editarlo<br>Then el sistema redirige al calendario</td>
      <td>EP-007</td>
    </tr>
    <tr>
      <td><b>US-030</b></td>
      <td>Cancelar una actividad</td>
      <td>Como responsable, quiero cancelar una actividad indicando el motivo para retirarla de pendientes sin perder su trazabilidad.</td>
      <td><b>Cancelación.</b><br>Given existe una actividad pendiente y el usuario tiene permiso<br>When confirma el motivo de cancelación<br>Then el sistema la marca como cancelada<br>And conserva actor y fecha<br><br><b>Sin permiso.</b><br>Given el usuario no es responsable ni propietario<br>When intenta cancelarla<br>Then el sistema rechaza la operación</td>
      <td>EP-007</td>
    </tr>
    <tr>
      <td><b>US-031</b></td>
      <td>Visualizar movimientos financieros</td>
      <td>Como ganadero, quiero ver mis ingresos, egresos y balance para controlar la rentabilidad de mi operacion.</td>
      <td><b>Movimientos existentes.</b><br>Given el ganadero tiene movimientos financieros registrados<br>When ingresa al apartado de finanzas<br>Then el sistema muestra ingresos, egresos, balance y detalle de movimientos<br><br><b>Sin movimientos.</b><br>Given el ganadero no tiene movimientos financieros<br>When ingresa al apartado de finanzas<br>Then el sistema muestra valores en cero o una lista vacia</td>
      <td>EP-008</td>
    </tr>
    <tr>
      <td><b>US-032</b></td>
      <td>Registrar movimiento financiero</td>
      <td>Como ganadero, quiero registrar ingresos y egresos para mantener actualizado mi balance mensual.</td>
      <td><b>Registro de ingreso.</b><br>Given el ganadero vende productos o animales<br>When registra un movimiento de tipo ingreso con categoria, monto, fecha y descripcion<br>Then el sistema suma el monto a los ingresos<br><br><b>Registro de egreso.</b><br>Given el ganadero realiza un gasto operativo<br>When registra un movimiento de tipo egreso con categoria, monto, fecha y descripcion<br>Then el sistema suma el monto a los egresos</td>
      <td>EP-008</td>
    </tr>
    <tr>
      <td><b>US-033</b></td>
      <td>Editar movimiento financiero</td>
      <td>Como ganadero, quiero editar un movimiento financiero para corregir montos, categorias o fechas.</td>
      <td><b>Edicion exitosa.</b><br>Given existe un movimiento financiero<br>When el ganadero modifica sus datos y guarda<br>Then el sistema actualiza el movimiento<br>And recalcula los totales financieros<br><br><b>Movimiento inexistente.</b><br>Given el movimiento no existe<br>When el ganadero intenta editarlo<br>Then el sistema redirige al listado financiero</td>
      <td>EP-008</td>
    </tr>
    <tr>
      <td><b>US-034</b></td>
      <td>Anular un movimiento financiero</td>
      <td>Como ganadero, quiero anular un movimiento incorrecto indicando el motivo para corregir el balance sin borrar la operación original.</td>
      <td><b>Anulación.</b><br>Given el movimiento pertenece al ganadero<br>When confirma el motivo<br>Then el sistema lo marca como anulado<br>And recalcula el balance<br>And conserva la operación original<br><br><b>Cancelación del flujo.</b><br>Given abrió la confirmación<br>When cancela<br>Then el movimiento no cambia</td>
      <td>EP-008</td>
    </tr>
    <tr>
      <td><b>US-035</b></td>
      <td>Visualizar analiticas del ganadero</td>
      <td>Como ganadero, quiero ver analiticas basadas en mis propios animales, fincas y registros sanitarios para tomar decisiones sobre el estado sanitario y productivo de mi hato.</td>
      <td><b>Analitica con datos propios.</b><br>Given el ganadero tiene animales, fincas y registros sanitarios registrados<br>When ingresa al apartado de analiticas<br>Then el sistema muestra metricas calculadas solo con sus datos<br><br><b>Analitica sin datos.</b><br>Given el ganadero no tiene informacion registrada<br>When ingresa al apartado de analiticas<br>Then el sistema muestra metricas en cero o graficos con estado sin datos</td>
      <td>EP-009</td>
    </tr>
    <tr>
      <td><b>US-036</b></td>
      <td>Visualizar analiticas del veterinario</td>
      <td>Como veterinario, quiero ver analiticas sanitarias de mis clientes asignados para priorizar pacientes, seguimientos y atenciones por hato.</td>
      <td><b>Analitica con clientes asignados.</b><br>Given el veterinario tiene clientes asignados<br>When ingresa al apartado de analiticas<br>Then el sistema muestra metricas de clientes, pacientes monitoreados, registros sanitarios y seguimientos pendientes<br><br><b>Graficos sanitarios del veterinario.</b><br>Given existen registros sanitarios de animales bajo supervision del veterinario<br>When visualiza analiticas<br>Then el sistema muestra graficos de registros por tipo y atenciones por hato</td>
      <td>EP-009</td>
    </tr>
    <tr>
      <td><b>US-037</b></td>
      <td>Visualizar estado sanitario del hato</td>
      <td>Como ganadero, quiero ver un grafico del estado de mis animales para identificar cuantos estan saludables, en observacion o en tratamiento.</td>
      <td><b>Grafico con animales registrados.</b><br>Given el ganadero tiene animales registrados con diferentes estados<br>When ingresa a analiticas<br>Then el sistema muestra un grafico de estado del hato con animales saludables, en observacion y en tratamiento<br><br><b>Grafico sin animales.</b><br>Given el ganadero no tiene animales registrados<br>When ingresa a analiticas<br>Then el sistema muestra el grafico sin datos o con valores en cero</td>
      <td>EP-009</td>
    </tr>
    <tr>
      <td><b>US-038</b></td>
      <td>Visualizar registros sanitarios por tipo</td>
      <td>Como usuario autorizado, quiero ver los registros sanitarios agrupados por tipo para entender que atenciones son mas frecuentes.</td>
      <td><b>Registros sanitarios existentes.</b><br>Given existen registros sanitarios visibles para el usuario<br>When ingresa al apartado de analiticas<br>Then el sistema muestra un grafico con tipos como incidencia, vacuna, revision, tratamiento y diagnostico<br><br><b>Sin registros sanitarios.</b><br>Given no existen registros sanitarios visibles para el usuario<br>When visualiza el grafico<br>Then el sistema muestra valores en cero o una representacion sin datos</td>
      <td>EP-009</td>
    </tr>
    <tr>
      <td><b>US-039</b></td>
      <td>Visualizar atenciones sanitarias por hato</td>
      <td>Como veterinario, quiero ver las atenciones sanitarias por hato para identificar que clientes requieren mas seguimiento.</td>
      <td><b>Atenciones agrupadas por hato.</b><br>Given el veterinario tiene clientes con hatos y registros sanitarios<br>When ingresa a analiticas<br>Then el sistema muestra un grafico con la cantidad de atenciones sanitarias por hato<br><br><b>Cliente sin atenciones.</b><br>Given un hato no tiene registros sanitarios asociados<br>When se generan las analiticas<br>Then el sistema muestra ese hato con valor cero o sin atenciones registradas</td>
      <td>EP-009</td>
    </tr>
    <tr>
      <td><b>US-040</b></td>
      <td>Navegar mediante menu lateral segun rol</td>
      <td>Como usuario autenticado, quiero ver un menu lateral adaptado a mi rol para acceder rapidamente a las secciones disponibles.</td>
      <td><b>Menu del ganadero.</b><br>Given el usuario tiene rol de ganadero<br>When se muestra el layout principal<br>Then el menu incluye panel ganadero, fincas, animales, sanidad, actividades, finanzas y analiticas<br><br><b>Menu del veterinario.</b><br>Given el usuario tiene rol de veterinario<br>When se muestra el layout principal<br>Then el menu incluye panel veterinario, clientes, pacientes, sanidad, actividades y analiticas</td>
      <td>EP-010</td>
    </tr>
    <tr>
      <td><b>US-041</b></td>
      <td>Visualizar pagina de inicio interna</td>
      <td>Como usuario autenticado, quiero ver una pagina de inicio operativa para acceder a modulos principales y obtener un resumen general.</td>
      <td><b>Inicio con datos disponibles.</b><br>Given el usuario tiene datos registrados<br>When ingresa a la pagina de inicio interna<br>Then el sistema muestra accesos y resumen operativo<br><br><b>Inicio sin datos.</b><br>Given el usuario aun no tiene datos registrados<br>When ingresa a la pagina de inicio interna<br>Then el sistema muestra accesos principales para comenzar</td>
      <td>EP-010</td>
    </tr>
    <tr>
      <td><b>US-042</b></td>
      <td>Visualizar pagina acerca de AniTec</td>
      <td>Como usuario, quiero consultar informacion acerca de AniTec para entender el proposito de la aplicacion.</td>
      <td><b>Acceso a la pagina acerca de.</b><br>Given el usuario navega a la seccion acerca de<br>When la pagina carga<br>Then el sistema muestra una descripcion de AniTec y sus modulos principales</td>
      <td>EP-010</td>
    </tr>
    <tr>
      <td><b>US-043</b></td>
      <td>Visualizar pagina no encontrada</td>
      <td>Como usuario, quiero ver un mensaje claro cuando ingreso a una ruta no disponible para saber que no existe contenido asociado.</td>
      <td><b>Ruta invalida.</b><br>Given el usuario ingresa una URL inexistente<br>When el sistema no encuentra una ruta asociada<br>Then muestra la pagina no encontrada<br>And permite volver a una ruta valida</td>
      <td>EP-010</td>
    </tr>
    <tr>
      <td><b>US-044</b></td>
      <td>Visualizar pagina principal de la landing page</td>
      <td>Como visitante, quiero ver la pagina principal de AniTec para comprender rapidamente que ofrece la plataforma.</td>
      <td><b>Carga de pagina principal.</b><br>Given el visitante ingresa a la landing page principal<br>When la pagina carga<br>Then el sistema muestra el logo, navegacion, hero principal, propuesta de valor y llamados a la accion<br><br><b>Navegacion hacia secciones internas.</b><br>Given el visitante esta en la pagina principal<br>When selecciona una opcion del menu<br>Then el sistema lo dirige a la seccion o pagina correspondiente</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-045</b></td>
      <td>Conocer beneficios generales de AniTec</td>
      <td>Como visitante, quiero revisar los beneficios generales de AniTec para evaluar si la plataforma resuelve mis necesidades de gestion ganadera.</td>
      <td><b>Visualizacion de beneficios.</b><br>Given el visitante navega a la seccion de beneficios o caracteristicas<br>When la seccion se muestra<br>Then el sistema presenta beneficios relacionados con gestion ganadera, sanidad, productividad y trazabilidad<br><br><b>Revision desde dispositivo movil.</b><br>Given el visitante usa un dispositivo movil<br>When visualiza los beneficios<br>Then el contenido se adapta al tamano de pantalla sin perder legibilidad</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-046</b></td>
      <td>Visualizar pagina para ganaderos</td>
      <td>Como ganadero visitante, quiero acceder a una pagina orientada a mi perfil para entender como AniTec mejora mi gestion diaria.</td>
      <td><b>Carga de pagina para ganaderos.</b><br>Given el visitante selecciona la pagina para ganaderos<br>When la pagina carga<br>Then el sistema muestra informacion sobre gestion de animales, sanidad, productividad, finanzas y alertas<br><br><b>Revision de comparacion tradicional vs AniTec.</b><br>Given el visitante esta en la pagina para ganaderos<br>When llega a la seccion comparativa<br>Then el sistema muestra diferencias entre la gestion tradicional y la gestion con AniTec</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-047</b></td>
      <td>Visualizar pagina para veterinarios</td>
      <td>Como veterinario visitante, quiero acceder a una pagina orientada a mi perfil para entender como AniTec apoya la gestion de clientes y pacientes.</td>
      <td><b>Carga de pagina para veterinarios.</b><br>Given el visitante selecciona la pagina para veterinarios<br>When la pagina carga<br>Then el sistema muestra informacion sobre clientes, pacientes, historiales clinicos, visitas y analiticas sanitarias<br><br><b>Revision de flujo profesional.</b><br>Given el visitante esta en la pagina para veterinarios<br>When revisa las secciones de uso<br>Then el sistema explica como el veterinario puede organizar su cartera y atenciones</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-048</b></td>
      <td>Visualizar pagina nosotros</td>
      <td>Como visitante, quiero conocer al equipo y la propuesta de AniTec para confiar en la solucion.</td>
      <td><b>Carga de pagina nosotros.</b><br>Given el visitante selecciona la pagina nosotros<br>When la pagina carga<br>Then el sistema muestra informacion institucional, proposito y contexto del producto</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-049</b></td>
      <td>Cambiar idioma en la landing page</td>
      <td>Como visitante, quiero cambiar el idioma de la landing page para leer la informacion en mi idioma preferido.</td>
      <td><b>Cambio a espanol.</b><br>Given la landing page esta en ingles<br>When el visitante selecciona espanol<br>Then el sistema actualiza los textos disponibles a espanol<br><br><b>Cambio a ingles.</b><br>Given la landing page esta en espanol<br>When el visitante selecciona ingles<br>Then el sistema actualiza los textos disponibles a ingles</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-050</b></td>
      <td>Consultar casos de uso ilustrativos</td>
      <td>Como visitante, quiero revisar casos de uso claramente identificados como ilustrativos para comprender cómo AniTec podría apoyar a ganaderos y veterinarios sin confundirlos con testimonios reales.</td>
      <td><b>Casos ilustrativos.</b><br>Given existen escenarios de demostración basados en personas mock<br>When el visitante abre la sección de casos de uso<br>Then el sistema muestra contexto, problema y resultado esperado<br>And identifica de forma visible que el caso es ilustrativo y no un testimonio real<br><br><b>Testimonio futuro.</b><br>Given el equipo desea publicar una experiencia real<br>When configura el contenido<br>Then debe existir autorización verificable y no se presentan afirmaciones no sustentadas</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-051</b></td>
      <td>Acceder a contacto o llamada a la accion</td>
      <td>Como visitante interesado, quiero encontrar facilmente una llamada a la accion o datos de contacto para dar el siguiente paso con AniTec.</td>
      <td><b>Acceso a contacto desde navegacion.</b><br>Given el visitante esta en la landing page<br>When selecciona la opcion de contacto<br>Then el sistema lo desplaza o redirige al bloque de contacto<br><br><b>Acceso desde CTA.</b><br>Given el visitante lee la propuesta de valor<br>When selecciona un boton de llamada a la accion<br>Then el sistema lo dirige a la seccion definida para iniciar contacto o conocer mas</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-052</b></td>
      <td>Visualizar landing page en dispositivos moviles</td>
      <td>Como visitante movil, quiero navegar la landing page desde mi celular para conocer AniTec sin problemas de visualizacion.</td>
      <td><b>Menu movil.</b><br>Given el visitante abre la landing page desde un dispositivo movil<br>When selecciona el boton de menu<br>Then el sistema muestra las opciones de navegacion adaptadas a pantalla pequena<br><br><b>Contenido responsive.</b><br>Given el visitante navega por la landing page desde movil<br>When revisa imagenes, textos y tarjetas<br>Then el contenido se adapta sin cortes, solapamientos ni perdida de legibilidad</td>
      <td>EP-011</td>
    </tr>
    <tr>
      <td><b>US-053</b></td>
      <td>Iniciar sesion como usuario registrado</td>
      <td>Como usuario registrado, quiero iniciar sesion con mis credenciales para acceder a las funcionalidades que corresponden a mi rol.</td>
      <td><b>Inicio de sesion con credenciales validas.</b><br>Given el usuario se encuentra en la pantalla de inicio de sesion<br>And ingresa un usuario y contrasena validos<br>When selecciona la opcion de ingresar<br>Then el sistema autentica al usuario mediante el backend<br>And guarda el token JWT de la sesion<br>And redirige al dashboard correspondiente segun su rol<br><br><b>Inicio de sesion con credenciales invalidas.</b><br>Given el usuario se encuentra en la pantalla de inicio de sesion<br>And ingresa un usuario o contrasena incorrectos<br>When selecciona la opcion de ingresar<br>Then el sistema no permite el acceso<br>And muestra un mensaje de credenciales invalidas</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>US-054</b></td>
      <td>Redirigir al dashboard del rol correspondiente</td>
      <td>Como usuario autenticado, quiero ser enviado al panel correcto para usar solo las funciones propias de mi perfil.</td>
      <td><b>Acceso como ganadero.</b><br>Given el usuario autenticado tiene rol de ganadero<br>When el inicio de sesion se completa correctamente<br>Then el sistema lo redirige al dashboard ganadero<br><br><b>Acceso como veterinario.</b><br>Given el usuario autenticado tiene rol de veterinario<br>When el inicio de sesion se completa correctamente<br>Then el sistema lo redirige al dashboard veterinario</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>US-055</b></td>
      <td>Restringir rutas segun rol</td>
      <td>Como usuario autenticado, quiero que el sistema me permita acceder solo a las secciones correspondientes a mi rol para evitar operaciones que no me pertenecen.</td>
      <td><b>Ganadero intenta acceder a una ruta de veterinario.</b><br>Given el usuario autenticado tiene rol de ganadero<br>When intenta ingresar a una ruta exclusiva de veterinarios<br>Then el sistema bloquea el acceso<br>And lo redirige a su dashboard ganadero<br><br><b>Veterinario intenta acceder a una ruta exclusiva de finanzas ganaderas.</b><br>Given el usuario autenticado tiene rol de veterinario<br>When intenta acceder a una ruta exclusiva del ganadero<br>Then el sistema bloquea el acceso<br>And lo redirige a su dashboard veterinario</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>US-056</b></td>
      <td>Cerrar sesion</td>
      <td>Como usuario autenticado, quiero cerrar sesion para proteger mi informacion cuando deje de usar la aplicacion.</td>
      <td><b>Cierre de sesion exitoso.</b><br>Given el usuario tiene una sesion activa<br>When selecciona la opcion de salir<br>Then el sistema elimina la sesion activa<br>And redirige al usuario a la pantalla de inicio de sesion<br><br><b>Intento de acceso posterior al cierre de sesion.</b><br>Given el usuario cerro sesion<br>When intenta acceder a una ruta privada<br>Then el sistema solicita iniciar sesion nuevamente</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>US-057</b></td>
      <td>Cambiar idioma de la interfaz</td>
      <td>Como usuario, quiero cambiar el idioma de la interfaz para utilizar la aplicacion en el idioma que prefiera.</td>
      <td><b>Seleccion de idioma espanol.</b><br>Given el usuario visualiza la aplicacion en otro idioma<br>When selecciona la opcion ES<br>Then el sistema muestra los textos de la interfaz en espanol<br><br><b>Seleccion de idioma ingles.</b><br>Given el usuario visualiza la aplicacion en espanol<br>When selecciona la opcion EN<br>Then el sistema muestra los textos disponibles en ingles</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>US-058</b></td>
      <td>Visualizar dispositivos IoT registrados</td>
      <td>Como usuario autenticado, quiero ver los dispositivos IoT registrados en la plataforma para monitorear los equipos asociados a fincas o animales.</td>
      <td><b>Dispositivos disponibles.</b><br>Given existen dispositivos registrados en el backend<br>When el usuario ingresa al modulo IoT<br>Then el sistema muestra tarjetas con nombre, tipo, estado y asociacion del dispositivo<br><br><b>Sin dispositivos registrados.</b><br>Given no existen dispositivos registrados<br>When el usuario ingresa al modulo IoT<br>Then el sistema muestra un estado vacio indicando que no hay dispositivos disponibles</td>
      <td>EP-012</td>
    </tr>
    <tr>
      <td><b>US-059</b></td>
      <td>Consultar metricas de un dispositivo IoT</td>
      <td>Como usuario autenticado, quiero consultar las metricas recientes de un dispositivo para conocer lecturas como peso, temperatura, humedad o actividad.</td>
      <td><b>Metricas disponibles.</b><br>Given un dispositivo tiene lecturas registradas<br>When el usuario revisa el detalle del dispositivo<br>Then el sistema muestra la ultima metrica y el historial de lecturas disponibles<br><br><b>Dispositivo sin metricas.</b><br>Given un dispositivo no tiene lecturas registradas<br>When el usuario revisa sus metricas<br>Then el sistema muestra un mensaje indicando que aun no existen lecturas</td>
      <td>EP-012</td>
    </tr>
    <tr>
      <td><b>US-060</b></td>
      <td>Visualizar planes de suscripcion</td>
      <td>Como usuario autenticado, quiero visualizar los planes de suscripcion disponibles para elegir el plan que mejor se adapte a mi operacion.</td>
      <td><b>Planes disponibles.</b><br>Given existen planes activos en el backend<br>When el usuario ingresa al modulo de planes<br>Then el sistema muestra nombre, precio y caracteristicas de cada plan<br><br><b>Plan activo identificado.</b><br>Given el usuario tiene una suscripcion activa<br>When visualiza los planes<br>Then el sistema identifica visualmente el plan actualmente activo</td>
      <td>EP-013</td>
    </tr>
    <tr>
      <td><b>US-061</b></td>
      <td>Consultar suscripcion activa</td>
      <td>Como usuario autenticado, quiero consultar mi suscripcion activa para conocer el plan asociado a mi cuenta.</td>
      <td><b>Suscripcion activa.</b><br>Given el usuario tiene una suscripcion vigente<br>When ingresa al modulo de planes<br>Then el sistema muestra la informacion de su suscripcion activa<br><br><b>Usuario sin suscripcion.</b><br>Given el usuario no tiene una suscripcion activa<br>When ingresa al modulo de planes<br>Then el sistema permite elegir un plan disponible</td>
      <td>EP-013</td>
    </tr>
    <tr>
      <td><b>US-062</b></td>
      <td>Realizar pago simulado de suscripcion</td>
      <td>Como usuario autenticado, quiero realizar un pago simulado de un plan para activar una suscripcion durante las pruebas del sistema.</td>
      <td><b>Pago simulado exitoso.</b><br>Given el usuario selecciona un plan disponible<br>When confirma el pago simulado<br>Then el backend registra la suscripcion y el pago mock<br>And el frontend actualiza el plan activo del usuario<br><br><b>Error durante el pago.</b><br>Given ocurre un problema al procesar el pago simulado<br>When el usuario intenta confirmar el plan<br>Then el sistema muestra un mensaje de error y mantiene el estado anterior</td>
      <td>EP-013</td>
    </tr>
    <tr>
      <td><b>US-063</b></td>
      <td>Consultar historial de pagos</td>
      <td>Como usuario autenticado, quiero consultar mi historial de pagos para revisar los pagos realizados por mis suscripciones.</td>
      <td><b>Pagos existentes.</b><br>Given el usuario tiene pagos registrados<br>When ingresa al modulo de planes y pagos<br>Then el sistema muestra el historial con monto, moneda, estado y fecha de pago<br><br><b>Sin pagos registrados.</b><br>Given el usuario no tiene pagos registrados<br>When ingresa al historial de pagos<br>Then el sistema muestra un mensaje indicando que aun no hay pagos</td>
      <td>EP-013</td>
    </tr>
    <tr>
      <td><b>US-064</b></td>
      <td>Consumir dashboards desde el backend</td>
      <td>Como usuario autenticado, quiero visualizar dashboards calculados desde el backend para revisar indicadores consistentes con la informacion persistida en la base de datos.</td>
      <td><b>Dashboard de ganadero.</b><br>Given el usuario tiene rol de ganadero<br>When ingresa a su dashboard<br>Then el sistema consume el endpoint de analiticas del ganadero<br>And muestra indicadores basados en datos persistidos<br><br><b>Dashboard de veterinario.</b><br>Given el usuario tiene rol de veterinario<br>When ingresa a su dashboard<br>Then el sistema consume el endpoint de analiticas del veterinario<br>And muestra indicadores de clientes, pacientes y seguimientos</td>
      <td>EP-002, EP-006, EP-009</td>
    </tr>
    <tr>
      <td><b>US-065</b></td>
      <td>Acceder a tareas prioritarias desde Android</td>
      <td>Como usuario de campo, quiero acceder desde Android a animales, historial, alertas y registro sanitario para completar mis tareas sin depender de una computadora.</td>
      <td><b>Acceso móvil.</b><br>Given el usuario inició sesión en la aplicación Android<br>When abre la navegación principal<br>Then encuentra acceso a las tareas permitidas para su rol<br>And la interfaz mantiene legibilidad y objetivos táctiles adecuados<br><br><b>Rol limitado.</b><br>Given una tarea no corresponde al rol<br>When el usuario abre la navegación<br>Then la opción no se muestra y el acceso directo es rechazado</td>
      <td>EP-014, EP-001</td>
    </tr>
    <tr>
      <td><b>US-066</b></td>
      <td>Guardar un registro sanitario sin conexión</td>
      <td>Como usuario de campo autorizado, quiero guardar un evento sanitario cuando no tengo conexión para no perder la información capturada durante el trabajo.</td>
      <td><b>Guardado local.</b><br>Given el dispositivo no tiene conexión y los datos obligatorios son válidos<br>When el usuario guarda el evento<br>Then la aplicación lo conserva localmente con identificador único<br>And lo muestra como pendiente de sincronización<br><br><b>Cierre de aplicación.</b><br>Given existe un registro pendiente<br>When la aplicación se cierra y vuelve a abrir<br>Then el registro continúa disponible sin duplicarse</td>
      <td>EP-014, EP-005</td>
    </tr>
    <tr>
      <td><b>US-067</b></td>
      <td>Consultar el estado de sincronización</td>
      <td>Como usuario de campo, quiero distinguir registros guardados, pendientes, sincronizados y con conflicto para saber si mi información llegó a la nube.</td>
      <td><b>Estados visibles.</b><br>Given existen operaciones locales<br>When el usuario abre el estado de sincronización<br>Then cada operación muestra un estado comprensible y la última actualización<br><br><b>Sin pendientes.</b><br>Given todas las operaciones se sincronizaron<br>When el usuario revisa el estado<br>Then la aplicación confirma que no quedan cambios pendientes</td>
      <td>EP-014</td>
    </tr>
    <tr>
      <td><b>US-068</b></td>
      <td>Reintentar una sincronización fallida</td>
      <td>Como usuario de campo, quiero que la aplicación reintente operaciones fallidas sin crear duplicados para recuperar continuidad cuando regrese la conexión.</td>
      <td><b>Reintento automático.</b><br>Given existe una operación pendiente y la conexión regresa<br>When se ejecuta la sincronización<br>Then la operación se envía de forma idempotente<br>And cambia a sincronizada una sola vez<br><br><b>Fallo persistente.</b><br>Given el servidor continúa no disponible<br>When termina el intento<br>Then la operación permanece local<br>And la aplicación informa el problema sin descartar datos</td>
      <td>EP-014</td>
    </tr>
    <tr>
      <td><b>US-069</b></td>
      <td>Resolver un conflicto de sincronización</td>
      <td>Como usuario autorizado, quiero revisar diferencias cuando dos personas modifican el mismo dato para resolver el conflicto sin sobrescribir información silenciosamente.</td>
      <td><b>Conflicto detectado.</b><br>Given la versión remota cambió desde la última sincronización<br>When el dispositivo intenta enviar una modificación incompatible<br>Then el sistema conserva ambas versiones<br>And marca la operación como conflicto<br><br><b>Resolución.</b><br>Given existe un conflicto visible<br>When un usuario con permiso selecciona o combina los valores y confirma<br>Then se crea una versión resuelta<br>And la decisión queda auditada</td>
      <td>EP-014, EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>US-070</b></td>
      <td>Confirmar la atención de una alerta</td>
      <td>Como responsable de una actividad, quiero confirmar, posponer justificadamente o cerrar una alerta para mantener visible su estado y evitar olvidos.</td>
      <td><b>Confirmación.</b><br>Given existe una alerta pendiente asignada al usuario<br>When confirma su atención<br>Then el sistema registra actor, fecha y resultado<br><br><b>Vencimiento.</b><br>Given una alerta prioritaria vence sin atención<br>When se actualiza su estado<br>Then permanece visible como vencida y no se elimina automáticamente</td>
      <td>EP-007</td>
    </tr>
    <tr>
      <td><b>US-071</b></td>
      <td>Revisar solicitudes de acceso veterinario</td>
      <td>Como ganadero propietario, quiero aprobar o rechazar solicitudes indicando su alcance y duración para controlar quién consulta o registra información de mis animales.</td>
      <td><b>Aprobación limitada.</b><br>Given existe una solicitud pendiente<br>When el propietario selecciona pacientes, permisos y vigencia y confirma<br>Then el acceso queda activo solo con ese alcance<br>And la decisión se audita<br><br><b>Rechazo.</b><br>Given existe una solicitud pendiente<br>When el propietario la rechaza<br>Then no se concede acceso y el veterinario recibe el estado sin datos privados</td>
      <td>EP-015, EP-006</td>
    </tr>
    <tr>
      <td><b>US-072</b></td>
      <td>Revocar el acceso de un veterinario</td>
      <td>Como ganadero propietario, quiero revocar un acceso vigente para impedir nuevas consultas o modificaciones cuando termine la relación profesional.</td>
      <td><b>Revocación efectiva.</b><br>Given un veterinario tiene acceso vigente<br>When el propietario confirma la revocación<br>Then las siguientes solicitudes del veterinario son rechazadas<br>And la fecha y el actor quedan auditados<br><br><b>Conservación clínica.</b><br>Given el acceso fue revocado<br>When el propietario revisa el historial<br>Then las atenciones legítimas anteriores permanecen disponibles</td>
      <td>EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>US-073</b></td>
      <td>Consultar únicamente clientes y pacientes autorizados</td>
      <td>Como veterinario, quiero visualizar solo propietarios y animales con autorización vigente para evitar mezclar clientes o exponer información ajena.</td>
      <td><b>Listado autorizado.</b><br>Given el veterinario posee relaciones vigentes<br>When consulta clientes o pacientes<br>Then el sistema devuelve solo recursos incluidos en sus permisos<br><br><b>Acceso directo no autorizado.</b><br>Given conoce el identificador de un animal fuera de su cartera<br>When intenta consultarlo directamente<br>Then el sistema rechaza la solicitud sin revelar datos</td>
      <td>EP-006, EP-015</td>
    </tr>
    <tr>
      <td><b>US-074</b></td>
      <td>Consultar la auditoría de información sensible</td>
      <td>Como ganadero propietario, quiero conocer quién creó, modificó, rectificó o consultó información sensible para verificar el uso de mis datos.</td>
      <td><b>Eventos auditables.</b><br>Given existen operaciones sobre permisos o registros sanitarios<br>When el propietario consulta la auditoría<br>Then visualiza actor, acción, recurso, fecha y resultado<br><br><b>Integridad.</b><br>Given un usuario ordinario accede al sistema<br>When intenta modificar eventos de auditoría<br>Then el sistema rechaza la operación</td>
      <td>EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>US-075</b></td>
      <td>Exportar información propia</td>
      <td>Como ganadero propietario, quiero exportar la información de mis hatos y animales en un formato reutilizable para conservar una copia y evitar dependencia del proveedor.</td>
      <td><b>Exportación.</b><br>Given el propietario selecciona un alcance autorizado<br>When solicita la exportación<br>Then el sistema genera un archivo con datos y fechas comprensibles<br>And no incluye información de otros propietarios<br><br><b>Preparación diferida.</b><br>Given la exportación requiere procesamiento<br>When aún no está lista<br>Then el sistema informa el estado sin generar archivos parciales</td>
      <td>EP-016</td>
    </tr>
    <tr>
      <td><b>US-076</b></td>
      <td>Recuperar información después de un fallo local</td>
      <td>Como usuario de campo, quiero recuperar registros sincronizados después de reinstalar o cambiar el dispositivo para continuar mi trabajo sin reconstruir el historial.</td>
      <td><b>Recuperación autorizada.</b><br>Given el usuario valida su identidad en un nuevo dispositivo<br>When inicia la recuperación<br>Then recibe únicamente la información vigente permitida para su rol<br><br><b>Cambios nunca sincronizados.</b><br>Given existían datos solo en un dispositivo perdido<br>When el usuario consulta la recuperación<br>Then el sistema no afirma haberlos recuperado y explica el alcance de la copia cloud</td>
      <td>EP-016, EP-014</td>
    </tr>
    <tr>
      <td><b>US-077</b></td>
      <td>Consultar versiones de un registro sanitario</td>
      <td>Como profesional autorizado, quiero revisar las versiones y rectificaciones de una atención para comprender qué cambió y utilizar el dato vigente.</td>
      <td><b>Historial de versiones.</b><br>Given un registro fue rectificado o anulado<br>When el usuario autorizado consulta sus detalles<br>Then el sistema muestra la versión vigente y la secuencia de cambios<br>And identifica autor, fecha y motivo<br><br><b>Sin autorización.</b><br>Given el usuario no posee permiso sobre el paciente<br>When intenta consultar las versiones<br>Then el sistema rechaza el acceso</td>
      <td>EP-005, EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>US-078</b></td>
      <td>Completar una guía inicial móvil</td>
      <td>Como usuario nuevo, quiero una guía breve y contextual para aprender a registrar, reconocer estados offline y gestionar permisos sin depender de capacitación extensa.</td>
      <td><b>Primera sesión.</b><br>Given el usuario abre por primera vez una función prioritaria<br>When inicia la guía<br>Then recibe instrucciones breves con opción de omitir y volver a consultar<br><br><b>Comprensión de estados.</b><br>Given la guía explica guardado local y sincronización<br>When finaliza<br>Then presenta un ejemplo visual de pendiente, sincronizado y conflicto</td>
      <td>EP-010, EP-014, EP-015</td>
    </tr>
    <tr><th colspan="5">Technical Enablers — sujetos a validación arquitectónica mediante ADD</th></tr>
    <tr>
      <td><b>TS-001</b></td>
      <td>Configuracion inicial del frontend con Vue, Vite y PrimeVue</td>
      <td>Como Developer frontend, quiero configurar la base del proyecto con Vue, Vite y PrimeVue para construir una aplicacion web modular, rapida y con componentes reutilizables.</td>
      <td><b>Proyecto ejecutable.</b><br>Given el proyecto frontend esta configurado<br>When se ejecuta npm run dev<br>Then la aplicacion inicia correctamente en el navegador<br><br><b>Compilacion correcta.</b><br>Given el codigo fuente esta completo<br>When se ejecuta npm run build<br>Then Vite genera la version de produccion sin errores de compilacion</td>
      <td>EP-010</td>
    </tr>
    <tr>
      <td><b>TS-002</b></td>
      <td>Configuracion de rutas protegidas por rol con Vue Router</td>
      <td>Como Developer frontend, quiero configurar rutas publicas y privadas con validacion por rol para controlar el acceso de ganaderos y veterinarios.</td>
      <td><b>Ruta privada sin sesion.</b><br>Given un usuario no autenticado intenta entrar a una ruta privada<br>When el router evalua la navegacion<br>Then el sistema lo redirige al inicio de sesion<br><br><b>Ruta restringida por rol.</b><br>Given un usuario autenticado intenta acceder a una ruta de otro rol<br>When el router valida los roles permitidos<br>Then el sistema lo redirige a su dashboard correspondiente</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>TS-003</b></td>
      <td>Manejo de estado global con Pinia</td>
      <td>Como Developer frontend, quiero manejar los datos principales mediante stores de Pinia para compartir informacion entre vistas sin repetir logica.</td>
      <td><b>Datos compartidos.</b><br>Given una vista carga animales, fincas, actividades o registros sanitarios<br>When otra vista necesita esos datos<br>Then puede obtenerlos desde el store correspondiente<br><br><b>Actualizacion del estado.</b><br>Given el usuario crea, edita o elimina un registro<br>When el store procesa la accion<br>Then la informacion visible se actualiza en la interfaz</td>
      <td>EP-002, EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-004</b></td>
      <td>Consumo de datos mediante Axios, BaseApi y BaseEndpoint</td>
      <td>Como Developer frontend, quiero centralizar el consumo de datos con Axios, BaseApi y BaseEndpoint para evitar repetir codigo de peticiones y consumir el backend de AniTec de forma consistente.</td>
      <td><b>Consulta de datos.</b><br>Given un store solicita informacion de un modulo<br>When llama a su clase API correspondiente<br>Then el sistema usa BaseEndpoint para obtener los datos del endpoint configurado en el backend<br><br><b>Operacion sobre registros.</b><br>Given el usuario crea, actualiza o elimina un registro<br>When el store llama a la API<br>Then se ejecuta la peticion correspondiente usando la estructura comun de endpoints<br><br><b>Token de sesion.</b><br>Given existe un token JWT guardado en la sesion<br>When se realiza una peticion al backend<br>Then BaseApi agrega el token en el header Authorization</td>
      <td>EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-005</b></td>
      <td>Configuración base de microservicios con ASP.NET Core</td>
      <td>Como Developer backend, quiero una base consistente para los microservicios ASP.NET Core para implementar contratos REST independientes sin acoplar los bounded contexts.</td>
      <td><b>Servicios ejecutables.</b><br>Given se selecciona un bounded context para extracción<br>When se construye y ejecuta su servicio<br>Then inicia de manera independiente<br>And publica health check y contrato OpenAPI<br><br><b>Independencia.</b><br>Given dos servicios están desplegados<br>When uno se detiene<br>Then el otro conserva las operaciones que no dependen de él</td>
      <td>EP-001, EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-006</b></td>
      <td>Persistencia delimitada por servicio</td>
      <td>Como Developer backend, quiero que cada microservicio sea propietario de su esquema o base de datos para evitar acceso directo entre bounded contexts.</td>
      <td><b>Propiedad de datos.</b><br>Given un servicio necesita persistir información<br>When se configura Entity Framework Core y MySQL<br>Then utiliza credenciales y migraciones de su almacenamiento delimitado<br><br><b>Sin acceso cruzado.</b><br>Given otro servicio necesita información<br>When realiza la consulta<br>Then usa un contrato o evento publicado y no tablas ajenas</td>
      <td>EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-007</b></td>
      <td>Autenticacion backend con JWT y BCrypt</td>
      <td>Como Developer backend, quiero implementar autenticacion con JWT y BCrypt para validar credenciales y proteger el acceso de los usuarios registrados.</td>
      <td><b>Inicio de sesion valido.</b><br>Given un usuario registrado ingresa credenciales correctas<br>When consume el endpoint de sign-in<br>Then el sistema responde con los datos del usuario y un token JWT<br><br><b>Contrasena protegida.</b><br>Given un usuario se registra en el sistema<br>When se almacena su contrasena<br>Then el backend la guarda usando hashing con BCrypt</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>TS-008</b></td>
      <td>Extracción incremental de bounded contexts</td>
      <td>Como Developer backend, quiero extraer las capacidades prioritarias en microservicios alineados con el dominio para desplegarlas y evolucionarlas independientemente.</td>
      <td><b>Extracción trazable.</b><br>Given ADD selecciona un bounded context y sus drivers<br>When se implementa el microservicio<br>Then expone contratos versionados y conserva sus invariantes<br><br><b>Migración incremental.</b><br>Given una capacidad aún permanece en la línea base<br>When el nuevo servicio entra en operación<br>Then la transición evita escrituras simultáneas no controladas sobre los mismos datos</td>
      <td>EP-003, EP-004, EP-005, EP-007, EP-008</td>
    </tr>
    <tr>
      <td><b>TS-009</b></td>
      <td>Servicios backend para analiticas y clientes veterinarios</td>
      <td>Como Developer backend, quiero implementar endpoints de analiticas y clientes veterinarios para que ganaderos y veterinarios consulten informacion calculada desde el servidor.</td>
      <td><b>Dashboard de ganadero.</b><br>Given existen datos de fincas, animales, eventos y registros financieros<br>When se consulta el dashboard de un ganadero<br>Then la API devuelve metricas resumidas para su operacion<br><br><b>Clientes del veterinario.</b><br>Given un veterinario tiene ganaderos asignados<br>When consulta su cartera de clientes<br>Then la API devuelve los clientes y datos relacionados necesarios para el frontend</td>
      <td>EP-006, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-010</b></td>
      <td>Servicios separados de telemetría y suscripciones</td>
      <td>Como Developer backend, quiero separar telemetría IoT y suscripciones en servicios con contratos propios para escalar y desplegar cada capacidad según sus drivers.</td>
      <td><b>Telemetría.</b><br>Given llegan lecturas de dispositivos<br>When el servicio de telemetría las procesa<br>Then las valida y almacena sin depender de tablas de suscripciones<br><br><b>Suscripciones.</b><br>Given se consulta un plan o pago de prueba<br>When el servicio de suscripciones responde<br>Then no accede directamente al almacenamiento de telemetría</td>
      <td>EP-012, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-011</b></td>
      <td>Documentacion y pruebas de API con Swagger</td>
      <td>Como Developer backend, quiero documentar y probar los endpoints con Swagger para validar manualmente el funcionamiento de la API antes de integrarla con el frontend.</td>
      <td><b>Swagger disponible.</b><br>Given la API esta ejecutandose en ambiente de desarrollo<br>When se abre Swagger en el navegador<br>Then se muestran los controladores y endpoints disponibles<br><br><b>Pruebas manuales.</b><br>Given un endpoint fue implementado<br>When se prueba desde Swagger o una herramienta HTTP<br>Then el backend responde con el codigo HTTP y datos esperados</td>
      <td>EP-001, EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-012</b></td>
      <td>Integracion frontend-backend con variables de entorno</td>
      <td>Como Developer frontend, quiero configurar variables de entorno para conectar la aplicacion Vue con la API de AniTec en distintos ambientes.</td>
      <td><b>Ambiente de desarrollo.</b><br>Given el frontend se ejecuta en modo desarrollo<br>When se leen las variables de entorno<br>Then la URL base apunta al backend local de AniTec<br><br><b>Cambio de ambiente.</b><br>Given se prepara un despliegue de produccion<br>When se configura la URL del backend productivo<br>Then el frontend consume la API real sin modificar el codigo fuente de los stores</td>
      <td>EP-001, EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009, EP-012, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-013</b></td>
      <td>Stores frontend para IoT y suscripciones</td>
      <td>Como Developer frontend, quiero crear stores y servicios para dispositivos, metricas, planes y pagos para integrar las nuevas pantallas con el backend.</td>
      <td><b>Store de dispositivos.</b><br>Given existe el modulo IoT en el frontend<br>When se carga la vista de dispositivos<br>Then el store consume dispositivos y metricas desde el backend<br><br><b>Store de suscripciones.</b><br>Given existe el modulo de planes<br>When el usuario ingresa a la vista de suscripciones<br>Then el store consume planes, suscripcion activa, pagos y checkout mock desde el backend</td>
      <td>EP-012, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-014</b></td>
      <td>Mapeo de recursos de clientes veterinarios</td>
      <td>Como Developer frontend, quiero mapear correctamente los recursos de clientes veterinarios para diferenciar el identificador de la relacion y el identificador del ganadero.</td>
      <td><b>Cliente veterinario recibido.</b><br>Given el backend devuelve un cliente con id de relacion y rancherId<br>When el frontend transforma el recurso<br>Then usa rancherId como identificador del ganadero en vistas de clientes y pacientes<br><br><b>Acciones sobre cliente.</b><br>Given el veterinario elimina o consulta un cliente<br>When se envia una peticion al backend<br>Then se utiliza el identificador correcto del ganadero</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>TS-015</b></td>
      <td>Configuracion de endpoints para despliegue productivo</td>
      <td>Como Developer frontend, quiero configurar el ambiente de produccion para que la aplicacion desplegada consuma el backend real y no el servicio mock utilizado durante prototipado.</td>
      <td><b>URL productiva configurada.</b><br>Given existe una API backend desplegada<br>When se prepara el build de produccion del frontend<br>Then la variable VITE_ANITEC_API_URL apunta al backend real<br><br><b>Endpoints completos.</b><br>Given el frontend usa modulos de IoT y suscripciones<br>When se revisa la configuracion productiva<br>Then existen rutas para dispositivos, metricas, planes y pagos</td>
      <td>EP-001, EP-012, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-016</b></td>
      <td>Integracion backend con Stripe para suscripciones</td>
      <td>Como Developer backend, quiero integrar Stripe en el bounded context de suscripciones para crear sesiones de pago y relacionarlas con los planes de AniTec.</td>
      <td><b>Sesion de pago creada.</b><br>Given existe un plan de suscripcion activo<br>When el usuario solicita iniciar el pago<br>Then el backend crea una sesion de Stripe y devuelve la URL de checkout<br><br><b>Resultado registrado.</b><br>Given Stripe confirma el resultado del pago<br>When el backend procesa la respuesta correspondiente<br>Then la suscripcion o pago queda registrado para el usuario</td>
      <td>EP-013</td>
    </tr>
    <tr>
      <td><b>TS-017</b></td>
      <td>Integracion frontend del flujo de pago con Stripe</td>
      <td>Como Developer frontend, quiero conectar la vista de planes con el checkout de Stripe para que el usuario pueda iniciar el pago desde la aplicacion web.</td>
      <td><b>Inicio de checkout.</b><br>Given el usuario autenticado selecciona un plan<br>When presiona el boton de pago<br>Then el frontend solicita la sesion de pago al backend<br><br><b>Redireccion a Stripe.</b><br>Given el backend devuelve una URL de checkout<br>When el frontend recibe la respuesta<br>Then redirige al usuario hacia la pasarela de pago de Stripe</td>
      <td>EP-013</td>
    </tr>
    <tr>
      <td><b>TS-018</b></td>
      <td>Mejora del IAM backend para autenticacion y autorizacion por rol</td>
      <td>Como Developer backend, quiero mejorar el IAM para validar credenciales, roles y datos de sesion de forma consistente en la API.</td>
      <td><b>Token con rol.</b><br>Given un usuario inicia sesion correctamente<br>When el backend genera el JWT<br>Then el token incluye la informacion necesaria para identificar usuario y rol<br><br><b>Autorizacion por rol.</b><br>Given un endpoint requiere un rol especifico<br>When un usuario con otro rol intenta acceder<br>Then la API rechaza la solicitud con una respuesta de autorizacion</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>TS-019</b></td>
      <td>Proteccion de endpoints principales mediante JWT y roles</td>
      <td>Como Developer backend, quiero proteger los endpoints principales con JWT y roles para evitar el acceso no autorizado a informacion de AniTec.</td>
      <td><b>Endpoint protegido sin token.</b><br>Given una peticion no incluye token JWT<br>When intenta acceder a un endpoint protegido<br>Then la API responde con estado no autorizado<br><br><b>Endpoint protegido con token valido.</b><br>Given una peticion incluye un token valido y rol permitido<br>When consume un endpoint protegido<br>Then la API procesa la solicitud correctamente</td>
      <td>EP-001, EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009, EP-012, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-020</b></td>
      <td>Adaptacion del IAM frontend para sesion, token y rutas protegidas</td>
      <td>Como Developer frontend, quiero adaptar el IAM para guardar sesion, token y rol del usuario, protegiendo la navegacion segun el tipo de cuenta.</td>
      <td><b>Sesion persistida.</b><br>Given un usuario inicia sesion correctamente<br>When el backend devuelve el token y rol<br>Then el frontend guarda la sesion necesaria para navegar<br><br><b>Ruta protegida.</b><br>Given un usuario no autenticado intenta ingresar a una vista privada<br>When el router valida el acceso<br>Then lo redirige al inicio de sesion</td>
      <td>EP-001</td>
    </tr>
    <tr>
      <td><b>TS-021</b></td>
      <td>Consumo autenticado de endpoints desde stores y servicios frontend</td>
      <td>Como Developer frontend, quiero enviar el token JWT en las peticiones Axios para consumir endpoints protegidos desde los stores de AniTec.</td>
      <td><b>Token enviado.</b><br>Given existe un token de sesion guardado<br>When un store realiza una peticion al backend<br>Then la solicitud incluye el header Authorization<br><br><b>Error de autenticacion.</b><br>Given el token expiro o no es valido<br>When el backend rechaza la peticion<br>Then el frontend muestra un error o redirige al inicio de sesion segun corresponda</td>
      <td>EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009, EP-012, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-022</b></td>
      <td>Documentacion y validacion del flujo de seguridad y suscripcion</td>
      <td>Como Developer, quiero documentar y validar el flujo de IAM, endpoints protegidos y Stripe para evidenciar que el Sprint 4 cumple su objetivo.</td>
      <td><b>Evidencia de seguridad.</b><br>Given los endpoints principales estan protegidos<br>When se documenta el Sprint<br>Then se incluyen evidencias de acceso con token y rechazo sin token<br><br><b>Evidencia de suscripcion.</b><br>Given el flujo de Stripe esta integrado<br>When se documenta el Sprint<br>Then se incluyen evidencias del checkout y resultado del proceso de pago</td>
      <td>EP-001, EP-013</td>
    </tr>
    <tr>
      <td><b>TS-023</b></td>
      <td>Base de la aplicación Android</td>
      <td>Como Developer mobile, quiero una aplicación Android modular para implementar los flujos de campo con navegación, sesión y componentes reutilizables.</td>
      <td><b>Build verificable.</b><br>Given el proyecto Android está configurado<br>When se ejecutan build y pruebas<br>Then la aplicación compila y puede instalarse en el nivel de API soportado<br><br><b>Separación.</b><br>Given existen funciones de ganadero y veterinario<br>When se revisa la estructura<br>Then la lógica de presentación no contiene acceso directo a bases cloud</td>
      <td>EP-014, EP-001</td>
    </tr>
    <tr>
      <td><b>TS-024</b></td>
      <td>Persistencia local y cola transaccional móvil</td>
      <td>Como Developer mobile, quiero persistencia local y una cola durable para conservar operaciones aceptadas sin conexión.</td>
      <td><b>Durabilidad.</b><br>Given una operación válida fue aceptada localmente<br>When la aplicación reinicia<br>Then la operación permanece disponible con el mismo identificador<br><br><b>Atomicidad.</b><br>Given falla el guardado local<br>When la transacción se revierte<br>Then no se muestra al usuario como pendiente</td>
      <td>EP-014</td>
    </tr>
    <tr>
      <td><b>TS-025</b></td>
      <td>API Gateway y contratos versionados</td>
      <td>Como Developer backend, quiero un API Gateway y contratos versionados para ofrecer un punto de entrada controlado a clientes móviles y web.</td>
      <td><b>Enrutamiento.</b><br>Given una solicitud autenticada llega al gateway<br>When corresponde a un servicio disponible<br>Then se enruta conservando identidad y correlación<br><br><b>Versión incompatible.</b><br>Given el cliente solicita una versión no soportada<br>When el gateway procesa la solicitud<br>Then responde con un error documentado sin enrutar silenciosamente</td>
      <td>EP-001, EP-014, EP-015</td>
    </tr>
    <tr>
      <td><b>TS-026</b></td>
      <td>Procesamiento idempotente de sincronización</td>
      <td>Como Developer backend, quiero comandos idempotentes para que los reintentos móviles no dupliquen animales, eventos ni atenciones.</td>
      <td><b>Repetición.</b><br>Given dos solicitudes válidas comparten la misma clave idempotente<br>When el servicio las procesa<br>Then aplica el cambio una sola vez<br>And devuelve un resultado coherente<br><br><b>Claves distintas.</b><br>Given son operaciones independientes<br>When se procesan<br>Then cada una conserva su identidad</td>
      <td>EP-014, EP-005</td>
    </tr>
    <tr>
      <td><b>TS-027</b></td>
      <td>Eventos asíncronos para integración</td>
      <td>Como Developer backend, quiero publicar eventos de dominio relevantes para propagar alertas, telemetría y analítica sin acoplar internamente los servicios.</td>
      <td><b>Publicación confiable.</b><br>Given una transacción genera un evento<br>When se confirma el cambio<br>Then el evento se publica mediante un mecanismo que evita pérdida entre persistencia y envío<br><br><b>Consumidor repetido.</b><br>Given un evento se entrega más de una vez<br>When un consumidor lo procesa<br>Then no duplica el efecto</td>
      <td>EP-007, EP-009, EP-012, EP-014</td>
    </tr>
    <tr>
      <td><b>TS-028</b></td>
      <td>Autorización de mínimo privilegio y auditoría</td>
      <td>Como Developer backend, quiero políticas de autorización y eventos de auditoría para aplicar permisos por recurso y conservar operaciones sensibles.</td>
      <td><b>Autorización por recurso.</b><br>Given un veterinario tiene alcance limitado<br>When solicita otro propietario o paciente<br>Then el servicio rechaza el acceso aunque el rol sea válido<br><br><b>Auditoría.</b><br>Given se modifica un permiso o registro clínico<br>When la operación termina<br>Then se conserva actor, recurso, acción, fecha, correlación y resultado</td>
      <td>EP-015, EP-016</td>
    </tr>
    <tr>
      <td><b>TS-029</b></td>
      <td>Observabilidad distribuida</td>
      <td>Como equipo de operación, quiero métricas, logs estructurados y trazas correlacionadas para detectar fallos entre gateway, servicios y sincronización móvil.</td>
      <td><b>Correlación.</b><br>Given una solicitud atraviesa varios componentes<br>When se consultan las trazas<br>Then comparten un identificador de correlación sin registrar secretos<br><br><b>Alerta operativa.</b><br>Given la tasa de errores supera el umbral definido<br>When el monitoreo evalúa la ventana<br>Then genera una alerta accionable</td>
      <td>EP-014, EP-015</td>
    </tr>
    <tr>
      <td><b>TS-030</b></td>
      <td>Pruebas de contratos, seguridad y sincronización</td>
      <td>Como equipo de desarrollo, quiero suites automatizadas para validar contratos, aislamiento, permisos, idempotencia y recuperación ante pérdida de conexión.</td>
      <td><b>Pipeline.</b><br>Given existe un cambio en un servicio o cliente<br>When se ejecuta integración continua<br>Then corren pruebas unitarias, de contrato y de integración relevantes<br><br><b>Fallo.</b><br>Given una prueba crítica no cumple<br>When finaliza el pipeline<br>Then se bloquea el artefacto candidato y se conserva evidencia</td>
      <td>EP-014, EP-015, EP-016</td>
    </tr>
  </tbody>
</table>
