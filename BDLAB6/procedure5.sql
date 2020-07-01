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
create or replace PROCEDURE Actualizacion_corriente(
    
p_estado out varchar2)as
v_interes number(10);
cursor c_actualizacion_corriente is
select id_transadeporeti,COD_SUCURSAL,ID_C,tipo_de_ahorro,tipo_de_transaccion from transadeporeti;
   v_saldo_de_ahorro ahorros.saldo_de_ahorro%type;
   v_saldo_de_interes ahorros.saldo_de_interes%type;
   v_tasa_de_interes ahorros.tasa_de_interes%type;
begin
p_estado:='Proceso ejecutado con exito';
 
for v_indice in c_actualizacion_corriente loop
select tasa_de_interes into v_tasa_de_interes from tipo_ahorro where tipo_de_ahorro=2;
select saldo_de_interes into v_saldo_de_interes from ahorros where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c;
select saldo_de_ahorro into v_saldo_de_ahorro from ahorros where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c;
 v_interes:=calcular_interes(v_saldo_de_ahorro,v_tasa_de_interes);
if v_indice.tipo_de_ahorro=2 THEN
update ahorros
set tasa_de_interes=v_tasa_de_interes,saldo_de_ahorro=v_saldo_de_ahorro+v_saldo_de_interes,saldo_de_interes=v_interes,usuario=user,fecha_de_modificacion=sysdate
where cod_sucursal=v_indice.cod_sucursal and id_c=v_indice.Id_c;
 
end if;
end loop;
 
 EXCEPTION 
         WHEN dup_val_on_index THEN 
              p_estado:='Este valor ya existe';
         WHEN others THEN
              p_estado:='No se ha creado el registro...';
commit;
end Actualizacion_corriente;
/
SET SERVEROUTPUT ON
declare
v_estado varchar(50);
begin
Actualizacion_corriente(v_estado);
dbms_output.put_line(v_estado);
end;
/