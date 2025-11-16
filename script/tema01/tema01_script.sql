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
('Molina, Esteban', '60111111', '1990-01-10', 'Masculino', '3811111111'),
('Rivas, Noelia', '60222222', '1992-02-15', 'Femenino', '3822222222'),
('Cano, Federico', '60333333', '1988-03-30', 'Masculino', NULL),
('Bustos, Melina', '60444444', '1995-04-01', 'Femenino', '3833333333'),
('Sanchez, Bruno', '60555555', '1993-05-20', 'Masculino', '3844444444'),
('Luna, Carla', '60666666', '1991-06-07', 'Femenino', NULL),
('Ponce, Diego', '60777777', '1989-07-11', 'Masculino', '3855555555'),
('Ayala, Mariana', '60888888', '1994-08-05', 'Femenino', '3866666666'),
('Ruiz, Tomas', '60999999', '1996-09-08', 'Masculino', NULL),
('Farias, Florencia', '61010101', '1997-10-01', 'Femenino', '3877777777'),
('Leiva, Matias', '61111111', '1990-11-10', 'Masculino', '3888888888'),
('Soria, Agustina', '61222222', '1992-12-15', 'Femenino', '3899999999'),
('Villar, Ivan', '61333333', '1988-01-30', 'Masculino', NULL),
('Bravo, Cecilia', '61444444', '1995-02-01', 'Femenino', '3901010101'),
('Correa, Alan', '61555555', '1993-03-20', 'Masculino', '3911111111'),
('Ojeda, Micaela', '61666666', '1991-04-07', 'Femenino', NULL),
('Ledesma, Ariel', '61777777', '1989-05-11', 'Masculino', '3922222222'),
('Medina, Julieta', '61888888', '1994-06-05', 'Femenino', '3933333333'),
('Silveyra, Franco', '61999999', '1996-07-08', 'Masculino', NULL),
('Barrios, Daniela', '62010101', '1997-08-01', 'Femenino', '3944444444');


/* Lote de Inserción Invocando a los Procedimientos Creados
Este script demuestra la modularidad y reutilización del código encapsulado en el procedimiento almacenado.*/

-- SCRIPT LOTE B: Inserción invocando el procedimiento almacenado
EXEC SP_InsertarPaciente 'Molina, Esteban', '70111111', '1990-01-10', 'Masculino', '4011111111';
EXEC SP_InsertarPaciente 'Rivas, Noelia', '70222222', '1992-02-15', 'Femenino', '4022222222';
EXEC SP_InsertarPaciente 'Cano, Federico', '70333333', '1988-03-30', 'Masculino', NULL;
EXEC SP_InsertarPaciente 'Bustos, Melina', '70444444', '1995-04-01', 'Femenino', '4033333333';
EXEC SP_InsertarPaciente 'Sanchez, Bruno', '70555555', '1993-05-20', 'Masculino', '4044444444';
EXEC SP_InsertarPaciente 'Luna, Carla', '70666666', '1991-06-07', 'Femenino', NULL;
EXEC SP_InsertarPaciente 'Ponce, Diego', '70777777', '1989-07-11', 'Masculino', '4055555555';
EXEC SP_InsertarPaciente 'Ayala, Mariana', '70888888', '1994-08-05', 'Femenino', '4066666666';
EXEC SP_InsertarPaciente 'Ruiz, Tomas', '70999999', '1996-09-08', 'Masculino', NULL;
EXEC SP_InsertarPaciente 'Farias, Florencia', '71010101', '1997-10-01', 'Femenino', '4077777777';
EXEC SP_InsertarPaciente 'Leiva, Matias', '71111111', '1990-11-10', 'Masculino', '4088888888';
EXEC SP_InsertarPaciente 'Soria, Agustina', '71222222', '1992-12-15', 'Femenino', '4099999999';
EXEC SP_InsertarPaciente 'Villar, Ivan', '71333333', '1988-01-30', 'Masculino', NULL;
EXEC SP_InsertarPaciente 'Bravo, Cecilia', '71444444', '1995-02-01', 'Femenino', '4101010101';
EXEC SP_InsertarPaciente 'Correa, Alan', '71555555', '1993-03-20', 'Masculino', '4111111111';
EXEC SP_InsertarPaciente 'Ojeda, Micaela', '71666666', '1991-04-07', 'Femenino', NULL;
EXEC SP_InsertarPaciente 'Ledesma, Ariel', '71777777', '1989-05-11', 'Masculino', '4122222222';
EXEC SP_InsertarPaciente 'Medina, Julieta', '71888888', '1994-06-05', 'Femenino', '4133333333';
EXEC SP_InsertarPaciente 'Silveyra, Franco', '71999999', '1996-07-08', 'Masculino', NULL;
EXEC SP_InsertarPaciente 'Barrios, Daniela', '72010101', '1997-08-01', 'Femenino', '4144444444';


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
