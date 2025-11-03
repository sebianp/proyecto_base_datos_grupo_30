CREATE DATABASE PROYECTO_MOVICAPS

USE PROYECTO_MOVICAPS

-- =============================================
-- CREACIoN DE TABLAS DEL PROYECTO // GRUPO #30 // 2025
-- =============================================

--Tabla del tipo de unidad (Puede ser general o alguna especialidad como: 
-- Odontologia, Pediatria, Vacunacion o Atencion General
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
    idBarrio INT IDENTITY(1,1) NOT NULL,
    nombre_barrio VARCHAR(100) NOT NULL,
    ciudad_id INT NOT NULL,
    CONSTRAINT PK_Barrio PRIMARY KEY (idBarrio),
	CONSTRAINT FK_Barrio_Ciudad FOREIGN KEY (ciudad_id) REFERENCES Ciudad(ciudad_id),
    CONSTRAINT UQ_Barrio UNIQUE (nombre_barrio)
);

--tabla unidad movil
CREATE TABLE UnidadMovil (
    idUnidad INT IDENTITY(1,1) NOT NULL,
    patente VARCHAR(20) NULL,
    idTipo INT NOT NULL,
    capacidadDiaria INT,
	id_ubicacion INT,
    CONSTRAINT PK_UnidadMovil PRIMARY KEY (idUnidad),
	CONSTRAINT FK_Unidad_Tipo FOREIGN KEY (idTipo) REFERENCES TipoUnidadMovil(idTipo),
    CONSTRAINT UQ_UnidadMovil_Patente UNIQUE (patente),
    CONSTRAINT CK_UnidadMovil_Capacidad CHECK (capacidadDiaria >= 0)
);

--Tabla ubicacion (Determina los distintos lugares estrategicos en las que se pueden reubicar las unidades)
CREATE TABLE UbicacionMovil(
	idUbicacionMovil INT IDENTITY(1,1) NOT NULL,
	idUnidad INT NOT NULL,
    idBarrio INT NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	fecha_ingreso DATE NOT NULL,
	fecha_egreso DATE NULL,
	CONSTRAINT PK_UbicacionMovil PRIMARY KEY (idUbicacionMovil),
	CONSTRAINT FK_UnidadMovil FOREIGN KEY (idUnidad) REFERENCES UnidadMovil(idUnidad),
	CONSTRAINT FK_Ubicacion_Barrio FOREIGN KEY (idBarrio) REFERENCES Barrio(idBarrio),
	CONSTRAINT CK_Fecha_Ingreso_Egreso CHECK (fecha_egreso IS NULL OR fecha_egreso > fecha_ingreso)
);



CREATE TABLE Especialidad (
    idEspecialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

--tabla profesional (no se tiene en cuenta el ingreso, ni los horarios, los profesionales pueden
-- ir variando, no se controla eso, se controla principalmente las atenciones de los pacientes
-- el modelo no busca un control riguroso de la asistencia, horarios y llegadas de los profesionales
-- Simplemente que profesional atendio a que paciente.
CREATE TABLE Profesional (
    idProfesional INT IDENTITY(1,1) NOT NULL,
    nombreCompleto VARCHAR(150) NOT NULL,
    idEspecialidad INT NOT NULL,
    matricula VARCHAR(50) NOT NULL,
    contacto VARCHAR(100),
    CONSTRAINT PK_Profesional PRIMARY KEY (idProfesional),
    CONSTRAINT UQ_Profesional_Matricula UNIQUE (matricula),
    CONSTRAINT FK_Especialidad FOREIGN KEY (idEspecialidad) REFERENCES Especialidad (idEspecialidad),
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
    idUbicacionMovil INT NOT NULL,
    idPaciente INT NOT NULL,
    idProfesional INT NOT NULL,
    idDiagnostico INT NOT NULL,
    CONSTRAINT PK_Atencion PRIMARY KEY (idAtencion),
    CONSTRAINT FK_Atencion_Ubicacion FOREIGN KEY (idUbicacionMovil) REFERENCES UbicacionMovil(idUbicacionMovil),
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