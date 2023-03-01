CREATE TABLE usuarios(Id int, Name varchar(50), CPF varchar(14), email varchar(100), 
Phone varchar(20), MotherName varchar(50), Birthday date, Registration date, 
CreditCard varchar(16), CVC int, Expiration varchar(5));

INSERT INTO usuarios(Id, Name, CPF, email, Phone, MotherName, Birthday, Registration, CreditCard, CVC, Expiration) VALUES 
(1, "Anderson", "976.884.150-80", "anderson@gmail.com", "11763565838", "Josefa", "1997-07-30", "2022-10-01", "6846987453215698", 634, "12/29" ),
(2, "Joao", "678.128.460-67", "joao@gmail.com", "11794557484", "Sheyla", "2000-09-05", "2022-10-02", "5367789932942059", 778, "09/24" ),
(3, "Mike", "526.652.580-05", "mike@gmail.com", "1166957889", "Dolores", "1996-12-15", "2022-10-03", "5220042723954017", 218, "04/24" ),
(4, "Aline", "916.135.260-83", "aline@gmail.com", "11339019576", "Neide", "1992-03-08", "2022-10-04", "5164277118416903", 894, "10/23" ),
(5, "Maria", "546.980.500-06", "maria@gmail.com", "11165922471", "Joana", "1954-06-20", "2022-10-05", "5396130218557714", 261, "04/24" ),
(6, "Selma", "066.130.510-47", "selma@gmail.com", "11561977603", "Lucia", "1970-04-03", "2022-10-06", "5482301230402107", 619, "03/24" ),
(7, "Camylly", "327.114.930-59", "camylly@gmail.com", "11154450596", "Agata", "2009-06-03", "2022-10-07", "5482301230402107", 348, "03/24" ),
(8, "Murillo", "032.981.320-04", "murillo@gmail.com", "11868162038", "Fabiana", "2006-05-22", "2022-10-08", "5127098891456858", 194, "09/24" ),
(9, "Jose", "427.113.130-00", "jose@gmail.com", "11711901013", "Cicera", "1964-07-14", "2022-10-09", "5576798976740482", 837, "07/23" ),
(10, "Anibal", "321.150.850-35", "anibal@gmail.com", "11655953964", "Vera", "1967-11-12", "2022-10-10", "5124554045004948", 315, "07/23" );

//SELECT * FROM usuarios; : 
//Para listar o conteúdo total da tabela deixei comentado pois não é possível executar dois Selects ao mesmo tempo, já que estou filtrando os usuários maiores de 18 anos
UPDATE usuarios SET Name = "Andrea", CPF = "077.235.589-77"  WHERE Id = 6;
SELECT * FROM usuarios WHERE Birthday <= "2004-10-10";