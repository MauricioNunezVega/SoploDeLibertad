CREATE OR REPLACE PACKAGE detalleventa_tapi IS
    TYPE detalleventa_tapi_rec IS RECORD (
        iddetalleventa      detalleventa.iddetalleventa%TYPE,
        cantidad            detalleventa.cantidad%TYPE,
        precioventa         detalleventa.precioventa%TYPE,
        venta_idventa       detalleventa.venta_idventa%TYPE,
        producto_idproducto detalleventa.producto_idproducto%TYPE
    );
    TYPE detalleventa_tapi_tab IS
        TABLE OF detalleventa_tapi_rec;
 -- INSERT 
    PROCEDURE ins (
        p_iddetalleventa      IN detalleventa.iddetalleventa%TYPE,
        p_cantidad            IN detalleventa.cantidad%TYPE,
        p_precioventa         IN detalleventa.precioventa%TYPE,
        p_venta_idventa       IN detalleventa.venta_idventa%TYPE,
        p_producto_idproducto IN detalleventa.producto_idproducto%TYPE
    );

 -- UPDATE  
    PROCEDURE udp (
        p_iddetalleventa      IN detalleventa.iddetalleventa%TYPE,
        p_cantidad            IN detalleventa.cantidad%TYPE,
        p_precioventa         IN detalleventa.precioventa%TYPE,
        p_venta_idventa       IN detalleventa.venta_idventa%TYPE,
        p_producto_idproducto IN detalleventa.producto_idproducto%TYPE
    );

-- DELETE 
    PROCEDURE del (
        p_iddetalleventa IN detalleventa.iddetalleventa%TYPE
    );

END detalleventa_tapi;

---------------- 
CREATE OR REPLACE PACKAGE BODY detalleventa_tapi IS
 -- INSERT 
    PROCEDURE ins (
        p_iddetalleventa      IN detalleventa.iddetalleventa%TYPE,
        p_cantidad            IN detalleventa.cantidad%TYPE,
        p_precioventa         IN detalleventa.precioventa%TYPE,
        p_venta_idventa       IN detalleventa.venta_idventa%TYPE,
        p_producto_idproducto IN detalleventa.producto_idproducto%TYPE
    ) IS
    BEGIN
        INSERT INTO detalleventa (
            iddetalleventa,
            cantidad,
            precioventa,
            venta_idventa,
            producto_idproducto
        ) VALUES (
            p_iddetalleventa,
            p_cantidad,
            p_precioventa,
            p_venta_idventa,
            p_producto_idproducto
        );

    END;

         -- UPDATE  
    PROCEDURE udp (
        p_iddetalleventa      IN detalleventa.iddetalleventa%TYPE,
        p_cantidad            IN detalleventa.cantidad%TYPE,
        p_precioventa         IN detalleventa.precioventa%TYPE,
        p_venta_idventa       IN detalleventa.venta_idventa%TYPE,
        p_producto_idproducto IN detalleventa.producto_idproducto%TYPE
    ) IS
    BEGIN
        UPDATE detalleventa
        SET
            cantidad = p_cantidad,
            precioventa = p_precioventa,
            venta_idventa = p_venta_idventa,
            producto_idproducto = p_producto_idproducto
        WHERE
            iddetalleventa = p_iddetalleventa;

    END; 

        -- DELETE 
    PROCEDURE del (
        p_iddetalleventa IN detalleventa.iddetalleventa%TYPE
    ) IS
    BEGIN
        DELETE FROM detalleventa
        WHERE
            iddetalleventa = p_iddetalleventa;

    END;

END detalleventa_tapi;

-----------
CREATE OR REPLACE PACKAGE documentacion_tapi IS
    TYPE documentacion_tapi_rec IS RECORD (
        iddocumentacion     documentacion.iddocumentacion%TYPE,
        tipodocumento       documentacion.tipodocumento%TYPE,
        nomdocumento        documentacion.nomdocumento%TYPE,
        documento           documentacion.documento%TYPE,
        producto_idproducto documentacion.producto_idproducto%TYPE
    );
    TYPE documentacion_tapi_tab IS
        TABLE OF documentacion_tapi_rec;
 -- INSERT 
    PROCEDURE ins (
        p_iddocumentacion     IN documentacion.iddocumentacion%TYPE,
        p_tipodocumento       IN documentacion.tipodocumento%TYPE,
        p_nomdocumento        IN documentacion.nomdocumento%TYPE,
        p_documento           IN documentacion.documento%TYPE,
        p_producto_idproducto IN documentacion.producto_idproducto%TYPE
    );

 -- UPDATE  
    PROCEDURE udp (
        p_iddocumentacion     IN documentacion.iddocumentacion%TYPE,
        p_tipodocumento       IN documentacion.tipodocumento%TYPE,
        p_nomdocumento        IN documentacion.nomdocumento%TYPE,
        p_documento           IN documentacion.documento%TYPE,
        p_producto_idproducto IN documentacion.producto_idproducto%TYPE
    );

-- DELETE 
    PROCEDURE del (
        p_iddocumentacion IN documentacion.iddocumentacion%TYPE
    );

END documentacion_tapi;

----------
CREATE OR REPLACE PACKAGE BODY documentacion_tapi IS
-- INSERT 
    PROCEDURE ins (
        p_iddocumentacion     IN documentacion.iddocumentacion%TYPE,
        p_tipodocumento       IN documentacion.tipodocumento%TYPE,
        p_nomdocumento        IN documentacion.nomdocumento%TYPE,
        p_documento           IN documentacion.documento%TYPE,
        p_producto_idproducto IN documentacion.producto_idproducto%TYPE
    ) IS
    BEGIN
        INSERT INTO documentacion (
            iddocumentacion,
            tipodocumento,
            nomdocumento,
            documento,
            producto_idproducto
        ) VALUES (
            p_iddocumentacion,
            p_tipodocumento,
            p_nomdocumento,
            p_documento,
            p_producto_idproducto
        );

    END; 
         -- UPDATE  
    PROCEDURE udp (
        p_iddocumentacion     IN documentacion.iddocumentacion%TYPE,
        p_tipodocumento       IN documentacion.tipodocumento%TYPE,
        p_nomdocumento        IN documentacion.nomdocumento%TYPE,
        p_documento           IN documentacion.documento%TYPE,
        p_producto_idproducto IN documentacion.producto_idproducto%TYPE
    ) IS
    BEGIN
        UPDATE documentacion
        SET
            tipodocumento = p_tipodocumento,
            nomdocumento = p_nomdocumento,
            documento = p_documento,
            producto_idproducto = p_producto_idproducto
        WHERE
            iddocumentacion = p_iddocumentacion;

    END; 
      -- DELETE 
    PROCEDURE del (
        p_iddocumentacion IN documentacion.iddocumentacion%TYPE
    ) IS
    BEGIN
        DELETE FROM documentacion
        WHERE
            iddocumentacion = p_iddocumentacion;

    END;

END documentacion_tapi;

---------------
CREATE OR REPLACE PACKAGE producto_tapi IS
    TYPE producto_tapi_rec IS RECORD (
        idproducto    producto.idproducto%TYPE,
        nomproducto   producto.nomproducto%TYPE,
        tipoproducto  producto.tipoproducto%TYPE,
        descripcion   producto.descripcion%TYPE,
        valorproducto producto.valorproducto%TYPE,
        marca         producto.marca%TYPE,
        modelo        producto.modelo%TYPE,
        stock         producto.stock%TYPE,
        imagen        producto.imagen%TYPE
    );
    TYPE producto_tapi_tab IS
        TABLE OF producto_tapi_rec;

         -- INSERT 
    PROCEDURE ins (
        p_idproducto    IN producto.idproducto%TYPE,
        p_nomproducto   IN producto.nomproducto%TYPE,
        p_tipoproducto  IN producto.tipoproducto%TYPE,
        p_descripcion   IN producto.descripcion%TYPE,
        p_valorproducto IN producto.valorproducto%TYPE,
        p_marca         IN producto.marca%TYPE,
        p_modelo        IN producto.modelo%TYPE,
        p_stock         IN producto.stock%TYPE,
        p_imagen        IN producto.imagen%TYPE
    );

 -- UPDATE  
    PROCEDURE udp (
        p_idproducto    IN producto.idproducto%TYPE,
        p_nomproducto   IN producto.nomproducto%TYPE,
        p_tipoproducto  IN producto.tipoproducto%TYPE,
        p_descripcion   IN producto.descripcion%TYPE,
        p_valorproducto IN producto.valorproducto%TYPE,
        p_marca         IN producto.marca%TYPE,
        p_modelo        IN producto.modelo%TYPE,
        p_stock         IN producto.stock%TYPE,
        p_imagen        IN producto.imagen%TYPE
    );

-- DELETE 
    PROCEDURE del (
        p_idproducto IN producto.idproducto%TYPE
    );

END producto_tapi;

------------
CREATE OR REPLACE PACKAGE BODY producto_tapi IS
     -- INSERT 
    PROCEDURE ins (
        p_idproducto    IN producto.idproducto%TYPE,
        p_nomproducto   IN producto.nomproducto%TYPE,
        p_tipoproducto  IN producto.tipoproducto%TYPE,
        p_descripcion   IN producto.descripcion%TYPE,
        p_valorproducto IN producto.valorproducto%TYPE,
        p_marca         IN producto.marca%TYPE,
        p_modelo        IN producto.modelo%TYPE,
        p_stock         IN producto.stock%TYPE,
        p_imagen        IN producto.imagen%TYPE
    ) IS
    BEGIN
        INSERT INTO producto (
            idproducto,
            nomproducto,
            tipoproducto,
            descripcion,
            valorproducto,
            marca,
            modelo,
            stock,
            imagen
        ) VALUES (
            p_idproducto,
            p_nomproducto,
            p_tipoproducto,
            p_descripcion,
            p_valorproducto,
            p_marca,
            p_modelo,
            p_stock,
            p_imagen
        );

    END; 
             -- UPDATE  
    PROCEDURE udp (
        p_idproducto    IN producto.idproducto%TYPE,
        p_nomproducto   IN producto.nomproducto%TYPE,
        p_tipoproducto  IN producto.tipoproducto%TYPE,
        p_descripcion   IN producto.descripcion%TYPE,
        p_valorproducto IN producto.valorproducto%TYPE,
        p_marca         IN producto.marca%TYPE,
        p_modelo        IN producto.modelo%TYPE,
        p_stock         IN producto.stock%TYPE,
        p_imagen        IN producto.imagen%TYPE
    ) IS
    BEGIN
        UPDATE producto
        SET
            nomproducto = p_nomproducto,
            tipoproducto = p_tipoproducto,
            descripcion = p_descripcion,
            valorproducto = p_valorproducto,
            marca = p_marca,
            modelo = p_modelo,
            stock = p_stock,
            imagen = p_imagen
        WHERE
            idproducto = p_idproducto;

    END; 
       -- DELETE 
    PROCEDURE del (
        p_idproducto IN producto.idproducto%TYPE
    ) IS
    BEGIN
        DELETE FROM producto
        WHERE
            idproducto = p_idproducto;

    END;

END producto_tapi;

------------
CREATE OR REPLACE PACKAGE rol_tapi IS
    TYPE rol_tapi_rec IS RECORD (
        idrol  rol.idrol%TYPE,
        nombre rol.nombre%TYPE
    );
    TYPE rol_tapi_tab IS
        TABLE OF rol_tapi_rec;

-- INSERT 
    PROCEDURE ins (
        p_idrol  IN rol.idrol%TYPE,
        p_nombre IN rol.nombre%TYPE
    );

-- UPDATE  
    PROCEDURE udp (
        p_idrol  IN rol.idrol%TYPE,
        p_nombre IN rol.nombre%TYPE
    );

-- DELETE 
    PROCEDURE del (
        p_idrol IN rol.idrol%TYPE
    );

END rol_tapi;

-------------
CREATE OR REPLACE PACKAGE BODY rol_tapi IS
-- INSERT 
    PROCEDURE ins (
        p_idrol  IN rol.idrol%TYPE,
        p_nombre IN rol.nombre%TYPE
    ) IS
    BEGIN
        INSERT INTO rol (
            idrol,
            nombre
        ) VALUES (
            p_idrol,
            p_nombre
        );

    END;

-- UPDATE  
    PROCEDURE udp (
        p_idrol  IN rol.idrol%TYPE,
        p_nombre IN rol.nombre%TYPE
    ) IS
    BEGIN
        UPDATE rol
        SET
            nombre = p_nombre
        WHERE
            idrol = p_idrol;

    END;

-- DELETE 
    PROCEDURE del (
        p_idrol IN rol.idrol%TYPE
    ) IS
    BEGIN
        DELETE FROM rol
        WHERE
            idrol = p_idrol;

    END;

END rol_tapi;

-------------------
CREATE OR REPLACE PACKAGE seguimientoenvios_tapi IS
    TYPE seguimientoenvios_tapi_rec IS RECORD (
        idseguimiento seguimientoenvios.idseguimiento%TYPE,
        estadoentrega seguimientoenvios.estadoentrega%TYPE,
        fechadespacho seguimientoenvios.fechadespacho%TYPE,
        fechaentrega  seguimientoenvios.fechaentrega%TYPE,
        venta_idventa seguimientoenvios.venta_idventa%TYPE
    );
    TYPE seguimientoenvios_tapi_tab IS
        TABLE OF seguimientoenvios_tapi_rec;
         -- INSERT 
    PROCEDURE ins (
        p_idseguimiento IN seguimientoenvios.idseguimiento%TYPE,
        p_estadoentrega IN seguimientoenvios.estadoentrega%TYPE,
        p_fechadespacho IN seguimientoenvios.fechadespacho%TYPE,
        p_fechaentrega  IN seguimientoenvios.fechaentrega%TYPE,
        p_venta_idventa IN seguimientoenvios.venta_idventa%TYPE
    );
 -- UPDATE  
    PROCEDURE udp (
        p_idseguimiento IN seguimientoenvios.idseguimiento%TYPE,
        p_estadoentrega IN seguimientoenvios.estadoentrega%TYPE,
        p_fechadespacho IN seguimientoenvios.fechadespacho%TYPE,
        p_fechaentrega  IN seguimientoenvios.fechaentrega%TYPE,
        p_venta_idventa IN seguimientoenvios.venta_idventa%TYPE
    );
-- DELETE 
    PROCEDURE del (
        p_idseguimiento IN seguimientoenvios.idseguimiento%TYPE
    );

END seguimientoenvios_tapi;

----------------
CREATE OR REPLACE PACKAGE BODY seguimientoenvios_tapi IS
           -- INSERT 
    PROCEDURE ins (
        p_idseguimiento IN seguimientoenvios.idseguimiento%TYPE,
        p_estadoentrega IN seguimientoenvios.estadoentrega%TYPE,
        p_fechadespacho IN seguimientoenvios.fechadespacho%TYPE,
        p_fechaentrega  IN seguimientoenvios.fechaentrega%TYPE,
        p_venta_idventa IN seguimientoenvios.venta_idventa%TYPE
    ) IS
    BEGIN
        INSERT INTO seguimientoenvios (
            idseguimiento,
            estadoentrega,
            fechadespacho,
            fechaentrega,
            venta_idventa
        ) VALUES (
            p_idseguimiento,
            p_estadoentrega,
            p_fechadespacho,
            p_fechaentrega,
            p_venta_idventa
        );

    END;

 -- UPDATE  
    PROCEDURE udp (
        p_idseguimiento IN seguimientoenvios.idseguimiento%TYPE,
        p_estadoentrega IN seguimientoenvios.estadoentrega%TYPE,
        p_fechadespacho IN seguimientoenvios.fechadespacho%TYPE,
        p_fechaentrega  IN seguimientoenvios.fechaentrega%TYPE,
        p_venta_idventa IN seguimientoenvios.venta_idventa%TYPE
    ) IS
    BEGIN
        UPDATE seguimientoenvios
        SET
            estadoentrega = p_estadoentrega,
            fechadespacho = p_fechadespacho,
            fechaentrega = p_fechaentrega,
            venta_idventa = p_venta_idventa
        WHERE
            idseguimiento = p_idseguimiento;

    END; 
-- DELETE 
    PROCEDURE del (
        p_idseguimiento IN seguimientoenvios.idseguimiento%TYPE
    ) IS
    BEGIN
        DELETE FROM seguimientoenvios
        WHERE
            idseguimiento = p_idseguimiento;

    END;

END seguimientoenvios_tapi;

----------------
CREATE OR REPLACE PACKAGE usuario_tapi IS
    TYPE usuario_tapi_rec IS RECORD (
        idusuario usuario.idusuario%TYPE,
        username  usuario.username%TYPE,
        password  usuario.password%TYPE,
        nombre    usuario.nombre%TYPE,
        apellidos usuario.apellidos%TYPE,
        rut       usuario.rut%TYPE,
        email     usuario.email%TYPE,
        fechanac  usuario.fechanac%TYPE,
        telefono  usuario.telefono%TYPE,
        direccion usuario.direccion%TYPE,
        comuna    usuario.comuna%TYPE,
        region    usuario.region%TYPE,
        rol_idrol usuario.rol_idrol%TYPE
    );
    TYPE usuario_tapi_tab IS
        TABLE OF usuario_tapi_rec;

-- INSERT 
    PROCEDURE ins (
        p_idusuario IN usuario.idusuario%TYPE,
        p_username  IN usuario.username%TYPE,
        p_password  IN usuario.password%TYPE,
        p_nombre    IN usuario.nombre%TYPE,
        p_apellidos IN usuario.apellidos%TYPE,
        p_rut       IN usuario.rut%TYPE,
        p_email     IN usuario.email%TYPE,
        p_fechanac  IN usuario.fechanac%TYPE,
        p_telefono  IN usuario.telefono%TYPE,
        p_direccion IN usuario.direccion%TYPE,
        p_comuna    IN usuario.comuna%TYPE,
        p_region    IN usuario.region%TYPE,
        p_rol_idrol IN usuario.rol_idrol%TYPE
    );

-- UPDATE 
    PROCEDURE udp (
        p_idusuario IN usuario.idusuario%TYPE,
        p_username  IN usuario.username%TYPE,
        p_password  IN usuario.password%TYPE,
        p_nombre    IN usuario.nombre%TYPE,
        p_apellidos IN usuario.apellidos%TYPE,
        p_rut       IN usuario.rut%TYPE,
        p_email     IN usuario.email%TYPE,
        p_fechanac  IN usuario.fechanac%TYPE,
        p_telefono  IN usuario.telefono%TYPE,
        p_direccion IN usuario.direccion%TYPE,
        p_comuna    IN usuario.comuna%TYPE,
        p_region    IN usuario.region%TYPE,
        p_rol_idrol IN usuario.rol_idrol%TYPE
    );

-- DELETE 
    PROCEDURE del (
        p_idusuario IN usuario.idusuario%TYPE
    );

END usuario_tapi;

------------------
CREATE OR REPLACE PACKAGE BODY usuario_tapi IS
-- INSERT 
    PROCEDURE ins (
        p_idusuario IN usuario.idusuario%TYPE,
        p_username  IN usuario.username%TYPE,
        p_password  IN usuario.password%TYPE,
        p_nombre    IN usuario.nombre%TYPE,
        p_apellidos IN usuario.apellidos%TYPE,
        p_rut       IN usuario.rut%TYPE,
        p_email     IN usuario.email%TYPE,
        p_fechanac  IN usuario.fechanac%TYPE,
        p_telefono  IN usuario.telefono%TYPE,
        p_direccion IN usuario.direccion%TYPE,
        p_comuna    IN usuario.comuna%TYPE,
        p_region    IN usuario.region%TYPE,
        p_rol_idrol IN usuario.rol_idrol%TYPE
    ) IS
    BEGIN
        INSERT INTO usuario (
            idusuario,
            username,
            password,
            nombre,
            apellidos,
            rut,
            email,
            fechanac,
            telefono,
            direccion,
            comuna,
            region,
            rol_idrol
        ) VALUES (
            p_idusuario,
            p_username,
            p_password,
            p_nombre,
            p_apellidos,
            p_rut,
            p_email,
            p_fechanac,
            p_telefono,
            p_direccion,
            p_comuna,
            p_region,
            p_rol_idrol
        );

    END;

-- UPDATE 
    PROCEDURE udp (
        p_idusuario IN usuario.idusuario%TYPE,
        p_username  IN usuario.username%TYPE,
        p_password  IN usuario.password%TYPE,
        p_nombre    IN usuario.nombre%TYPE,
        p_apellidos IN usuario.apellidos%TYPE,
        p_rut       IN usuario.rut%TYPE,
        p_email     IN usuario.email%TYPE,
        p_fechanac  IN usuario.fechanac%TYPE,
        p_telefono  IN usuario.telefono%TYPE,
        p_direccion IN usuario.direccion%TYPE,
        p_comuna    IN usuario.comuna%TYPE,
        p_region    IN usuario.region%TYPE,
        p_rol_idrol IN usuario.rol_idrol%TYPE
    ) IS
    BEGIN
        UPDATE usuario
        SET
            username = p_username,
            password = p_password,
            nombre = p_nombre,
            apellidos = p_apellidos,
            rut = p_rut,
            email = p_email,
            fechanac = p_fechanac,
            telefono = p_telefono,
            direccion = p_direccion,
            comuna = p_comuna,
            region = p_region,
            rol_idrol = p_rol_idrol
        WHERE
            idusuario = p_idusuario;

    END;

-- DELETE 
    PROCEDURE del (
        p_idusuario IN usuario.idusuario%TYPE
    ) IS
    BEGIN
        DELETE FROM usuario
        WHERE
            idusuario = p_idusuario;

    END;

END usuario_tapi;

------------------
CREATE OR REPLACE PACKAGE venta_tapi IS
    TYPE venta_tapi_rec IS RECORD (
        idseguimiento seguimientoenvios.idseguimiento%TYPE,
        estadoentrega seguimientoenvios.estadoentrega%TYPE,
        fechadespacho seguimientoenvios.fechadespacho%TYPE,
        fechaentrega  seguimientoenvios.fechaentrega%TYPE,
        venta_idventa seguimientoenvios.venta_idventa%TYPE
    );
    TYPE venta_tapi_tab IS
        TABLE OF venta_tapi_rec;
         -- INSERT 
    PROCEDURE ins (
        p_idventa           IN venta.idventa%TYPE,
        p_fechahora         IN venta.fechahora%TYPE,
        p_totalventa        IN venta.totalventa%TYPE,
        p_estadoventa       IN venta.estadoventa%TYPE,
        p_usuario_idusuario IN venta.usuario_idusuario%TYPE
    );
 -- UPDATE  
    PROCEDURE udp (
        p_idventa           IN venta.idventa%TYPE,
        p_fechahora         IN venta.fechahora%TYPE,
        p_totalventa        IN venta.totalventa%TYPE,
        p_estadoventa       IN venta.estadoventa%TYPE,
        p_usuario_idusuario IN venta.usuario_idusuario%TYPE
    );
-- DELETE 
    PROCEDURE del (
        p_idventa IN venta.idventa%TYPE
    );

END venta_tapi;

--------------------
CREATE OR REPLACE PACKAGE BODY venta_tapi IS
         -- INSERT 
    PROCEDURE ins (
        p_idventa           IN venta.idventa%TYPE,
        p_fechahora         IN venta.fechahora%TYPE,
        p_totalventa        IN venta.totalventa%TYPE,
        p_estadoventa       IN venta.estadoventa%TYPE,
        p_usuario_idusuario IN venta.usuario_idusuario%TYPE
    ) IS
    BEGIN
        INSERT INTO venta (
            idventa,
            fechahora,
            totalventa,
            estadoventa,
            usuario_idusuario
        ) VALUES (
            p_idventa,
            p_fechahora,
            p_totalventa,
            p_estadoventa,
            p_usuario_idusuario
        );

    END;

 -- UPDATE  
    PROCEDURE udp (
        p_idventa           IN venta.idventa%TYPE,
        p_fechahora         IN venta.fechahora%TYPE,
        p_totalventa        IN venta.totalventa%TYPE,
        p_estadoventa       IN venta.estadoventa%TYPE,
        p_usuario_idusuario IN venta.usuario_idusuario%TYPE
    ) IS
    BEGIN
        UPDATE venta
        SET
            fechahora = p_fechahora,
            totalventa = p_totalventa,
            estadoventa = p_estadoventa,
            usuario_idusuario = p_usuario_idusuario
        WHERE
            idventa = p_idventa;

    END; 
    
-- DELETE 
    PROCEDURE del (
        p_idventa IN venta.idventa%TYPE
    ) IS
    BEGIN
        DELETE FROM venta
        WHERE
            idventa = p_idventa;

    END;

END venta_tapi;