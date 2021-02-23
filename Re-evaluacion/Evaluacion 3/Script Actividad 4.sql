-- Crear Datos para Usuarios - Sing In 
-- Usuario -> Compras <- Fornecedor

-- Ingreso a Usuarios y a dependiente Sing-in... 
INSERT INTO `vendas`.`Usuarios` (`Nome`,`Login`,`senha`) Values ('Leandro','leandrojordan@gmail.com','PH180LJ18');
INSERT INTO `vendas`.`Usuarios` (`Nome`,`Login`,`senha`) Values ('Nahuel','nahuel@gmail.com','YP49320LJn');
INSERT INTO `vendas`.`sing in` (`Data_entrada`,`Data_Saida`,`Usuarios_idUsuarios`) Values ('2021/02/21 08:00:00','2021/02/21 12:00:00',1);
INSERT INTO `vendas`.`sing in` (`Data_entrada`,`Data_Saida`,`Usuarios_idUsuarios`) Values ('2021/02/21 08:00:00','2021/02/21 12:00:00',2);
INSERT INTO `vendas`.`sing in` (`Data_entrada`,`Data_Saida`,`Usuarios_idUsuarios`) Values ('2021/02/21 14:00:00','2021/02/21 18:00:00',1);

-- Ingreso en Fornecedor 1 - n Productos...
INSERT INTO `vendas`.`fornecedor` (`Nome`,`Endereco`,`Telefone`,`Email`) VALUES ('Galletitas SA','Lá','+598 46284869','galletitas@galletitas.com');
INSERT INTO `vendas`.`produtos` (`Nome`,`Preco`,`Quantidade`) VALUES ('ChocoTitas',8.24,30);
INSERT INTO `vendas`.`produtos` (`Nome`,`Preco`,`Quantidade`) VALUES ('Otra Cosa',8.24,25);
INSERT INTO `vendas`.`produtos` (`Nome`,`Preco`,`Quantidade`) VALUES ('Otra mas',9.99,50);
INSERT INTO `vendas`.`produtos` (`Nome`,`Preco`,`Quantidade`) VALUES ('Otra menos',10.22,35);

-- Ingreso en Comprar dependiente de fornecedor y Usuario para luego seleccionar el producto Comprado
INSERT INTO `vendas`.`compras` (`Data`,`Descricao`,`Usuarios_idUsuarios`,`Fornecedor_idFornecedor`) VALUES ('2021/02/19','Ni idea lo que comentar...',1,1);
INSERT INTO `vendas`.`it_compras` (`Quantidade`, `Preco`, `Total`, `Desconto`, `Produtos_idProdutos`, `Compras_idCompras`, `Compras_Usuarios_idUsuarios`, `Compras_Fornecedor_idFornecedor`) VALUES ('25', '90', '20000', '15.7', '10', '2', '1', '1');
INSERT INTO `vendas`.`it_compras` (`Quantidade`, `Preco`, `Total`, `Desconto`, `Produtos_idProdutos`, `Compras_idCompras`, `Compras_Usuarios_idUsuarios`, `Compras_Fornecedor_idFornecedor`) VALUES ('50', '9550', '2000', '12.8', '10', '2', '1', '1');
INSERT INTO `vendas`.`it_compras` (`Quantidade`, `Preco`, `Total`, `Desconto`, `Produtos_idProdutos`, `Compras_idCompras`, `Compras_Usuarios_idUsuarios`, `Compras_Fornecedor_idFornecedor`) VALUES ('70', '1950', '2500', '8.4', '10', '2', '1', '1');
INSERT INTO `vendas`.`it_compras` (`Quantidade`, `Preco`, `Total`, `Desconto`, `Produtos_idProdutos`, `Compras_idCompras`, `Compras_Usuarios_idUsuarios`, `Compras_Fornecedor_idFornecedor`) VALUES ('75', '9150', '26000', '9.7', '10', '2', '1', '1');


 SELECT * FROM `vendas`.`it_compras`;
 
 -- UPDATE DE FILA 3
 UPDATE `vendas`.`it_compras` SET `Produtos_idProdutos` = 11 WHERE `idIt_Compras` = 3; 
 
 -- ELIMINAR FILA 4
 DELETE FROM `vendas`.`it_compras` WHERE `idIt_Compras` = 4;