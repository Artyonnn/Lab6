create or replace procedure inser_t_sucursal(
    p_cod_sucursal in sucursal.cod_sucursal%type,
    p_nombre_sucursal in Sucursal.nombre_sucursal%type,
    p_monto_prestamo in sucursal.monto_prestamo%type,
    p_monto_ahorrado in sucursal.monto_ahorrado%type,
    p_tipo_prestamo in sucursal.tipo_prestamo%type,
     p_tipo_de_ahorro in sucursal.tipo_de_ahorro%type,
    P_mensaje out varchar2) as
Begin
    p_mensaje:='Proceso ejecutado con exito';
    insert into sucursal(cod_sucursal,nombre_sucursal,monto_prestamo,monto_ahorrado,tipo_prestamo,tipo_de_ahorro)
    values(p_cod_sucursal,p_nombre_sucursal,p_monto_prestamo,p_monto_ahorrado,p_tipo_prestamo,p_tipo_de_ahorro);
EXCEPTION
    WHEN dup_val_on_index THEN
        p_mensaje:='Este valor ya existe';
    WHEN others THEN
        p_mensaje:='No se ha creado el registro...';
end inser_t_sucursal;
/
SET serveroutput ON
declare
v_cod_sucursal number:=1;
v_nombre_sucursal varchar(30):='Chiriqui';
v_monto_prestamo number:=0;
v_monto_ahorrado number:=0; 
v_tipo_prestamo number:=1; 
v_tipo_de_ahorro number:=1; 
v_mensaje varchar2(50);
Begin
inser_t_sucursal(v_cod_sucursal,v_nombre_sucursal,v_monto_prestamo,v_monto_ahorrado,v_tipo_prestamo,v_tipo_de_ahorro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_cod_sucursal number:=1;
v_nombre_sucursal varchar(30):='Chiriqui';
v_monto_prestamo number:=0;
v_monto_ahorrado number:=0; 
v_tipo_prestamo number:=2; 
v_tipo_de_ahorro number:=2; 
v_mensaje varchar2(50);
Begin
inser_t_sucursal(v_cod_sucursal,v_nombre_sucursal,v_monto_prestamo,v_monto_ahorrado,v_tipo_prestamo,v_tipo_de_ahorro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_cod_sucursal number:=1;
v_nombre_sucursal varchar(30):='Chiriqui';
v_monto_prestamo number:=0;
v_monto_ahorrado number:=0; 
v_tipo_prestamo number:=1; 
v_tipo_de_ahorro number:=3; 
v_mensaje varchar2(50);
Begin
inser_t_sucursal(v_cod_sucursal,v_nombre_sucursal,v_monto_prestamo,v_monto_ahorrado,v_tipo_prestamo,v_tipo_de_ahorro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_cod_sucursal number:=2;
v_nombre_sucursal varchar(30):='Las Cumbres';
v_monto_prestamo number:=0;
v_monto_ahorrado number:=0; 
v_tipo_prestamo number:=1; 
v_tipo_de_ahorro number:=1; 
v_mensaje varchar2(50);
Begin
inser_t_sucursal(v_cod_sucursal,v_nombre_sucursal,v_monto_prestamo,v_monto_ahorrado,v_tipo_prestamo,v_tipo_de_ahorro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_cod_sucursal number:=2;
v_nombre_sucursal varchar(30):='Las Cumbres';
v_monto_prestamo number:=0;
v_monto_ahorrado number:=0; 
v_tipo_prestamo number:=1; 
v_tipo_de_ahorro number:=2; 
v_mensaje varchar2(50);
Begin
inser_t_sucursal(v_cod_sucursal,v_nombre_sucursal,v_monto_prestamo,v_monto_ahorrado,v_tipo_prestamo,v_tipo_de_ahorro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_cod_sucursal number:=2;
v_nombre_sucursal varchar(30):='Las Cumbres';
v_monto_prestamo number:=0;
v_monto_ahorrado number:=0; 
v_tipo_prestamo number:=1; 
v_tipo_de_ahorro number:=3; 
v_mensaje varchar2(50);
Begin
inser_t_sucursal(v_cod_sucursal,v_nombre_sucursal,v_monto_prestamo,v_monto_ahorrado,v_tipo_prestamo,v_tipo_de_ahorro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/