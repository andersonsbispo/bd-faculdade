/*
    Crie uma estrutura de banco de dados que atenda a situação abaixo:
        *Um sistema gestor de serviços:
        *Cadastro de usuários.
        *Cadastro de serviços.
        *Interligação entre responsáveis e serviços.
        *Datas de controle de execução.
        *Baixas de serviços prontos.
        *Consultas mostrando o cruzamento de usuários e serviços.
        *Consultas mostrando usuários que possuem serviços atrasados.
        *Consulta mostrando todos os usuários e a quantidade de serviços executados.
        *Consulta por usuário mostrando o que ele tem de executado e atrasado por dada.
    */

CREATE TABLE usuarios (id int AUTO_INCREMENT NOT NULL, nome varchar(50) NOT NULL, email varchar(100) NOT NULL, telefone varchar (20) NOT NULL, 
dataCadastro date NOT NULL, PRIMARY KEY(id));

INSERT INTO usuarios (nome, email, telefone, dataCadastro) VALUES
("João", "joao@joao.com", "(13)1234-5678", "2022-01-01"),
("Maria", "maria@maria.com", "(13)9876-5432","2022-02-15"),
("José", "jose@jose.com", "(13)5555-5555", "2022-03-10"),
("Ana", "ana@ana.com", "(13)4444-4444", "2022-04-20"),
("Carolina", "carolina@carolina.com", "(11)7070-7070", "2022-05-05");

CREATE TABLE servicos (id int AUTO_INCREMENT NOT NULL, nome varchar(50) NOT NULL, descricao varchar(100) NOT NULL, valor float NOT NULL, 
dataCadastro date NOT NULL, PRIMARY KEY(id));

INSERT INTO servicos (nome, descricao, valor, dataCadastro) VALUES
("Limpez", "Limpeza de casa", 50.00, "2022-01-01"),
("Jardinagem", "Corte de grama e poda de árvores", 100.00, "2022-02-15"),
("Encanamento", "Conserto de vazamentos e instalação de torneiras", 150.00, "2022-03-10"),
("Eletricidade", "Instalação de tomadas e luminárias", 200.00, "2022-04-20"),
("Pintura", "Pintura de paredes e tetos", 250.00, "2022-05-05");

CREATE TABLE responsaveis (id int AUTO_INCREMENT NOT NULL, id_usuarios int, FOREIGN KEY(id_usuarios) REFERENCES usuarios(id), 
id_servico int, FOREIGN KEY(id_servico) REFERENCES servicos(id), dataInicio date, dataPrazo date, dataConclusao date, PRIMARY KEY(id));

INSERT INTO responsaveis (id_usuarios, id_servico, dataInicio, dataPrazo, dataConclusao) VALUES
(1, 1, "2022-01-02", "2022-01-05", "2022-01-05"),
(1, 2, "2022-01-16", "2022-01-20", "2022-01-19"),
(2, 3, "2022-03-15", "2022-03-20", "2022-05-10"),
(2, 4, "2022-04-25", "2022-04-30", "2022-04-28"),
(3, 5, "2022-05-06", "2022-05-10", "2022-05-09"),
(3, 1, "2022-05-15", "2022-05-20", "2002-05-19"),
(4, 2, "2022-05-25", "2022-05-30", "2022-05-28"),
(5, 3, "2022-06-10", "2022-06-15", "2022-06-14");

CREATE TABLE baixas (id int AUTO_INCREMENT NOT NULL, id_responsavel int, FOREIGN KEY(id_responsavel) REFERENCES responsaveis(id), 
dataBaixa date, PRIMARY KEY(id));

INSERT INTO baixas (id_responsavel, dataBaixa) VALUES
(1, "2022-01-05"),
(2, "2022-01-19"),
(3, "2022-05-10"),
(4, "2022-04-28"),
(5, "2022-05-09"),
(6, "2002-05-19"),
(7, "2022-05-28"),
(8, "2022-06-14");

/*Datas de controle de execução.*/
SELECT dataConclusao, COUNT(*) as quantidade 
FROM responsaveis 
WHERE dataConclusao IS NOT NULL 
GROUP BY dataConclusao;

/*Baixas de serviços prontos.*/
SELECT u.nome as usuario, s.nome as servico, b.dataBaixa 
FROM usuarios u 
JOIN responsaveis r ON u.id = r.id_usuarios 
JOIN servicos s ON s.id = r.id_servico 
JOIN baixas b ON r.id = b.id_responsavel 
WHERE r.dataConclusao IS NOT NULL;

/*Consultas mostrando o cruzamento de usuários e serviços.*/
SELECT usuarios.nome, servicos.nome
FROM usuarios, servicos, responsaveis
WHERE usuarios.id = responsaveis.id_usuarios AND servicos.id = responsaveis.id_servico;

/*Consultas mostrando usuários que possuem serviços atrasados.*/
SELECT usuarios.nome, responsaveis.dataPrazo, responsaveis.dataConclusao
FROM usuarios, responsaveis
WHERE usuarios.id = responsaveis.id_usuarios AND responsaveis.dataConclusao > responsaveis.dataPrazo;

/*Consulta mostrando todos os usuários e a quantidade de serviços executados.*/
SELECT usuarios.nome, COUNT(responsaveis.id_usuarios) AS "Quantidade de serviços executados"
FROM usuarios, responsaveis
WHERE usuarios.id = responsaveis.id_usuarios AND responsaveis.dataConclusao IS NOT NULL
GROUP BY usuarios.nome;

/*Consulta por usuário mostrando o que ele tem de executado e atrasado por dada.*/
SELECT usuarios.nome, servicos.nome, responsaveis.dataPrazo, responsaveis.dataConclusao
FROM usuarios, servicos, responsaveis
WHERE usuarios.id = responsaveis.id_usuarios AND servicos.id = responsaveis.id_servico AND usuarios.nome = "Maria"
ORDER BY responsaveis.dataPrazo;