Create table usuarios (id int AUTO_INCREMENT NOT NULL, nome varchar(50) NOT NULL, 
telefone varchar(20), email varchar(100), idade int NOT NULL, dataNas date NOT NULL, PRIMARY KEY(id));

Create table emails (id int AUTO_INCREMENT NOT NULL, 
email varchar(100) NOT NULL, id_usuarios int, 
PRIMARY KEY(id), FOREIGN KEY(id_usuarios) REFERENCES usuarios(id));

Insert into usuarios (nome, telefone, email, idade, dataNas)
Values ("bruno", "444343", "bruno@bruno.com.br", 33, "1989-10-02"),
("gabriel", "332423", "gabriel@adb.com.br", 20, "2003-05-02"),
("thiago", "5554343", "thiago@bfdfd.com.br", 15, "1973-05-03"),
("pedro", "4443443", "pedro@cde.com.br", 73, "1973-05-03");

Insert into usuarios (nome, telefone, email, idade, dataNas)
Values ("renan", "4343443", "renan@ren.com.br", 30, "1997-07-30");

Insert into emails (email, id_usuarios) Values ("bb@bb.com", 1), ("cc@cc.com", 1), 
("dd@dd.com", 2), ("ee@ee.com", 2), ("ff@ff.com", 3);

/*
SELECT * FROM usuarios order by idade ASC; Idade de forma crescete
SELECT * FROM usuarios order by idade DESC; Idade de forma decrescente
SELECT * FROM usuarios WHERE idade >= 18 && idade <= 65;
SELECT * FROM usuarios WHERE nome = "bruno" || nome = "gabriel";
SELECT * FROM usuarios WHERE idade = 20 || (idade = 30 && nome = "gabriel");
*/

SELECT u.nome, e.email FROM usuarios u, emails e
WHERE u.id = e.id_usuarios;