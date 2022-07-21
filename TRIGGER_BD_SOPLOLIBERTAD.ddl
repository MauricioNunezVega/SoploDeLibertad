create or replace TRIGGER trig_detalleventa
BEFORE INSERT ON DETALLEVENTA
FOR EACH ROW 
BEGIN 
SELECT seq_detalleventa.NEXTVAL INTO :NEW.IDDETALLEVENTA FROM DUAL;
END;
--------
create or replace TRIGGER trig_documentacion
BEFORE INSERT ON DOCUMENTACION
FOR EACH ROW 
BEGIN 
SELECT seq_documentacion.NEXTVAL INTO :NEW.IDDOCUMENTACION FROM DUAL;
END;
---------
create or replace TRIGGER trig_producto
BEFORE INSERT ON PRODUCTO
FOR EACH ROW 
BEGIN 
SELECT seq_producto.NEXTVAL INTO :NEW.IDPRODUCTO FROM DUAL;
END;
----------
create or replace TRIGGER trig_rol
BEFORE INSERT ON ROL
FOR EACH ROW 
BEGIN 
SELECT seq_rol.NEXTVAL INTO :NEW.IDROL FROM DUAL;
END;
----------
create or replace TRIGGER trig_seguimientoenvios
BEFORE INSERT ON SEGUIMIENTOENVIOS
FOR EACH ROW 
BEGIN 
SELECT seq_seguimientoenvios.NEXTVAL INTO :NEW.IDSEGUIMIENTO FROM DUAL;
END;
----------
create or replace TRIGGER trig_usuario
BEFORE INSERT ON USUARIO
FOR EACH ROW 
BEGIN 
SELECT seq_usuario.NEXTVAL INTO :NEW.IDUSUARIO FROM DUAL;
END;
---------
create or replace TRIGGER trig_venta
BEFORE INSERT ON VENTA
FOR EACH ROW 
BEGIN 
SELECT seq_venta.NEXTVAL INTO :NEW.IDVENTA FROM DUAL;
END;