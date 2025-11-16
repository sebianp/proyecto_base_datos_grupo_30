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

# Optimización de consultas a través de índices

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


## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus. 



## BIBLIOGRAFÍA DE CONSULTA

* IBM Corporation. (s. f.). *Índices – Documentación de IBM DB2 11.5*. Recuperado de [https://www.ibm.com/docs/es/db2/11.5.x?topic=objects-indexes](https://www.ibm.com/docs/es/db2/11.5.x?topic=objects-indexes) ([IBM][1])
* Enviame IO. (s. f.). *Índices en BBDD relacionales*. Recuperado de [https://enviame.io/indices-en-bbdd-relacionales/](https://enviame.io/indices-en-bbdd-relacionales/)
* Akansha & SQLShack Team. (2018, 28 de mayo). *¿Cuál es la diferencia entre Índices Agrupados y No Agrupados en SQL Server?* SQLShack. Recuperado de [https://www.sqlshack.com/es/cual-es-la-diferencia-entre-indices-agrupados-y-no-agrupados-en-sql-server/](https://www.sqlshack.com/es/cual-es-la-diferencia-entre-indices-agrupados-y-no-agrupados-en-sql-server/) ([sqlshack.com][2])
* IBM Corporation. (s. f.). *Índices en clúster y no en clúster – Documentación de IBM DB2 12.1.0*. Recuperado de [https://www.ibm.com/docs/es/db2/12.1.0?topic=indexes-clustered-non-clustered](https://www.ibm.com/docs/es/db2/12.1.0?topic=indexes-clustered-non-clustered)
* Microsoft. (s. f.). *Create unique constraints – SQL Server | Microsoft Learn*. Recuperado de [https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver17](https://learn.microsoft.com/en-us/sql/relational-databases/tables/create-unique-constraints?view=sql-server-ver17) ([Microsoft Learn][3])

