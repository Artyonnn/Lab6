CREATE SEQUENCE secuencia_numero_de_cuenta
start with 1
increment by 1
maxvalue 99999
minvalue 1;
/
/*Procedure de crear ahorro*/
create or replace procedure inser_ahorro(
    p_cod_sucursal in ahorros.cod_sucursal%type,
    p_id_c in ahorros.id_c%type,
    p_tipo_de_ahorro in ahorros.tipo_de_ahorro%type,
    p_fecha_de_apertura in ahorros.fecha_de_apertura%type,
    p_letra_deposito_mensual in ahorros.letra_depositvo_mensual%type,
    P_mensaje out varchar2) as
    v_saldo_de_ahorro ahorros.saldo_de_ahorro%type;
    v_saldo_de_interes ahorros.saldo_de_interes%type;
    v_tasa_interes ahorros.tasa_de_interes%type;
 
Begin

if p_tipo_de_ahorro=1 or p_tipo_de_ahorro=3 then
v_tasa_interes:=6;
else
v_tasa_interes:=4;
end if;
    p_mensaje:='Proceso ejecutado con exito';
    v_saldo_de_ahorro:=0;
    v_saldo_de_interes:=0;
    insert into ahorros(numero_de_cuenta,cod_sucursal,ID_C,tipo_de_ahorro,fecha_de_apertura,tasa_de_interes,letra_depositvo_mensual,saldo_de_ahorro,saldo_de_interes,usuario,fecha_de_modificacion)
    values(secuencia_numero_de_cuenta.nextval,p_cod_sucursal,p_id_c,p_tipo_de_ahorro,p_fecha_de_apertura,v_tasa_interes,P_letra_deposito_mensual,v_saldo_de_ahorro,v_saldo_de_interes,user,sysdate);
EXCEPTION
    WHEN dup_val_on_index THEN
        p_mensaje:='Este valor ya existe';
    WHEN others THEN
        p_mensaje:='No se ha creado el registro...';
end inser_ahorro;

/
Set serveroutput on
declare
    v_cod_sucursal number:=1;
    v_id_c number:=1;
    v_tipo_de_ahorro number:=1;
    v_fecha_de_apertura date:='10/08/2020';
    v_letra_deposito_mensual number:=50;
v_mensaje varchar2(50);
Begin
inser_ahorro(v_cod_sucursal,v_id_c,v_tipo_de_ahorro,v_fecha_de_apertura,v_letra_deposito_mensual,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/

Set serveroutput on
declare
    v_cod_sucursal number:=2;
    v_id_c number:=2;
    v_tipo_de_ahorro number:=2;
    v_fecha_de_apertura date:='14/10/2020';
    v_letra_deposito_mensual number:=50;
v_mensaje varchar2(50);
Begin
inser_ahorro(v_cod_sucursal,v_id_c,v_tipo_de_ahorro,v_fecha_de_apertura,v_letra_deposito_mensual,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/

Set serveroutput on
declare
    v_cod_sucursal number:=2;
    v_id_c number:=3;
    v_tipo_de_ahorro number:=3;
    v_fecha_de_apertura date:='18/10/2019';
    v_letra_deposito_mensual number:=50;
v_mensaje varchar2(50);
Begin
inser_ahorro(v_cod_sucursal,v_id_c,v_tipo_de_ahorro,v_fecha_de_apertura,v_letra_deposito_mensual,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
