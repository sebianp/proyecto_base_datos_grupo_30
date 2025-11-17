USE PROYECTO_MOVICAPS;

-- Vemos indices existentes.
EXEC sp_helpindex 'Paciente';

-- Primero vaciaremos la tabla Paciente, asi que hay que quitar la FK con atencion por si hay registros.
ALTER TABLE Atencion
DROP CONSTRAINT FK_Atencion_Paciente;
GO

-- Solo para esta prueba borramos algunos pacientes.
DELETE FROM Paciente;
GO

-- Reiniciar el IDENTITY, para que el conteo empiece de 0,
DBCC CHECKIDENT ('Paciente', RESEED, 0);
GO

-- Quitar PK actual (clustered)
ALTER TABLE Paciente
DROP CONSTRAINT PK_Paciente;
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

-- Usaremos la siguiente consulta para probar rendimiento de indices
-- StatisticsTIME muestra tiempo que tardo cada consulta, IO muestra cuántas páginas de datos tuvo que leer SQL Server para ejecutar la consulta.
SET STATISTICS IO, TIME ON; 

SELECT COUNT(*) 
FROM Paciente
WHERE fechaNacimiento BETWEEN '2021-01-01' AND '2025-12-31';

SET STATISTICS IO, TIME OFF;

-- Indice agrupado sobre col fecha.

--CREATE CLUSTERED INDEX IX_Paciente_FechaNacimiento_CL
--ON Paciente(fechaNacimiento);

 --DROP INDEX IX_Paciente_FechaNacimiento_CL ON Paciente;



-- Otro indice agrupado sobre col fecha y mas columnas

--CREATE CLUSTERED INDEX IX_Paciente_FechaNacimiento_MasColumnas_CL
--ON Paciente(fechaNacimiento, nombreCompleto, dni, sexo, idPaciente);

 --DROP INDEX IX_Paciente_FechaNacimiento_MasColumnas_CL ON Paciente;

-- RESET

-- 1. Volver a PK clustered en idPaciente
ALTER TABLE Paciente
ADD CONSTRAINT PK_Paciente
    PRIMARY KEY CLUSTERED (idPaciente);
GO

-- 3. Volver a crear FK Atencion -> Paciente
ALTER TABLE Atencion
ADD CONSTRAINT FK_Atencion_Paciente
    FOREIGN KEY (idPaciente)
    REFERENCES Paciente(idPaciente);
