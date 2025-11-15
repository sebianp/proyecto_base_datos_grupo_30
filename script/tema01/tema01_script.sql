/*Utilizaremos la tabla Paciente para las operaciones CRUD, ya que incluye campos esenciales como nombreCompleto, dni, fechaNacimiento y contacto.

 Procedimiento para Insertar Registros (INSERT)
Paso: Definir el procedimiento SP_InsertarPaciente que acepta los parámetros necesarios para crear un nuevo registro en la tabla Paciente.
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
   