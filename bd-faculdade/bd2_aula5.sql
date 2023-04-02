CREATE TABLE alunos(Id int AUTO_INCREMENT, Nome varchar(20), Telefone varchar(10), DataNas Date, PRIMARY KEY(Id));

INSERT INTO alunos(Nome, Telefone, DataNas) VALUES 
("Anderson", "1212", "2000-01-05"), ("Joao", "45454", "1950-05-04"),
("Mike","5544","2015-07-05"), ("Gabriel","8899","2010-04-07"),
("Jonatan","9797","1998-05-09");

CREATE TABLE turmas (Id int AUTO_INCREMENT, Turma varchar(10), Sala varchar(3), PRIMARY KEY(Id));

INSERT INTO turmas (Turma, Sala) VALUES
("Eng1","10"), ("ADM1","15"), ("Eng2","20"), ("ADM2","25");

CREATE TABLE emailsAlunos(Id int AUTO_INCREMENT, IdAluno int, Email varchar(100), PRIMARY KEY(Id), foreign key(IdAluno) REFERENCES Alunos(Id));

INSERT INTO emailsAlunos(IdAluno,Email) VALUES
(1,"aaa@aaa"), (1,"bbb@bbb"), (2,"ccc@ccc"), (4,"fff@fff"), (9,"zzz@zzz");

/*
SELECT * FROM alunos;

SELECT a.Nome, ea.Email FROM alunos a, emailsAlunos ea 
WHERE a.Id = ea.IdAluno and a.Nome LIKE "%Joao%";

SELECT * FROM alunos a right JOIN emailsAlunos ae ON a.Id=ae.IdAluno;
SELECT * FROM alunos a left JOIN emailsAlunos ae ON a.Id=ae.IdAluno;
SELECT * FROM alunos a cross JOIN emailsAlunos ae;


SELECT count(1) FROM alunos a, emailsAlunos ea 
WHERE a.Id = ea.IdAluno and a.Nome LIKE "%Anderson%";
*/

CREATE TABLE aluTur(IdAluno int, IdTurma int, FOREIGN KEY(IdAluno) REFERENCES alunos(Id), FOREIGN KEY(IdTurma) REFERENCES turmas(Id));

INSERT INTO aluTur(IdAluno,IdTurma) VALUES
(1,1), (1,2), (2,2), (3,2);

SELECT count(1), Turma FROM alunos a, turmas t, aluTur at 
WHERE a.Id = at.IdAluno AND t.ID = at.IdTurma GROUP BY Turma;