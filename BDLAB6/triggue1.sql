create or replace trigger T_sucursales AFTER UPDATE ON ahorros for each row 
declare
VmontoF ahorros.saldo_de_ahorro%type;
v_prueba number(25);
BEGIN
 dbms_output.put_line('se ha ejecutado el trigger T_sucursales con exito');
VmontoF := :NEW.saldo_de_ahorro - :OLD.saldo_de_ahorro;
update sucursal set monto_ahorrado = monto_ahorrado+VmontoF where tipo_de_ahorro=:new.tipo_de_ahorro and  cod_sucursal=:new.cod_sucursal;
dbms_output.put_line(vmontof);
end T_sucursales;
/