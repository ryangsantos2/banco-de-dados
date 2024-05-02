create database venda;
use venda;

CREATE TABLE cliente (
  idCliente INT PRIMARY KEY,
  nome VARCHAR(45),
  cep CHAR(8),
  numero int,
  fkIndicado INT,
    FOREIGN KEY (fkIndicado)
    REFERENCES cliente(idCliente)
   );
   
	INSERT INTO cliente VALUES
    (1, 'Woody', '02851000', 114, null),
    (2, 'Buzz', '01234567', 988, 1),
    (3, 'Picapau', '02345678', 554, null),
    (4, 'Leoncio', '03456789', 8716, 3);
   
CREATE TABLE produto(
  idProduto INT PRIMARY KEY,
  nome VARCHAR(45),
  descricao VARCHAR(45),
  preco DECIMAL(5,2)
  );

INSERT INTO produto VALUES
(1, 'Detergente', 'Produto de limpeza', '4.99'),
(2, 'Sabonete', 'Produto de limpeza', '2.50'),
(3,'Alface', 'Verduras', '3.00'),
(4, 'Guarana', 'Bebida', '3.99'),
(5, 'Red bull', 'Bebida', '7.99'),
(6, 'Pao', 'Alimento','0.60');

CREATE TABLE venda(
idVenda INT,
fkCliente INT,
fkProduto INT,
qtdVenda INT,
desconto VARCHAR(45),
totalVenda DECIMAL(6,2),
dtVenda DATETIME,
	PRIMARY KEY (idVenda, fkCliente, fkProduto),
    FOREIGN KEY (fkCliente)
		REFERENCES cliente(idCliente),
	FOREIGN KEY (fkProduto)
    REFERENCES produto (idProduto)
);
   
INSERT INTO venda VALUES

(1, 1,1, 2, NULL, '9.98', '2024-10-10 08:00:00'),
(2, 1,2, 3, NULL, '7.50', '2024-10-10 08:002:37'),
(3, 2,4, 4,NULL, '15.96', '2024-10-10 09:00:00'),
(4, 3,5, 10, '20', '59.90', '2024-10-10 10:00:00'),
(5, 4, 6, 3,NULL, '1.80', '2024-10-10 11:00:00');

-- e) Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM venda;
-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.

SELECT cliente.nome, produto.nome, venda.dtVenda
FROM cliente 
JOIN venda
	ON cliente.idCliente = venda.fkCliente
JOIN produto
	ON produto.idProduto = venda.fkProduto
-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes
