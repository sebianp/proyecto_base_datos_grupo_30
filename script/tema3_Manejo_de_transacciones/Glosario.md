# Glosario de conceptos sobre transacciones en SQL Server

## Transacción
Conjunto de operaciones SQL que se ejecutan como una unidad lógica de trabajo. Garantiza que todas las operaciones se completen correctamente o ninguna se aplique, manteniendo la integridad de los datos.

## Propiedades ACID
Principios que aseguran la confiabilidad de las transacciones:

**Atomicidad**: La transacción se completa íntegramente o se revierte.

**Consistencia**: Los datos pasan de un estado válido a otro estado válido.

**Aislamiento**: Las transacciones concurrentes no interfieren entre sí.

**Durabilidad**: Los cambios confirmados persisten incluso ante fallos del sistema.

## Autocommit
Modo por defecto en SQL Server: cada instrucción DML (`INSERT`, `UPDATE`, `DELETE`) se ejecuta como una transacción individual y se confirma automáticamente si no hay error.

## Transacciones implícitas
Se activan con `SET IMPLICIT_TRANSACTIONS ON`. Cada instrucción DML inicia automáticamente una transacción que requiere un `COMMIT` o `ROLLBACK` explícito para finalizar.

## Transacciones explícitas
Se controlan manualmente con:

`BEGIN TRANSACTION` → inicia

`COMMIT TRANSACTION` → confirma

`ROLLBACK TRANSACTION` → revierte

**Permiten agrupar varias operaciones en un bloque controlado.**

## Transacciones anidadas
Uso de múltiples `BEGIN TRANSACTION` dentro de una transacción principal.

Cada `BEGIN` incrementa el contador `@@TRANCOUNT`.

Los `COMMIT` internos solo reducen el contador, no confirman nada hasta el último `COMMIT`.

Un `ROLLBACK` en cualquier nivel revierte toda la transacción. 

**Su utilidad es estructural y modular, no para confirmar resultados parciales.**

## Savepoints (SAVE TRANSACTION)
Puntos de recuperación dentro de una transacción. Permiten hacer `ROLLBACK TRANSACTION` **nombre_savepoint** para revertir solo lo posterior al savepoint, conservando lo anterior. **Son la forma correcta de lograr rollback parcial.**

## @@TRANCOUNT
Variable global que indica cuántos niveles de transacción están activos.

    0 → no hay transacción activa

    >0 → transacción en curso (profundidad anidada)

## XACT_STATE()
Función que devuelve el estado de la transacción actual:

    1 → transacción activa y válida

    0 → no hay transacción activa

    -1 → transacción en estado de error (situación que deja la transacción en un estado inconsistente o irrecuperable, solo se puede hacer ROLLBACK)
    
    
**Algunos ejemplos típicos que llevan a XACT_STATE() = -1 son:**

**Violación de constraint crítica**

Ejemplo: intentar insertar un valor duplicado en una columna con PRIMARY KEY o UNIQUE.

O insertar un valor que viola una FOREIGN KEY obligatoria.

**Error de conversión de datos**

Ejemplo: intentar guardar texto en una columna numérica ('abc' en un INT).

O un desbordamiento (9999999999 en un INT).

**Error de tipo grave en la transacción**

Ejemplo: división por cero (1/0).

O un CHECK constraint que falla.

**Errores de integridad que afectan varias operaciones**

Ejemplo: un UPDATE que deja la base en estado inconsistente respecto a reglas de negocio.

## SCOPE_IDENTITY()
Función que devuelve el último valor de columna IDENTITY generado en la misma sesión y scope (bloque de código o contexto donde se ejecuta la instrucción). Se usa para recuperar el ID recién insertado y relacionarlo con otras tablas.

## TRY...CATCH
Bloques de control de errores en T‑SQL.

`TRY` → contiene el código que puede fallar

`CATCH` → maneja el error, permite ejecutar `ROLLBACK`, mostrar mensajes o registrar el fallo