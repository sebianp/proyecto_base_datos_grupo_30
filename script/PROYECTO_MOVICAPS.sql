CREATE DATABASE PROYECTO_MOVICAPS

USE PROYECTO_MOVICAPS

-- =============================================
-- CREACIÓN DE TABLAS DEL PROYECTO // GRUPO #30 // 2025
-- =============================================

--Tabla del tipo de unidad (Puede ser general o alguna especialidad como: 
-- Odontologia, Pediatria, Vacunacion o Atención General
CREATE TABLE TipoUnidadMovil (
    idTipo INT IDENTITY(1,1) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
	CONSTRAINT PK_TipoUnidadMovil PRIMARY KEY (idTipo),
	CONSTRAINT UQ_TipoUnidad UNIQUE (descripcion)
);

--tabla ciudad
CREATE TABLE Ciudad(
	ciudad_id INT IDENTITY(1,1) NOT NULL,
    nombre_ciudad VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Ciudad PRIMARY KEY (ciudad_id),
    CONSTRAINT UQ_Ciudad UNIQUE (nombre_ciudad)
)

--tabla barrio
CREATE TABLE Barrio (
    barrio_id INT IDENTITY(1,1) NOT NULL,
    nombre_barrio VARCHAR(100) NOT NULL,
    ciudad_id INT NOT NULL,
    CONSTRAINT PK_Barrio PRIMARY KEY (barrio_id),
	CONSTRAINT FK_Barrio_Ciudad FOREIGN KEY (ciudad_id) REFERENCES Ciudad(ciudad_id),
    CONSTRAINT UQ_Barrio UNIQUE (nombre_barrio)
);

--Tabla ubicacion (Determina los distintos lugares estrategicos en las que se pueden reubicar las unidades)
CREATE TABLE UbicacionMovil(
	id_ubicacion INT IDENTITY(1,1) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	barrio_id INT NOT NULL,
	CONSTRAINT PK_UbicacionMovil PRIMARY KEY (id_ubicacion),
	CONSTRAINT FK_Ubicacion_Barrio FOREIGN KEY (barrio_id) REFERENCES Barrio(barrio_id),
)

--tabla unidad movil
CREATE TABLE UnidadMovil (
    idUnidad INT IDENTITY(1,1) NOT NULL,
    patente VARCHAR(20) NULL,
    idTipo INT NOT NULL,
    capacidadDiaria INT,
	id_ubicacion INT,
    CONSTRAINT PK_UnidadMovil PRIMARY KEY (idUnidad),
	CONSTRAINT FK_Unidad_Tipo FOREIGN KEY (idTipo) REFERENCES TipoUnidadMovil(idTipo),
	CONSTRAINT FK_Unidad_Ubicacion FOREIGN KEY (id_ubicacion) REFERENCES UbicacionMovil(id_ubicacion),
    CONSTRAINT UQ_UnidadMovil_Patente UNIQUE (patente),
    CONSTRAINT CK_UnidadMovil_Capacidad CHECK (capacidadDiaria >= 0)
);

--tabla profesional (no se tiene en cuenta el ingreso, ni los horarios, los profesionales pueden
-- ir variando, no se controla eso, se controla principalmente las atenciones de los pacientes
-- el modelo no busca un control riguroso de la asistencia, horarios y llegadas de los profesionales
-- Simplemente que profesional atendio a que paciente.
CREATE TABLE Profesional (
    idProfesional INT IDENTITY(1,1) NOT NULL,
    nombreCompleto VARCHAR(150) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) NOT NULL,
    contacto VARCHAR(100),
    CONSTRAINT PK_Profesional PRIMARY KEY (idProfesional),
    CONSTRAINT UQ_Profesional_Matricula UNIQUE (matricula),
    CONSTRAINT CK_Profesional_Nombre CHECK (LEN(nombreCompleto) > 3)
);

--tabla paciente
CREATE TABLE Paciente (
    idPaciente INT IDENTITY(1,1) NOT NULL,
    nombreCompleto VARCHAR(150) NOT NULL,
    dni VARCHAR(15) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    contacto VARCHAR(100),
    CONSTRAINT PK_Paciente PRIMARY KEY (idPaciente),
    CONSTRAINT UQ_Paciente_DNI UNIQUE (dni),
    CONSTRAINT CK_Paciente_Sexo CHECK (sexo IN ('Masculino','Femenino','Otro')),
    CONSTRAINT CK_Paciente_FechaNacimiento CHECK (fechaNacimiento <= GETDATE())
);

--tabla diagnostico
CREATE TABLE Diagnostico (
    idDiagnostico INT IDENTITY(1,1) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    CONSTRAINT PK_Diagnostico PRIMARY KEY (idDiagnostico),
    CONSTRAINT UQ_Diagnostico_Descripcion UNIQUE (descripcion)
);

--tabla sintoma
CREATE TABLE Sintoma (
    idSintoma INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Sintoma PRIMARY KEY (idSintoma),
    CONSTRAINT UQ_Sintoma_Nombre UNIQUE (nombre)
);

--tabla tratamiento
CREATE TABLE Tratamiento (
    idTratamiento INT IDENTITY(1,1) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    CONSTRAINT PK_Tratamiento PRIMARY KEY (idTratamiento),
    CONSTRAINT UQ_Tratamiento_Descripcion UNIQUE (descripcion)
);

--tabla atencion
CREATE TABLE Atencion (
    idAtencion INT IDENTITY(1,1) NOT NULL,
    fechaHora DATETIME NOT NULL DEFAULT GETDATE(),
    idUnidad INT NOT NULL,
    idPaciente INT NOT NULL,
    idProfesional INT NOT NULL,
    idDiagnostico INT NOT NULL,
    CONSTRAINT PK_Atencion PRIMARY KEY (idAtencion),
    CONSTRAINT FK_Atencion_Unidad FOREIGN KEY (idUnidad) REFERENCES UnidadMovil(idUnidad),
    CONSTRAINT FK_Atencion_Paciente FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    CONSTRAINT FK_Atencion_Profesional FOREIGN KEY (idProfesional) REFERENCES Profesional(idProfesional),
    CONSTRAINT FK_Atencion_Diagnostico FOREIGN KEY (idDiagnostico) REFERENCES Diagnostico(idDiagnostico),
    CONSTRAINT CK_Atencion_Fecha CHECK (fechaHora <= GETDATE())
);

--relacionn atencion - sintoma
CREATE TABLE Atencion_Sintoma (
    idAtencion INT NOT NULL,
    idSintoma INT NOT NULL,
    CONSTRAINT PK_Atencion_Sintoma PRIMARY KEY (idAtencion, idSintoma),
    CONSTRAINT FK_AtencionSintoma_Atencion FOREIGN KEY (idAtencion) REFERENCES Atencion(idAtencion),
    CONSTRAINT FK_AtencionSintoma_Sintoma FOREIGN KEY (idSintoma) REFERENCES Sintoma(idSintoma)
);

--atencion - tratamiento
CREATE TABLE Atencion_Tratamiento (
    idAtencion INT NOT NULL,
    idTratamiento INT NOT NULL,
    CONSTRAINT PK_Atencion_Tratamiento PRIMARY KEY (idAtencion, idTratamiento),
    CONSTRAINT FK_AtencionTratamiento_Atencion FOREIGN KEY (idAtencion) REFERENCES Atencion(idAtencion),
    CONSTRAINT FK_AtencionTratamiento_Tratamiento FOREIGN KEY (idTratamiento) REFERENCES Tratamiento(idTratamiento)
);
