----------------------------------------
-- VIEW_USUARIO
----------------------------------------

CREATE VIEW view_usuario AS
SELECT nombre ||''|| apellidos "NOMBRE COMPLETO", rut, 
trunc(months_between(to_date(to_char(SYSDATE, 'dd/mm/yyyy'), 'dd/mm/yyyy'), 
TO_CHAR(to_char(fechanac, 'dd/mm/yyyy'), 'dd/mm/yyyy'))/12) "EDAD",
fechanac "FECHA DE NACIMIENTO", telefono ,email "CORREO", direccion, comuna, region
from usuario
ORDER BY "NOMBRE COMPLETO" ASC;


----------------------------------------
-- VIEW_USUARIOCARGO
----------------------------------------

CREATE VIEW view_usuarioCargo AS
SELECT u.nombre ||''|| u.apellidos "NOMBRE COMPLETO", u.username, u.password, u.rut, 
trunc(months_between(to_date(to_char(SYSDATE, 'dd/mm/yyyy'), 'dd/mm/yyyy'), 
to_date(TO_CHAR(u.fechanac, 'dd/mm/yyyy'), 'dd/mm/yyyy'))/12) "EDAD",
u.fechanac "FECHA DE NACIMIENTO", u.telefono ,u.email "CORREO", r.nombre "CARGO"
FROM usuario u INNER JOIN rol r
ON u.idusuario = r.idrol
ORDER BY "NOMBRE COMPLETO";

----------------------------------------
-- VIEW_VENTAUSUARIO
----------------------------------------

CREATE VIEW view_ventaUsuario AS
SELECT  v.idventa "ID VENTA", u.nombre ||''|| u.apellidos "NOMBRE COMPLETO",u.telefono, u.email, v.fechahora "FECHA DE COMPRA", 
v.estadoventa "ESTADO VENTA", p.nomproducto "NOM PRODUCTO", p.tipoproducto "TIPO PRODUCTO", p.marca, p.modelo, p.imagen,
TO_CHAR(p.valorproducto,'$99g999g999') "VALOR UNITARIO", d.cantidad, 
TO_CHAR(p.valorproducto*d.cantidad,'$99g999g999') "TOTAL VENTA"
FROM venta v 
FULL JOIN usuario u
ON v.idventa = u.idusuario
FULL JOIN producto p
ON v.idventa = p.idproducto
FULL JOIN detalleventa d
ON v.idventa = d.iddetalleventa
ORDER BY fechahora DESC;

----------------------------------------
-- VIEW_DETALLEVENTA
----------------------------------------

CREATE VIEW view_DetalleVenta AS
SELECT iddetalleventa, cantidad, 
TO_CHAR(precioventa,'$99g999g999') "PRECIO VENTA" , venta_idventa "ID VENTA", producto_idproducto "ID PRODUCTO" from detalleventa
ORDER BY iddetalleventa ASC;

----------------------------------------
-- VIEW_PRODUCTO
----------------------------------------

CREATE VIEW view_producto AS
SELECT idproducto, nomproducto, tipoproducto, descripcion, 
TO_CHAR(valorproducto,'$99g999g999') "PRECIO", marca, modelo, stock, imagen 
FROM producto
ORDER BY idproducto ASC;