
--Objetivo: 
--registrar una atencion medica junto con los síntomas del paciente, y asegurarte de que no se registre nada si falla alguna parte.
-- Transaccion para Atencion, Sintomas y tratamientos
-- Transaccion para Atencion, Sintomas y tratamientos (En proceso)
BEGIN TRANSACTION;
BEGIN TRY
    --Obtener idUnidad desde la ubicación actual
    DECLARE @idUnidad INT;
	DECLARE @idUbicacionMovil INT;
    SELECT @idUnidad = idUnidad, @idUbicacionMovil = idUbicacionMovil FROM UbicacionMovil WHERE idUbicacionMovil = 1;

    --Verificar capacidad Disponible antes de hacer la atencion
    DECLARE @capacidad INT;
    SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;
	--set @capacidad = 0; --Error provocado: falta de capacidad

	 IF @capacidad <= 0
        THROW 50001, 'La unidad móvil no tiene capacidad disponible.', @idUnidad;

    -- Insertar atención
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES (GETDATE(), @idUbicacionMovil, 2, 2, 2);

    DECLARE @idAtencion INT = SCOPE_IDENTITY();

    -- Insertar síntomas asociados (provocar error poniendo sintomas que no existen)
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 3);
	INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 3);

    --Una vez realizada la atención se actualiza la capacidad diaria
    UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = @idUnidad;

    COMMIT TRANSACTION;
    PRINT 'Atención y síntomas registrados correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error detectado. Se canceló la transacción.';
END CATCH;
go

select * from UnidadMovil as un inner join UbicacionMovil as ub on un.idUnidad = ub.idUnidad
go

select a.idAtencion, a.idPaciente, a.idProfesional , a.idUbicacionMovil, a.fechaHora
from Atencion as a
order by a.fechaHora desc
go

select *
from Diagnostico

select *
from Atencion as a left join Atencion_Tratamiento as ta on a.idAtencion = ta.idAtencion
left join Tratamiento as t on ta.idTratamiento = t.idTratamiento


--Comprobacion viendo por fecha se puede ver si se agrego o no, dependiendo si se provoco un fallo
select a.idAtencion, a.idPaciente, a.idProfesional , a.idUnidad, a.fechaHora
from Atencion as a
order by a.fechaHora desc

--No debe haber nulos
select *
from Atencion as a left join Atencion_Tratamiento as ta on a.idAtencion = ta.idAtencion
left join Tratamiento as t on ta.idTratamiento = t.idTratamiento

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

    --Ingreso de tratamiento
    INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento)
    VALUES (@idAtencion, 1);

    COMMIT TRANSACTION;
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

    --Verificar capacidad Disponible antes de hacer la atencion
    DECLARE @capacidad INT;
    SELECT @capacidad = capacidadDiaria FROM UnidadMovil WHERE idUnidad = @idUnidad;

    IF @capacidad <= 0
        THROW 50001, 'La unidad móvil no tiene capacidad disponible.', 1;

    --Transaccion 2(anidada): registrar atención
    BEGIN TRANSACTION;  --Inicio transaccion anidada

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

    COMMIT TRANSACTION;  -- Transacción anidada

    --Una vez realizada la atención se actualiza la capacidad diaria
    UPDATE UnidadMovil SET capacidadDiaria = capacidadDiaria - 1 WHERE idUnidad = 1;

    COMMIT TRANSACTION;  --Transacción principal
    PRINT 'Transacción completada con éxito';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error en la transacción. Operación revertida.';
    PRINT ERROR_MESSAGE();
END CATCH;
