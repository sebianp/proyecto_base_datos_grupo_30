
/*TRANSACCIONES DE CONFIRMACION AUTOMATICA (Transacciones impliticas autocommit)*/

--Cada instrucción es una transacción independiente
--Si se ejecuta correctamente, se confirma automáticamente
--Si falla, se revierte automáticamente.
--Es el modo por defecto en SQL Server.

-- Insertar un paciente
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
VALUES ('Lucía Fernández', '98765432', '1992-07-10', 'Femenino','luci_fernad10z@email.com');

-- Insertar una atención
INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
VALUES (GETDATE(), 1, 1, 2, 1);

-- Actualizar capacidad de la unidad móvil
UPDATE UnidadMovil
SET capacidadDiaria = capacidadDiaria - 1
WHERE idUnidad = 1;
-- Cada una de estas operaciones se confirma automáticamente si no hay errores.


/*TRANSACCION IMPLICITA*/
SET IMPLICIT_TRANSACTIONS ON; --se activa el modo de transacciones implícitas

--Primera transacción: se inicia automáticamente con este INSERT
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
VALUES ('María López', '45678901', '1985-03-15', 'Femenino', 'mariaa.lopz@email.com');

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




--====== TRANSACCION EXPLITICA CON TRY CATCH ======
--Objetivo de la transacción: 
--registrar una atencion medica junto con los síntomas del paciente, y asegurarte de que no se registre nada si falla alguna parte.
-- Transaccion para Atencion, Sintomas y tratamientos

BEGIN TRANSACTION; --INICIO EXPLICITO DE LA TRANSACCION
BEGIN TRY
    --Obtener idUnidad desde la ubicación actual
    DECLARE @idUnidad INT;
	DECLARE @idUbicacionMovil INT;
    SELECT @idUnidad = idUnidad, @idUbicacionMovil = idUbicacionMovil FROM UbicacionMovil WHERE idUbicacionMovil = 1;

    --Verificar capacidad Disponible antes de hacer la atencion
    DECLARE @capacidad INT;
    SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;
	set @capacidad = 0; --Error provocado: falta de capacidad (fuerza un error controlado para mostrar cómo se maneja la transacción)

	 IF @capacidad <= 0
        THROW 50001, 'La unidad móvil no tiene capacidad disponible.', @idUnidad;

    -- Insertar atención
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES (GETDATE(), @idUbicacionMovil, 3, 2, 1);

    DECLARE @idAtencion INT = SCOPE_IDENTITY();

    --Insertar síntomas asociados (provocar error poniendo sintomas que no existen)
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 3);
	INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 3);

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
go

--Comprobacion viendo por fecha se puede ver si se agrego o no, dependiendo si se provoco un fallo
select a.idAtencion, a.idPaciente, a.idProfesional , a.idUnidad, a.fechaHora
from Atencion as a
order by a.fechaHora desc

--No debe haber nulos
select *
from Atencion as a left join Atencion_Tratamiento as ta on a.idAtencion = ta.idAtencion
left join Tratamiento as t on ta.idTratamiento = t.idTratamiento

--======TRANSACCION UTILIZANDO SAVEPOINT =========
--Ejemplo Utilizando SAVE TRANSACTION
BEGIN TRANSACTION;
BEGIN TRY
    --insertar paciente
    DECLARE @idPaciente INT;
    INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES ('Juan Pérez', '12345678', '1990-05-12', 'Masculino', 'juan.perez@email.com');
    SET @idPaciente = SCOPE_IDENTITY();

    -- guarda punto de recuperación (Si falla la transacción el paciente queda registrado, pero no la atención)
    SAVE TRANSACTION PacienteOK; --Savepoint

    --se inserta la atencion para el paciente en cuestión
    DECLARE @idAtencion INT;
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES ('2025-11-03 09:00', 1, @idPaciente, 1, 1);
    SET @idAtencion = SCOPE_IDENTITY();

    --Ingreso de sintomas
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma)
    VALUES (@idAtencion, 1); 
    --Si modificamos el 1 por un idSintoma que no existe, se provoca un error, esto hará que se revierta solo la atención, pero el paciente quedará registrado.

    --Ingreso de tratamiento
    INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento)
    VALUES (@idAtencion, 1);

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

--======TRANSACCIONES ANIDADAS =========
--Transaccion anidada de Atencion: Creación de paciente en principal y cargar atención en la anidada
BEGIN TRY
    BEGIN TRANSACTION;  -- Transacción principal

    --Transaccion 1.
    --Insertar paciente
    DECLARE @idPaciente INT;
    INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES ('Juan Pérez', '12345678', '1990-05-12', 'Masculino', 'juan.perez@email.com');
    SET @idPaciente = SCOPE_IDENTITY(); --Se guarda el id del paciente para utilizarlo en la transaccion anidada

    --Obtener idUnidad desde la ubicación
    DECLARE @idUnidad INT;
    SELECT @idUnidad = idUnidad FROM UbicacionMovil WHERE idUbicacionMovil = 1;

    --Transaccion 2 (anidada 1): Verificar disponibilidad de capacidad de atención
    BEGIN TRANSACTION;  --Inicio transaccion anidada 1
        --Verificar capacidad Disponible antes de hacer la atencion
        DECLARE @capacidad INT;
        SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;

        IF @capacidad <= 0
            THROW 50001, 'La unidad móvil no tiene capacidad disponible.', 1;

    COMMIT TRANSACTION;  -- Transacción anidada 2 fin

    --Transaccion 3 (anidada 2): registrar atención
    BEGIN TRANSACTION;--Inicio transaccion anidada 2

        DECLARE @idAtencion INT;
        INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
        VALUES ('2025-11-03 09:00', 1, @idPaciente, 1, 1);
        SET @idAtencion = SCOPE_IDENTITY();

        -- Insertar síntomas (simulamos error)
        INSERT INTO Atencion_Sintoma (idAtencion, idSintoma)
        VALUES (@idAtencion, 1), (@idAtencion, 999); -- ← Error: idSintoma 999 no existe

        -- Insertar tratamientos
        INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento)
        VALUES (@idAtencion, 1), (@idAtencion, 2);

    COMMIT TRANSACTION;--Transacción anidada 3 (fin)

    --Una vez realizada la atención se actualiza la capacidad diaria
    UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = 1;

    COMMIT TRANSACTION;  --Transacción principal commit
    PRINT 'Transacción completada con éxito';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en la transacción. Operación revertida.';
    PRINT ERROR_MESSAGE(); --Se muestra el error del THROW en capacidad (para este caso, pero puede ser cualquier otro)
END CATCH;
