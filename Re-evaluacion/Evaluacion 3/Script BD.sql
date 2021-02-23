CREATE DATABASE IF NOT EXISTS `vendas`;
USE `vendas` ;

CREATE TABLE IF NOT EXISTS `vendas`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(60) NOT NULL,
  `Login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE INDEX `Login_UNIQUE` (`Login` ASC) VISIBLE);


CREATE TABLE IF NOT EXISTS `vendas`.`Sing in` (
  `idSing in` INT NOT NULL AUTO_INCREMENT,
  `Data_entrada` DATETIME NOT NULL,
  `Data_Saida` DATETIME NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idSing in`, `Usuarios_idUsuarios`),
  INDEX `fk_Sing in_Usuarios_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Sing in_Usuarios`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `vendas`.`Usuarios` (`idUsuarios`));


CREATE TABLE IF NOT EXISTS `vendas`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(45) NULL,
  `Telefone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClientes`));

CREATE TABLE IF NOT EXISTS `vendas`.`Vendas` (
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Total` FLOAT NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idVendas`, `Usuarios_idUsuarios`),
  INDEX `fk_Vendas_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Vendas_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_Vendas_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `vendas`.`Clientes` (`idClientes`),
  CONSTRAINT `fk_Vendas_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `vendas`.`Usuarios` (`idUsuarios`));

CREATE TABLE IF NOT EXISTS `vendas`.`Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`idProdutos`));

CREATE TABLE IF NOT EXISTS `vendas`.`Hist_Precos` (
  `idHist_Precos` INT NOT NULL AUTO_INCREMENT,
  `Data_Inicio` DATE NOT NULL,
  `Data_Fin` DATE NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Produtos_idProdutos` INT NOT NULL,
  PRIMARY KEY (`idHist_Precos`),
  INDEX `fk_Hist_Precos_Produtos1_idx` (`Produtos_idProdutos` ASC) VISIBLE,
  CONSTRAINT `fk_Hist_Precos_Produtos1`
    FOREIGN KEY (`Produtos_idProdutos`)
    REFERENCES `vendas`.`Produtos` (`idProdutos`));

CREATE TABLE IF NOT EXISTS `vendas`.`It_Vendas` (
  `idIt_Vendas` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` INT NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Total` FLOAT NOT NULL,
  `Desconto` FLOAT NULL,
  `Produtos_idProdutos` INT NOT NULL,
  `Vendas_idVendas` INT NOT NULL,
  `Vendas_Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idIt_Vendas`, `Produtos_idProdutos`, `Vendas_idVendas`, `Vendas_Usuarios_idUsuarios`),
  INDEX `fk_It_Vendas_Produtos1_idx` (`Produtos_idProdutos` ASC) VISIBLE,
  INDEX `fk_It_Vendas_Vendas1_idx` (`Vendas_idVendas` ASC, `Vendas_Usuarios_idUsuarios` ASC) VISIBLE,
  CONSTRAINT `fk_It_Vendas_Produtos1`
    FOREIGN KEY (`Produtos_idProdutos`)
    REFERENCES `vendas`.`Produtos` (`idProdutos`),
  CONSTRAINT `fk_It_Vendas_Vendas1`
    FOREIGN KEY (`Vendas_idVendas` , `Vendas_Usuarios_idUsuarios`)
    REFERENCES `vendas`.`Vendas` (`idVendas` , `Usuarios_idUsuarios`));

CREATE TABLE IF NOT EXISTS `vendas`.`Fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereco` VARCHAR(60) NOT NULL,
  `Telefone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`));


CREATE TABLE IF NOT EXISTS `vendas`.`Compras` (
  `idCompras` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idCompras`, `Usuarios_idUsuarios`, `Fornecedor_idFornecedor`),
  INDEX `fk_Compras_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Compras_Fornecedor1_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `vendas`.`Usuarios` (`idUsuarios`),
  CONSTRAINT `fk_Compras_Fornecedor1`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `vendas`.`Fornecedor` (`idFornecedor`));

CREATE TABLE IF NOT EXISTS `vendas`.`It_Compras` (
  `idIt_Compras` INT NOT NULL AUTO_INCREMENT,
  `Quantidade` INT NOT NULL,
  `Preco` FLOAT NOT NULL,
  `Total` FLOAT NOT NULL,
  `Desconto` FLOAT NOT NULL,
  `Produtos_idProdutos` INT NOT NULL,
  `Compras_idCompras` INT NOT NULL,
  `Compras_Usuarios_idUsuarios` INT NOT NULL,
  `Compras_Fornecedor_idFornecedor` INT NOT NULL,
  PRIMARY KEY (`idIt_Compras`, `Produtos_idProdutos`, `Compras_idCompras`, `Compras_Usuarios_idUsuarios`, `Compras_Fornecedor_idFornecedor`),
  INDEX `fk_It_Compras_Produtos1_idx` (`Produtos_idProdutos` ASC) VISIBLE,
  INDEX `fk_It_Compras_Compras1_idx` (`Compras_idCompras` ASC, `Compras_Usuarios_idUsuarios` ASC, `Compras_Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_It_Compras_Produtos1`
    FOREIGN KEY (`Produtos_idProdutos`)
    REFERENCES `vendas`.`Produtos` (`idProdutos`),
  CONSTRAINT `fk_It_Compras_Compras1`
    FOREIGN KEY (`Compras_idCompras` , `Compras_Usuarios_idUsuarios` , `Compras_Fornecedor_idFornecedor`)
    REFERENCES `vendas`.`Compras` (`idCompras` , `Usuarios_idUsuarios` , `Fornecedor_idFornecedor`));







    


INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Atelier graphique', 'Grenzacherweg 237', '5085552555', 'glycoses@usacentrall.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Signal Gift Stores', 'Drammensveien 126A', '0241-039123', 'rochelle_myers@yahoo.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Australian Collectors, Co.', 'Kingsfordweg', '+34 913 728555', 'theresia_thorne@protonmail.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('La Rochelle Gifts', 'Obere Str. 57', '61-9-3844-6555', 'brittani_carr@hotmail.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Baane Mini Imports', 'Torikatu 38', '+39 022515555', 'qiana_amos@hotmail.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Mini Gifts Distributors Ltd.', 'Rue Joseph-Bens 532', '+7 812 293 0521', 'libbie_barnes@aol.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Havel & Zbyszek Co', '3758 North Pendale Street', '+ 972 9 959 8555', 'chong_drew@aol.com');
INSERT INTO `vendas`.`clientes` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Blauer See Auto, Co.', '4575 Hillside Dr.', '(95) 555 82 82', 'arletta_faulkner@zohomail.com');








INSERT INTO `vendas`.`fornecedor` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Dallas Bowen', '080 Gibson Harbor Suite 420 - Smyrna, WV / 58601', '6326315996', 'fanny_hawes@gmail.com');
INSERT INTO `vendas`.`fornecedor` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Ellamae Hook', '48077 Alford Key Apt. 417 - Casper, CO / 00089', '7152395122', 'bernardina_reid@outlook.com');
INSERT INTO `vendas`.`fornecedor` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Collin Norris', '91235 Turner Grove Suite 246 - Sioux Falls, KY / 95306', '8342448955', 'arletta_hussain@outlook.com');
INSERT INTO `vendas`.`fornecedor` (`Nome`, `Endereco`, `Telefone`, `Email`) VALUES ('Adrienne Eastwood', '674 Dillon Rue Apt. 835 - Anchorage, MA / 42882', '622025651', 'lady_kennedy@outlook.com');





INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('a', '950', '15');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('b', '100', '20');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('c', '150', '10');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('d', '12', '100');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('r', '10', '300');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('g', '54', '30');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('d', '98', '35');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('f', '55', '24');
INSERT INTO `vendas`.`produtos` (`Nome`, `Preco`, `Quantidade`) VALUES ('y', '45', '15');




INSERT INTO `vendas`.`usuarios` (`Nome`, `Login`, `senha`) VALUES ('Leandro Jordan', 'leandroeljordan@gmail.com', '456sdde');

INSERT INTO `vendas`.`sing in` (`Data_entrada`, `Data_Saida`, `Usuarios_idUsuarios`) VALUES ('2021/02/22 08:00:00', '2021/02/22 21:00:00', '1');

INSERT INTO `vendas`.`compras` (`Data`, `Descricao`, `Usuarios_idUsuarios`, `Fornecedor_idFornecedor`) VALUES ('2020-11-13 18:00:00', 'Ni Idea', '1', '4');

INSERT INTO `vendas`.`vendas` (`Data`, `Total`, `Clientes_idClientes`, `Usuarios_idUsuarios`) VALUES ('2021-02-22', '1250',
'1', '1');
INSERT INTO `vendas`.`vendas` (`Data`, `Total`, `Clientes_idClientes`, `Usuarios_idUsuarios`) VALUES ('2021/02/22', '1000', '1', '1');



INSERT INTO `vendas`.`it_vendas` (`Quantidade`, `Preco`, `Total`, `Produtos_idProdutos`, `Vendas_idVendas`, `Vendas_Usuarios_idUsuarios`) VALUES ('5', '1050', '1250', '1', '1', '1');
