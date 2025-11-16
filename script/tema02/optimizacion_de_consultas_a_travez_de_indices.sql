USE PROYECTO_MOVICAPS;
GO

-- Solo para esta prueba borramos algunos pacientes que antes se habian insertado.
DELETE FROM Paciente;
GO

-- Reiniciar el IDENTITY, para que el conteo empiece de 0,
DBCC CHECKIDENT ('Paciente', RESEED, 0);
GO
-- Inserts randoms by chatgpt
WITH N AS (
    SELECT TOP (1000000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
SELECT
    CONCAT('Paciente ', N.n),
    RIGHT('000000000' + CAST(N.n AS VARCHAR(9)), 9),
    DATEADD(DAY, - (N.n % 20000), CAST(GETDATE() AS DATE)),
    CASE N.n % 3
        WHEN 0 THEN 'Masculino'
        WHEN 1 THEN 'Femenino'
        ELSE 'Otro'
    END,
    CONCAT('paciente', N.n, '@correo.com')
FROM N;

-- Vemos indices existentes.
EXEC sp_helpindex 'Paciente';

-- Usaremos la siguiente consulta para probar rendimiento de indices
-- StatisticsTIME muestra tiempo que tardo cada consulta, IO muestra cuántas páginas de datos tuvo que leer SQL Server para ejecutar la consulta.
SET STATISTICS IO, TIME ON; 

SELECT COUNT(*) 
FROM Paciente
WHERE fechaNacimiento BETWEEN '2021-01-01' AND '2025-12-31';

SET STATISTICS IO, TIME OFF;

-- Crear indice para prueba con indice
CREATE NONCLUSTERED INDEX IX_Paciente_FechaNacimiento
ON Paciente(fechaNacimiento);

-- Borrar
-- DROP INDEX IX_Paciente_FechaNacimiento ON Paciente;
