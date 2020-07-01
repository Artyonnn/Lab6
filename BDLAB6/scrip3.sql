create or replace procedure deporeti(
    p_cod_sucursal transadeporeti.COD_SUCURSAL%type,
    p_id_transadeporeti transadeporeti.id_transadeporeti%type,
    p_id_c transadeporeti.id_C%type,
    p_tipo_de_ahorro transadeporeti.tipo_de_ahorro%type,
    p_tipo_de_transaccion transadeporeti.tipo_de_transaccion%type, 
    p_monto_deposito_retiro transadeporeti.monto_deposito_retiro%type,
    P_mensaje out varchar2)as
begin 
  p_mensaje:='Proceso ejecutado con exito';
    INSERT INTO transadeporeti(cod_sucursal,id_transadeporeti,id_C,tipo_de_ahorro,fecha_transaccion,tipo_de_transaccion,monto_deposito_retiro,fecha_insercion,usuario)
         VALUES(p_cod_sucursal,p_id_transadeporeti,p_ID_C,p_tipo_de_ahorro,sysdate,p_tipo_de_transaccion,p_monto_deposito_retiro,sysdate,user);
EXCEPTION
         WHEN dup_val_on_index THEN
              p_mensaje:='Este valor ya estaba';
         WHEN others THEN
              p_mensaje:='No se ha creado el registro...'; 
COMMIT;
 
end deporeti;
/
 
/* bloque anonimo problema 3*/
SET serveroutput ON
declare
v_cod_sucursal number:=1;
v_id_transadeporeti number:=2;
v_id_c number:=1;
v_tipo_de_ahorro number:=1;
v_tipo_de_transaccion number:=1; 
v_monto_deposito_retiro number:=50;
v_mensaje varchar2(50);
Begin
deporeti(v_cod_sucursal,v_id_transadeporeti,v_id_c,v_tipo_de_ahorro,v_tipo_de_transaccion,v_monto_deposito_retiro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
/* bloque anonimo problema 3*/
SET serveroutput ON
declare
v_cod_sucursal number:=2;
v_id_transadeporeti number:=3;
v_id_c number:=2;
v_tipo_de_ahorro number:=2;
v_tipo_de_transaccion number:=1; 
v_monto_deposito_retiro number:=50;
v_mensaje varchar2(50);
Begin
deporeti(v_cod_sucursal,v_id_transadeporeti,v_id_c,v_tipo_de_ahorro,v_tipo_de_transaccion,v_monto_deposito_retiro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
/* bloque anonimo problema 3*/
SET serveroutput ON
declare
v_cod_sucursal number:=2;
v_id_transadeporeti number:=1;
v_id_c number:=3;
v_tipo_de_ahorro number:=3;
v_tipo_de_transaccion number:=1; 
v_monto_deposito_retiro number:=50;
v_mensaje varchar2(50);
Begin
deporeti(v_cod_sucursal,v_id_transadeporeti,v_id_c,v_tipo_de_ahorro,v_tipo_de_transaccion,v_monto_deposito_retiro,v_mensaje);
DBMS_output.put_line(v_mensaje);
end;
/
