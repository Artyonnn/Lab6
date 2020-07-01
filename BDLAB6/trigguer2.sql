CREATE SEQUENCE secuencia_id_transaccion
start with 1
increment by 1
maxvalue 99999
minvalue 1;
/
CREATE or REPLACE TRIGGER I_auditoria BEFORE UPDATE
  ON ahorros FOR EACH ROW
  declare
  V_saldoT  transadeporeti.monto_deposito_retiro%type;
  v_tipo_de_transaccion   transadeporeti.tipo_de_transaccion%type;
BEGIN
   dbms_output.put_line('se ha ejecutado el trigger I_auditoria con exito');
    V_saldoT := :NEW.saldo_de_ahorro - :OLD.saldo_de_ahorro;
   if (V_saldoT <= 0) THEN
   v_tipo_de_transaccion:=2;
   v_saldot:=-1*(v_saldot);
   ELSE
   v_tipo_de_transaccion:=1; 
   END IF;
   INSERT INTO auditoria VALUES (secuencia_id_transaccion.NEXTVAL, :OLD.numero_de_cuenta,'Ahorros',:OLD.ID_C,:old.tipo_de_ahorro,v_tipo_de_transaccion,:OLD.saldo_de_ahorro,v_saldot,:new.saldo_de_ahorro,user,sysdate);
END I_auditoria;
/