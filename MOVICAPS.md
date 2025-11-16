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

Un **procedimiento almacenado** de SQL Server es un grupo de una o varias instrucciones. Los procedimientos pueden:
Aceptar parámetros de entrada y devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.
Contener instrucciones de programación que realicen operaciones en la base de datos. Entre otras, pueden contener llamadas a otros procedimientos.
Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.

**Funciones definidas por el usuario**
Las funciones definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción, como un cálculo complejo, y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.

**TEMA 2 " ----- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.

...

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

 **a) Cómo se realizó el Trabajo Práctico**
Para iniciar el desarrollo del proyecto, se organizó una reunión entre los integrantes del grupo para definir el caso de estudio que abordaríamos a lo largo del trabajo. Una vez elegido el tema, para la primera parte de la entrega, se creó un repositorio en GitHub, donde cada miembro del equipo iría subiendo sus aportes para desarrollar las actividades asignadas y se elaboró el diagrama entidad-relación con su diccionario de datos para, posteriormente, avanzar con el modelo físico y el lote de datos con los que trabajaríamos.

En la segunda parte del proyecto, distribuimos los temas de investigación entre los miembros del equipo a través de un sorteo. Realizamos reuniones periodicas virtuales para coordinar sobre los avanzes realizados.

 **b) Herramientas (Instrumentos y procedimientos)**
- [SQL SERVER EXPRESS 22](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Discord] (https://discord.com/)
- [Github] (https://github.com/sebianp/proyecto_base_datos_grupo_30)


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

### Diagrama relacional
![diagrama_relacional](https://github.com/sebianp/proyecto_base_datos_grupo_30/blob/main/doc/erd_grupo30_2025.png)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.


### Desarrollo TEMA 1 "----"

**FUNCION**

Al igual que las funciones de los lenguajes de programación, las **funciones** definidas por el usuario de SQL Server son rutinas que aceptan parámetros, realizan una acción, como un cálculo complejo, y devuelven el resultado de esa acción como un valor. El valor devuelto puede ser un valor escalar único o un conjunto de resultados.

**Tipos de funciones**

**Funciones escalares**

Las funciones escalares definidas por el usuario devuelven un único valor de datos del tipo definido en la cláusula RETURNS. En una función escalar insertada, el valor escalar es el resultado de una sola instrucción. Para una función escalar de varias instrucciones, el cuerpo de la función puede contener una serie de instrucciones de Transact-SQL que devuelven el único valor. El tipo devuelto puede ser de cualquier tipo de datos excepto text, ntext, image, cursory timestamp.

**Funciones con valores de tabla**

Las funciones con valores de tabla definidas por el usuario (TVF) devuelven un tipo de datos table. Las funciones con valores de tabla insertadas no tienen cuerpo; la tabla es el conjunto de resultados de una sola instrucción SELECT. 

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


**Tipos de procedimientos almacenados**

**Definida por el usuario**

Un procedimiento definido por el usuario se puede crear en una base de datos definida por el usuario o en todas las bases de datos del sistema excepto en la base de datos Resource. El procedimiento se puede desarrollar en Transact-SQL o como referencia a un método de Common Language Runtime (CLR) de Microsoft .NET Framework.

**Temporario**

Los procedimientos temporales son una forma de procedimientos definidos por el usuario. Los procedimientos temporales son como un procedimiento permanente, salvo que se almacenan en tempdb. Hay dos tipos de procedimientos temporales: locales y globales. Se diferencian entre sí por los nombres, la visibilidad y la disponibilidad. Los procedimientos temporales locales tienen como primer carácter de sus nombres un solo signo de número (#); solo son visibles en la conexión actual del usuario y se eliminan cuando se cierra la conexión. Los procedimientos temporales globales presentan dos signos de número (##antes del nombre; son visibles para cualquier usuario después de su creación y se eliminan al final de la última sesión en la que se usa el procedimiento.

**Sistema**

Los procedimientos del sistema se incluyen con el motor de base de datos. Están almacenados físicamente en la base de datos interna y oculta Resourcey se muestran de forma lógica en el esquema sys de cada base de datos definida por el sistema y por el usuario. Además, la base de datos msdb también contiene procedimientos almacenados del sistema en el esquema dbo que se usan para programar alertas y trabajos. Dado que los procedimientos del sistema empiezan con el prefijo sp\_, le recomendamos que no use este prefijo cuando asigne un nombre a los procedimientos definidos por el usuario.

SQL Server admite los procedimientos del sistema que proporcionan una interfaz de SQL Server a los programas externos para varias actividades de mantenimiento. Estos procedimientos extendidos usan el prefijo xp\_.

**Definido por el usuario extendido**

Los procedimientos extendidos permiten crear rutinas externas en un lenguaje de programación, como C. Estos procedimientos son bibliotecas DLL que una instancia de SQL Server puede cargar y ejecutar de forma dinámica.

**Comparación entre Procedimientos y Funciones Almacenadas**

La deferencia fundamental entre un Procedimiento Almacenado y una Función Definida por el Usuario (UDF) reside en su capacidad para modificar la base de datos y cómo se integran en las consultas.

El propósito principal de un Procedimiento Almacenado es ejecutar un conjunto de acciones en el servidor, generalmente para implementar la lógica de negocio y las operaciones CRUD. Por ello, los procedimientos pueden realizar cambios definitivos en la base de datos (como INSERT, UPDATE, DELETE) y tienen permitido el control explícito de transacciones (COMMIT, ROLLBACK). En cambio, las Funciones Almacenadas están diseñadas para cálculos o la lectura de datos sin alteración; están estrictamente prohibidas de realizar cualquier manipulación de datos o tener efectos secundarios, lo que asegura la integridad de la base de datos.

En cuanto al retorno de valores, la diferencia también es significativa. Una Función Almacenada tiene la restricción de devolver siempre un único valor (ya sea un valor escalar simple o un único conjunto de resultados en formato TABLE). Por otro lado, un Procedimiento Almacenado es más flexible, ya que puede devolver múltiples conjuntos de resultados de varias consultas, además de múltiples parámetros de salida y un valor de estado para indicar el éxito o fracaso de su ejecución.

Finalmente, la manera de invocación en el código es la característica más visible. Las Funciones Almacenadas son altamente integrables, pudiendo ser utilizadas directamente dentro de sentencias SELECT, WHERE o HAVING como cualquier función de sistema nativa, o como fuente de datos en la cláusula FROM. Por el contrario, los Procedimientos Almacenados no son aptos para la composición de consultas y deben ser invocados de manera independiente mediante el comando EXECUTE o EXEC.

**SCRIPT con ejemplos aplicados al proyecto**
> Acceder a la siguiente carpeta  [scripts-> tema_01](script/tema01/tema01_script.sql)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

... 


## CAPÍTULO V: CONCLUSIONES

**Tema 1: "Procedimientos y funciones almacenadas"**
Los procedimientos almacenados y funciones almacenadas, tienen propósitos específicos y complementarios en la gestión de bases de datos. Aprendimos que los procedimientos almacenados son fundamentales para operaciones complejas y modificaciones de datos, permitiendo una gestión eficiente y segura de procesos de negocio gracias a su capacidad de ejecutar múltiples operaciones, controlar transacciones y reducir el tráfico de red. Por otro lado, las funciones almacenadas resultan más adecuadas para cálculos y transformaciones reutilizables dentro de consultas, ya que su diseño se centra en devolver valores o conjuntos de resultados sin modificar datos.



## BIBLIOGRAFÍA DE CONSULTA

 1. [List item](https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver17)
 2. [List item](https://learn.microsoft.com/es-es/sql/relational-databases/user-defined-functions/user-defined-functions?view=sql-server-ver17)
 3. List item
 4. List item
 5. List item

