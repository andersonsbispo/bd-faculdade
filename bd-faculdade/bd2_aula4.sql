CREATE TABLE cidades(ID int AUTO_INCREMENT, cidade varchar(50), estado varchar(50), 
qualidadeAr int, tamanho float, Primary key(ID));

INSERT INTO cidades(cidade, estado, qualidadeAr, tamanho) VALUES
("Santos", "SP", 7.5, 400), ("Praia Grande", "SP", 8.5, 320), ("São Vicente", "SP", 7, 280),
("Cubatão", "SP", 5, 250), ("Hallvile", "PR", 8, 150), ("Curitiba", "PR", 8,300),  ("Lindaity", "PR", 9, 80),
("HellCity", "PR", 4, 200);

select count(1), estado from cidades group by (estado);

select cidade, qualidadeAr, 
    case when qualidadeAr < 5 then "Ruim"
        when (qualidadeAr >= 5 && qualidadeAr <= 7) then "Média"
        when qualidadeAr > 7 then "Boa"
    end as NotaAr
from cidades;

select cidade, qualidadeAr, 
    if (qualidadeAr < 5, "Ruim",
        if (qualidadeAr >= 5 && qualidadeAr <= 7, "Média", "Boa"))
        as NotaAr
from cidades;