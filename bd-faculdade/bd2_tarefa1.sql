/*
*Criar uma tabela de usuários, que contenha seus nomes, contato, e-mail, cpf, dataNas, login, senha e seus status de administrador. 
    Não esquecer de criar o ID com auto increment
*Inserir nesta tabela pelo menos 8 registos.
*Apresentar comandos que remova todos os usuários menores de idade.
*Alterar o nome de um usuário.
*Listar na tela todos que são administradores.
*Listar na tela todos que tem sua data de nascimento inferior a 1980.
*/

CREATE TABLE usuarios (id int AUTO_INCREMENT NOT NULL, nome varchar(50) NOT NULL, telefone varchar (20) NOT NULL, email varchar(100) NOT NULL,
cpf varchar(14) NOT NULL, dataNas date NOT NULL, login varchar(20) NOT NULL, senha varchar(50) NOT NULL, statusAdmin boolean NOT NULL, primary key(id));

INSERT INTO usuarios (nome, telefone, email, cpf, dataNas, login, senha, statusAdmin) VALUES
("Anderson", "11763565838", "anderson@gmail.com", "976.884.150-80", "1997-07-30", "anderson123", "12345678", true),
("Joao", "11794557484", "joao@gmail.com", "678.128.460-67", "2000-09-05", "joao123", "12345678", true),
("Mike", "11669578891", "mike@gmail.com", "526.652.580-05", "1996-12-15", "mike123", "12345678", true),
("Aline", "11339019576", "aline@gmail.com", "916.135.260-83", "1992-03-08", "aline123", "12345678", false),
("Maria", "11165922471", "maria@gmail.com", "546.980.500-06", "1954-06-20", "maria123", "12345678", false),
("Selma", "11561977603", "selma@gmail.com", "066.130.510-47", "1970-04-03", "selma123", "12345678", false),
("Camylly", "11154450596", "camylly@gmail.com", "327.114.930-59", "2009-06-03", "camylly123", "12345678", false),
("Murillo", "11868162038", "murillo@gmail.com", "032.981.320-04", "2006-05-22", "murillo123", "12345678", false);

DELETE FROM usuarios WHERE dataNas >= "2005-02-2";

UPDATE usuarios SET nome = "Jon" WHERE id = 2;

SELECT * FROM usuarios WHERE statusAdmin = true;
SELECT * FROM usuarios WHERE dataNas < "1980-01-01";