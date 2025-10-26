# Manejo de Transacciones y Transacciones Anidadas

## ¿Qué es una transacción?

Una **transacción** es una unidad única de trabajo. Si una transacción tiene éxito, todas las modificaciones de los datos realizadas durante la transacción se confirman y se convierten en una parte permanente de la base de datos. Si la transacción encuentra errores y debe cancelarse o revertirse, se borran todas las modificaciones de los datos.

### Modos de transacción en SQL Server

- **Transacciones de confirmación automática**: Cada instrucción individual es una transacción.
- **Transacciones explícitas**: La transacción se inicia explícitamente con `BEGIN TRANSACTION` y se termina explícitamente con una instrucción `COMMIT` o `ROLLBACK`.
- **Transacciones implícitas**: Una nueva transacción se inicia implícitamente al completarse la anterior, pero se completa explícitamente con una instrucción `COMMIT` o `ROLLBACK`.
- **Transacciones de ámbito de lote**: Una transacción implícita o explícita de Transact-SQL que se inicia en una sesión de MARS (conjuntos de resultados activos múltiples) y se convierte en una transacción de ámbito de lote.

### Instrucciones de transacción en SQL Server

- **`BEGIN TRANSACTION` o `BEGIN TRAN`**: Marca el inicio de una transacción.
- **`ROLLBACK TRANSACTION` o `ROLLBACK TRAN`**: Revierte la transacción en caso de error o para abandonarla.
- **`COMMIT TRANSACTION` o `COMMIT TRAN`**: Confirma el conjunto de operaciones, haciendo los datos definitivos.