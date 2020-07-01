create or replace procedure inser_t_ahorros(
    p_t_ahorro in tipo_ahorro.tipo_de_ahorro%type,
    p_descripcion in tipo_ahorro.descripcion%type,
    p_tasa_de_interes in tipo_ahorro.tasa_de_interes%type,
    P_mensaje out varchar2) as
Begin
    p_mensaje:='Proceso ejecutado con exito';
    insert into Tipo_ahorro(tipo_de_ahorro,descripcion,tasa_de_interes)
    values(p_t_ahorro,p_descripcion,p_tasa_de_interes);
EXCEPTION
    WHEN dup_val_on_index THEN
        p_mensaje:='Este valor ya existe';
    WHEN others THEN
        p_mensaje:='No se ha creado el registro...';
end inser_t_ahorros;
/*bloque de tipo ahorro*/
/
SET serveroutput ON
declare
v_t_ahorro number(10):=1;
v_descripcion varchar(30):='ahorro de navidad';
v_tasa_de_interes number(10):=6;
v_mensaje varchar2(50);
Begin
inser_t_ahorros(v_t_ahorro,v_descripcion,v_tasa_de_interes,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_t_ahorro number:=2;
v_descripcion varchar(30):='ahorro corriente';
v_tasa_de_interes number:=4;
v_mensaje varchar2(50);
Begin
inser_t_ahorros(v_t_ahorro,v_descripcion,v_tasa_de_interes,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
SET serveroutput ON
declare
v_t_ahorro number:=3;
v_descripcion varchar(30):='ahorro escolar';
v_tasa_de_interes number:=6; 
v_mensaje varchar2(50);
Begin
inser_t_ahorros(v_t_ahorro,v_descripcion,v_tasa_de_interes,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/