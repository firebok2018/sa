DROP DATABASE IF EXISTS DEK_ELECTRIC;

CREATE DATABASE DEK_ELECTRIC;

USE DEK_ELECTRIC;

CREATE TABLE TB_DISTRITO(
cod_dis		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
nom_dis		VARCHAR(40)							-- NOMBRE
);


CREATE TABLE TB_EMPLEADO(
cod_emp		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
tip_emp		CHAR(3),							-- TIPO (ADM: ADMNINISTRADOR, VEN: VENDEDOR, CAJ: CAJERO, ALM: ALMACENERO)
nom_emp 	VARCHAR(30),						-- NOMBRES
ape_emp 	VARCHAR(30),						-- APELLIDOS
dni_emp		CHAR(8),							-- NÚMERO DE DNI
fna_emp 	DATE,								-- FECHA DE NACIMIENTO
tel_emp		VARCHAR(15),						-- TELÉFONO
dir_emp		VARCHAR(70),						-- DIRECCIÓN
cod_dis		INT	REFERENCES TB_DISTRITO,			-- CÓDIGO DE DISTRITO
fin_emp 	DATE								-- FECHA DE INGRESO 
);


CREATE TABLE TB_USUARIO(
cod_usu		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO DE USUARIO
cod_emp		INT	REFERENCES TB_EMPLEADO,			-- CÓDIGO DE EMPLEADO
log_usu		VARCHAR(8),							-- LOGIN
pas_usu		VARCHAR(8)							-- PASSWORD
);
 

CREATE TABLE TB_CLIENTE(
cod_cli 	INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
rsn_cli 	VARCHAR(60),							-- RAZÓN SOCIAL O NOMBRE
rdn_cli 	VARCHAR(11),						-- RUC O DNI
dir_cli 	VARCHAR(50),						-- DIRECCIÓN
cod_dis		INT	REFERENCES TB_DISTRITO,			-- CÓDIGO DE DISTRITO
tel_cli 	VARCHAR(15),						-- TELÉFONO
ema_cli		VARCHAR(40),						-- EMAIL
tip_cli 	CHAR(1)								-- TIPO (0: NATURAL, 1: JURÍDICO)
);


CREATE TABLE TB_PROVEEDOR(
cod_prv 	INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
rso_prv 	VARCHAR(60),						-- RAZÓN SOCIAL
ruc_prv		VARCHAR(11),						-- RUC
dir_prv 	VARCHAR(70),						-- DIRECCIÓN
tel_prv 	VARCHAR(15),						-- TELÉFONO
ema_prv 	VARCHAR(40),						-- EMAIL
rep_prv 	VARCHAR(80)							-- REPRESENTANTE DE VENTAS
);


CREATE TABLE TB_CUENTA(
cod_cue		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO DE CUENTA
cod_prv 	INT REFERENCES TB_PROVEEDOR,		-- CÓDIGO DE PROVEEDOR
nro_cue		VARCHAR(30),						-- NÚMERO DE CUENTA
ban_cue		VARCHAR(30),						-- BANCO
tip_cue		CHAR(1)								-- TIPO DE CUENTA (A:AHORROS, C: CORRIENTE)
);


CREATE TABLE TB_TRANSPORTISTA(
cod_tra		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
rso_tra		VARCHAR(60),						-- RASÓN SOCIAL DE EMPRESA DE TRANSPORTES
ruc_tra		VARCHAR(11),						-- RUC
con_tra		VARCHAR(40),						-- CONTACTO
tel_tra		VARCHAR(15)							-- TELÉFONO
);


CREATE TABLE TB_CATEGORIA(
cod_cat		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
des_cat		VARCHAR(40)							-- DESCRIPCIÓN
);


CREATE TABLE TB_MARCA(
cod_mar		INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
des_mar		VARCHAR(40)							-- DESCRIPCIÓN
);


CREATE TABLE TB_PRODUCTO(
cod_pro 	INT AUTO_INCREMENT PRIMARY KEY,		-- CÓDIGO
cod_cat 	INT REFERENCES TB_CATEGORIA,		-- CATEGORÍA
des_pro  	VARCHAR(50),						-- DESCRIPCIÓN
cod_mar		INT REFERENCES TB_MARCA,			-- MARCA
pre_pro 	DECIMAL(10,2),							-- PRECIO
sta_pro 	INT,								-- STOCK ACTUAL
stm_pro 	INT,								-- STOCK MÍNIMO
unm_pro		VARCHAR(30),						-- UNIDAD DE MEDIDA
imp_pro 	CHAR(1),							-- SI ES IMPORTADO O NO
est_pro		CHAR(1)								-- ESTADO
);


CREATE TABLE TB_VENTA(	
num_ven 	INT AUTO_INCREMENT PRIMARY KEY,		-- NÚMERO DE VENTA
fec_ven 	DATE,								-- FECHA
cod_cli 	INT REFERENCES TB_CLIENTE,			-- CÓDIGO DE CLIENTE
est_ven 	CHAR(1),							-- ESTADO DE VENTA (1: CANCELADO, 0: PENDIENTE)
cod_emp		INT	REFERENCES TB_EMPLEADO			-- CÓDIGO DE EMPLEADO
);


CREATE TABLE TB_DETALLE_VENTA(
num_ven 	INT REFERENCES TB_VENTA,			-- NÚMERO DE VENTA
cod_pro 	INT REFERENCES TB_PRODUCTO,			-- CÓDIGO DE PRODUCTO
can_ven 	INT, 								-- CANTIDAD
PRIMARY KEY (num_ven,cod_pro)
);


CREATE TABLE TB_ORDEN_COMPRA(
num_oco 	INT AUTO_INCREMENT PRIMARY KEY,		-- NÚMERO DE ORDEN DE COMPRA
fec_oco 	DATE,								-- FECHA
cod_prv 	INT REFERENCES TB_PROVEEDOR,		-- CÓDIGO DE PROVEEDOR
cod_tra		INT REFERENCES TB_TRANSPORTISTA,	-- CÓDIGO DE EMPRESA DE TRANSPORTES
cod_emp		INT REFERENCES TB_EMPLEADO			-- CÓDIGO DE EMPLEADO
);


CREATE TABLE TB_DETALLE_COMPRA(
num_oco 	INT  REFERENCES TB_ORDEN_COMPRA,	-- NÚMERO DE ORDEN DE COMPRA
cod_pro 	INT  REFERENCES TB_PRODUCTO,		-- CÓDIGO DE PRODUCTO
can_ped 	INT,								-- CANTIDAD DE PEDIDO
pre_com		DECIMAL(10,2),						-- PRECIO DE COMPRA DE PRODUCTO
PRIMARY KEY (num_oco,cod_pro)
);


CREATE  TABLE TB_ABASTECIMIENTO(
cod_prv 	INT REFERENCES TB_PROVEEDOR,		-- CÓDIGO DE PROVEEDOR
cod_pro 	INT REFERENCES TB_PRODUCTO,			-- CÓDIGO DE PRODUCTO
pre_aba 	DECIMAL(10,2),						-- PRECIO DE ABASTECIMIENTO
PRIMARY KEY (cod_prv,cod_pro)
);

-- ----------------------------------------------------------------------------------
-- ***************************
-- INGRESANDO DATOS DE PRUEBA
-- ***************************
-- DISTRITO
INSERT INTO TB_DISTRITO VALUES(1,'CERRO COLORADO');
INSERT INTO TB_DISTRITO VALUES(2,'CAYMA');
INSERT INTO TB_DISTRITO VALUES(3,'SELVA ALEGRE');

-- USUARIO
INSERT INTO TB_USUARIO VALUES(1,1,'diego','diego');
INSERT INTO TB_USUARIO VALUES(2,2,'dnillson','dnillson');
INSERT INTO TB_USUARIO VALUES(3,3,'waldir','waldir');
INSERT INTO TB_USUARIO VALUES(4,4,'juan','juan');
INSERT INTO TB_USUARIO VALUES(5,5,'edgar','edgar');
INSERT INTO TB_USUARIO VALUES(6,6,'gian','gian');

-- EMPLEADO
INSERT INTO TB_EMPLEADO VALUES(1,'VEN','DIEGO','ZUNI','87458725','2003-12-07','987545458','AV. CIBERTEC S/N',1,CURDATE());
INSERT INTO TB_EMPLEADO VALUES(2,'ADM','DNILLSON','MEDRANO','25478425','2007-05-07','918348719','AV. CIBERTEC S/N',2,CURDATE());
INSERT INTO TB_EMPLEADO VALUES(3,'VEN','WALDIR','PANTA','25458725','2017-02-07','917354781','AV. CIBERTEC S/N',3,CURDATE());
INSERT INTO TB_EMPLEADO VALUES(4,'VEN','JUAN','ESPINOZA','25458725','2017-02-07','917354781','AV. CIBERTEC S/N',3,CURDATE());
INSERT INTO TB_EMPLEADO VALUES(5,'VEN','EDGAR','LOVATÓN','25458725','2017-02-07','917354781','AV. CIBERTEC S/N',3,CURDATE());
INSERT INTO TB_EMPLEADO VALUES(6,'VEN','GIANCARLO','MENDOZA','25458725','2017-02-07','917354781','AV. CIBERTEC S/N',3,CURDATE());


SELECT * FROM TB_EMPLEADO;

-- CLIENTE
INSERT INTO TB_CLIENTE VALUES(1,'FINSETH','1824369834','AV. LOS VIÑEDOS 100',1,'4342318','CONTACTO@FINSETH.COM','1');
INSERT INTO TB_CLIENTE VALUES(2,'ELECTRIC AQP','10245874520','AV. LOS PARDOS 150',2,'8754545','CONTACTO@ELECTRICAQP.COM','1');
INSERT INTO TB_CLIENTE VALUES(3,'LUIS ESCOLARI','19325102584','Av. LOS CLAVELES 200',3,'2819464','LUIS.ESCOLARI@GMAIL.COM','0');

SELECT * FROM TB_CLIENTE;

-- PROVEEDOR
INSERT INTO TB_PROVEEDOR VALUES(1,'DIELECTRIC SAC','10842584586','AV. LOS GERANIOS 1875','4330895','CONTACTO@DIELECTRIC.COM','LUS SALAS');
INSERT INTO TB_PROVEEDOR VALUES(2,'ALTATENSION SA','20145845250','AV. LOS ÁLAMOS 545','4330895','CONTACTO@ALTATENSION.COM','CARLOS LOPEZ');
INSERT INTO TB_PROVEEDOR VALUES(3,'CORTOCIRCUITO EIRL','84682514781','AV. INDUSTRIAL 325','4330895','CONTACTO@CORTOCIRCUITO.COM',',MERY MANRIQUEZ');

SELECT * FROM TB_PROVEEDOR;

-- CUENTA
INSERT INTO TB_CUENTA VALUES(1,1,'124-54587487878-2545','BANCO DE CREDITO','C');
INSERT INTO TB_CUENTA VALUES(2,2,'545-5454545','SCOTIABANK','C');
INSERT INTO TB_CUENTA VALUES(3,3,'54545-5545454554','BANCO CONTINENTAL','C');

-- TRANSPORTISTA
INSERT INTO TB_TRANSPORTISTA VALUES(1,'SECURE SPEEDY SAC','58421584185','LUS SALAS','912457845');
INSERT INTO TB_TRANSPORTISTA VALUES(2,'FAST OK EIRL','12584126953','GERARDO PEREZ','912457845');
INSERT INTO TB_TRANSPORTISTA VALUES(3,'CONFIABILITY SA','12412584582','LUZ CARDENAS','912457845');

-- CATEGORIA
INSERT INTO TB_CATEGORIA VALUES(1,'CABLES');
INSERT INTO TB_CATEGORIA VALUES(2,'FLUORESCENTES');
INSERT INTO TB_CATEGORIA VALUES(3,'INTERRUPTORES');

SELECT * FROM TB_CATEGORIA;

-- MARCA
INSERT INTO TB_MARCA VALUES(1,'TIZINO');
INSERT INTO TB_MARCA VALUES(2,'SATRA');
INSERT INTO TB_MARCA VALUES(3,'CROWN');

SELECT * FROM TB_MARCA;

-- PRODUCTO
INSERT INTO  TB_PRODUCTO VALUES(1,1,'CABLE DE ALTA TENSION NRO R-7','1',35.15, 100,20,'METRO','F','1');
INSERT INTO  TB_PRODUCTO VALUES(2,2,'FLUORESCENTE LED 50W','2',10.17, 100,20,'UNIDAD','F','1');
INSERT INTO  TB_PRODUCTO VALUES(3,3,'INTERRUPTOR','3',28.14, 100,20,'UNIDAD','F','1');

SELECT * FROM TB_PRODUCTO;

-- VENTA
INSERT INTO TB_VENTA VALUES(1,'2003-10-07','1','0','1');
INSERT INTO TB_VENTA VALUES(2,'2007-04-07','2','0','1');
INSERT INTO TB_VENTA VALUES(3,'2017-03-07','3','0','2');

SELECT * FROM TB_VENTA;

-- DETALLE DE VENTA
INSERT INTO TB_DETALLE_VENTA VALUES(1,'1',3);
INSERT INTO TB_DETALLE_VENTA VALUES(1,'2',1);
INSERT INTO TB_DETALLE_VENTA VALUES(2,'3',2);
INSERT INTO TB_DETALLE_VENTA VALUES(3,'1',1);

SELECT * FROM TB_DETALLE_VENTA;

-- ORDEN DE COMPRA
INSERT INTO TB_ORDEN_COMPRA VALUES(1,'2002-05-07','1','1','1');
INSERT INTO TB_ORDEN_COMPRA VALUES(2,'2008-11-07','2','2','1');
INSERT INTO TB_ORDEN_COMPRA VALUES(3,'2016-01-07','3','2','1');

SELECT * FROM TB_ORDEN_COMPRA;

-- DETALLE DE ORDEN DE COMPRA
INSERT INTO TB_DETALLE_COMPRA VALUES(1,2,100,12);
INSERT INTO TB_DETALLE_COMPRA VALUES(2,1,100,15);
INSERT INTO TB_DETALLE_COMPRA VALUES(3,3,100,5);

SELECT * FROM TB_DETALLE_COMPRA;

-- ABASTECIMIENTO
INSERT INTO TB_ABASTECIMIENTO VALUES(1,2,35);
INSERT INTO TB_ABASTECIMIENTO VALUES(2,1,10);
INSERT INTO TB_ABASTECIMIENTO VALUES(3,3,20);

SELECT * FROM TB_ABASTECIMIENTO;

-- ---------------------------------------------------------------------

-- *******************************************************
-- PROCEDIMINETOS ALMACENADOS PARA MANTENIMIENTO DE TABLAS
-- *******************************************************

-- *********
-- DISTRITO 
-- *********

--  USP INSERTAR DISTRITO
DROP PROCEDURE IF EXISTS USP_INSERTAR_DISTRITO;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_DISTRITO(COD INT, NOM VARCHAR(40))
BEGIN
	INSERT INTO TB_DISTRITO VALUES(COD,NOM);
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_INSERTAR_DISTRITO(NULL,'YANAHUARA');
SELECT * FROM TB_DISTRITO;


-- USP ACTUALIZAR DISTRITO
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_DISTRITO;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_DISTRITO(COD INT, NOM VARCHAR(40))
BEGIN
	UPDATE TB_DISTRITO SET nom_dis=NOM WHERE cod_dis=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ACTUALIZAR_DISTRITO(4,'CANALETAS');
SELECT * FROM TB_DISTRITO;


-- USP ELIMINAR DISTRITO
DROP PROCEDURE IF EXISTS USP_ELIMINAR_DISTRITO;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_DISTRITO(COD INT)
BEGIN
	DELETE FROM TB_DISTRITO WHERE cod_dis=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ELIMINAR_DISTRITO(4);
SELECT * FROM TB_DISTRITO;


-- USP LISTAR DISTRITO
DROP PROCEDURE IF EXISTS USP_LISTAR_DISTRITO;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_DISTRITO()
BEGIN
	SELECT * FROM TB_DISTRITO;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_DISTRITO();

-- ------------------------------------------------------------
-- *********
-- CATEGORIA 
-- *********

--  USP INSERTAR CATEGORIA
DROP PROCEDURE IF EXISTS USP_INSERTAR_CATEGORIA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_CATEGORIA(COD INT, DES VARCHAR(40))
BEGIN
	INSERT INTO TB_CATEGORIA VALUES(COD,DES);
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_INSERTAR_CATEGORIA(NULL,'CANALETAS');
SELECT * FROM TB_CATEGORIA;


-- USP ACTUALIZAR CATEGORÍA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_CATEGORIA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_CATEGORIA(COD INT, DES VARCHAR(40))
BEGIN
	UPDATE TB_CATEGORIA SET DES_CAT=DES WHERE COD_CAT=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ACTUALIZAR_CATEGORIA(4,'CANALETAS');
SELECT * FROM TB_CATEGORIA;


-- USP ELIMINAR CATEGORÍA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_CATEGORIA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_CATEGORIA(COD INT)
BEGIN
	DELETE FROM TB_CATEGORIA WHERE COD_CAT=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ELIMINAR_CATEGORIA(4);
SELECT * FROM TB_CATEGORIA;


-- USP LISTAR CATEGORÍA
DROP PROCEDURE IF EXISTS USP_LISTAR_CATEGORIA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_CATEGORIA()
BEGIN
	SELECT * FROM TB_CATEGORIA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_CATEGORIA();

-- ------------------------------------------------------------
-- *****
-- MARCA
-- *****

-- USP INSERTAR MARCA
DROP PROCEDURE IF EXISTS USP_INSERTAR_MARCA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_MARCA(COD INT, DES VARCHAR(40))
BEGIN
	INSERT INTO TB_MARCA VALUES(COD,DES);
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_INSERTAR_MARCA(4,'CIBERTEC');
SELECT * FROM TB_MARCA;


-- USP ACTUALIZAR MARCA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_MARCA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_MARCA(COD INT, DES VARCHAR(40))
BEGIN
	UPDATE TB_MARCA SET DES_MAR=DES WHERE COD_MAR=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ACTUALIZAR_MARCA(4,'CIBERTEC PERU');
SELECT * FROM TB_MARCA;


-- USP ELIMINAR MARCA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_MARCA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_MARCA(COD INT)
BEGIN
	DELETE FROM TB_MARCA WHERE COD_MAR=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ELIMINAR_MARCA(4);
SELECT * FROM TB_MARCA;


-- USP LISTAR MARCA
DROP PROCEDURE IF EXISTS USP_LISTAR_MARCA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_MARCA()
BEGIN
	SELECT * FROM TB_MARCA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_MARCA();

-- ------------------------------------------------------------
-- ********
-- PRODUCTO
-- ********

-- USP INSERTAR PRODUCTO
DROP PROCEDURE IF EXISTS USP_INSERTAR_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_PRODUCTO(CODP INT, CODC INT, DES VARCHAR(50), CODM INT, PRE DECIMAL(10,2), STA INT, STM INT, UNM VARCHAR(30), IMP CHAR(1), EST CHAR(1))
BEGIN
	INSERT INTO TB_PRODUCTO VALUES(CODP, CODC, DES, CODM, PRE, STA, STM, UNM, IMP, EST);
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_INSERTAR_PRODUCTO('4','1','PRODUCTO DE PRUEBA','2',14.5,100,50,'UNIDAD','V','1');
SELECT * FROM TB_PRODUCTO;


-- USP ACTUALIZAR PRODUCTO
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_PRODUCTO(CODP INT, CODC INT, DES VARCHAR(50), CODM INT, PRE DECIMAL(10,2), STA INT, STM INT, UNM VARCHAR(30), IMP CHAR(1), EST CHAR(1))
BEGIN
	UPDATE TB_PRODUCTO SET COD_CAT=CODC, DES_PRO=DES, COD_MAR=CODM, PRE_PRO=PRE, STA_PRO=STA, STM_PRO=STM, UNM_PRO=UNM, IMP_PRO=IMP, EST_PRO=EST
WHERE COD_PRO=CODP;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ACTUALIZAR_PRODUCTO('4','1','PRODUCTO DE ENSAYO','1',20.17,50,20,'UNIDAD','F','2');
SELECT * FROM TB_PRODUCTO;


-- USP ELIMINAR PRODUCTO
DROP PROCEDURE IF EXISTS USP_ELIMINAR_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_PRODUCTO(COD INT)
BEGIN
	DELETE FROM TB_PRODUCTO WHERE COD_PRO=COD;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_ELIMINAR_PRODUCTO(4);
SELECT * FROM TB_PRODUCTO;


-- USP LISTAR PRODUCTO
DROP PROCEDURE IF EXISTS USP_LISTAR_PRODUCTO;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_PRODUCTO()
BEGIN
	SELECT * FROM TB_PRODUCTO;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_PRODUCTO();


-- ********
-- EMPLEADO
-- ********

-- USP INSERTAR EMPLEADO
DROP PROCEDURE IF EXISTS USP_INSERTAR_EMPLEADO;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_EMPLEADO(
CODE INT,TIPE CHAR(3),NOME VARCHAR(30),APEE VARCHAR(30),
DNIE CHAR(8),FNAE DATE,TELE VARCHAR(15),DIRE VARCHAR(70),
CODD INT,FINE DATE)
BEGIN
	INSERT INTO TB_EMPLEADO VALUES(
CODE,TIPE,NOME,APEE,DNIE,FNAE ,
TELE ,DIRE ,CODD ,FINE);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_EMPLEADO( );
-- SELECT * FROM TB_EMPLEADO;


-- USP ACTUALIZAR EMPLEADO
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_EMPLEADO;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_EMPLEADO(CODE INT,TIPE CHAR(3),
NOME VARCHAR(30),APEE VARCHAR(30),DNIE CHAR(8),FNAE DATE,
TELE VARCHAR(15),DIRE VARCHAR(70),CODD INT,FINE DATE)
BEGIN
	UPDATE TB_EMPLEADO SET tip_emp=TIPE,nom_emp=NOME,ape_emp=APEE,dni_emp=DNIE,
	fna_emp=FNAE ,tel_emp=TELE ,dir_emp=DIRE ,cod_dis=CODD ,fin_emp=FINE
WHERE cod_emp=CODE;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_EMPLEADO();
-- SELECT * FROM TB_EMPLEADO;


-- USP ELIMINAR EMPLEADO
DROP PROCEDURE IF EXISTS USP_ELIMINAR_EMPLEADO;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_EMPLEADO(COD INT)
BEGIN
	DELETE FROM TB_EMPLEADO WHERE cod_emp=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_EMPLEADO();
-- SELECT * FROM TB_EMPLEADO;


-- USP LISTAR EMPLEADO
DROP PROCEDURE IF EXISTS USP_LISTAR_EMPLEADO;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_EMPLEADO()
BEGIN
	SELECT * FROM TB_EMPLEADO;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_EMPLEADO();

-- ------------------------------------------------------------
-- ********
-- USUARIO
-- ********

-- USP INSERTAR USUARIO
DROP PROCEDURE IF EXISTS USP_INSERTAR_USUARIO;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_USUARIO(CODU INT,CODE INT,
LOGU VARCHAR(8),PASU VARCHAR(8))
BEGIN
	INSERT INTO TB_USUARIO VALUES(CODU ,CODE ,
LOGU ,PASU);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_USUARIO();
-- SELECT * FROM TB_USUARIO;


-- USP ACTUALIZAR USUARIO
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_USUARIO;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_USUARIO(CODU INT,CODE INT,
LOGU VARCHAR(8),PASU VARCHAR(8))
BEGIN
	UPDATE TB_USUARIO SET cod_emp=CODE,
    log_usu=LOGU ,pas_usu=PASU
WHERE cod_usu=CODU;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_USUARIO();
-- SELECT * FROM TB_USUARIO;


-- USP ELIMINAR USUARIO
DROP PROCEDURE IF EXISTS USP_ELIMINAR_USUARIO;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_USUARIO(COD INT)
BEGIN
	DELETE FROM TB_USUARIO WHERE cod_usu=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_USUARIO();
-- SELECT * FROM TB_USUARIO;


-- USP LISTAR USUARIO
DROP PROCEDURE IF EXISTS USP_LISTAR_USUARIO;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_USUARIO()
BEGIN
	SELECT * FROM TB_USUARIO;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_USUARIO();

-- ------------------------------------------------------------
-- ********
-- CLIENTE
-- ********

-- USP INSERTAR CLIENTE
DROP PROCEDURE IF EXISTS USP_INSERTAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_CLIENTE(
CODC INT,RSNC CHAR(60),RDNC VARCHAR(11),
DIRC VARCHAR(50),CODD INT,TELC VARCHAR(15),
EMAC	VARCHAR(40),TIPC CHAR(1))
BEGIN
	INSERT INTO TB_CLIENTE VALUES(
CODC,RSNC,RDNC,
DIRC,CODD,TELC,
EMAC,TIPC);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_CLIENTE();
-- SELECT * FROM TB_CLIENTE;


-- USP ACTUALIZAR CLIENTE
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_CLIENTE(CODC INT,RSNC CHAR(60),RDNC VARCHAR(11),
DIRC VARCHAR(50),CODD INT,TELC VARCHAR(15),
EMAC	VARCHAR(40),TIPC CHAR(1))
BEGIN
	UPDATE TB_CLIENTE SET 
	rsn_cli=RSNC,rdn_cli=RDNC,
    dir_cli=DIRC,cod_dis=CODD,tel_cli=TELC,
    ema_cli=EMAC,tip_cli=TIPC
WHERE cod_cli=CODC;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_CLIENTE();
-- SELECT * FROM TB_CLIENTE;


-- USP ELIMINAR CLIENTE
DROP PROCEDURE IF EXISTS USP_ELIMINAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_CLIENTE(COD INT)
BEGIN
	DELETE FROM TB_CLIENTE WHERE cod_cli=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_CLIENTE();
-- SELECT * FROM TB_CLIENTE;


-- USP LISTAR CLIENTE
DROP PROCEDURE IF EXISTS USP_LISTAR_CLIENTE;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_CLIENTE()
BEGIN
	SELECT * FROM TB_CLIENTE;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_CLIENTE();

-- ------------------------------------------------------------
-- ********
-- PROVEEDOR
-- ********

-- USP INSERTAR PROVEEDOR
DROP PROCEDURE IF EXISTS USP_INSERTAR_PROVEEDOR;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_PROVEEDOR(
CODPO INT,RSOPO VARCHAR(60),RUCPO VARCHAR(11),
DIRPO VARCHAR(70),TELPO VARCHAR(15),
EMAPO VARCHAR(40),REPV VARCHAR(80))
BEGIN
	INSERT INTO TB_PROVEEDOR VALUES(
	CODPO,RSOPO,RUCPO,
    DIRPO,TELPO,
    EMAPO,REPV);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_PROVEEDOR();
-- SELECT * FROM TB_PROVEEDOR;


-- USP ACTUALIZAR PROVEEDOR
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_PROVEEDOR;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_PROVEEDOR(
CODPO INT,RSOPO VARCHAR(60),RUCPO VARCHAR(11),
DIRPO VARCHAR(70),TELPO VARCHAR(15),
EMAPO VARCHAR(40),REPV VARCHAR(80))
BEGIN
	UPDATE TB_PROVEEDOR SET 
	rso_prv=RSOPO,ruc_prv=RUCPO,
    dir_prv=DIRPO,tel_prv=TELPO,
    ema_prv=EMAPO,rep_ven=REPV
WHERE cod_prv=CODPO;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_PROVEEDOR();
-- SELECT * FROM TB_PROVEEDOR;


-- USP ELIMINAR PROVEEDOR
DROP PROCEDURE IF EXISTS USP_ELIMINAR_PROVEEDOR;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_PROVEEDOR(COD INT)
BEGIN
	DELETE FROM TB_PROVEEDOR WHERE cod_prv=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_PROVEEDOR();
-- SELECT * FROM TB_PROVEEDOR;


-- USP LISTAR PROVEEDOR
DROP PROCEDURE IF EXISTS USP_LISTAR_PROVEEDOR;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_PROVEEDOR()
BEGIN
	SELECT * FROM TB_PROVEEDOR;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_PROVEEDOR();

-- ------------------------------------------------------------
-- ********
-- CUENTA
-- ********

-- USP INSERTAR CUENTA
DROP PROCEDURE IF EXISTS USP_INSERTAR_CUENTA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_CUENTA(
CODCU INT,CODP INT,
NROCU VARCHAR(30),BANCU VARCHAR(30),
TIPCU CHAR(1))
BEGIN
	INSERT INTO TB_CUENTA VALUES(
	CODCU,CODP,
    NROCU,BANCU,
    TIPCU );
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_CUENTA();
-- SELECT * FROM TB_CUENTA;


-- USP ACTUALIZAR CUENTA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_CUENTA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_CUENTA(CODCU INT,CODP INT,
NROCU VARCHAR(30),BANCU VARCHAR(30),
TIPCU CHAR(1))
BEGIN
	UPDATE TB_CUENTA SET 
	cod_prv=CODP,nro_cue=NROCU,
	ban_cue=BANCU,tip_cue=TIPCU
WHERE cod_cue=CODCU;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_CUENTA();
-- SELECT * FROM TB_CUENTA;


-- USP ELIMINAR CUENTA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_CUENTA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_CUENTA(COD INT)
BEGIN
	DELETE FROM TB_CUENTA WHERE cod_cue=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_CUENTA();
-- SELECT * FROM TB_CUENTA;


-- USP LISTAR CUENTA
DROP PROCEDURE IF EXISTS USP_LISTAR_CUENTA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_CUENTA()
BEGIN
	SELECT * FROM TB_CUENTA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_CUENTA();

-- ------------------------------------------------------------
-- *************
-- TRANSPORTISTA
-- *************

-- USP INSERTAR TRANSPORTISTA
DROP PROCEDURE IF EXISTS USP_INSERTAR_TRANSPORTISTA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_TRANSPORTISTA(
CODT INT,RSOT VARCHAR(60),RUCT	VARCHAR(11),
CONT VARCHAR(40),TELT VARCHAR(15))
BEGIN
	INSERT INTO TB_TRANSPORTISTA VALUES(
	CODT,RSOT,RUCT,
    CONT,TELT);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_TRANSPORTISTA();
-- SELECT * FROM TB_TRANSPORTISTA;


-- USP ACTUALIZAR TRANSPORTISTA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_TRANSPORTISTA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_TRANSPORTISTA(
CODT INT,RSOT VARCHAR(60),RUCT	VARCHAR(11),
CONT VARCHAR(40),TELT VARCHAR(15))
BEGIN
	UPDATE TB_TRANSPORTISTA SET 
	ros_tra=RSOT,ruc_tra=RUCT,
    con_tra=CONT,tel_tra=TELT
WHERE cod_tra=CODT;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_TRANSPORTISTA();
-- SELECT * FROM TB_TRANSPORTISTA;


-- USP ELIMINAR TRANSPORTISTA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_TRANSPORTISTA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_TRANSPORTISTA(COD INT)
BEGIN
	DELETE FROM TB_TRANSPORTISTA WHERE cod_tra=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_TRANSPORTISTA();
-- SELECT * FROM TB_TRANSPORTISTA;


-- USP LISTAR TRANSPORTISTA
DROP PROCEDURE IF EXISTS USP_LISTAR_TRANSPORTISTA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_TRANSPORTISTA()
BEGIN
	SELECT * FROM TB_TRANSPORTISTA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_TRANSPORTISTA();

-- ------------------------------------------------------------
-- *************
-- VENTA
-- *************

-- USP INSERTAR VENTA
DROP PROCEDURE IF EXISTS USP_INSERTAR_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_VENTA(NUMV INT,FECV DATE,CODC INT,ESTV CHAR(1),COD_E INT)
BEGIN
	INSERT INTO TB_VENTA VALUES(
	NUMV,FECV,CODC,
    ESTV ,COD_E);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_VENTA();
-- SELECT * FROM TB_VENTA;


-- USP ACTUALIZAR VENTA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_VENTA(
NUMV INT,FECV DATE,CODC INT,
ESTV CHAR(1),COD_E INT)
BEGIN
	UPDATE TB_VENTA SET 
	fec_ven=FECV,cod_cli=CODC,
    est_ven=ESTV ,cod_emp=COD_E
WHERE num_ven=NUMV;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_VENTA();
-- SELECT * FROM TB_VENTA;


-- USP ELIMINAR VENTA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_VENTA(COD INT)
BEGIN
	DELETE FROM TB_VENTA WHERE num_ven=COD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_VENTA();
-- SELECT * FROM TB_VENTA;


-- USP LISTAR VENTA
DROP PROCEDURE IF EXISTS USP_LISTAR_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_VENTA()
BEGIN
	SELECT * FROM TB_VENTA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_VENTA();

-- ------------------------------------------------------------
-- *************
-- DETALLE_VENTA
-- *************

-- USP INSERTAR DETALLE_VENTA
DROP PROCEDURE IF EXISTS USP_INSERTAR_DETALLE_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_DETALLE_VENTA(
NUMV INT,CODP INT,CANV INT)
BEGIN
	INSERT INTO TB_DETALLE_VENTA VALUES(
	NUMV,CODP,CANV);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_DETALLE_VENTA();
-- SELECT * FROM TB_DETALLE_VENTA;


-- USP ACTUALIZAR DETALLE_VENTA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_DETALLE_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_DETALLE_VENTA(NUMV INT,CODP INT,CANV INT)
BEGIN
	UPDATE TB_DETALLE_VENTA SET can_ven=CANV 
WHERE num_ven=NUMV AND cod_pro=CODP ;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_DETALLE_VENTA();
-- SELECT * FROM TB_DETALLE_VENTA;


-- USP ELIMINAR DETALLE_VENTA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_DETALLE_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_DETALLE_VENTA(NUMV INT, CODP INT)
BEGIN
	DELETE FROM TB_DETALLE_VENTA WHERE num_ven=NUMV AND cod_pro=CODP;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_DETALLE_VENTA();
-- SELECT * FROM TB_DETALLE_VENTA;


-- USP LISTAR DETALLE_VENTA
DROP PROCEDURE IF EXISTS USP_LISTAR_DETALLE_VENTA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_DETALLE_VENTA()
BEGIN
	SELECT * FROM TB_DETALLE_VENTA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_DETALLE_VENTA();

-- ------------------------------------------------------------
-- *************
-- ORDEN_COMPRA
-- *************

-- USP INSERTAR ORDEN_COMPRA
DROP PROCEDURE IF EXISTS USP_INSERTAR_ORDEN_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_ORDEN_COMPRA(
NUMO INT,FECO DATE,CODP INT,
CODT INT,CODE INT)
BEGIN
	INSERT INTO TB_ORDEN_COMPRA VALUES(
	NUMO,FECO,CODP,
    CODT,CODE);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_ORDEN_COMPRA();
-- SELECT * FROM TB_ORDEN_COMPRA;


-- USP ACTUALIZAR ORDEN_COMPRA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_ORDEN_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_ORDEN_COMPRA(
NUMO INT,FECO DATE,CODP INT,
CODT INT,CODE INT)
BEGIN
	UPDATE TB_ORDEN_COMPRA SET 
	fec_oco=FECO,cod_pro=CODP,
    cod_tra=CODT,cod_emp=CODE
WHERE num_oco=NUMO;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_ORDEN_COMPRA();
-- SELECT * FROM TB_ORDEN_COMPRA;


-- USP ELIMINAR ORDEN_COMPRA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_ORDEN_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_ORDEN_COMPRA(NUM INT)
BEGIN
	DELETE FROM TB_ORDEN_COMPRA WHERE num_oco=NUM;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_ORDEN_COMPRA();
-- SELECT * FROM TB_ORDEN_COMPRA;


-- USP LISTAR ORDEN_COMPRA
DROP PROCEDURE IF EXISTS USP_LISTAR_ORDEN_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_ORDEN_COMPRA()
BEGIN
	SELECT * FROM TB_ORDEN_COMPRA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_ORDEN_COMPRA();

-- ------------------------------------------------------------
-- *************
-- DETALLE_COMPRA
-- *************

-- USP INSERTAR DETALLE_COMPRA
DROP PROCEDURE IF EXISTS USP_INSERTAR_DETALLE_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_DETALLE_COMPRA(
NUMO INT,CODP INT,
CANP INT,PREC DECIMAL(10,2))
BEGIN
	INSERT INTO TB_DETALLE_COMPRA VALUES(
	NUMO,CODP,
    CANP,PREC);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_DETALLE_COMPRA();
-- SELECT * FROM TB_DETALLE_COMPRA;


-- USP ACTUALIZAR DETALLE_COMPRA
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_DETALLE_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_DETALLE_COMPRA(
NUMO INT,CODP INT,
CANP INT,PREC DECIMAL(10,2))
BEGIN
	UPDATE TB_DETALLE_COMPRA SET 
    can_ped=CANP,pre_com=PREC
WHERE num_oco=NUMO AND cod_pro=CODP ;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_DETALLE_COMPRA();
-- SELECT * FROM TB_DETALLE_COMPRA;


-- USP ELIMINAR DETALLE_COMPRA
DROP PROCEDURE IF EXISTS USP_ELIMINAR_DETALLE_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_DETALLE_COMPRA(NUMO INT, CODP INT)
BEGIN
	DELETE FROM TB_DETALLE_COMPRA WHERE num_oco=NUMO AND cod_pro=CODP;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_DETALLE_COMPRA();
-- SELECT * FROM TB_DETALLE_COMPRA;


-- USP LISTAR DETALLE_COMPRA
DROP PROCEDURE IF EXISTS USP_LISTAR_DETALLE_COMPRA;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_DETALLE_COMPRA()
BEGIN
	SELECT * FROM TB_DETALLE_COMPRA;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_DETALLE_COMPRA();

-- ------------------------------------------------------------
-- *************
-- ABASTECIMIENTO
-- *************

-- USP INSERTAR ABASTECIMIENTO
DROP PROCEDURE IF EXISTS USP_INSERTAR_ABASTECIMIENTO;
DELIMITER $$
CREATE PROCEDURE USP_INSERTAR_ABASTECIMIENTO(
CODPR INT,CODP INT,PREA DECIMAL(10,2))
BEGIN
	INSERT INTO TB_ABASTECIMIENTO VALUES(
	CODPR,CODP,PREA);
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_INSERTAR_ABASTECIMIENTO();
-- SELECT * FROM TB_ABASTECIMIENTO;


-- USP ACTUALIZAR ABASTECIMIENTO
DROP PROCEDURE IF EXISTS USP_ACTUALIZAR_ABASTECIMIENTO;
DELIMITER $$
CREATE PROCEDURE USP_ACTUALIZAR_ABASTECIMIENTO(
CODPR INT,CODP INT,PREA DECIMAL(10,2))
BEGIN
	UPDATE TB_ABASTECIMIENTO SET 
	pre_aba=PREA
WHERE cod_prv=CODPR AND cod_pro=CODP ;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ACTUALIZAR_ABASTECIMIENTO();
-- SELECT * FROM TB_ABASTECIMIENTO;


-- USP ELIMINAR ABASTECIMIENTO
DROP PROCEDURE IF EXISTS USP_ELIMINAR_ABASTECIMIENTO;
DELIMITER $$
CREATE PROCEDURE USP_ELIMINAR_ABASTECIMIENTO(CODPV INT, CODPD INT)
BEGIN
	DELETE FROM TB_ABASTECIMIENTO WHERE cod_prv=CODPV AND cod_pro=CODPD;
END $$
DELIMITER ;
-- PROBANDO USP
-- CALL USP_ELIMINAR_ABASTECIMIENTO();
-- SELECT * FROM TB_ABASTECIMIENTO;


-- USP LISTAR ABASTECIMIENTO
DROP PROCEDURE IF EXISTS USP_LISTAR_ABASTECIMIENTO;
DELIMITER $$
CREATE PROCEDURE USP_LISTAR_ABASTECIMIENTO()
BEGIN
	SELECT * FROM TB_ABASTECIMIENTO;
END $$
DELIMITER ;
-- PROBANDO USP
CALL USP_LISTAR_ABASTECIMIENTO();

