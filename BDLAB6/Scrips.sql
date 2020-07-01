Create table Sucursal(
cod_sucursal number(10),
nombre_sucursal varchar(15),
monto_prestamo number(10),
monto_ahorrado varchar(15),
tipo_prestamo  number(15),
tipo_de_ahorro number(10),
Constraint pk_id_sucursal 
Primary key (cod_sucursal,tipo_de_ahorro)
);



Create table Tipo_ahorro(
    tipo_de_ahorro number(10),
    descripcion varchar(30),
    tasa_de_interes number(10),
    Constraint pk_tipo_ahorro 
    Primary key (tipo_de_ahorro)
    );



Create table ahorros(
    numero_de_cuenta number(6),
    cod_sucursal number(10),
    id_C number(6),
    tipo_de_ahorro number(10),
    fecha_de_apertura date,
    tasa_de_interes number(10),
    letra_depositvo_mensual number(10),
    saldo_de_ahorro number(10),
    saldo_de_interes number(10),
    fecha_de_deposito varchar(15),
    fecha_de_retiro varchar(15),
    usuario varchar(15),
    fecha_de_modificacion date,
    Constraint pk_ahorros 
    Primary key (numero_de_cuenta),
    Constraint fk_ahorros_sucursal  
    foreign key(cod_sucursal,tipo_de_ahorro)
    references sucursal(cod_sucursal,tipo_de_ahorro),
    Constraint fk_ahorros_id_c
    foreign key(id_C)
    references Cliente(ID_C)
);



Create table auditoria(
    id_transaccion number(10),
    numero_de_cuenta number(10),
    tabla varchar2(20),
    ID_C number(6),
    tipo_de_ahorro number(10),
    tipo_de_transaccion number(10),
    saldo_cuenta_antes number(10),
    monto_deposito_retiro number(10),
    saldo_final number(10),
    usuario varchar(15),
    fecha varchar(20),
    Constraint pk_id_transaccion
    Primary key (id_transaccion),
    constraint fk_auditoria_ID_C
    Foreign Key (ID_C) 
    References Cliente(ID_C), 
    constraint fk_audioria_tipo
    Foreign Key (tipo_de_ahorro) 
    References tipo_ahorro(tipo_de_ahorro),
     constraint fk_audioria_numero
    Foreign Key (numero_de_cuenta) 
    References ahorros(numero_de_cuenta)
);



create table transadeporeti(
    id_transadeporeti number(10),
    cod_sucursal number(10),
    ID_C number(6),
    tipo_de_ahorro number(10),
    tipo_de_transaccion number(10),
    Fecha_transaccion date,
    monto_deposito_retiro number(10),
    fecha_insercion date,
    usuario varchar(15),
    Constraint pk_id_transadeporeti
    Primary key (id_transadeporeti),
    constraint fk_transadeporeti_cod_sucursal
    Foreign Key (cod_sucursal,tipo_de_ahorro) 
    References Sucursal(cod_sucursal,tipo_de_ahorro), 
    constraint fk_transadeporeti_tipo_ahorro
    Foreign Key (tipo_de_ahorro) 
    References tipo_ahorro(tipo_de_ahorro)  
);



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
   INSERT INTO auditoria VALUES (secuencia_id_transaccion.NEXTVAL, :OLD.numero_de_cuenta,:OLD.ID_C,:old.tipo_de_ahorro,v_tipo_de_transaccion,:OLD.saldo_de_ahorro,v_saldot,:new.saldo_de_ahorro,user,sysdate);
END I_auditoria;
/

/*-----------------*/
/*-----selects*/
select * from sucursal;
select * from ahorros;
select * from auditoria;
select * from transadeporeti;
select * from cliente;
select * from profesion;
select * from tipo_ahorro;
