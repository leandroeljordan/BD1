-- Actividad 5 SLECT
-- • Listar todos os clientes cujo nome inicie com a letra 'A'.//
-- • Listar todas as vendas cujo código do cliente seja 24453.//
-- • Listar todos os logins realizados entre os dias 01/11/2020 até 20/11/2020//
-- • Listar a venda e seus itens cujo código seja o 2300.
-- • Listar todos os produtos cuja quantidade em estoque seja maior que 900.//

SELECT * FROM `vendas`.`clientes` WHERE `Nome` LIKE  'a%';
SELECT * FROM `vendas`.`vendas` WHERE `Clientes_idClientes` = 24453;
SELECT * FROM `vendas`.`sing in` WHERE `Data_entrada` BETWEEN '2020/01/11' AND '2020/11/20';

-- Ingreso de Fila, solo para probar codigo.
INSERT INTO `vendas`.`vendas` (`idVendas`, `Data`, `Total`, `Clientes_idClientes`, `Usuarios_idUsuarios`) VALUES ('2300', '2021/02/22', 2500, 2, 1);


SELECT * FROM `vendas`.`clientes` INNER JOIN `vendas`.`vendas` ON `idClientes` = `vendas`.`Clientes_idClientes`  WHERE `vendas`.`idVendas` = 2300;
--        TABLA 1 donde se encuentran  JUNTA CON TABLA   TABLA 2       COMPARACION DE COLUMNAS;
--             Los Datos a rescatar                  




SELECT * FROM `vendas`.`produtos`WHERE `Quantidade` > 900;

