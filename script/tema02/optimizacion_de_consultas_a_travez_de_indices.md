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