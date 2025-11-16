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


**TEMA 2 " Optimizacion de consultas a traves de indices. "** 

El uso de índices representa una de las técnicas esenciales para optimizar el rendimiento en sistemas de gestión de bases de datos relacionales. A medida que la cantidad de registros crece, la necesidad de acceder a los datos de manera eficiente se vuelve fundamental para garantizar tiempos de respuesta adecuados y una correcta experiencia de uso en aplicaciones de software.

En el presente informe se estudian los tipos principales de índices soportados por SQL Server, su utilidad, criterios para su creación y las consideraciones prácticas respecto al impacto que generan en operaciones de lectura y escritura. Asimismo, se demuestra la mejora en el rendimiento mediante pruebas controladas, comparando tiempos y planes de ejecución antes y después de la aplicación de índices adecuados. El objetivo es comprender cuándo y por qué utilizar índices.

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

### Desarrollo TEMA 2 "Optimización de consultas a través de índices"

## ¿Qué es un índice en bases de datos relacionales?

Un **índice** es un conjunto de punteros ordenados lógicamente por los valores de una o varias claves. Estos punteros hacen referencia a registros de una tabla con el fin de agilizar su localización.

En el siguiente diagrama tenemos un índice basado en los números de empleados de una tabla. Este valor de clave proporciona un puntero a las filas correspondientes. Por ejemplo, el número de empleado 19 apunta al empleado KMP.

Esto permite un acceso más eficiente a los datos creando una “vía rápida” hacia ellos y evitando que el motor recorra fila por fila la tabla.

![diagrama\_relacional](https://github.com/sebianp/proyecto_base_datos_grupo_30/blob/main/doc/tema_02/representacion_indices.png)

---

## ¿Por qué usar índices?

Los índices se utilizan principalmente para **mejorar el rendimiento** de las consultas:

* **Sin índices:** el motor realiza un *Table Scan*, es decir, lee toda la tabla.
* **Con índices:** puede realizar un *Index Seek* o un *Index Scan*, siendo más eficiente.

Son especialmente útiles cuando las consultas incluyen:

* `WHERE`
* `JOIN`
* `ORDER BY`
* `GROUP BY`

También son importantes para garantizar **unicidad** en datos como DNI, correo electrónico, etc. Esto es porque un índice único es el mecanismo que usa la mayoría de las bases de datos para hacer cumplir una restricción UNIQUE.

Cuando hacemos

```
ALTER TABLE Persona
ADD CONSTRAINT UQ_Persona_DNI UNIQUE (DNI);
```

La base de datos:

1. Crea automáticamente un índice único sobre DNI.
2. Usa el índice para verificar que no haya duplicados.
3. De paso, mejora búsquedas por ese campo.

---

## Tipos de índices más utilizados

A continuación se presentan los tipos principales que se trabajarán en este tema.

### Índices agrupados (Clustered)

* Definen el **orden físico** en que se almacenan los datos dentro de la tabla.
* Una tabla solo puede tener **un** índice agrupado.
* SQL Server crea automáticamente un índice agrupado cuando se define una clave primaria (a menos que se indique lo contrario).
* Optimizan las consultas que trabajan con rangos (por ejemplo, fechas, claves primarias compuestas, etc).

**Ejemplo de uso:**
Historial de ventas por fecha:

```
WHERE Fecha BETWEEN '2025-01-01' AND '2025-01-31'
```

---

### Índices no agrupados (Non-Clustered)

* No modifican el orden físico de los datos.
* La tabla queda almacenada en un lugar y el índice en otro.
* Se pueden crear **varios** índices no agrupados por tabla.
* Son ideales para columnas que habitualmente se utilizan en filtros.

**Ejemplo de uso:**
Consultas por DNI o Email:

```
WHERE DNI = '40123456'
```

---

### Índices únicos (Unique Index)

* Garantizan que no existan valores duplicados en la columna indexada.
* Como mencionamos anteriormente, se generan automáticamente al definir una restricción `UNIQUE`.

Ejemplos típicos: DNI, CUIT, correo electrónico de usuario.

**Ejemplo de uso:**
Evitar registrar dos usuarios con el mismo email.

---

### Índices compuestos (Composite Index)

* Utilizan dos o más columnas de forma conjunta.
* Mejoran el rendimiento cuando la consulta filtra por esas columnas en ese mismo orden.

Ejemplo: `(Fecha, IdPaciente)`

**Ejemplo de uso:**
Consultas combinadas:

```
WHERE IdPaciente = 5 AND Fecha >= '2025-01-01'
```

---

## Consideraciones

Aunque los índices mejoran la lectura de datos, también presentan desventajas:

* Ocupan espacio adicional en el almacenamiento.
* Las operaciones `INSERT`, `UPDATE` y `DELETE` se vuelven más costosas, ya que el motor debe actualizar el índice en cada modificación.

Por esta razón, no se recomienda crear índices indiscriminadamente, sino solo aquellos que realmente aporten rendimiento.

---

## Cómo crear un índice en SQL Server

Algunas palabras reservadas importantes:

* `CREATE INDEX`: crea un índice.
* `IX_<Tabla>_<Columna>`: convención común para nombrar índices.
* `ON Tabla (Columna)`: indica la tabla y columna afectada.

### Índice agrupado (Clustered)

```sql
CREATE CLUSTERED INDEX IX_Ventas_Fecha
ON Ventas (Fecha);
```

---

### Índice no agrupado (Non-Clustered)

```sql
CREATE NONCLUSTERED INDEX IX_Persona_DNI
ON Persona (DNI);
```

---

### Índice único (Unique Index)

```sql
CREATE UNIQUE INDEX UQ_Usuario_Email
ON Usuario (Email);
```

---

### Índice compuesto (Composite Index)

```sql
CREATE NONCLUSTERED INDEX IX_Atencion_Fecha_IdPaciente
ON Atencion (Fecha, IdPaciente);
```

---
 ### SCRIPT con ejemplos aplicados al proyecto
> Acceder a la siguiente carpeta [scripts-> tema_2](script/tema02)

### Desarrollo TEMA 3 "Manejo de transacciones y transacciones anidadas"

Una transacción es una unidad de trabajo indivisible que agrupa una o varias operaciones SQL, tratadas como un solo bloque lógico. El éxito o fracaso de una transacción determina si los cambios hechos a la base de datos son persistidos `COMMIT` o revertidos `ROLLBACK`.
En SQL Server, toda operación de modificación de datos está implicada en una transacción. Por defecto, cada sentencia SQL es autocommit (transacción automática). Sin embargo, para escenarios complejos, se requiere la definición de **transacciones explícitas**, especialmente para asegurar la integridad en operaciones que involucran múltiples pasos.

 ### Las Garantías ACID

Las propiedades **ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad)** son el estándar que debe cumplir toda transacción para garantizar la fiabilidad en las bases de datos.

**Atomicidad**: La transacción debe completarse en su totalidad o no realizar ningún cambio. En caso de error, todos los cambios son revertidos.

**Consistencia**: Las transacciones llevan la base de datos de un estado válido a otro, respetando restricciones y reglas de integridad. Un rollback debe restaurar el estado previo sin violaciones de integridad.

**Aislamiento**: Las transacciones concurrentes no se deben afectar; el resultado debe ser como si se hubiesen ejecutado en serie.

**Durabilidad**: Una vez confirmados los cambios de una transacción, estos deben persistir aunque ocurran fallos de hardware o energía.

### Sintaxis de Transacciones en SQL Server

SQL Server proporciona un conjunto de comandos Transact-SQL para definir y controlar transacciones explícitas:

`BEGIN TRANSACTION` [nombre]: Inicia una nueva transacción.

`COMMIT` [TRANSACTION] [nombre]: Confirma la transacción, haciendo permanentes los cambios.

`ROLLBACK` [TRANSACTION] [nombre | savepoint]: Revierte la transacción completa o hasta un punto de guardado específico (savepoint).

`SAVE TRANSACTION` [savepoint]: Define un punto de guardado intermedio para permitir rollbacks parciales.

`@@TRANCOUNT`: Es la **Variable de sistema** que indica el número de transacciones activas anidadas en la sesión actual
La variable **@@TRANCOUNT** permite saber cuántos niveles de anidamiento transaccional existen en la sesión. Cada vez que se inicia una transacción, el contador se incrementa, con cada `COMMIT` se reduce en uno y con `ROLLBACK` se cancelan todas.
```sql
BEGIN TRANSACTION;
PRINT @@TRANCOUNT; -- Devuelve 1

BEGIN TRANSACTION;
PRINT @@TRANCOUNT; -- Devuelve 2

ROLLBACK TRANSACTION;
PRINT @@TRANCOUNT; -- Devuelve 0 (se cancelan todas)
```

**Sintaxis básica**

```sql
BEGIN TRANSACTION;

-- Operaciones SQL (INSERT, UPDATE, DELETE...)

COMMIT TRANSACTION;   -- Confirma los cambios
-- o
ROLLBACK TRANSACTION; -- Revierte todo
```

### SAVEPOINT (Puntos de Guardado)

El comando `SAVE TRANSACTION` permite establecer puntos de guardado dentro de una transacción. Estos puntos sirven para posibilitar rollbacks parciales si una parte específica de la transacción falla, mientras que se mantienen los cambios previos al savepoint. Es una herramienta poderosa cuando se quiere preservar parte del trabajo dentro de una transacción, especialmente útil para NO perder todo si ocurre un error.
Se puede tener múltiples SAVE TRANSACTION, pero solo podés hacer ROLLBACK a uno a la vez.

## Control de Errores en Transacciones: TRY…CATCH

SQL Server implementa el manejo estructurado de errores mediante las construcciones `TRY...CATCH`. Este mecanismo captura excepciones y permite evitar estados inválidos o transacciones abiertas, lo cual es clave para garantizar la consistencia y robustez del sistema.
Dentro de los bloques `CATCH`, se pueden usar funciones como `ERROR_NUMBER()`, `ERROR_MESSAGE()`, `ERROR_LINE()`, entre otras, para obtener información detallada del error ocurrido. Sin `TRY...CATCH`, si ocurre un error (ej. violación de clave foránea, constraint, falta de capacidad), la transacción se cancela abruptamente y el usuario solo ve un mensaje genérico. Si una transacción falla y no se maneja, puede quedar abierta y bloquear recursos (tablas, filas), Con `TRY...CATCH`, siempre aseguramos un `ROLLBACK` o `COMMIT`, evitando bloqueos. Dentro del `CATCH`, podés verificar si la transacción está dañada (-1) o aún válida (1) utilizando `XACT_STATE()`

```sql
BEGIN TRY
    BEGIN TRANSACTION; -- Inicio de la transaccion

    --Operaciones que queremos realizar
    INSERT INTO ...;
    UPDATE ...;

    COMMIT TRANSACTION; --Commit de la transaccion
END TRY
BEGIN CATCH --Mostrar errores justo al ROLLBACK que revierte toda la transaccion
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

```
 ### Uso de XACT_STATE()

`XACT_STATE()` es una función interna de SQL Server que te dice en qué estado se encuentra la transacción actual dentro de tu sesión. Es clave para manejar errores de forma segura en bloques `TRY...CATCH`. Si devuelve 1, se puede decidir confirmar o revertir. Si devuelve -1, no hay opción: solo se puede hacer ROLLBACK. Cuando su valor es 1 nos dice que hay una transacción activa y está en estado válido, se puede hacer `COMMIT` o `ROLLBACK`. Si su valor es 0 no hay ninguna transacción activa en la sesión. Si su valor es -1 hay una transacción activa pero está en estado dañado (por un error grave), por lo tanto solo se puede hacer `ROLLBACK`.

### Modos de transacción en SQL Server

- **Transacciones de confirmación automática**: Es el modo por defecto. Cada instrucción SQL se ejecuta como una transacción individual. Si la instrucción tiene éxito, se confirma automáticamente. Si falla, se revierte. No requiere `BEGIN TRANSACTION`, `COMMIT` ni `ROLLBACK`.
```sql
--se ejecuta como una transaccion individual
    INSERT INTO Paciente (nombreCompleto, dni) VALUES ('Laura Díaz', '12345678');
--si no hay error, se confirma automaticamente
```

- **Transacciones explícitas**: La transacción se inicia explícitamente con `BEGIN TRANSACTION` y se termina explícitamente con una instrucción `COMMIT` o `ROLLBACK`. Es decir, el desarrollador controla manualmente el inicio y fin de la transacción. Se utiliza cuando
se necesita garantizar que varias operaciones se ejecuten juntas en procesos criticos como atenciones, pagos, reservas, etc.

```sql
    BEGIN TRANSACTION;
        --Operaciones definidas por el desarrollador:
        INSERT INTO Atencion (...) VALUES (...);
        UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = 1;

    COMMIT TRANSACTION;

```

- **Transacciones implícitas**: Las transacciones implícitas son un modo de ejecución en SQL Server donde cada instrucción que modifica datos inicia automáticamente una transacción, pero no se confirma ni se revierte automáticamente sino que se debe completar explícitamente con una instrucción `COMMIT` o `ROLLBACK`. Se inicia con `SET` IMPLICIT_TRANSACTIONS `ON`, pero no se confirma hasta realizar `COMMIT` o `ROLLBACK`, luego de eso, la siguiente instrucción inicia otra transacción hasta que se vuelva a confirmar con `COMMIT` o `ROLLBACK`.

```sql
SET IMPLICIT_TRANSACTIONS ON;

--Se inicia una transacción de manera automática
INSERT INTO Paciente (nombreCompleto, dni) VALUES ('Carlos Ruiz', '12345678');
-- La transacción sigue abierta. Nada se confirma aún.

--se confirma manualmente
COMMIT TRANSACTION;

--Se inicia otra transacción automática
UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = 1;

--Se confirma manualmente
COMMIT TRANSACTION;

```
Si no se hace `COMMIT` o `ROLLBACK`, la transacción queda abierta y puede bloquear recursos.

- **Transacciones de ámbito de lote**: Se dan en escenarios donde está habilitado MARS (Multiple Active Result Sets), por ejemplo en aplicaciones cliente (ADO.NET, ODBC) que permiten ejecutar varios comandos en paralelo sobre la misma conexión. En ese contexto, una transacción explícita o implícita se convierte en una transacción de ámbito de lote: afecta a todas las instrucciones que forman parte de ese lote de ejecución. Si una instrucción falla dentro del lote, se puede hacer `ROLLBACK TRANSACTION` y se revierte todo el lote. Si todo sale bien, `COMMIT TRANSACTION` confirma el lote completo. Esto ocurre porque aunque los comandos se ejecuten en paralelo (debido a MARS), todos pertenecen a la misma transacción de lote. Se utiliza en aplicaciones cliente que necesitan ejecutar múltiples consultas en paralelo sin perder atomicidad.

### Concepto de Anidamiento

Una transacción anidada se produce cuando, dentro del contexto de una transacción activa, se inicia otra transacción con `BEGIN TRANSACTION`. Aunque pareciera que se crean transacciones independientes, SQL Server en realidad mantiene un contador interno (@@TRANCOUNT), pero solo existen realmente dos estados: transacción abierta o no abierta. Todas las operaciones comparten el mismo contexto y log de transacción.
SQL Server no permite transacciones verdaderamente independientes dentro de otras.

Funcionamiento Interno y Comportamiento de COMMIT y ROLLBACK
Cada `BEGIN TRANSACTION` incrementa @@TRANCOUNT en uno.

Cada `COMMIT TRANSACTION` decrementa @@TRANCOUNT en uno.

Solo el `COMMIT TRANSACTION` más externo (el que reduce @@TRANCOUNT a 0) realmente escribe los cambios en la base de datos.

Cualquier `ROLLBACK`, sin savepoint, revierte toda la cadena de transacciones anidadas y pone el contador a 0.

### Ventaja de las transacciones

**Manejo de errores y recuperación**

- Proporciona un mecanismo controlado para manejar errores. Si ocurre un error, todos los cambios realizados hasta ese momento se revierten automáticamente.

**Mejora en la concurrencia y eficiencia**

- Facilita el manejo eficiente de accesos concurrentes, minimizando conflictos y mejorando el rendimiento.

**Seguridad y control en los cambios de datos**

- Limita el acceso a los datos solo a las operaciones que se confirman (`commit`), añadiendo una capa de seguridad crucial en sistemas con datos sensibles.

 ### SCRIPT con ejemplos aplicados al proyecto
> Acceder a la siguiente carpeta [scripts-> tema_3](script/tema3_Manejo_de_transacciones)


## CAPÍTULO V: CONCLUSIONES

**Manejo de transacciones y transacciones anidadas**: A traves de la investigación y estudio del tema se pudo concluir que el uso de transacciones en SQL Server constituye una herramienta esencial para asegurar la integridad y consistencia de los datos. Al agrupar operaciones en bloques lógicos, se garantiza que los cambios se ejecuten de manera completa o se reviertan en caso de error, evitando estados intermedios que comprometan la base de datos. Las transacciones anidadas, aunque no permiten confirmaciones parciales, ofrecen una estructura modular que facilita el control de procesos complejos y la coordinación entre distintos procedimientos. Implementar correctamente transacciones y savepoints según las necesidades del sistema no solo protege la confiabilidad de la información, sino que también optimiza la eficiencia operativa y la seguridad en entornos multiusuario. Los objetivos planteados por la catedra fueron alcanzados a traves de distintas pruebas que permitieron una mejor comprensión del uso de transacciones y su importancia en las bases de datos.



## BIBLIOGRAFÍA DE CONSULTA

* IBM Corporation. (s. f.). *Índices – Documentación de IBM DB2 11.5*. Recuperado de [https://www.ibm.com/docs/es/db2/11.5.x?topic=objects-indexes](https://www.ibm.com/docs/es/db2/11.5.x?topic=objects-indexes) ([IBM][1])
* Enviame IO. (s. f.). *Índices en BBDD relacionales*. Recuperado de [https://enviame.io/indices-en-bbdd-relacionales/](https://enviame.io/indices-en-bbdd-relacionales/)
* Akansha & SQLShack Team. (2018, 28 de mayo). *¿Cuál es la diferencia entre Índices Agrupados y No Agrupados en SQL Server?* SQLShack. Recuperado de [https://www.sqlshack.com/es/cual-es-la-diferencia-entre-indices-agrupados-y-no-agrupados-en-sql-server/](https://www.sqlshack.com/es/cual-es-la-diferencia-entre-indices-agrupados-y-no-agrupados-en-sql-server/) ([sqlshack.com][2])
* IBM Corporation. (s. f.). *Índices en clúster y no en clúster – Documentación de IBM DB2 12.1.0*. Recuperado de [https://www.ibm.com/docs/es/db2/12.1.0?topic=indexes-clustered-non-clustered](https://www.ibm.com/docs/es/db2/12.1.0?topic=indexes-clustered-non-clustered)
* Microsoft. (s. f.). *Create unique constraints – SQL Server | Microsoft Learn*. Recuperado de [https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver17](https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver17) ([Microsoft Learn][3])
* DataCamp (2023). Transacciones ACID: qué son y por qué importan. Blog de DataCamp. Disponible en: https://www.datacamp.com/es/blog/acid-transactions.
* Programacion.net (s.f.). Transacciones en SQL Server. Artículo técnico en Programacion.net. . Disponible en: https://programacion.net/articulo/transacciones_en_sql_server_299.
* Microsoft Docs (2025). Transacciones (Transact-SQL). Documentación oficial de Microsoft Learn. Disponible en: https://learn.microsoft.com/es-es/sql/t-sql/language-elements/transactions-transact-sql?view=sql-server-ver17.

