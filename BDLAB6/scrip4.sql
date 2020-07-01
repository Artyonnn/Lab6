create or replace function calcular_interes(
p_tasa_de_interes tipo_ahorro.tasa_de_interes%type,
p_saldoactual     ahorros.saldo_de_ahorro%type)
return float as 
p_monto_temporal number(25);
begin
p_monto_temporal:=(p_tasa_de_interes/100)*p_saldoactual;
return p_monto_temporal;
end calcular_interes;
/
 
create or replace PROCEDURE Actualizacion(
    
p_estado out varchar2)as
v_interes number(10);
cursor c_actualizacion is
select id_transadeporeti,COD_SUCURSAL,ID_C,tipo_de_ahorro,tipo_de_transaccion from transadeporeti;
v_saldo_de_ahorro ahorros.saldo_de_ahorro%type;
v_saldo_de_interes ahorros.saldo_de_interes%type;
v_fecha_RoP ahorros.fecha_de_deposito%type;
v_monto_del_deposito_o_retiro  transadeporeti.monto_deposito_retiro%type;
v_tasa_de_interes ahorros.tasa_de_interes%type;
begin
 p_estado:='Proceso ejecutado con exito';
 
for v_indice in c_actualizacion loop
select tasa_de_interes into v_tasa_de_interes from ahorros where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c;
select saldo_de_interes into v_saldo_de_interes from ahorros where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c;
select saldo_de_ahorro into v_saldo_de_ahorro from ahorros where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c;
select monto_deposito_retiro into v_monto_del_deposito_o_retiro from transadeporeti 
where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c and id_transadeporeti=v_indice.id_transadeporeti and tipo_de_transaccion=v_indice.tipo_de_transaccion;
v_interes:=calcular_interes(v_saldo_de_ahorro,v_tasa_de_interes);

if v_indice.tipo_de_transaccion=1 THEN
update ahorros
set saldo_de_ahorro=v_saldo_de_ahorro+v_monto_del_deposito_o_retiro,saldo_de_interes=v_saldo_de_interes+v_interes,fecha_de_deposito=sysdate,usuario=user,fecha_de_modificacion=sysdate
where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c and tipo_de_ahorro=v_indice.tipo_de_ahorro;
elsif v_indice.tipo_de_transaccion=2 and v_indice.tipo_de_ahorro=2 and v_saldo_de_ahorro>v_monto_del_deposito_o_retiro THEN
update ahorros
set saldo_de_ahorro=v_saldo_de_ahorro-v_monto_del_deposito_o_retiro,fecha_de_retiro=sysdate,usuario=user,fecha_de_modificacion=sysdate
where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c and tipo_de_ahorro=v_indice.tipo_de_ahorro;
end if;
end loop;
 
 EXCEPTION 
         WHEN dup_val_on_index THEN 
              p_estado:='Este valor ya existe';
         WHEN others THEN
              p_estado:='No se ha creado el registro...';
end Actualizacion;
/
SET SERVEROUTPUT ON
declare
v_estado varchar(50);
begin
Actualizacion(v_estado);
dbms_output.put_line(v_estado);
end;
/