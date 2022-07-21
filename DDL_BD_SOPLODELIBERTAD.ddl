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