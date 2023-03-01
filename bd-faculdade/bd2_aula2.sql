CREATE TABLE alunos (ID int AUTO_INCREMENT, Nome varchar(30), DataNas date, Telefone varchar(20), primary key(ID));
INSERT INTO alunos (Nome, Telefone, DataNas) VALUES
("bruno", "334343", "1989-10-02"),
("thiago", "777888", "1996-05-03"),
("fernanda", "88899", "1994-04-21"),
("bruna", "55515", "2012-09-04"),
("gloria", "8885", "1994-04-21"),
("maria", "55541", "2014-10-15");


DELETE FROM alunos WHERE ID = 4;

INSERT INTO alunos (Nome, Telefone, DataNas) VALUES
("bruna", "55515", "2012-09-04");

/*select * from alunos Order By ID asc;*/

UPDATE alunos SET DataNas = "2012-10-15" WHERE ID = 6;

/*select * from alunos;*/

SELECT Nome, DataNas FROM alunos WHERE Nome LIKE "%br%" || (DataNas = "1989-10-02" || DataNas > "2010-01-01");