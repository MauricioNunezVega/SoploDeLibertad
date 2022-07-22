----------------------------------------
--SEQUENCE DETALLEVENTA
----------------------------------------

CREATE SEQUENCE seq_detalleventa START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_detalleventa
BEFORE INSERT ON DETALLEVENTA
FOR EACH ROW 
BEGIN 
SELECT seq_detalleventa.NEXTVAL INTO :NEW.IDDETALLEVENTA FROM DUAL;
END;

----------------------------------------
--SEQUENCE DOCUMENTACION
----------------------------------------

CREATE SEQUENCE seq_documentacion START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_documentacion
BEFORE INSERT ON DOCUMENTACION
FOR EACH ROW 
BEGIN 
SELECT seq_documentacion.NEXTVAL INTO :NEW.IDDOCUMENTACION FROM DUAL;
END;

----------------------------------------
--SEQUENCE PRODUCTO
----------------------------------------

CREATE SEQUENCE seq_producto START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_producto
BEFORE INSERT ON PRODUCTO
FOR EACH ROW 
BEGIN 
SELECT seq_producto.NEXTVAL INTO :NEW.IDPRODUCTO FROM DUAL;
END;

----------------------------------------
--SEQUENCE ROL
----------------------------------------

CREATE SEQUENCE seq_rol START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_rol
BEFORE INSERT ON ROL
FOR EACH ROW 
BEGIN 
SELECT seq_rol.NEXTVAL INTO :NEW.IDROL FROM DUAL;
END;

----------------------------------------
--SEQUENCE SEGUIMIENTOENVIOS
----------------------------------------

CREATE SEQUENCE seq_seguimientoenvios START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_seguimientoenvios
BEFORE INSERT ON SEGUIMIENTOENVIOS
FOR EACH ROW 
BEGIN 
SELECT seq_seguimientoenvios.NEXTVAL INTO :NEW.IDSEGUIMIENTO FROM DUAL;
END;

----------------------------------------
--SEQUENCE USUARIO
----------------------------------------

CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_usuario
BEFORE INSERT ON USUARIO
FOR EACH ROW 
BEGIN 
SELECT seq_usuario.NEXTVAL INTO :NEW.IDUSUARIO FROM DUAL;
END;

----------------------------------------
--SEQUENCE VENTA
----------------------------------------

CREATE SEQUENCE seq_venta START WITH 1 INCREMENT BY 1;
create or replace TRIGGER trig_venta
BEFORE INSERT ON VENTA
FOR EACH ROW 
BEGIN 
SELECT seq_venta.NEXTVAL INTO :NEW.IDVENTA FROM DUAL;
END;