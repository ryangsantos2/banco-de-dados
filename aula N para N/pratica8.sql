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
	ON produto.idProduto = venda.fkProduto;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
SELECT cliente.nome, produto.nome, venda.dtVenda
FROM cliente 
JOIN venda
	ON cliente.idCliente = venda.fkCliente
JOIN produto
	ON produto.idProduto = venda.fkProduto
WHERE cliente.nome = 'Woody';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes
SELECT cliente.nome AS CLIENTE, indicado.nome AS INDICADO
	FROM cliente
    JOIN cliente AS indicado
		ON cliente.idCliente = indicado.fkIndicado;
        
-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome
-- do cliente que indicou na consulta).
SELECT cliente.nome AS CLIENTE, indicado.nome AS INDICADO
	FROM cliente
    JOIN cliente AS indicado
		ON cliente.idCliente = indicado.fkIndicado
			WHERE cliente.nome = 'Picapau';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
-- dados das respectivas vendas e dos produtos.
SELECT *
FROM cliente 
JOIN venda
	ON cliente.idCliente = venda.fkCliente
JOIN produto
	ON produto.idProduto = venda.fkProduto
 JOIN cliente AS indicador
	ON cliente.idCliente = indicador.fkIndicado;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto
-- numa determinada venda.
SELECT produto.nome,data.dtVenda, qtd.qtdVenda
	FROM produto
    JOIN venda AS data
		ON produto.idProduto = data.fkProduto
	JOIN venda AS qtd
		ON produto.idProduto = qtd.fkProduto;
        
-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
-- produtos vendidos agrupados pelo nome do produto.
SELECT pro;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
-- vendas, e os clientes que não realizaram nenhuma venda.

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
SELECT MAX(preco) FROM produto;
SELECT MIN(preco) FROM produto;

-- q) Exibir a soma e a média dos preços dos produtos;
SELECT SUM(preco) FROM produto;
SELECT AVG(preco) FROM produto;
SELECT ROUND(AVG(preco),2) FROM produto;
-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
SELECT COUNT(preco) from produto 
	WHERE preco > (SELECT AVG(preco) FROM produto);
-- s) Exibir a soma dos preços distintos dos produtos;
SELECT SUM(preco) FROM produto
	WHERE nome = 'Detergente';
SELECT SUM(preco) FROM produto
	WHERE nome = 'Sabonete';
SELECT SUM(preco) FROM produto
	WHERE nome = 'Alface';
SELECT SUM(preco) FROM produto
	WHERE nome = 'Guarana';
SELECT SUM(preco) FROM produto
	WHERE nome = 'Red bull';
SELECT SUM(preco) FROM produto
	WHERE nome = 'Pao';

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
SELECT SUM(produto.preco), venda.fkProduto 
 FROM produto 
 JOIN venda
	ON produto.idProduto = venda.fkProduto
	GROUP BY fkProduto;
	
