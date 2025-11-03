use PROYECTO_MOVICAPS

--Tipo de Unidades Moviles
INSERT INTO TipoUnidadMovil (descripcion) VALUES
('Odontología'),
('Pediatría'),
('Vacunación'),
('Atención General');

--Ciudades (Aunque solo se trabaje en la ciudad de Corrientes para el proyecto, el sistema puede expendirse
INSERT INTO Ciudad (nombre_ciudad) VALUES
('Corrientes'),
('Resistencia'),
('Posadas'),
('Formosa'),
('Paraná'),
('Santa Fe'),
('Goya'),
('Reconquista'),
('Mercedes'),
('Paso de los Libres');

--Barrios de Corrientes Capital que se utilizaran para el caso de estudio
INSERT INTO Barrio (nombre_barrio, ciudad_id) VALUES
('Centro', 1),
('San Benito', 1),
('Laguna Seca', 1),
('Juan de Vera', 1),
('Dr. Montaña', 1),
('San Roque Este', 1),
('Santa Catalina', 1),
('Pío X', 1),
('San Gerónimo', 1),
('Molina Punta', 1);



select * from UbicacionMovil


--Unidad Movil de Atencion Primaria

INSERT INTO UnidadMovil (patente, idTipo, capacidadDiaria) VALUES
('ABC123', 1, 20),
('DEF456', 2, 15),
('GHI789', 3, 25),
('JKL012', 4, 30),
('MNO345', 4, 18),
('PQR678', 4, 22),
('STU901', 4, 10),
('VWX234', 2, 12),
('YZA567', 2, 16),
('BCD890', 1, 14);

--Ubicacion del Movil de Atencion Medica

INSERT INTO UbicacionMovil (idUnidad, idBarrio, direccion, fecha_ingreso, fecha_egreso ) VALUES
(1, 1, 'Av. 3 de Abril 1234', '2025-09-01', null),
(2, 2, 'Calle 25 de Mayo 456', '2025-09-02', null),
(3, 3, 'Ruta 5 km 12', '2025-09-03', null),
(4, 4, 'Av. Armenia 789', '2025-09-04', null),
(5, 5, 'Calle Mitre 101', '2025-09-05', null),
(6, 6, 'Av. Maipú 2020', '2025-09-06', null),
(7, 7, 'Calle Belgrano 303', '2025-09-07', null),
(8, 8, 'Av. Independencia 404', '2025-09-08', null),
(9, 9, 'Calle San Lorenzo 505', '2025-09-09', null),
(10, 10, 'Av. Madariaga 606', '2025-09-10', null);



--Especialidades
INSERT INTO Especialidad (nombre) VALUES
('Pediatría'),
('Odontología'),
('Enfermeria'), --Utilizada para vacunacion
('Clínica General'),
('Ginecología'),
('Cardiología'),
('Dermatología'),
('Traumatología'),
('Neurología'),
('Psicología');


--Medicos especialistas
INSERT INTO Profesional (nombreCompleto, idEspecialidad , matricula, contacto) VALUES
('Dr. Juan Pérez', 1, 'MAT001', 'juan.perez@salud.org'),
('Dra. Ana Gómez', 2, 'MAT002', 'ana.gomez@salud.org'),
('Lic. Carla Ruiz', 3, 'MAT003', 'carla.ruiz@salud.org'),
('Lic. Luis Torres', 3, 'MAT004', 'luis.torres@salud.org'),
('Lic. Marta López', 3, 'MAT005', 'marta.lopez@salud.org'),
('Dr. Pablo Díaz', 4, 'MAT006', 'pablo.diaz@salud.org'),
('Dra. Silvia Ramírez', 4, 'MAT007', 'silvia.ramirez@salud.org'),
('Dr. Diego Fernández', 4, 'MAT008', 'diego.fernandez@salud.org'),
('Dra. Laura Medina', 1, 'MAT009', 'laura.medina@salud.org'),
('Dr. Andrés Molina', 4, 'MAT010', 'andres.molina@salud.org');

--Pacientes que ya han sido registrados en atencion medica
INSERT INTO Paciente (nombreCompleto, dni, fechaNacimiento, sexo, contacto) VALUES
('Carlos Sánchez', '30123456', '1985-06-15', 'Masculino', 'carlos.sanchez@gmail.com'),
('Lucía Fernández', '30234567', '1990-03-22', 'Femenino', 'lucia.fernandez@gmail.com'),
('Martín López', '30345678', '2000-11-05', 'Masculino', 'martin.lopez@gmail.com'),
('Sofía Gómez', '30456789', '1995-08-30', 'Femenino', 'sofia.gomez@gmail.com'),
('Julián Torres', '30567890', '1988-01-12', 'Masculino', 'julian.torres@gmail.com'),
('Valentina Ruiz', '30678901', '1992-07-19', 'Femenino', 'valentina.ruiz@gmail.com'),
('Tomás Díaz', '30789012', '1980-04-25', 'Masculino', 'tomas.diaz@gmail.com'),
('Camila Ramírez', '30890123', '1997-09-10', 'Femenino', 'camila.ramirez@gmail.com'),
('Agustín Fernández', '30901234', '1993-12-03', 'Masculino', 'agustin.fernandez@gmail.com'),
('Micaela Medina', '31012345', '1986-05-17', 'Femenino', 'micaela.medina@gmail.com');

--Sintomas que pueden presentar los pacientes
INSERT INTO Sintoma (nombre) VALUES
('Fiebre'),
('Dolor de cabeza'),
('Tos'),
('Congestión nasal'),
('Dolor abdominal'),
('Náuseas'),
('Fatiga'),
('Dolor muscular'),
('Erupción cutánea'),
('Dificultad para respirar');

--Tratamientos
INSERT INTO Tratamiento (descripcion) VALUES
('Reposo y control de temperatura'),
('Analgésicos y antipiréticos'),
('Antibióticos de amplio espectro'),
('Antihistamínicos'),
('Hidratación oral'),
('Aplicación de crema tópica'),
('Inhaladores broncodilatadores'),
('Suero intravenoso'),
('Ejercicios de fisioterapia'),
('Derivación a especialista');

--Diagnostico
INSERT INTO Diagnostico (descripcion) VALUES
('Gripe común'),
('Infección respiratoria'),
('Dermatitis alérgica'),
('Gastroenteritis'),
('Hipertensión leve'),
('Bronquitis'),
('Migraña'),
('Contractura muscular'),
('Ansiedad leve'),
('Resfriado');

--Atenciones Médicas
INSERT INTO Atencion (fechaHora, idUbicacionMovil, idPaciente, idProfesional, idDiagnostico) VALUES
('2025-10-01 09:00', 1, 1, 1, 1),
('2025-10-02 10:30', 2, 2, 2, 2),
('2025-10-03 11:15', 3, 3, 3, 3),
('2025-10-04 08:45', 4, 4, 4, 4),
('2025-10-05 14:00', 5, 5, 5, 5),
('2025-10-06 15:30', 6, 6, 6, 6),
('2025-10-07 09:45', 7, 7, 7, 7),
('2025-10-08 13:20', 8, 8, 8, 8),
('2025-10-09 10:10', 9, 9, 9, 9),
('2025-10-10 16:00', 10, 10, 10, 10);

select * from Atencion

-- 1. Borrar todos los datos
DELETE FROM Atencion;

-- 2. Reiniciar el contador IDENTITY a 0 (el próximo será 1)
DBCC CHECKIDENT ('Atencion', RESEED, 0);


--Atencion-Simtomas 
INSERT INTO Atencion_Sintoma (idAtencion, idSintoma) VALUES
(1, 1), (1, 2),
(2, 3), (2, 10),
(3, 9),
(4, 5), (4, 6),
(5, 1), (5, 7),
(6, 3), (6, 10),
(7, 2), (7, 8),
(8, 8),
(9, 2), (9, 4),
(10, 4), (10, 1);

select * from Atencion_Sintoma
order by idAtencion asc

--Atencion-Tratamiento
INSERT INTO Atencion_Tratamiento (idAtencion, idTratamiento) VALUES
(1, 1), (1, 2),
(2, 3), (2, 7),
(3, 6),
(4, 5),
(5, 2), (5, 9),
(6, 3), (6, 7),
(7, 2),
(8, 9),
(9, 4),
(10, 1), (10, 5);



