/*TRANSACCIONES DE CONFIRMACION AUTOMATICA (Transacciones impliticas autocommit)*/

--Cada instrucción es una transacción independiente
--Si se ejecuta correctamente, se confirma automáticamente
--Si falla, se revierte automáticamente.
--Es el modo por defecto en SQL Server.

--Insertar un paciente
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
VALUES ('Lucía Fernández', '98765432', '1992-07-10', 'Femenino','luci_fernad10z@email.com');

--Insertar una atención
INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
VALUES (GETDATE(), 1, 1, 2, 1);

--Actualizar capacidad de la unidad móvil
UPDATE UnidadMovil
SET capacidadDiaria = capacidadDiaria - 1
WHERE idUnidad = 1;
--Cada una de estas operaciones se confirma automáticamente si no hay errores.

--================================================================================================

/*TRANSACCION IMPLICITA*/
SET IMPLICIT_TRANSACTIONS ON; --se activa el modo de transacciones implícitas

--Primera transacción: se inicia automáticamente con este INSERT
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
VALUES ('Raul Gerardo Gomez', '32001987', '1985-03-15', 'Masculino', 'raulogp@email.com');

--Nada se confirma todavía, la transacción sigue abierta, podemos hacer más operaciones o revertir
--Si decidimos confirmar, ejecutamos COMMIT TRANSACTION;
--Confirmamos manualmente
COMMIT TRANSACTION;

--Segunda transacción: se inicia automáticamente con este UPDATE
UPDATE UnidadMovil
SET capacidadDiaria = capacidadDiaria - 1
WHERE idUnidad = 1;

--Confirmamos manualmente
COMMIT TRANSACTION;

-- Tercera transacción: se inicia automáticamente con este INSERT
INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
VALUES (GETDATE(), 1, 1, 2, 1);

--si ocurre un error, podemos revertir
--se revierte solo la transacción que está actualmente abierta (la última instrucción que inició una transacción y todavía no fue confirmada).
ROLLBACK TRANSACTION; 

SET IMPLICIT_TRANSACTIONS OFF; --se desactiva el modo de transacciones implícitas
GO

--Verificaciones:
-- Verificar si hay transacciones activas
-- SELECT @@TRANCOUNT as transacciones_activas;
select * from UnidadMovil as u order by u.idUnidad asc
--select * from paciente as p order by p.idPaciente desc;

--================================================================================================

--====== TRANSACCION EXPLITICA CON TRY CATCH ======
--Objetivo de la transacción: 
--registrar una atencion medica junto con los síntomas del paciente, y asegurarte de que no se registre nada si falla alguna parte.
-- Transaccion para Atencion, Sintomas y tratamientos

BEGIN TRANSACTION;--INICIO EXPLICITO DE LA TRANSACCION
BEGIN TRY
    --Obtener idUnidad desde la ubicación actual y se almacenan en variables.
    DECLARE @idUnidad INT;
	DECLARE @idUbicacionMovil INT;
	--Selecciona la ubicacion movil y el id de la unidad en la ubicacion.
    SELECT @idUnidad = idUnidad, @idUbicacionMovil = idUbicacionMovil FROM UbicacionMovil WHERE idUbicacionMovil = 1;

    --Verificar capacidad Disponible antes de hacer la atencion
    DECLARE @capacidad INT;
    SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;
	--set @capacidad = 0; --Error provocado: falta de capacidad (fuerza un error controlado para mostrar cómo se maneja la transacción)

	 IF @capacidad <= 0
        THROW 50001, 'La unidad móvil no tiene capacidad disponible.', @idUnidad;

    -- Insertar atención (Paciente ya existente)
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES (GETDATE(), @idUbicacionMovil, 8, 2, 1);

    DECLARE @idAtencion INT = SCOPE_IDENTITY(); --Devuelve el último valor de identity generado en la misma sesión.

    --Insertar síntomas asociados (provocar error poniendo sintomas que no existen)
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 4);
	INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 4);

    --Una vez realizada la atención se actualiza la capacidad diaria
    UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = @idUnidad;

    COMMIT TRANSACTION; --si todo sale bien se confirma la transacción
    PRINT 'Atención y síntomas registrados correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION; --si ocurre un error, se revierte todo y se muestra el mensaje.
    PRINT 'Error detectado. Se canceló la transacción.';
    PRINT ERROR_MESSAGE(); --muestra el mensaje del THROW
END CATCH;
GO
/*Conclusión:
Este ejemplo muestra cómo una transacción explícita en SQL Server permite agrupar varias operaciones críticas 
(insertar una atención, registrar síntomas y tratamientos, y actualizar la capacidad de una unidad móvil) dentro de un mismo 
bloque de ejecución. Gracias al uso de TRY...CATCH, si todo funciona correctamente se confirma con COMMIT, 
y si ocurre un error (como capacidad insuficiente o un síntoma inexistente) se revierte con ROLLBACK, 
evitando que los datos queden incompletos o inconsistentes.
 - La transacción explícita da control total sobre cuándo confirmar o cancelar cambios.
 - El bloque TRY...CATCH asegura que los errores se manejen de forma controlada.
 - Se garantiza la integridad de los datos, ya que o se guarda todo correctamente o no se guarda nada.
 - Es útil en procesos médicos/operativos como este, donde no puede quedar registrada una atención parcial o incorrecta.
*/

--Comprobacion viendo por fecha se puede ver si se agrego o no, dependiendo si se provoco un fallo
select a.idAtencion, a.idPaciente, a.idProfesional , a.idUbicacionMovil, a.fechaHora
from Atencion as a
order by a.fechaHora desc
GO
--Verificar estado de unidad movil
select * from UnidadMovil
go

--No debe haber nulos
select *
from Atencion as a left join Atencion_Tratamiento as ta on a.idAtencion = ta.idAtencion
left join Tratamiento as t on ta.idTratamiento = t.idTratamiento
GO
--================================================================================================

--======TRANSACCION UTILIZANDO SAVEPOINT =========
--Ejemplo Utilizando SAVE TRANSACTION
BEGIN TRANSACTION; -- Esto permite que el SAVE TRANSACTION (savepoint) esté disponible dentro del TRY
BEGIN TRY
    --insertar paciente
    DECLARE @idPaciente INT;
    INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES ('Anastasia Gomez', '28654198', '1991-05-12', 'Femenino', 'ani_gomez@email.com');
    SET @idPaciente = SCOPE_IDENTITY();

	--select * from paciente as p order by p.idPaciente desc

    -- guarda punto de recuperación (Si falla la transacción el paciente queda registrado, pero no la atención)
    SAVE TRANSACTION PacienteOK; --Savepoint
	
	--Obtener idUnidad desde la ubicación actual y se almacenan en variables.
    DECLARE @idUnidad INT;
	DECLARE @idUbicacionMovil INT;

	--Selecciona la ubicacion movil y el id de la unidad en la ubicacion.
    SELECT @idUnidad = idUnidad, @idUbicacionMovil = idUbicacionMovil FROM UbicacionMovil WHERE idUbicacionMovil = 1;

	 --Verificar capacidad Disponible antes de hacer la atencion
    DECLARE @capacidad INT;
    SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;
	set @capacidad = 0; --Error provocado: falta de capacidad (fuerza un error controlado para mostrar cómo se maneja la transacción)

	 IF @capacidad <= 0
        THROW 50001, 'La unidad móvil no tiene capacidad disponible.', @idUnidad;

    --se inserta la atencion para el paciente en cuestión
    DECLARE @idAtencion INT;
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES (getdate(), 1, @idPaciente, 1, 1);
    SET @idAtencion = SCOPE_IDENTITY();

    --Ingreso de sintomas
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma)
    VALUES (@idAtencion, 1); 
    --Si modificamos el 1 por un idSintoma que no existe, se provoca un error, esto hará que se revierta solo la atención, pero el paciente quedará registrado.

    --Ingreso de tratamiento
    INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento)
    VALUES (@idAtencion, 1);

	--Una vez realizada la atención se actualiza la capacidad diaria
    UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = @idUnidad;

    COMMIT TRANSACTION; --si todo sale bien se confirma la transacción
    PRINT 'Transacción completada con éxito';
END TRY
BEGIN CATCH
    --estado actual de la transacción en ejecución se obtiene usando XACT_STATE() = 1/0/-1
    IF XACT_STATE() = -1 -- Si es -1 indica que hay una transaccion en estado de error, no se puede volver al savepoint
    BEGIN
        --Hay una transacción activa pero está en estado de error (se cancela todo)
        ROLLBACK TRANSACTION;
        PRINT 'Error grave. Se canceló toda la transacción.';
    END
    ELSE
    BEGIN
        --Transacción activa, se revierte solo lo posterior al paciente (se conserva paciente)
        ROLLBACK TRANSACTION PacienteOK;
        COMMIT TRANSACTION;
        PRINT 'Error en la atención. El paciente quedó registrado, pero no se guardó la atención.';
    END
    PRINT ERROR_MESSAGE();
END CATCH;
GO
/*
Conclusion: Si provocamos un error pero hacemos un rollback hacia el savepoint que asignamos, el paciente se guarda con exito
pero la atención no, debido al error provocado se cancela todo lo posterior al savepoint (SAVE TRANSACTION) y se guarda todo
lo anterior al savepoint, siendo de utilidad para no perder todos los datos de un bloque de transacciones en caso de que ocurra
algún error inesperado. En este caso, el paciente queda registrado en el sistema y no lo tenemos que volver a registrar.
*/

--================================================================================================

--======TRANSACCIONES ANIDADAS =========
--Transaccion anidada de Atencion: Creación de paciente en principal
--Verificacion de capacidad movil en anidada 1
-- Ingresar atención en Anidada 2
--

BEGIN TRY
    PRINT 'Inicio de transacción principal';
    BEGIN TRANSACTION; -- @@TRANCOUNT = 1

    -- Insertar paciente
    DECLARE @idPaciente INT;
    INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES ('Juan Carlos Rivero', '22908671', '1975-05-06', 'Masculino', 'juanca99@email.com');
    SET @idPaciente = SCOPE_IDENTITY();
    PRINT 'Paciente insertado. @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS VARCHAR);

	--Obtener idUnidad desde la ubicación
    DECLARE @idUnidad INT;
    SELECT @idUnidad = idUnidad FROM UbicacionMovil WHERE idUbicacionMovil = 5;

    -- Transacción anidada 1
    BEGIN TRANSACTION; -- @@TRANCOUNT = 2
        PRINT 'Inicio transacción anidada 1. @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS VARCHAR);

        -- Verificar capacidad
        DECLARE @capacidad INT;
        SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;

		--set @capacidad = 0; --ERROR PROVOCADO

        IF @capacidad <= 0
            THROW 50001, 'Unidad sin capacidad disponible.', 1;

    COMMIT TRANSACTION; -- @@TRANCOUNT = 1
    PRINT 'Fin transacción anidada 1. @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS VARCHAR);

    -- Transacción anidada 2
    BEGIN TRANSACTION; -- @@TRANCOUNT = 2
        PRINT 'Inicio transacción anidada 2. @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS VARCHAR);

        --Registrar atención
        DECLARE @idAtencion INT;
        INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
        VALUES (GETDATE(), 1, @idPaciente, 5, 3);
        SET @idAtencion = SCOPE_IDENTITY();

        --Registrar síntoma
        INSERT INTO Atencion_Sintoma (idAtencion, idSintoma)
        VALUES (@idAtencion, 3);

		--Ingreso de tratamiento
		INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento)
		VALUES (@idAtencion, 3);

    COMMIT TRANSACTION; -- @@TRANCOUNT = 1
    PRINT 'Fin transacción anidada 2. @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS VARCHAR);

    -- Actualizar capacidad
    UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = @idUnidad;

    COMMIT TRANSACTION; -- @@TRANCOUNT = 0  (Aca se confirma todo)
    PRINT 'Transacción principal confirmada. @@TRANCOUNT = ' + CAST(@@TRANCOUNT AS VARCHAR);
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error detectado. Se canceló toda la transacción.';
    PRINT ERROR_MESSAGE();
END CATCH;
/*
Conclusión:
En este ejemplo de transacciones anidadas, se observa cómo una transacción principal puede contener
varias transacciones anidadas para manejar operaciones específicas de manera ordenada.
Las transacciones anidadas en SQL Server no generan transacciones independientes, sino que incrementan el 
contador @@TRANCOUNT. Solo el último COMMIT confirma los cambios, y cualquier ROLLBACK revierte todo el bloque. 
Su utilidad es principalmente estructural y modular, para coordinar procedimientos complejos dentro de una transacción principal.
*/

--Comprobacion viendo por fecha se puede ver si se agrego o no, dependiendo si se provoco un fallo
select a.idAtencion, a.idPaciente, a.idProfesional , a.idUbicacionMovil, a.fechaHora
from Atencion as a
order by a.fechaHora desc

--Comprobar datos de la unidad movil (capacidad)
select * from UnidadMovil 

--Verificar que se agrego el paciente
select * from Paciente order by idPaciente desc

--=================================================================================================
--TRANSACCIONES MULTI-LOTE CON MARS (Multiple Active Result Sets)

--Que es MARS?
--MARS (Multiple Active Result Sets) es una característica de SQL Server que permite a una
--misma conexión tener múltiples conjuntos de resultados activos al mismo tiempo.
--Esto es útil en escenarios donde una aplicación necesita ejecutar múltiples consultas
--o procedimientos almacenados simultáneamente sin tener que abrir múltiples conexiones.
--Para habilitar MARS, se debe configurar en la cadena de conexión del cliente.

--Objetivo: Ejecutar varios lotes dentro de una misma transacción.

--Supongamos que la conexión tiene habilitado MARS (esto se configura en el cliente)
BEGIN TRANSACTION;

-- Lote 1:insertar paciente
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo)
VALUES ('Pedro Gómez', '11223344', '1980-01-01', 'Masculino');

-- Lote 2:insertar atención para ese paciente
INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
VALUES (GETDATE(), 1, SCOPE_IDENTITY(), 2, 1);

-- Lote 3:actualizar capacidad de la unidad móvil
UPDATE UnidadMovil
SET capacidadDiaria = capacidadDiaria - 1
WHERE idUnidad = 1;

COMMIT TRANSACTION;
/*Cada lote se ejecuta en su propio contexto de ejecución, pero todos forman parte de la misma transacción.
Si el lote finaliza sin un COMMIT o ROLLBACK explícito antes de que la conexión se cierre, 
la transacción se revertirá automáticamente.*/




