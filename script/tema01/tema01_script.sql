/*Utilizaremos la tabla Paciente para las operaciones CRUD, ya que incluye campos esenciales como nombreCompleto, dni, fechaNacimiento y contacto.

 Procedimiento para Insertar Registros (INSERT)
 Procedimiento SP_InsertarPaciente que acepta los parámetros necesarios para crear un nuevo registro en la tabla Paciente.
*/
 
CREATE PROCEDURE SP_InsertarPaciente (
    @p_nombreCompleto VARCHAR(150),
    @p_dni VARCHAR(15),
    @p_fechaNacimiento DATE,
    @p_sexo VARCHAR(10), -- Restricción CHECK en la tabla Paciente: ('Masculino','Femenino','Otro') [2]
    @p_contacto VARCHAR(100) = NULL 
)
AS
BEGIN
    -- Ejecutar INSERT INTO
    INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto)
    VALUES (@p_nombreCompleto, @p_dni, @p_fechaNacimiento, @p_sexo, @p_contacto);
 END;   
   
/*Procedimiento para Modificar Registros (UPDATE)
Procedimiento SP_ModificarContactoPaciente para actualizar el campo contacto de un paciente, 
utilizando la clave primaria idPaciente para el filtro WHERE.*/


CREATE PROCEDURE SP_ModificarContactoPaciente (
    @p_idPaciente INT,
    @p_nuevoContacto VARCHAR(100)
)
AS
BEGIN
    -- Ejecutar UPDATE
    UPDATE Paciente
    SET contacto = @p_nuevoContacto
    WHERE idPaciente = @p_idPaciente;
END;

/* Procedimiento para Eliminar Registros (DELETE)
 Procedimiento SP_EliminarPaciente para eliminar un paciente, usando idPaciente.*/

CREATE PROCEDURE SP_EliminarPaciente (
    @p_idPaciente INT
)
AS
BEGIN
    -- Ejecutar DELETE
    DELETE FROM Paciente
    WHERE idPaciente = @p_idPaciente;
END;

/*Inserción de Lotes de Datos
 Lote de Inserción Directa con Sentencias INSERT (Guardar Script)
Este script utiliza sentencias DML directas.*/

-- SCRIPT LOTE A: Inserción directa en la tabla Paciente (Guardar como script)
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto) 
VALUES 
('Ramirez, Elias', '10111222', '19900515', 'Masculino', '3624123456'),
('Pereyra, Daniela', '20222333', '19871120', 'Femenino', '3624987654');

/* Lote de Inserción Invocando a los Procedimientos Creados
Este script demuestra la modularidad y reutilización del código encapsulado en el procedimiento almacenado.*/

-- SCRIPT LOTE B: Inserción invocando el procedimiento almacenado
EXEC SP_InsertarPaciente 
    @p_nombreCompleto = 'Castro, Hector',
    @p_dni = '30333444',
    @p_fechaNacimiento = '20050101',
    @p_sexo = 'Masculino',
    @p_contacto = '3624001122';

EXEC SP_InsertarPaciente 
    @p_nombreCompleto = 'Silva, Romina',
    @p_dni = '40444555',
    @p_fechaNacimiento = '19750808',
    @p_sexo = 'Femenino',
    @p_contacto = NULL; -- Contacto opcional


/* Modificación y Eliminación con Procedimientos. Realizar UPDATE invocando el procedimiento
Asumiendo que el paciente con dni = '10111222' tiene idPaciente = 11.
Actualizar el contacto del Paciente ID 1 (Ramirez, Elias)*/
--consulta para verificar el id de paciente 10111222
select* from Paciente
where dni = 10111222;
--
EXEC SP_ModificarContactoPaciente 
    @p_idPaciente = 11, 
    @p_nuevoContacto = '3624123456_NUEVO';


/* Realizar DELETE invocando el procedimiento
Asumiendo que el paciente con dni = '20222333' tiene idPaciente = 12.*/

-- Eliminar el registro del Paciente ID 12 (Pereyra, Daniela)
EXEC SP_EliminarPaciente 
    @p_idPaciente = 12;


/* Desarrollo de Funciones Almacenadas
Las funciones almacenadas deben devolver un valor único (escalar) o una tabla (TVF) y no deben modificar datos.
Para Calcular la Edad (FN_CalcularEdadPaciente)
Tipo: Función Escalar. Recibe la fecha de nacimiento del paciente (fechaNacimiento) y calcula su edad actual en años.*/


CREATE FUNCTION FN_CalcularEdadPaciente (
    @p_fechaNacimiento DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Edad INT;
    
    
    SET @Edad = DATEDIFF(year, @p_fechaNacimiento, GETDATE());
    
    -- Lógica de ajuste si el cumpleaños no ha ocurrido
    IF (MONTH(@p_fechaNacimiento) > MONTH(GETDATE()) OR 
        (MONTH(@p_fechaNacimiento) = MONTH(GETDATE()) AND DAY(@p_fechaNacimiento) > DAY(GETDATE())))
    BEGIN
        SET @Edad = @Edad - 1;
    END;
    
    RETURN @Edad;
END;

--uso paraa mostrar la edad 
SELECT
    P.nombreCompleto,
    dbo.FN_CalcularEdadPaciente(P.fechaNacimiento) AS Edad_Calculada
FROM
    Paciente p ;


/*Obtener el Nombre de la Especialidad por ID (FN_GetEspecialidadNombre)
Tipo: Función Escalar. Dada una idEspecialidad de la tabla Especialidad, devolver el nombre (nombre) asociado.*/

CREATE FUNCTION FN_GetEspecialidadNombre (
    @p_idEspecialidad INT
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @NombreEspecialidad VARCHAR(100);

    SELECT @NombreEspecialidad = nombre
    FROM Especialidad
    WHERE idEspecialidad = @p_idEspecialidad;

    -- Si no se encuentra, devuelve NULL (o una cadena vacía, dependiendo del diseño)
    RETURN @NombreEspecialidad;
END; 

--uso de funcion GetEspecialidadNombre
SELECT
    PR.idProfesional,
    PR.nombreCompleto AS Nombre_del_Profesional,
    PR.matricula,
    -- Invocación de la función escalar:
    dbo.FN_GetEspecialidadNombre(PR.idEspecialidad) AS Nombre_Especialidad
FROM
    Profesional PR
WHERE
    PR.idProfesional = 5; --asegurarse que sea id valido

/* Funcion para listar Atenciones en una Ubicación en un Día Específico (FN_ListarAtencionesUbicacionDia)
Tipo: Función con Valores de Tabla (TVF). Devuelve una tabla con todas las atenciones registradas en una ubicación móvil específica en una fecha dada, filtrando la tabla Atencion.*/


CREATE FUNCTION FN_ListarAtencionesUbicacionDia (
    @p_idUbicacionMovil INT,
    @p_fecha DATE
)
RETURNS TABLE
AS
RETURN
(
    -- Consulta SELECT que se utiliza como el conjunto de resultados de la tabla
    SELECT
        A.idAtencion,
        A.fechaHora,
        P.nombreCompleto AS Paciente,
        PR.nombreCompleto AS Profesional
    FROM
        Atencion A
    JOIN 
        Paciente P ON A.idPaciente = P.idPaciente
    JOIN 
        Profesional PR ON A.idProfesional = PR.idProfesional
    WHERE
        A.idUbicacionMovil = @p_idUbicacionMovil
        AND CAST(A.fechaHora AS DATE) = @p_fecha -- Convertir DATETIME a DATE para la comparación diaria
);

-- Uso de la Función ListarAtencionesUbicacionDia:
select * from Atencion;--ver datos antes de consultar

SELECT * FROM dbo.FN_ListarAtencionesUbicacionDia(1, '20250110');
