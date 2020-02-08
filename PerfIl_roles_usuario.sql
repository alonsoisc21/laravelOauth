
CREATE TABLE usuarios(
id_usuario bigint primary key,
nombres	varchar,
apellido_materno varchar,
apellido_paterno varchar,
alias varchar,
correo	varchar,
f_registro date,
f_alta  date,
f_baja date,
f_edicion date,
h_registro time,
h_alta time,
h_baja time,
h_edicion time,
contrasena varchar,
roles varchar,
status boolean,
token varchar,
telefono varchar,
idusr_alta varchar,
idusr_baja varchar,
idusr_edicion varchar
);

--------------------------------
-----RELACION perfiles_usuarios--------------
--------------------------------
CREATE TABLE perfiles_usuarios(
id_perfilesusuarios bigserial primary key,
id_perfil int,
id_usuario int
);

CREATE TABLE perfiles(
id_perfil bigserial primary key,
codeperdil varchar,
nameperfil varchar
);

--------------------------------
-----RELACION PERFILES_ROLES--------------
--------------------------------
CREATE TABLE perfiles_roles(
id_perfilesroles bigserial primary key,
id_perfil int,
id_role int
);

CREATE TABLE roles(
id_role bigserial primary key,
coderl varchar,
namerl varchar
);

--------------------------------
-----RELACION PERFILES MODULOS-----------
--------------------------------
CREATE TABLE perfiles_modulos(
id_perfilmodulo bigserial primary key,
id_perfil int,
id_modulo int
);



CREATE TABLE modulos(
id_modulo bigserial primary key,
codemodulo varchar,
namemodulo varchar
);

CREATE TABLE modulos_menus(
id_modulosmenus bigserial primary key,
id_modulo int,
id_menu int
)

CREATE TABLE menus(
id_menu bigserial primary key,
namemenu varchar,
linkmenu varchar
);




/***************************************************/
-------RELACIONES DE TABLAS-------------------------
/***************************************************/

---PERFILES TO USUARIOS
ALTER TABLE perfiles_usuarios ADD CONSTRAINT FK_perfiles_usuariosTOusuarios FOREIGN
KEY(id_usuario)
REFERENCES usuarios(id_usuario)
ON DELETE restrict ON UPDATE restrict;


ALTER TABLE perfiles_usuarios ADD CONSTRAINT FK_perfiles_usuariosTOperfiles FOREIGN
KEY(id_perfil)
REFERENCES perfiles(id_perfil)
ON DELETE restrict ON UPDATE restrict;


---PERFILES_ROLES TO PERFILES
ALTER TABLE perfiles_roles ADD CONSTRAINT FK_perfiles_rolesTOperfiles FOREIGN
KEY(id_perfil)
REFERENCES perfiles(id_perfil)
ON DELETE restrict ON UPDATE restrict;


---PERFILES_ROLES TO ROLES
ALTER TABLE perfiles_roles ADD CONSTRAINT FK_perfiles_rolesTOroles FOREIGN
KEY(id_role)
REFERENCES roles(id_role)
ON DELETE restrict ON UPDATE restrict;



---PERFILES_MODULOS TO PERFILES
ALTER TABLE perfiles_modulos ADD CONSTRAINT FK_perfiles_modulosTOperfiles FOREIGN
KEY(id_perfil)
REFERENCES perfiles(id_perfil)
ON DELETE restrict ON UPDATE restrict;


---PERFILES_MODULOS TO MODULOS
ALTER TABLE perfiles_modulos ADD CONSTRAINT FK_perfiles_modulosTOmodulos FOREIGN
KEY(id_modulo)
REFERENCES modulos(id_modulo)
ON DELETE restrict ON UPDATE restrict;


---MODULOS_MENUS TO MODULOS
ALTER TABLE modulos_menus ADD CONSTRAINT FK_modulos_menusTOmodulos FOREIGN
KEY(id_modulo)
REFERENCES modulos(id_modulo)
ON DELETE restrict ON UPDATE restrict;


---MODULOS_MENUS TO MENUS
ALTER TABLE modulos_menus ADD CONSTRAINT FK_modulos_menusTOmenus FOREIGN
KEY(id_menu)
REFERENCES menus(id_menu)
ON DELETE restrict ON UPDATE restrict;




--------------------------------
-----RELACION ROLE--------------
--------------------------------
/******************************************************************************/
/******************************************************************************/
/******************************************************************************/

INSERT INTO usuarios(id_usuario,usuario,contrasenia,nombre,apellidos,f_registro)
VALUES(default,'Antonio','12345','Antonio','Bautista',now());
INSERT INTO usuarios(id_usuario,usuario,contrasenia,nombre,apellidos,f_registro)
VALUES(default,'Jose','12345','Jose','Bautista',now());
INSERT INTO usuarios(id_usuario,usuario,contrasenia,nombre,apellidos,f_registro)
VALUES(default,'Hernandez','12345','Hernandez','Bautista',now());


INSERT INTO  perfiles_usuarios(id_perfilesusuarios,id_perfil,id_usuario) VALUES(default,1,1);
INSERT INTO  perfiles_usuarios(id_perfilesusuarios,id_perfil,id_usuario) VALUES(default,2,2);
INSERT INTO  perfiles_usuarios(id_perfilesusuarios,id_perfil,id_usuario) VALUES(default,3,3);


INSERT INTO  perfiles(id_perfil,codeperdil,nameperfil)VALUES(default,'S1','Super Administrador');
INSERT INTO  perfiles(id_perfil,codeperdil,nameperfil)VALUES(default,'A1','Administrador');
INSERT INTO  perfiles(id_perfil,codeperdil,nameperfil)VALUES(default,'O1','Operador');

--------------------------------
-----RELACION PERFILES_ROLES--------------
--------------------------------
INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,1,1);
INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,1,2);
INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,1,3);
INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,1,4);


INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,2,1);
INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,2,2);
INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,2,3);

INSERT INTO  perfiles_roles(id_perfilesroles,id_perfil,id_role)VALUES(default,3,1);


INSERT INTO  roles(id_role,coderl,namerl)VALUES(default,'r','READ');
INSERT INTO  roles(id_role,coderl,namerl)VALUES(default,'u','UPDATE');
INSERT INTO  roles(id_role,coderl,namerl)VALUES(default,'i','INSERT');
INSERT INTO  roles(id_role,coderl,namerl)VALUES(default,'d','DELETE');


--------------------------------
-----RELACION PERFILES MODULOS-----------
--------------------------------
INSERT INTO  perfiles_modulos(id_perfilmodulo,id_perfil,id_modulo)VALUES(default,1,1);
INSERT INTO  perfiles_modulos(id_perfilmodulo,id_perfil,id_modulo)VALUES(default,2,2);
INSERT INTO  perfiles_modulos(id_perfilmodulo,id_perfil,id_modulo)VALUES(default,3,3);


INSERT INTO  modulos(id_modulo,codemodulo,namemodulo)VALUES(default,'I_SA','Incidentes');
INSERT INTO  modulos(id_modulo,codemodulo,namemodulo)VALUES(default,'I_AD','Incidentes');
INSERT INTO  modulos(id_modulo,codemodulo,namemodulo)VALUES(default,'I_OP','Incidentes');
SELECT * FROM modulos

INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,1,1);
INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,1,2);
INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,1,3);
INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,1,4);

INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,2,1);
INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,2,2);
INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,2,3);

INSERT INTO modulos_menus(id_modulosmenus,id_modulo,id_menu)VALUES(default,3,1);



INSERT INTO  menus(id_menu,namemenu,linkmenu)VALUES(default,'Listar Incidentes','www.listarincidentes.com');
INSERT INTO  menus(id_menu,namemenu,linkmenu)VALUES(default,'Editar Incidenes','www.editarincidentes.com');
INSERT INTO  menus(id_menu,namemenu,linkmenu)VALUES(default,'Registrar Incidentes','www.registrarincidentes.com');
INSERT INTO  menus(id_menu,namemenu,linkmenu)VALUES(default,'Eliminar Incidentes','www.eliminarincidentes.com');



-------------------------------------------------------
------------------------------------------------------
------*******CONSULTAS DE VERIFCACION****************----
SELECT * FROM usuarios;
SELECT * FROM perfiles_usuarios;
SELECT * FROM perfiles;
SELECT * FROM perfiles_roles;
SELECT * FROM roles;
SELECT * FROM perfiles_modulos;
SELECT * FROM modulos;
SELECT * FROM modulos_menus;
SELECT * FROM menus;
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------
-------------------------------------------------------

SELECT usuarios.usuario,perfiles.codeperdil,perfiles.nameperfil  FROM usuarios INNER JOIN perfiles_usuarios ON
usuarios.id_usuario=perfiles_usuarios.id_usuario INNER JOIN perfiles ON
perfiles_usuarios.id_perfil=perfiles.id_perfil

SELECT perfiles.codeperdil,roles.namerl FROM perfiles_roles INNER JOIN  perfiles ON
perfiles_roles.id_perfil=perfiles.id_perfil INNER JOIN roles ON 
perfiles_roles.id_role=roles.id_role WHERE perfiles.codeperdil='O1'



SELECT perfiles.codeperdil,modulos.codemodulo FROM perfiles_modulos INNER JOIN perfiles ON
perfiles_modulos.id_perfil=perfiles.id_perfil INNER JOIN  modulos ON 
perfiles_modulos.id_modulo=modulos.id_modulo 
WHERE perfiles.codeperdil='O1'

/*
SELECT DISTINCT menus.id_menu,menus.namemenu,menus.linkmenu FROM modulos_menus INNER JOIN modulos ON
modulos_menus.id_modulo =modulos.id_modulo INNER JOIN menus ON
modulos_menus.id_menu=menus.id_menu WHERE modulos.codemodulo='I_OP'
*/

SELECT * FROM modulos  INNER JOIN modulos_menus ON
modulos.id_modulo=modulos_menus.id_modulo INNER JOIN menus ON
modulos_menus.id_menu=menus.id_menu WHERE modulos.codemodulo='I_OP'

-------------------------------------------------------
