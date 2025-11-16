use PROYECTO_MOVICAPS; 
/****Prueba de manejo de permisos a nivel de usuario****/
--Crear inicios de sesion para los usuarios de administrador y analista
CREATE LOGIN administrador WITH PASSWORD = '#*1userAdm1n';
CREATE LOGIN analista WITH PASSWORD = '*#2userAn4l1st';
--Crear usuarios relacionados a los inicios de sesion
CREATE USER analista FOR LOGIN analista;
CREATE USER administrador FOR LOGIN administrador;

-- Permisos para el administrador (control total)
GRANT CONTROL ON DATABASE::PROYECTO_MOVICAPS TO administrador;
-- Permisos para el analista (solo lectura)
GRANT SELECT ON DATABASE::PROYECTO_MOVICAPS TO analista;


--Procedimiento almacenado
CREATE PROCEDURE SP_InsertarPaciente (
    @p_nombreCompleto VARCHAR(150),
    @p_dni VARCHAR(15),
    @p_fechaNacimiento DATE,
    @p_sexo VARCHAR(10), -- Restricci�n CHECK en la tabla Paciente: ('Masculino','Femenino','Otro') [2]
    @p_contacto VARCHAR(100) = NULL 
)
AS
BEGIN
    -- Ejecutar INSERT INTO
    INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES (@p_nombreCompleto, @p_dni, @p_fechaNacimiento, @p_sexo, @p_contacto);
 END;  

 -- Permiso de ejecucion sobre un procedimiento especifico para el usuario analista
GRANT EXECUTE ON OBJECT::dbo.SP_InsertarPaciente TO analista;

--Pruebas de permisos
EXECUTE AS USER = 'analista';

INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES ('Ramirez, Elias', '10111222', '19900515', 'Masculino', '3624123456');

--Resultado: The INSERT permission was denied on the object 'Paciente', database 'PROYECTO_MOVICAPS', schema 'dbo'.

EXECUTE AS USER = 'administrador';

INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES ('Ramirez, Elias', '45342321', '19900515', 'Masculino', '3624123456');

--Utilizando el procedimiento almacenado para el usuario 'analista'

EXECUTE AS USER = 'analista';
EXEC SP_InsertarPaciente 
    @p_nombreCompleto = 'Castro, Hector',
    @p_dni = '30333444',
    @p_fechaNacimiento = '20050101',
    @p_sexo = 'Masculino',
    @p_contacto = '3624001122';

/****Prueba de manejo de permisos a nivel de Roles****/

use PROYECTO_MOVICAPS; 
--Crear inicios de sesion para los usuarios de auditor y mantenimiento
CREATE LOGIN auditor WITH PASSWORD = '**=aud1t0rr';
CREATE LOGIN mantenimiento WITH PASSWORD = '..*12m4nt3nim';
--Crear usuarios relacionados a los inicios de sesion
CREATE USER auditor FOR LOGIN auditor;
CREATE USER mantenimiento FOR LOGIN mantenimiento;

-- Crear el rol de solo lectura para el/ la auditor/a
CREATE ROLE lectorAuditor;

-- Conceder permisos de lectura (SELECT) sobre las tablas espec�ficas
GRANT SELECT ON OBJECT::dbo.Paciente TO lectorAuditor;
GRANT SELECT ON OBJECT::dbo.UnidadMovil TO lectorAuditor;
GRANT SELECT ON OBJECT::dbo.Atencion TO lectorAuditor;

-- Agregar el usuario auditor al rol
ALTER ROLE lectorAuditor ADD MEMBER auditor;


--pruebas de permisos
EXECUTE AS USER = 'mantenimiento';

select p.nombreCompleto, p.dni, p.fechaNacimiento, p.sexo, p.contacto
from paciente p;

EXECUTE AS USER = 'auditor';

select p.nombreCompleto, p.dni, p.fechaNacimiento, p.sexo, p.contacto
from paciente p;