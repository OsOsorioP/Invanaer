CREATE SCHEMA IF NOT EXISTS basededatosaqui;

-- Establecer esquema actual
SET search_path TO basededatosaqui;

-- Crear tabla Usuario
DROP TABLE IF EXISTS usuario CASCADE;

CREATE TABLE usuario(
    id SERIAL PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(255) DEFAULT NULL,
    dirección VARCHAR(255) DEFAULT NULL,
    teléfono VARCHAR(30) DEFAULT NULL,
    título VARCHAR(50) DEFAULT NULL,
    biografía VARCHAR(255) DEFAULT NULL,
    activado BOOLEAN DEFAULT TRUE,
    no_bloqueado BOOLEAN DEFAULT FALSE,
    usando_mfa BOOLEAN DEFAULT FALSE,
    fecha_creación TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    imagen_url VARCHAR(255) DEFAULT ''
);

-- Crear tabla Rol
DROP TABLE IF EXISTS rol CASCADE;

CREATE TABLE rol (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    permisos VARCHAR(255) NOT NULL -- ejemplo: "user:read, user:delete, customer:read"
);

-- Crear tabla UsuarioRol
DROP TABLE IF EXISTS usuario_rol CASCADE;

CREATE TABLE usuario_rol (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    rol_id INT NOT NULL,
    CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT fk_rol_id FOREIGN KEY (rol_id) REFERENCES rol(id)
);

-- Crear tabla evento
DROP TABLE IF EXISTS evento CASCADE;

CREATE TABLE evento (
    id SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL UNIQUE,
    descripción VARCHAR(255) NOT NULL,
    CONSTRAINT chk_tipo CHECK (tipo IN ('LOGIN_ATTEMPT', 'LOGIN_ATTEMPT_FAILURE', 'LOGIN_ATTEMPT_SUCCESS', 'PROFILE_UPDATE', 'PROFILE_PICTURE_UPDATE', 'ROLE_UPDATE', 'ACCOUNT_SETTINGS_UPDATE', 'PASSWORD_UPDATE', 'MFA_UPDATE'))
);

-- Crear tabla usuario_evento
DROP TABLE IF EXISTS usuario_evento CASCADE;

CREATE TABLE usuario_evento (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    evento_id INT NOT NULL,
    dispositivo VARCHAR(100) DEFAULT NULL,
    dirección_ip VARCHAR(100) DEFAULT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT fk_evento_id FOREIGN KEY (evento_id) REFERENCES evento(id)
);

-- Crear tabla usuario_evento
DROP TABLE IF EXISTS verificación_cuenta CASCADE;

CREATE TABLE verificación_cuenta (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    evento_id INT NOT NULL,
    dispositivo VARCHAR(100) DEFAULT NULL,
    dirección_ip VARCHAR(100) DEFAULT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    CONSTRAINT fk_evento_id FOREIGN KEY (evento_id) REFERENCES evento(id)
);