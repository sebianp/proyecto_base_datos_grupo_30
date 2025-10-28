
--Objetivo: 
--registrar una atencion medica junto con los síntomas del paciente, y asegurarte de que no se registre nada si falla alguna parte.

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
go

--Provocar un error: Se modifica un sintoma y se coloca un idSintoma no registrado.
INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES (@idAtencion, 29); --No existe el sintoma 29, solo hay hasta 10

--Comprobacion viendo por fecha se puede ver si se agrego o no, dependiendo si se provoco un fallo
select a.idAtencion, a.idPaciente, a.idProfesional , a.idUnidad, a.fechaHora, s.idSintoma
from Atencion as a inner join Atencion_Sintoma as s on a.idAtencion = s.idAtencion
order by a.fechaHora desc

--Controles

select *
from Diagnostico

--No debe haber nulos
select *
from Atencion as a left join Atencion_Tratamiento as ta on a.idAtencion = ta.idAtencion
left join Tratamiento as t on ta.idTratamiento = t.idTratamiento