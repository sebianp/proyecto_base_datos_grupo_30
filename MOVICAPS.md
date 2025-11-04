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

**TEMA 1 " PROCEDIMIENTOS Y FUNCIONES ALMACENADAS "** 

Un **procedimiento almacenado** de SQL Server es un grupo de una o varias instrucciones Transact-SQL o una referencia a un método de Common Runtime Language (CLR) de Microsoft .NET Framework. Los procedimientos se asemejan a las construcciones de otros lenguajes de programación, porque pueden:

Aceptar parámetros de entrada y devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.

Contener instrucciones de programación que realicen operaciones en la base de datos. Entre otras, pueden contener llamadas a otros procedimientos.

Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.

**Funciones definidas por el usuario**
Al igual que las funciones de los lenguajes de programación, las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción, como un cálculo complejo, y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.

**TEMA 2 " ----- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.

...

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

**FUNCION**

Al igual que las funciones de los lenguajes de programación, las **funciones** definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción, como un cálculo complejo, y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.


**Ventajas de las funciones definidas por el usuario**

**Programación modular**. Puede crear la función una vez, almacenarla en la base de datos y llamarla desde el programa tantas veces como desee. Las funciones definidas por el usuario se pueden modificar, independientemente del código de origen del programa.

**Ejecución más rápida.** Al igual que los procedimientos almacenados, las funciones definidas por el usuario de Transact-SQL reducen el costo de compilación del código de Transact-SQL almacenando los planes en la caché y reutilizándolos para ejecuciones repetidas. Esto significa que la función definida por el usuario no tiene que volver a analizarse y volver a personalizarse con cada uso, lo que da lugar a tiempos de ejecución más rápidos.

Las funciones de idioma común en tiempo de ejecución (CLR) ofrecen una ventaja de rendimiento importante sobre las funciones de Transact-SQL para tareas de cálculo, manipulación de cadenas y lógica de negocios. Las funciones de Transact-SQL se adecuan mejor a la lógica intensiva del acceso a datos.

**Reducción del tráfico de red**. Una operación que filtra datos basándose en restricciones complejas que no se puede expresar en una sola expresión escalar se puede expresar como una función. La función se puede invocar luego en la cláusula WHERE para reducir el número de filas que se envían al cliente.

**Importante**

Las funciones definidas por el usuario de Transact-SQL en consultas solo se pueden ejecutar en un único subproceso (plan de ejecución en serie). Por tanto, el uso de UDF impide el procesamiento de consultas en paralelo. Para obtener más información sobre el procesamiento de consultas en paralelo, vea la Guía de arquitectura de procesamiento de consultas.

**Tipos de funciones**

**Funciones escalares**

Las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. En una función escalar insertada, el valor escalar es el resultado de una sola instrucción. Para una función escalar de varias instrucciones, el cuerpo de la función puede contener una serie de instrucciones de Transact-SQL que devuelven el único valor. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp. Para obtener ejemplos, consulte Creación de funciones definidas por el usuario (motor de base de datos).

**Funciones con valores de tabla**

Las funciones con valores de tabla definidas por el usuario (TVF) devuelven un tipo de datos table. Las funciones con valores de tabla insertadas no tienen cuerpo; la tabla es el conjunto de resultados de una sola instrucción SELECT. Para obtener ejemplos, consulte Creación de funciones definidas por el usuario (motor de base de datos).

**Funciones del sistema**

SQL Server proporciona numerosas funciones del sistema que se pueden usar para realizar diversas operaciones. No se pueden modificar. Para obtener más información, vea ¿Qué son las funciones de SQL Database?, Funciones del sistema por categoría para Transact-SQL y vistas de administración dinámica del sistema.

**Directrices**

Las funciones de Transact-SQL manejan los errores de forma estricta: cualquier error detiene inmediatamente su ejecución y cancela la función invocadora, a diferencia de los procedimientos almacenados, donde la ejecución podría continuar con la siguiente instrucción. Estas rutinas deben ser libres de efectos secundarios, por lo que tienen prohibido realizar cambios permanentes en la base de datos o en recursos externos (como modificar tablas o enviar correos electrónicos), limitándose solo a manipular variables u objetos locales. Finalmente, debe tenerse en cuenta que el optimizador de consultas puede variar el número de veces que una función se ejecuta dentro de una cláusula (como en una subconsulta WHERE), dependiendo del plan de ejecución que se elija.
Las funciones deterministas deben estar enlazadas al esquema. Use la cláusula SCHEMABINDING al crear una función determinista.


**Procedimientos almacenados** (motor de base de datos)

Un procedimiento almacenado de SQL Server es un grupo de una o varias instrucciones Transact-SQL o una referencia a un método de Common Runtime Language (CLR) de Microsoft .NET Framework. Los procedimientos se asemejan a las construcciones de otros lenguajes de programación, porque pueden:

Aceptar parámetros de entrada y devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.

Contener instrucciones de programación que realicen operaciones en la base de datos. Entre otras, pueden contener llamadas a otros procedimientos.

Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.


**Ventajas de usar procedimientos almacenados**

**Tráfico de red reducido entre el cliente y el servidor**

Los comandos de un procedimiento se ejecutan en un único lote de código. Esto puede reducir significativamente el tráfico de red entre el servidor y el cliente porque únicamente se envía a través de la red la llamada que va a ejecutar el procedimiento. Sin la encapsulación de código que proporciona un procedimiento, cada una de las líneas de código tendría que enviarse a través de la red.

**Mayor seguridad**

El uso de procedimientos almacenados refuerza la seguridad de la base de datos al permitir que usuarios y programas realicen operaciones en objetos subyacentes sin necesidad de contar con permisos directos, lo que simplifica la gestión de seguridad. La cláusula EXECUTE AS permite la suplantación de otro usuario para ejecutar actividades que, de otro modo, requerirían permisos excesivos (como TRUNCATE TABLE). Además, los procedimientos protegen contra ataques por inyección de código SQL al tratar los parámetros como valores literales en lugar de código ejecutable, y garantizan que solo la llamada sea visible en la red, ocultando así los nombres reales de las tablas y objetos a usuarios malintencionados. Finalmente, los procedimientos ofrecen la opción de ser cifrados para ofuscar su código fuente.

**Reutilización del código**

El código de cualquier operación de base de datos redundante resulta un candidato perfecto para la encapsulación de procedimientos. De este modo, se elimina la necesidad de escribir de nuevo el mismo código, se reducen las inconsistencias de código y se permite que cualquier usuario o aplicación que cuente con los permisos necesarios pueda acceder al código y ejecutarlo.

**Mantenimiento más fácil**

Cuando las aplicaciones cliente llaman a procedimientos y mantienen las operaciones de base de datos en la capa de datos, solo deben actualizarse los cambios de los procesos en la base de datos subyacente. El nivel de aplicación permanece independiente y no tiene que tener conocimiento sobre los cambios realizados en los diseños, las relaciones o los procesos de la base de datos.

**Rendimiento mejorado**

De forma predeterminada, los procedimientos almacenados mejoran el rendimiento porque el motor de base de datos compila la consulta y almacena un plan de ejecución la primera vez que se ejecutan, el cual se reutiliza en llamadas posteriores para ahorrar tiempo de procesamiento. Sin embargo, si existen cambios importantes en las tablas o datos subyacentes, este plan precompilado puede volverse ineficiente, haciendo que el procedimiento se ejecute con lentitud. En tales casos, es necesario volver a crear el procedimiento para forzar la generación de un nuevo plan optimizado y restaurar el rendimiento.





> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

... 


## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus. 



## BIBLIOGRAFÍA DE CONSULTA

 1. [List item](https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver17)
 2. [List item](https://learn.microsoft.com/es-es/sql/relational-databases/user-defined-functions/user-defined-functions?view=sql-server-ver17)
 3. List item
 4. List item
 5. List item

