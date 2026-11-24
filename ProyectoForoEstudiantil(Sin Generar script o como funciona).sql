CREATE DATABASE ForoEstudiantilDB;
GO

USE ForoEstudiantilDB;
GO

CREATE TABLE Usuario (
    IDusuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(150) NOT NULL UNIQUE,
    contraseña NVARCHAR(255) NOT NULL,
    telefono VARCHAR(10) NULL,
    tipoUsuario NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE Categoria (
    IDcategoria INT IDENTITY(1,1) PRIMARY KEY,
    nombreCategoria NVARCHAR(100) NOT NULL,
    materia NVARCHAR(100) NULL,
    grado NVARCHAR(50) NULL
);
GO

CREATE TABLE Publicacion (
    IDpublicacion INT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(200) NOT NULL,
    contenido NVARCHAR(MAX) NOT NULL,
    fechaPublicacion DATETIME NOT NULL DEFAULT GETDATE(),
    IDusuario INT NOT NULL,
    IDcategoria INT NOT NULL,
    CONSTRAINT FK_Publicacion_Usuario FOREIGN KEY (IDusuario) REFERENCES Usuario(IDusuario),
    CONSTRAINT FK_Publicacion_Categoria FOREIGN KEY (IDcategoria) REFERENCES Categoria(IDcategoria)
);
GO

CREATE TABLE Comentario (
    IDcomentario INT IDENTITY(1,1) PRIMARY KEY,
    contenido NVARCHAR(MAX) NOT NULL,
    fechaComentario DATETIME NOT NULL DEFAULT GETDATE(),
    IDusuario INT NOT NULL,
    IDpublicacion INT NOT NULL,
    CONSTRAINT FK_Comentario_Usuario FOREIGN KEY (IDusuario) REFERENCES Usuario(IDusuario),
    CONSTRAINT FK_Comentario_Publicacion FOREIGN KEY (IDpublicacion) REFERENCES Publicacion(IDpublicacion)
);
GO

CREATE TABLE Archivo (
    IDarchivo INT IDENTITY(1,1) PRIMARY KEY,
    nombreArchivo NVARCHAR(255) NOT NULL,
    tipoArchivo NVARCHAR(50) NOT NULL,
    rutaArchivo NVARCHAR(500) NOT NULL,
    IDpublicacion INT NOT NULL,
    CONSTRAINT FK_Archivo_Publicacion FOREIGN KEY (IDpublicacion) REFERENCES Publicacion(IDpublicacion)
);
GO

CREATE TABLE Reaccion (
    IDreaccion INT IDENTITY(1,1) PRIMARY KEY,
    tipoReaccion NVARCHAR(50) NOT NULL,
    fechaReaccion DATETIME NOT NULL DEFAULT GETDATE(),
    IDusuario INT NOT NULL,
    IDpublicacion INT NOT NULL,
    CONSTRAINT FK_Reaccion_Usuario FOREIGN KEY (IDusuario) REFERENCES Usuario(IDusuario),
    CONSTRAINT FK_Reaccion_Publicacion FOREIGN KEY (IDpublicacion) REFERENCES Publicacion(IDpublicacion)
);
GO


INSERT INTO Usuario (nombre, correo, contraseña, telefono, tipoUsuario)
VALUES (N'Maggy Ramirez', N'maggy.ramirez@correo.com', N'ClaveSegura123', '6674631558', N'Docente');

INSERT INTO Usuario (nombre, correo, contraseña, telefono, tipoUsuario)
VALUES (N'Yatziry Reyes', N'yatziry.reyes@correo.com', N'ClaveSegura123', '6673052424', N'Docente');

INSERT INTO Usuario (nombre, correo, contraseña, telefono, tipoUsuario)
VALUES (N'Jesus Octavio', N'jesus.octavio@correo.com', N'ClaveSegura123', '6674840289', N'Docente');

INSERT INTO Categoria (nombreCategoria, materia, grado)
VALUES (N'Guías de Estudio', N'Matemáticas', N'3ro Secundaria');

INSERT INTO Publicacion (titulo, contenido, IDusuario, IDcategoria)
VALUES (N'Ejercicios de álgebra', N'Les comparto la guía para el examen parcial.', 1, 1);


SELECT * FROM Usuario;
SELECT * FROM Categoria;
SELECT * FROM Publicacion;

-- Nombre de los Integrantes del Proyecto: Jesus Armando, Maggy Ramirez, Yatziry Reyes, Jesus Octavio