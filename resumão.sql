-- criando um banco de dados
CREATE DATABASE simuladodb;

-- utilizando o simuladodb
USE simuladodb;

-- criando uma tabela chamada clientes
CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
idade INT,
cidade VARCHAR(50)
);

-- criando outra tabela chamada pedidos
CREATE TABLE pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
produto VARCHAR(50),
valor DECIMAL(10,2),
DATA_PEDIDO DATE,
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- inserindo dados na tabela clientes
INSERT INTO clientes (nome,idade,cidade) 
VALUES ('Lucas',25, 'Belém'),
	   ('Maria',30,'São Paulo'),
       ('João',40,'Rio de Janeiro'),
       ('Ana',22,'Curitiba'),
       ('Pedro',35,'Belém');
       
-- inserindo dados na tabela pedidos
INSERT INTO pedidos (cliente_id,produto,valor,data_pedido)
VALUES (1,'Notebook',3500.00,'2023-01-15'),
       (2,'Celular',2500.00,'2023-02-10'),
       (1,'Mouse',80.00,'2023-02-10'),
       (3,'Geladeira',2800.00,'2023-03-05'),
       (4,'Fone de ouvido',200.00, '2023-03-12'),
       (5,'TV',3200.00,'2023-04-01');
       
       
--  VISUALIZAÇÃO DA TABELA CLIENTE       
 SELECT*FROM clientes;
 
 -- VISUALIZAÇÃO DA TABELAL PEDIDOS
 SELECT*FROM pedidos;
 
 
-- Seleciona todos os registros da tabela clientes
-- mas apenas aqueles em que a cidade é igual a 'Belém'
 SELECT*FROM clientes
 WHERE cidade = 'Belém';
 
 -- esse comando liga as duas tabelas (clientes e pedidos) 
 -- através da chave estrangeira, e mostra o nome do cliente junto com os pedidos que ele fez.
 SELECT clientes.nome,pedidos.produto, pedidos.valor, pedidos.data_pedido
 FROM pedidos
 JOIN clientes ON pedidos.cliente_id = clientes.id;
 
 -- join = Eu quero combinar informações de duas (ou mais)
 -- tabelas que têm uma relação entre si.
 
 -- eu desligo o modo atualização segura. pra ativar mude para 1.
 SET SQL_SAFE_UPDATES = 0;

 
 -- isto aqui vai pegar o  altera  a idade do 
 -- cliente lucas que estava 25 vai ser att para 26.
 UPDATE clientes
 SET idade =26
 WHERE nome = 'Lucas';
 
 -- vai deletar a linha pedro da tabela clientes.
 DELETE FROM clientes
 WHERE nome = 'Pedro';
 
 
 -- Ela conta o número total de linhas que existem na tabela pedidos
 SELECT COUNT(*) AS total_pedido FROM pedidos;
 
 --  é uma função de agregação que calcula a media. 
 -- ou seja esse comando retorna a média do valor de todos os pedidos. 
 SELECT AVG (valor) AS media_valor FROM pedidos;
 
 
 -- Mostra os pedidos feitos entre 01/02/2023 e 28/02/2023
 SELECT * FROM pedidos
 WHERE data_pedido BETWEEN '2023-02-01' AND '2023-02-28';
 
 
 -- Mostra o valor da tabela pedidos do maior pro menor.
 SELECT*FROM pedidos
 ORDER BY valor DESC;
 
 -- você vai ter uma lista com o nome de cada cliente e o total que ele gastou em pedidos.
 
 SELECT cliente.nome, SUM(pedidos.valor) AS total_gasto
 FROM pedidos
 JOIN clientes ON pedidos.cliente_id = clientes.id
 GROUP BY clientes.nome;
 
 
 -- exclui o banco de dados
 DROP DATABASE simuladodb;