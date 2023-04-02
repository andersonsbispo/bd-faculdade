CREATE TABLE produtos (id int AUTO_INCREMENT, nomeProduto varchar(50), valor float, qtd int, 
ativo boolean, primary key(id));

CREATE TABLE fornecedor (id int AUTO_INCREMENT, nomeFornecedor varchar(50), email varchar(100), 
cnpj varchar(30), cidade varchar(20), qualidade int, ativo boolean, primary key(id));

CREATE TABLE for_prod(id int AUTO_INCREMENT, idProduto int, idFornecedor int, primary key(id), 
foreign key(idProduto) references produtos(id), foreign key(idFornecedor) references fornecedor(id));

INSERT INTO produtos (nomeProduto, valor, qtd, ativo) VALUES
("celular", 2000, 50, true),
("notbook", 4000, 15, true),
("antena", 500, 200, false),
("c.gamer", 1500, 10, true),
("monitor", 1550, 80, false),
("M2", 300, 20, true);

INSERT INTO fornecedor (nomeFornecedor, email, cnpj, cidade, qualidade, ativo) VALUES
("tio patinhas", "tp@tp", "1597533", "patopolis", 6, true),
("casa do tio", "ct@tp", "1543534", "tiopatopolis", 3, false),
("home of tio", "ht@tp", "5465465", "homepatopolis", 9, true);

INSERT INTO for_prod(idProduto, idFornecedor) VALUES
(1,3), (2,3), (4,1), (3,2), (1,1), (2,2), (6,3), (5,3), (6,1);

SELECT p.nomeProduto, f.nomeFornecedor, 
CASE
    WHEN f.qualidade < 5 THEN "UMA BOSTA"
    WHEN (f.qualidade >= 5 && f.qualidade < 8) THEN "ATE QUE DA"
    WHEN f.qualidade >= 8 THEN "DU BOM"
END AS qualidade

FROM fornecedor f, produtos p, for_prod fp
WHERE p.id = fp.idProduto && f.id = fp.idFornecedor && f.ativo = true && p.ativo = true Order By p.nomeProduto ASC;