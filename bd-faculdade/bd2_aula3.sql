CREATE TABLE alunos(Id int, Nome varchar(20),
Telefone varchar(10), DataNas Date);

INSERT INTO alunos(Id, Nome, Telefone, DataNas) VALUES 
(1,"Bruno", "1212", "2000-01-05"),(2,"Thiago", "45454", "1950-05-04"),
(3,"Felipe","5544","2015-07-05"),(4,"Gabriel","8899","2010-04-07"),
(5,"Joao","9797","1998-05-09");

CREATE TABLE turmas (Id int, Turma varchar(10), Sala varchar(3));
INSERT INTO turmas (Id, Turma, Sala) VALUES(1,"Eng1","10"),
(2,"ADM1","15"),(3,"Eng2","20"),(4,"ADM2","25");

CREATE TABLE apostilas (Id int AUTO_INCREMENT, apostila varchar(30), valor float, 
estoque int, primary key(Id));
INSERT INTO apostilas (apostila, valor, estoque) VALUES
("EXS-Matematica", 150.50, 59), ("HUM-Geografia", 50.44, 40), 
("HUM-Portugues", 100.54, 100), ("HUM-Historia", 59.50, 90), 
("HUM-Ingles", 49.90, 25);

/*
SELECT count(1) FROM alunos where DataNas >= "2000-01-01";
SELECT round(SUM(estoque * valor),4) FROM apostilas;
SELECT max(valor), apostila FROM apostilas GROUP BY(apostila);
SELECT * FROM apostilas where apostila = trim("Matematica ")
SELECT substring(apostila,1,3) AS apos, SUM(estoque) from apostilas GROUP BY (apos);
SELECT REPLACE(substring(Turma,1,3),"Eng", "ENG") AS turma, sala from turmas;
SELECT UCASE(turma) AS turma, sala from turmas;
*/

SELECT DATE_FORMAT(DataNas, "%d/%c/%Y") FROM alunos;