 -- DROP TABLAS
DROP TABLE detalleventa CASCADE CONSTRAINTS;
DROP TABLE documentacion CASCADE CONSTRAINTS;
DROP TABLE producto CASCADE CONSTRAINTS;
DROP TABLE rol CASCADE CONSTRAINTS;
DROP TABLE seguimientoenvios CASCADE CONSTRAINTS;
DROP TABLE usuario CASCADE CONSTRAINTS;
DROP TABLE venta CASCADE CONSTRAINTS;

 -- DROP SEQUENCE 
DROP SEQUENCE seq_detalleventa;
DROP SEQUENCE seq_documentacion;
DROP SEQUENCE seq_producto;
DROP SEQUENCE seq_rol;
DROP SEQUENCE seq_seguimientoenvios;
DROP SEQUENCE seq_usuario;
DROP SEQUENCE seq_venta;

 -- DROP PACKAGE
DROP PACKAGE detalleventa_tapi;
DROP PACKAGE documentacion_tapi;
DROP PACKAGE producto_tapi;
DROP PACKAGE rol_tapi;
DROP PACKAGE seguimientoenvios_tapi;
DROP PACKAGE usuario_tapi;
DROP PACKAGE venta_tapi;

 -- DROP TRIGGER
DROP TRIGGER trig_detalleventa;
DROP TRIGGER trig_documentacion;
DROP TRIGGER trig_producto;
DROP TRIGGER trig_rol;
DROP TRIGGER trig_seguimientoenvios;
DROP TRIGGER trig_usuario;
DROP TRIGGER trig_venta;
--------------------
CREATE TABLE detalleventa (
    iddetalleventa       INTEGER NOT NULL,
    cantidad             INTEGER,
    precioventa          INTEGER,
    venta_idventa        INTEGER NOT NULL,
    producto_idproducto  INTEGER NOT NULL
);

ALTER TABLE detalleventa ADD CONSTRAINT detalleventa_pk PRIMARY KEY ( iddetalleventa );

CREATE TABLE documentacion (
    iddocumentacion      INTEGER NOT NULL,
    tipodocumento        VARCHAR2(60),
    nomdocumento         VARCHAR2(60),
    documento            VARCHAR2(200),
    producto_idproducto  INTEGER NOT NULL
);

ALTER TABLE documentacion ADD CONSTRAINT documentacion_pk PRIMARY KEY ( iddocumentacion );

CREATE TABLE producto (
    idproducto     INTEGER NOT NULL,
    nomproducto    VARCHAR2(60),
    tipoproducto   VARCHAR2(60),
    descripcion    VARCHAR2(60),
    valorproducto  INTEGER,
    marca          VARCHAR2(60),
    modelo         VARCHAR2(60),
    stock          INTEGER,
    imagen         VARCHAR2(200)
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( idproducto );

CREATE TABLE rol (
    idrol   INTEGER NOT NULL,
    nombre  VARCHAR2(20)
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( idrol );

CREATE TABLE seguimientoenvios (
    idseguimiento  INTEGER NOT NULL,
    estadoentrega  VARCHAR2(60),
    fechadespacho  DATE,
    fechaentrega   DATE,
    venta_idventa  INTEGER NOT NULL
);

ALTER TABLE seguimientoenvios ADD CONSTRAINT seguimientoenvios_pk PRIMARY KEY ( idseguimiento,
                                                                                venta_idventa );

CREATE TABLE usuario (
    idusuario  INTEGER NOT NULL,
    username   VARCHAR2(30),
    password   VARCHAR2(20),
    nombre     VARCHAR2(30),
    apellidos  VARCHAR2(60),
    rut        VARCHAR2(10),
    email      VARCHAR2(30),
    fechanac   DATE,
    telefono   INTEGER,
    direccion  VARCHAR2(60),
    rol_idrol  INTEGER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( idusuario );

CREATE TABLE venta (
    idventa            INTEGER NOT NULL,
    fechahora          DATE,
    totalventa         INTEGER,
    estadoventa        VARCHAR2(60),
    usuario_idusuario  INTEGER NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( idventa );

ALTER TABLE detalleventa
    ADD CONSTRAINT detalleventa_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

ALTER TABLE detalleventa
    ADD CONSTRAINT detalleventa_venta_fk FOREIGN KEY ( venta_idventa )
        REFERENCES venta ( idventa );

ALTER TABLE documentacion
    ADD CONSTRAINT documentacion_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

ALTER TABLE seguimientoenvios
    ADD CONSTRAINT seguimientoenvios_venta_fk FOREIGN KEY ( venta_idventa )
        REFERENCES venta ( idventa );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_rol_fk FOREIGN KEY ( rol_idrol )
        REFERENCES rol ( idrol );

ALTER TABLE venta
    ADD CONSTRAINT venta_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );

-- PRODUCTO
INSERT INTO producto (idproducto, nomproducto, tipoproducto, descripcion, valorproducto, marca, modelo, stock, imagen) VALUES (1, 'PULSERA ECO CUERO', 'ACCESORIO', 'PULSERA EXO CUERO ESTILO VERANIEGO', 2500, 'STYLE FREE', 'VERANIEGO', 55, 'RUTA');
INSERT INTO producto (idproducto, nomproducto, tipoproducto, descripcion, valorproducto, marca, modelo, stock, imagen) VALUES (2, 'PELUCHE ITO ITO', 'ACCESORIO', 'PELUCHE DISEÑO MONITO ITO ITO', 5000, 'MONIN', 'INFANTES', 60, 'RUTA');
INSERT INTO producto (idproducto, nomproducto, tipoproducto, descripcion, valorproducto, marca, modelo, stock, imagen) VALUES (3, 'SOPORTE LED', 'ACCESORIO', 'SOPORTE PARA LED DE ESCRITORIO', 3500, 'GROVEE', 'ILUMINATION', 90, 'RUTA');

-- DETALLEVENTA
INSERT INTO detalleventa (iddetalleventa, cantidad, precioventa, venta_idventa, producto_idproducto) VALUES (1, 25, 2500, 1, 1);
INSERT INTO detalleventa (iddetalleventa, cantidad, precioventa, venta_idventa, producto_idproducto) VALUES (2, 5, 5000, 1, 2);
INSERT INTO detalleventa (iddetalleventa, cantidad, precioventa, venta_idventa, producto_idproducto) VALUES (3, 6, 5500, 1, 3);

-- DOCUMENTACION
INSERT INTO documentacion (iddocumentacion,tipodocumento, nomdocumento, documento, producto_idproducto) VALUES (1, 'PDF', 'USO Y CUIDADO DE PULSERA', 'RUTA', 1);
INSERT INTO documentacion (iddocumentacion,tipodocumento, nomdocumento, documento, producto_idproducto) VALUES (2, 'PDF', 'CUIDADO Y USO DE PELUCHE', 'RUTA', 2);
INSERT INTO documentacion (iddocumentacion,tipodocumento, nomdocumento, documento, producto_idproducto) VALUES (3, 'PDF', 'SUGERENCIAS LEDS', 'RUTA', 3);

-- ROL
INSERT INTO rol (idrol, nombre) VALUES (1, 'SUPERVISOR');
INSERT INTO rol (idrol, nombre) VALUES (2, 'VENDEDOR');
INSERT INTO rol (idrol, nombre) VALUES (3, 'USUARIO');

-- USUARIOS
INSERT INTO usuario (idusuario, username, password, nombre, apellidos, rut, email, fechanac, telefono, direccion, rol_idrol) VALUES (1, 'mau.nunezv', '123123', 'Mauricio', ' Jimenez Vega', '18525378-0', 'mauro_1982@live.com', '13/08/1995', 935488947, 'palena 2320, peña blanca', 1);
INSERT INTO usuario (idusuario, username, password, nombre, apellidos, rut, email, fechanac, telefono, direccion, rol_idrol) VALUES (2, 'juanReal', '987987', 'Juan', ' Real Cornelio', '20010740-3', 'Juan.real.cornelio@live.com', '25/01/1980', 88164075, 'Huanhualli, Villa Alemana', 2);
INSERT INTO usuario (idusuario, username, password, nombre, apellidos, rut, email, fechanac, telefono, direccion, rol_idrol) VALUES (3, 'MargaritaCarmen', '123456', 'Margarita', ' Carmen Urrieta', '142985876-0', 'MargaritaCarmen@gmail.com', '11/04/1997', 936210874, 'Sur 140, Limache', 3);

-- VENTA
INSERT INTO venta (idventa, fechahora, totalventa,estadoventa,usuario_idusuario) VALUES (1, '21/05/2022', 350000, 'PAGADO', 3);
INSERT INTO venta (idventa, fechahora, totalventa,estadoventa,usuario_idusuario) VALUES (2, '14/06/2022', 50000, 'PENDIENTE', 2);
INSERT INTO venta (idventa, fechahora, totalventa,estadoventa,usuario_idusuario) VALUES (3, '25/07/2022', 500000, 'PENDIENTE', 1);

-- SEGUIMINTOENVIOS
INSERT INTO seguimientoenvios (idseguimiento,estadoentrega, fechadespacho, fechaentrega, venta_idventa) VALUES (1, 'PENDIENTE', '22/05/2022', '26/05/2022', 1);  
INSERT INTO seguimientoenvios (idseguimiento,estadoentrega, fechadespacho, fechaentrega, venta_idventa) VALUES (2, 'EN ENVIO', '15/05/2022', '17/05/2022', 2);  
INSERT INTO seguimientoenvios (idseguimiento,estadoentrega, fechadespacho, fechaentrega, venta_idventa) VALUES (3, 'ENTREGADO', '25/05/2022', '26/05/2022', 3);  

