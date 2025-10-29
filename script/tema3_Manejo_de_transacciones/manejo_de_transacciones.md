# Manejo de Transacciones y Transacciones Anidadas

## ¿Qué es una transacción?

Una **transacción** es una unidad lógica de trabajo que agrupa una o más operaciones sobre la base de datos. Su objetivo es garantizar que los datos permanezcan consistentes, incluso ante errores o fallos del sistema. Las transacciones siguen el principio **ACID**:

- **Atomicidad**: Todas las operaciones se completan o ninguna se aplica.
- **Consistencia**: La base de datos pasa de un estado válido a otro estado válido.
- **Aislamiento**: Las transacciones concurrentes no interfieren entre sí.
- **Durabilidad**: Una vez confirmada, la transacción es permanente.

## Modos de transacción en SQL Server

- **Transacciones de confirmación automática**: Cada instrucción `INSERT`, `UPDATE` o `DELETE` se ejecuta como una transacción individual.
- **Transacciones explícitas**: Se controlan manualmente con `BEGIN TRANSACTION`, `COMMIT` y `ROLLBACK`.
- **Transacciones implícitas**: SQL Server inicia automáticamente una nueva transacción después de cada instrucción de modificación, pero requiere `COMMIT` o `ROLLBACK` explícito.
- **Transacciones de ámbito de lote (MARS)**: Permiten múltiples conjuntos de resultados activos en una misma conexión, afectando el alcance de las transacciones.

## Instrucciones de transacción en SQL Server

- `BEGIN TRANSACTION` o `BEGIN TRAN`: Inicia una transacción explícita.
- `COMMIT TRANSACTION` o `COMMIT TRAN`: Confirma los cambios realizados durante la transacción.
- `ROLLBACK TRANSACTION` o `ROLLBACK TRAN`: Revierte todos los cambios si ocurre un error o se desea cancelar.

## ¿Qué es una transacción anidada?

Una **transacción anidada** ocurre cuando se inicia una nueva transacción dentro de otra ya existente. SQL Server permite anidar transacciones, pero solo la transacción externa controla el `COMMIT` o `ROLLBACK` final. Las transacciones internas usan `SAVEPOINT` para marcar puntos de recuperación.

### Instrucciones adicionales

- `SAVE TRANSACTION nombre`: Crea un punto de guardado dentro de una transacción.
- `ROLLBACK TRANSACTION nombre`: Revierte hasta el punto de guardado, sin cancelar toda la transacción externa.

## ¿Por qué usar transacciones?

- Para garantizar la integridad de los datos en operaciones críticas.
- Para evitar registros parciales o inconsistentes.
- Para manejar errores de forma controlada y segura.

## Ejemplo práctico

```sql
BEGIN TRANSACTION;
BEGIN TRY
    -- Insertar atención
    INSERT INTO Atencion (fechaHora, idUnidad, idPaciente, idProfesional, idDiagnostico)
    VALUES (GETDATE(), 5, 7, 5, 3);

    DECLARE @idAtencion INT = SCOPE_IDENTITY();

    -- Insertar síntomas asociados (provocar error poniendo sintomas que no existen)
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 3);
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 7);
	INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 3);
    INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 1);

    COMMIT TRANSACTION;
    PRINT 'Atención y síntomas registrados correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error detectado. Se canceló la transacción.';
END CATCH;
