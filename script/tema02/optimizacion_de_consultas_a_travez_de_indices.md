# Optimizacion de consultas a traves de indices.

## ¿Qué es un índice en bases de datos relacionales?

Un **índice** es un conjunto de punteros ordenados lógicamente por los valores de una o varias claves. Éstos pueden hacer referencia a registros de una tabla que será el foco del tema actual.

En el siguiente diagrama tenemos un índice basado en los números de empleados de una tabla. Este valor de clave proporciona un puntero a las filas de la tabla. Por ejemplo, el número de empleado 19 apunta al empleado KMP. Un índice permite un acceso eficaz a las filas de una tabla creando una vía de acceso a los datos mediante punteros.

![diagrama_relacional](https://github.com/sebianp/proyecto_base_datos_grupo_30/blob/main/doc/tema_02/representacion_indices.png)


## Como crear un índice en SQL Server

- `CREATE INDEX`: Crea un índice.
- `IX_<Tabla>_<Columna>`: Define el nombre del índice.
- `ON Tabla (Pk_Nombre)`: define sobre qué tabla y columna se aplicará.

## Índices agrupados y no agrupados

### Agrupados

Un índice agrupado define el orden en el cual los datos son físicamente almacenados en una tabla. Los datos de las tablas pueden ser ordenados sólo en una forma, por lo tanto, sólo puede haber un índice agrupado por tabla. En SQL Server, la restricción de llave primaria crea automáticamente un índice agrupado en esa columna en particular.

### No agrupados

Un índice no agrupado no ordena los datos físicos dentro de la tabla. De hecho, un índice no agrupado es agrupado en un solo lugar y los datos de la tabla son almacenados en otro lugar. Esto es similar a un libro de texto donde el contenido del libro está localizado en un lugar y el índice está localizado en otro. Esto permite tener más de un índice no agrupado por tabla.

## ¿Por qué usar índices?

Se usan principalmente para mejorar el rendimiento. En la mayoría de los casos, el acceso a los datos es más rápido con un índice.

 `Sin índices:` El motor tiene que hacer un “table scan”, leyendo fila por fila.

 `Con índices:` El motor hace un "index seek" o "index scan", es más rápido.

## Consideraciones

La **creación masiva de índices** en una tabla, conlleva efectos adversos:

- Cada índice ocupa espacio de almacenamiento en nuestra base de datos.
- La velocidad en las operaciones de insert, update y delete puede verse afectada, ya que los índices de la tabla deben ser actualizados, ante cada una de estas acciones.

## Ejemplo práctico

```sql
-- index no agrupado
CREATE INDEX IX_Atencion_idPaciente
ON Atencion (idPaciente);

-- index agrupado
CREATE INDEX IX_Atencion_Paciente_Fecha
ON Atencion (idPaciente, fechaHora);

```