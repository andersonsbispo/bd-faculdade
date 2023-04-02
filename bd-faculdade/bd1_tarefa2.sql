CREATE TABLE fornecedores (id int AUTO_INCREMENT NOT NULL, Name varchar(50) NOT NULL, 
Category varchar(50), Website varchar(50), Sede varchar(50), PRIMARY KEY(id));

INSERT INTO fornecedores (Name, Category, Website, Sede) VALUES
("Apple", "Software and Hardware", "https://www.apple.com/", "California-USA"),
("Samsung", "Software and Hardware", "https://www.samsung.com/", "Suwon-KOR"),
("Sony", "Software and Hardware", "https://www.sony.com/", "Tokio-JP"),
("Microsoft", "Software and Hardware", "https://www.microsoft.com/", "Washington-USA"),
("Nintendo", "Software and Hardware", "https://www.nintendo.com/", "Quioto-JP"),
("Xiaomi", "Software and Hardware", "https://www.mi.com/", "Pequim-CN");

CREATE TABLE produtos(id int AUTO_INCREMENT NOT NULL, Name varchar(50) NOT NULL, 
SaleValue float NOT NULL, PurchasePrice float NOT NULL, Amount int NOT NULL, Category varchar(50), 
id_fornecedores int, PRIMARY KEY(id), FOREIGN KEY (id_fornecedores) REFERENCES fornecedores(id));

INSERT INTO produtos(Name, SaleValue, PurchasePrice, Amount, Category, id_fornecedores) VALUES
("iPhone 14", 80, 60, 237, "Smartphones", 1),
("Galaxy S22 Ultra", 75, 65, 322, "Smartphones", 2),
("Airpods", 16, 12, 143, "Fones de Ouvido", 1),
("Galaxy Buds", 38, 28, 289, "Fones de Ouvido", 2),
("Apple Watch", 28, 21, 487, "Smartwatches", 1),
("Galaxy Watch", 11, 89, 691, "Smartwatches", 2),
("PlayStation 5", 44, 33, 12, "Videogames", 3),
("XBOX One X", 19, 14, 0, "Videogames", 4),
("XBOX Series X", 40, 30, 5, "Videogames", 4),
("Nintendo Switch", 25, 19, 24, "Videogames", 5),
("MI 11", 75, 65, 322, "Smartphones", 6);

SELECT * FROM produtos WHERE order by SaleValue ASC; /*liste os produtos mais baratos.*/
SELECT * FROM produtos WHERE SaleValue >= 10 && SaleValue <= 50; /*Liste os produtos intermediarios, entre 10 e 50.*/
SELECT * FROM produtos WHERE Category = "Videogames" && SaleValue < 40;/*Os pordutos de uma determinada categoria que possua o preço abaixo de 40.*/
SELECT f.Name, p.Name FROM fornecedores f, produtos p 
WHERE f.id = p.id_fornecedores; /*Liste os produtos e seus fornecedores.*/