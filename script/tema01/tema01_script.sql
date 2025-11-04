 --Procedimiento para obtener unidades móviles por barrio (actuales)
 
CREATE PROCEDURE SP_ObtenerUnidadesPorBarrioActual
    @p_idBarrio INT
AS
BEGIN
    SELECT
        um.patente,
        tum.descripcion AS TipoUnidad,
        um.capacidadDiaria,
        b.nombre_barrio,
        uc.direccion,
        uc.fecha_ingreso
    FROM
        UnidadMovil um
    JOIN
        TipoUnidadMovil tum ON um.idTipo = tum.idTipo
    JOIN
        UbicacionMovil uc ON um.idUnidad = uc.idUnidad
    JOIN
        Barrio b ON uc.idBarrio = b.idBarrio
    WHERE
        uc.idBarrio = @p_idBarrio
        AND uc.fecha_egreso IS NULL; -- Solo ubicaciones actuales 
END;

--uso
 EXEC SP_ObtenerUnidadesPorBarrioActual 10;



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