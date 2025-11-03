
--Objetivo: 
--registrar una atencion medica junto con los síntomas del paciente, y asegurarte de que no se registre nada si falla alguna parte.
-- Transaccion para Atencion, Sintomas y tratamientos
BEGIN TRANSACTION;
BEGIN TRY
    -- Insertar atención
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
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
go

--Provocar un error: Se modifica un sintoma y se coloca un idSintoma no registrado.
BEGIN TRANSACTION;
BEGIN TRY
    -- Insertar atención
    INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES (GETDATE(), 7, 2, 5, 3);

    DECLARE @idAtencion INT = SCOPE_IDENTITY();

    -- Insertar síntomas asociados (provocar error poniendo un sintoma que no existe)
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 3);
    INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 17); --Error Provocado (No existe sintoma 17)
	INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 3);
    INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES (@idAtencion, 1);

    COMMIT TRANSACTION;
    PRINT 'Atención y síntomas registrados correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error detectado. Se canceló la transacción.';
END CATCH;
go

--Comprobacion viendo por fecha se puede ver si se agrego o no, dependiendo si se provoco un fallo
select a.idAtencion, a.idPaciente, a.idProfesional , a.idUnidad, a.fechaHora
from Atencion as a
order by a.fechaHora desc

--Controles

select *
from Diagnostico

--No debe haber nulos
select *
from Atencion as a left join Atencion_Tratamiento as ta on a.idAtencion = ta.idAtencion
left join Tratamiento as t on ta.idTratamiento = t.idTratamiento