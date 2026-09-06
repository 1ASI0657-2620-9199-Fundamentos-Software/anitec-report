# 3.1. User Stories.

En esta sección se presentan los Epics, User Stories y Technical Stories identificados para AniTec a partir del análisis de entrevistas, needfinding, definición de segmentos objetivo y alcance actual de la solución. Las User Stories describen necesidades funcionales de ganaderos, veterinarios, usuarios autenticados y visitantes de la landing page. Las Technical Stories describen necesidades técnicas del frontend y del RESTful API, usando el rol Developer y criterios de aceptación en formato Given-When-Then.

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
      <td>Eliminar finca</td>
      <td>Como ganadero, quiero eliminar una finca cuando ya no forma parte de mi operacion.</td>
      <td><b>Eliminacion confirmada.</b><br>Given existe una finca registrada<br>When el ganadero confirma su eliminacion<br>Then el sistema elimina la finca del listado<br><br><b>Eliminacion cancelada.</b><br>Given el ganadero abre la confirmacion de eliminacion<br>When cancela la accion<br>Then el sistema conserva la finca sin cambios</td>
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
      <td>Eliminar animal</td>
      <td>Como ganadero, quiero eliminar un animal cuando ya no pertenece a mi hato o registro productivo.</td>
      <td><b>Eliminacion confirmada.</b><br>Given existe un animal registrado<br>When el ganadero confirma la eliminacion<br>Then el sistema elimina el animal del listado<br><br><b>Eliminacion cancelada.</b><br>Given el ganadero abre la confirmacion de eliminacion<br>When cancela la accion<br>Then el animal permanece registrado</td>
      <td>EP-004</td>
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
      <td>Editar registro sanitario</td>
      <td>Como usuario autorizado, quiero editar un registro sanitario para corregir o complementar informacion clinica.</td>
      <td><b>Edicion exitosa.</b><br>Given existe un registro sanitario visible para el usuario<br>When el usuario actualiza los datos y guarda<br>Then el sistema muestra el registro actualizado<br><br><b>Registro inexistente.</b><br>Given el registro sanitario no existe<br>When el usuario intenta editarlo<br>Then el sistema redirige a la lista de gestion sanitaria</td>
      <td>EP-005</td>
    </tr>
    <tr>
      <td><b>US-018</b></td>
      <td>Eliminar registro sanitario</td>
      <td>Como usuario autorizado, quiero eliminar un registro sanitario incorrecto para mantener limpio el historial.</td>
      <td><b>Eliminacion confirmada.</b><br>Given existe un registro sanitario<br>When el usuario confirma la eliminacion<br>Then el sistema elimina el registro del listado<br><br><b>Eliminacion cancelada.</b><br>Given el usuario abre la confirmacion de eliminacion<br>When cancela la accion<br>Then el registro permanece sin cambios</td>
      <td>EP-005</td>
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
      <td>Agregar cliente ganadero a la cartera del veterinario</td>
      <td>Como veterinario, quiero buscar ganaderos registrados y enviar una peticion para agregarlos a mi cartera de clientes.</td>
      <td><b>Busqueda de ganadero.</b><br>Given existen ganaderos registrados en la aplicacion<br>When el veterinario ingresa al panel de agregar cliente<br>Then el sistema muestra ganaderos en cartas con nombre, fincas y avatar circular<br><br><b>Envio de peticion.</b><br>Given el veterinario encuentra un ganadero disponible<br>When selecciona enviar peticion<br>Then el sistema registra la relacion veterinario-cliente en el backend<br>And lo muestra como cliente agregado<br><br><b>Busqueda sin resultados.</b><br>Given el veterinario escribe un nombre sin coincidencias<br>When el sistema filtra los ganaderos<br>Then muestra un mensaje indicando que no se encontraron ganaderos</td>
      <td>EP-006</td>
    </tr>
    <tr>
      <td><b>US-024</b></td>
      <td>Eliminar cliente de la cartera del veterinario</td>
      <td>Como veterinario, quiero eliminar un cliente de mi lista para dejar de visualizar sus datos ganaderos y sanitarios.</td>
      <td><b>Eliminacion de relacion veterinario-cliente.</b><br>Given el veterinario tiene un cliente asignado<br>When selecciona eliminar cliente<br>Then el sistema elimina la relacion entre veterinario y ganadero<br>And el cliente deja de aparecer en su lista<br><br><b>Datos del ganadero se conservan.</b><br>Given el veterinario elimina un cliente de su cartera<br>When el sistema procesa la accion<br>Then las fincas, animales y registros del ganadero se conservan en la aplicacion</td>
      <td>EP-006</td>
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
      <td>Eliminar actividad</td>
      <td>Como usuario, quiero eliminar actividades que ya no son necesarias para mantener mi calendario ordenado.</td>
      <td><b>Eliminacion confirmada.</b><br>Given existe una actividad registrada<br>When el usuario confirma la eliminacion<br>Then el sistema elimina la actividad<br><br><b>Eliminacion cancelada.</b><br>Given el usuario abre la confirmacion de eliminacion<br>When cancela la accion<br>Then la actividad permanece registrada</td>
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
      <td>Eliminar movimiento financiero</td>
      <td>Como ganadero, quiero eliminar un movimiento incorrecto para mantener mi balance limpio.</td>
      <td><b>Eliminacion confirmada.</b><br>Given existe un movimiento financiero<br>When el ganadero confirma la eliminacion<br>Then el sistema elimina el movimiento<br>And recalcula ingresos, egresos y balance<br><br><b>Eliminacion cancelada.</b><br>Given el ganadero abre la confirmacion de eliminacion<br>When cancela la accion<br>Then el movimiento permanece registrado</td>
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
      <td>Consultar testimonios de usuarios</td>
      <td>Como visitante, quiero leer testimonios de ganaderos o veterinarios para conocer experiencias de uso de AniTec.</td>
      <td><b>Testimonios visibles.</b><br>Given el visitante navega a una pagina con testimonios<br>When llega a la seccion de testimonios<br>Then el sistema muestra comentarios, nombres e imagenes de usuarios representativos</td>
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
      <td>Configuracion inicial del backend con ASP.NET Core</td>
      <td>Como Developer backend, quiero crear la solucion de AniTec con ASP.NET Core para implementar una API REST organizada y preparada para integrarse con el frontend.</td>
      <td><b>Proyecto backend creado.</b><br>Given la solucion backend fue creada<br>When se revisa la estructura del proyecto<br>Then existe un proyecto ASP.NET Core con carpetas organizadas por bounded contexts<br><br><b>Backend ejecutable.</b><br>Given el backend esta configurado<br>When se ejecuta dotnet run<br>Then la API inicia correctamente en ambiente de desarrollo</td>
      <td>EP-001, EP-003, EP-004, EP-005, EP-006, EP-007, EP-008, EP-009</td>
    </tr>
    <tr>
      <td><b>TS-006</b></td>
      <td>Persistencia con Entity Framework Core y MySQL</td>
      <td>Como Developer backend, quiero configurar Entity Framework Core con MySQL para almacenar la informacion de AniTec en una base de datos relacional.</td>
      <td><b>Conexion a MySQL.</b><br>Given la cadena de conexion esta configurada<br>When la API inicia<br>Then el backend se conecta a la base de datos MySQL<br><br><b>Migraciones aplicadas.</b><br>Given existen migraciones de Entity Framework Core<br>When se ejecuta la actualizacion de base de datos<br>Then las tablas necesarias se crean o actualizan correctamente</td>
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
      <td>Implementacion de bounded contexts de gestion ganadera</td>
      <td>Como Developer backend, quiero implementar los bounded contexts principales de AniTec para exponer servicios REST de fincas, animales, sanidad, actividades y finanzas.</td>
      <td><b>Endpoints CRUD disponibles.</b><br>Given los bounded contexts principales fueron implementados<br>When se consulta Swagger<br>Then existen endpoints para fincas, animales, eventos sanitarios, actividades y registros financieros<br><br><b>Operaciones persistentes.</b><br>Given el frontend o Swagger envia una operacion de creacion, edicion o eliminacion<br>When la API procesa la solicitud<br>Then el cambio se guarda correctamente en MySQL</td>
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
      <td>Servicios backend para dispositivos, metricas y suscripciones</td>
      <td>Como Developer backend, quiero implementar dispositivos, metricas y suscripciones para ampliar AniTec con informacion IoT y planes de uso de la plataforma.</td>
      <td><b>Dispositivos y metricas.</b><br>Given existen dispositivos registrados<br>When se consultan sus metricas<br>Then la API devuelve las lecturas asociadas al dispositivo<br><br><b>Planes y suscripciones.</b><br>Given existen planes de suscripcion<br>When se consultan los endpoints de suscripciones<br>Then la API devuelve planes, suscripciones y pagos mock para pruebas</td>
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
  </tbody>
</table>
