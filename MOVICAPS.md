# Proyecto de Estudio
    
**Universidad Nacional del Nordeste**

**Facultad de Ciencias Exactas Naturales y Agrimensura**

**Carrera: Licenciatura en Sistemas de Información**

# MOVICAPS (Unidades Moviles de Atención Primaria)

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Aranda Vera, Vanesa Alejandra Samanta
 - Prado, Sebastián
 - Frias, Javier Antonio 
 - Toledo, Agustina Ines

**Año**: 2025

## CAPÍTULO I: INTRODUCCIÓN

### Introducción 

La **atención médica primaria** en las ciudades se enfrenta a un problema: las clínicas fijas (CAP) no pueden moverse cuando hay una emergencia en otra zona (como un brote de gripe o un evento masivo).

**Nuestra Idea** proponer un **sistema flexible** que use **unidades móviles** (camionetas o vehículos equipados) que se puedan mover por toda la ciudad. Estas unidades son especializadas (generales, dentales, pediátricas, de vacunas).

El objetivo es tener un sistema que se adapte rápido a las necesidades de la gente. Si hay un brote en el barrio A, movemos más unidades a ese lugar.

### Problema de Investigación

La ausencia de un sistema automatizado en las unidades móviles de atención primaria dificulta el registro y la gestión eficiente de las atenciones realizadas en los distintos barrios de Corrientes Capital. Esta limitación impide identificar con precisión las necesidades particulares de cada barrio, restringe la capacidad de respuesta ante eventos multitudinarios y obstaculiza la planificación estratégica para la distribución óptima de los recursos móviles.

Ante esta problemática, el proyecto propone el desarrollo de un sistema automatizado capaz de registrar, organizar y analizar en tiempo real las atenciones brindadas. Esta solución tecnológica no solo mejorará la eficiencia operativa, sino que permitirá tomar decisiones informadas sobre el traslado de unidades móviles, adaptándose a la demanda y a eventos especiales. 

### Alcance del Proyecto

El alcance del trabajo incluye el diseño  implementación y optimización de una base de 
datos relacional utilizando SQL Server. Se enfocará en las siguientes áreas esenciales de gestión: administración de unidades móviles, gestión de personal, gestión clínica móvil, planificación territorial, generación de reportes. Quedan explícitamente fuera del alcance funcionalidades secundarias o de apoyo, como: gestión de nómina de empleados, inventario y stock de insumos y medicamentos, módulos de facturación o contabilidad.

### Objetivo General 

Desarrollar una Base de Datos Relacional para la gestión dinámica de Unidades Móviles de Atención Primaria, que permita administrar de manera eficiente la ubicación estratégica de las unidades especializadas, la asignación de personal médico y el registro de atenciones y diagnósticos. El sistema será implementado utilizando SQL Server, aplicando conceptos de roles, permisos, procedimientos almacenados y optimización de consultas para garantizar la integridad y la seguridad de los datos sanitarios y operativos.


## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1 " ---- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.


**TEMA 2 " ----- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.

**TEMA 3 "Manejo de transacciones y transacciones anidadas"** 
El manejo adecuado de transacciones es un pilar clave en los sistemas de gestión de bases de datos relacionales, especialmente en contextos empresariales críticos donde la integridad y consistencia de los datos son absolutamente vitales. SQL Server, uno de los sistemas más utilizados a nivel global, provee sofisticadas herramientas para el control de transacciones, permitiendo a los desarrolladores y administradores definir y controlar las operaciones para garantizar que los datos se mantengan seguros, coherentes y recuperables ante errores o fallos del sistema. En este informe se profundiza en la teoría, la sintaxis y las mejores prácticas referentes al manejo de transacciones y transacciones anidadas en SQL Server, con un enfoque en los objetivos de comprender la consistencia y atomicidad, implementar transacciones simples y anidadas, y documentar casos de prueba y manejo de fallos.


## CAPÍTULO III: METODOLOGÍA SEGUIDA 

Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros.

 **a) Cómo se realizó el Trabajo Práctico**
Vestibulum rutrum feugiat molestie. Nunc id varius augue. Ut augue mauris, venenatis et lacus ut, mattis blandit urna. Fusce lobortis, quam non vehicula scelerisque, nisi enim ultrices diam, ac tristique libero ex nec orci.

 **b) Herramientas (Instrumentos y procedimientos)**
Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros. Integer interdum id orci id rutrum. Curabitur facilisis lorem sed metus interdum accumsan. 


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

### Diagrama relacional
![diagrama_relacional](https://github.com/sebianp/proyecto_base_datos_grupo_30/blob/main/doc/erd_grupo30_2025.png)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


### Desarrollo TEMA 1 "----"

Fusce auctor finibus lectus, in aliquam orci fermentum id. Fusce sagittis lacus ante, et sodales eros porta interdum. Donec sed lacus et eros condimentum posuere. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

### Desarrollo TEMA 3 "Manejo de transacciones y transacciones anidadas"

Una transacción es una unidad de trabajo indivisible que agrupa una o varias operaciones SQL, tratadas como un solo bloque lógico. El éxito o fracaso de una transacción determina si los cambios hechos a la base de datos son persistidos **(commit)** o revertidos **(rollback)**.
En SQL Server, toda operación de modificación de datos está implicada en una transacción. Por defecto, cada sentencia SQL es autocommit (transacción automática). Sin embargo, para escenarios complejos, se requiere la definición de **transacciones explícitas**, especialmente para asegurar la integridad en operaciones que involucran múltiples pasos.

**Las Garantías ACID**
Las propiedades **ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad)** son el estándar que debe cumplir toda transacción para garantizar la fiabilidad en las bases de datos.

**Atomicidad**: La transacción debe completarse en su totalidad o no realizar ningún cambio. En caso de error, todos los cambios son revertidos.

**Consistencia**: Las transacciones llevan la base de datos de un estado válido a otro, respetando restricciones y reglas de integridad. Un rollback debe restaurar el estado previo sin violaciones de integridad.

**Aislamiento**: Las transacciones concurrentes no se deben afectar; el resultado debe ser como si se hubiesen ejecutado en serie.

**Durabilidad**: Una vez confirmados los cambios de una transacción, estos deben persistir aunque ocurran fallos de hardware o energía.

**Sintaxis de Transacciones en SQL Server**

SQL Server proporciona un conjunto de comandos Transact-SQL para definir y controlar transacciones explícitas:

`BEGIN TRANSACTION` [nombre]: Inicia una nueva transacción.

`COMMIT` [TRANSACTION] [nombre]: Confirma la transacción, haciendo permanentes los cambios.

`ROLLBACK` [TRANSACTION] [nombre | savepoint]: Revierte la transacción o hasta un punto de guardado específico.

`SAVE TRANSACTION` [savepoint]: Define un punto de guardado intermedio para permitir rollbacks parciales.

`@@TRANCOUNT`: Variable de sistema que indica el número de transacciones activas anidadas en la sesión actual
La variable de sistema **@@TRANCOUNT** permite saber cuántos niveles de anidamiento transaccional existen en la sesión. Cada vez que se inicia una transacción, el contador se incrementa, y con cada COMMIT se reduce en uno.

**SAVEPOINT y Puntos de Guardado**

El comando `SAVE TRANSACTION` permite establecer puntos de guardado dentro de una transacción. Estos puntos sirven para posibilitar rollbacks parciales si una parte específica de la transacción falla, mientras que se mantienen los cambios previos al savepoint.

**Control de Errores en Transacciones: TRY…CATCH**

SQL Server implementa el manejo estructurado de errores mediante las construcciones TRY...CATCH. Este mecanismo captura excepciones y permite evitar estados inválidos o transacciones abiertas, lo cual es clave para garantizar la consistencia y robustez del sistema.
Dentro de los bloques `CATCH`, se pueden usar funciones como `ERROR_NUMBER()`, `ERROR_MESSAGE()`, `ERROR_LINE()`, entre otras, para obtener información detallada del error ocurrido.


**Modos de transacción en SQL Server**

- **Transacciones de confirmación automática**: Cada instrucción individual es una transacción.

- **Transacciones explícitas**: La transacción se inicia explícitamente con `BEGIN TRANSACTION` y se termina explícitamente con una instrucción `COMMIT` o `ROLLBACK`.

- **Transacciones implícitas**: Una nueva transacción se inicia implícitamente al completarse la anterior, pero se completa explícitamente con una instrucción `COMMIT` o `ROLLBACK`.

- **Transacciones de ámbito de lote**: Una transacción implícita o explícita de Transact-SQL que se inicia en una sesión de MARS (conjuntos de resultados activos múltiples) y se convierte en una transacción de ámbito de lote.

**Concepto de Anidamiento**

Una transacción anidada se produce cuando, dentro del contexto de una transacción activa, se inicia otra transacción con `BEGIN TRANSACTION`. Aunque pareciera que se crean transacciones independientes, SQL Server en realidad mantiene un contador interno (@@TRANCOUNT), pero solo existen realmente dos estados: transacción abierta o no abierta. Todas las operaciones comparten el mismo contexto y log de transacción.

Funcionamiento Interno y Comportamiento de COMMIT y ROLLBACK
Cada `BEGIN TRAN` incrementa @@TRANCOUNT en uno.

Cada `COMMIT TRAN` decrementa @@TRANCOUNT en uno.

Solo el `COMMIT TRAN` más externo (el que reduce @@TRANCOUNT a 0) realmente escribe los cambios en la base de datos.

Cualquier `ROLLBACK`, sin savepoint, revierte toda la cadena de transacciones anidadas y pone el contador a 0.

**Ventaja de las transacciones**

**Manejo de errores y recuperación**

- Proporciona un mecanismo controlado para manejar errores. Si ocurre un error, todos los cambios realizados hasta ese momento se revierten automáticamente.

**Mejora en la concurrencia y eficiencia**

- Facilita el manejo eficiente de accesos concurrentes, minimizando conflictos y mejorando el rendimiento.

**Seguridad y control en los cambios de datos**

- Limita el acceso a los datos solo a las operaciones que se confirman (`commit`), añadiendo una capa de seguridad crucial en sistemas con datos sensibles.


> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_3](script/tema3_Manejo_de_transacciones)


## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus. 



## BIBLIOGRAFÍA DE CONSULTA

 1. https://www.datacamp.com/es/blog/acid-transactions
 2. https://programacion.net/articulo/transacciones_en_sql_server_299
 3. https://learn.microsoft.com/es-es/sql/t-sql/language-elements/transactions-transact-sql?view=sql-server-ver17
 4. List item
 5. List item

