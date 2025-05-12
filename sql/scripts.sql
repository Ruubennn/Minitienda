-- Crear tabla usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contraseña VARCHAR(100) NOT NULL,
    nombre VARCHAR(100)
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    importe_total NUMERIC(10,2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pedidos_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
);

-- Crear tabla tarjetas
CREATE TABLE tarjetas (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER,
    tipo VARCHAR(50),
    numero VARCHAR(50),
    CONSTRAINT tarjetas_usuario_id_fkey FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
);
