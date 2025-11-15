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