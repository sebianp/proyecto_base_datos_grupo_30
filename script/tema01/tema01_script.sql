-- Ejemplo 1: Procedimiento para registrar una nueva atención
CREATE PROCEDURE SP_RegistrarAtencion
    @p_idUbicacionMovil INT,
    @p_idPaciente INT,
    @p_idProfesional INT,
    @p_idDiagnostico INT
AS
BEGIN
    -- Validaciones o lógica de negocio aquí (ej: verificar capacidad, horarios, etc.)

    INSERT INTO Atencion (idUbicacionMovil, idPaciente, idProfesional, idDiagnostico)
    VALUES (@p_idUbicacionMovil, @p_idPaciente, @p_idProfesional, @p_idDiagnostico);

    SELECT SCOPE_IDENTITY() AS NuevoIdAtencion; -- Devuelve el ID de la nueva atención
END
GO;
--para cargar atencion
 EXEC SP_RegistrarAtencion 1, 5, 2, 8;