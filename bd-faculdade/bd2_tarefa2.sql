CREATE TABLE usuarios (id int AUTO_INCREMENT NOT NULL, nome varchar(50) NOT NULL, 
login varchar(30) NOT NULL, senha varchar(20) NOT NULL, ativo boolean NOT NULL, PRIMARY KEY(id));

INSERT INTO usuarios (nome, login, senha, ativo) Values
("blabla", "asd", "1234", true),
("bleble", "sdf", "5432", true),
("blibli", "dfg", "2333", false),
("bloblo", "fgj", "6654", false);

CREATE TABLE perfil (id int AUTO_INCREMENT NOT NULL, perfil varchar(20) NOT NULL, PRIMARY KEY(id));

INSERT INTO perfil (perfil) VALUES
("admin"), ("usu"), ("hook");

CREATE TABLE usuarios_perfil (id int AUTO_INCREMENT NOT NULL, id_usuarios int, 
FOREIGN KEY(id_usuarios) REFERENCES usuarios(id), 
id_perfil int, FOREIGN KEY(id_perfil) REFERENCES perfil(id), PRIMARY KEY(id));

INSERT INTO usuarios_perfil (id_usuarios, id_perfil) VALUES 
(2,1), (2,2), (3,2), (1,3);

CREATE TABLE email_usuarios (id int AUTO_INCREMENT NOT NULL, id_usuarios int, 
email varchar(100) NOT NULL, FOREIGN KEY(id_usuarios) REFERENCES usuarios(id), PRIMARY KEY(id));

INSERT INTO email_usuarios (id_usuarios, email) VALUES
(1, "bbb@ddd"), (1, "vvv@ccc"), (2, "ddd@ddf"), (3, "ffff@ffff");


SELECT u.nome, u.login, eu.email FROM usuarios u, email_usuarios eu
WHERE u.id = eu.id_usuarios;

SELECT u.nome, p.perfil FROM usuarios u, perfil p, usuarios_perfil up 
WHERE u.id = up.id_usuarios && p.id = up.id_perfil && u.nome = "bleble";