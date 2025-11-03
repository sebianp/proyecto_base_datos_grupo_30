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
 

 -- Función para obtener el historial de atenciones de un paciente
CREATE FUNCTION FN_HistorialAtencionesPaciente (@p_idPaciente INT)
RETURNS TABLE
AS
RETURN
(
    SELECT
        a.fechaHora,
        p.nombreCompleto AS Profesional,
        e.nombre AS Especialidad,
        d.descripcion AS Diagnostico
    FROM
        Atencion a
    JOIN
        Profesional p ON a.idProfesional = p.idProfesional
    JOIN
        Especialidad e ON p.idEspecialidad = e.idEspecialidad [cite: 6]
    JOIN
        Diagnostico d ON a.idDiagnostico = d.idDiagnostico
    WHERE
        a.idPaciente = @p_idPaciente
);
GO*/

--uso consulta historial de atencion de un paciente
SELECT
    *
FROM
    dbo.FN_HistorialAtencionesPaciente(5) -- Muestra el historial del paciente con idPaciente = 5
ORDER BY
    fechaHora DESC;