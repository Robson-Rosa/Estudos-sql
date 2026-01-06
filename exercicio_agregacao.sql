-- Inserçao de dados em tabelas criadas anteriormente--
INSERT INTO clientes (id_cliente, nome, cidade, uf) VALUES
(1, 'Ana Silva', 'São Paulo', 'SP'),
(2, 'Bruno Oliveira', 'Belo Horizonte', 'MG'),
(3, 'Carla Souza', 'Curitiba', 'PR'),
(4, 'Diego Santos', 'Rio de Janeiro', 'RJ'),
(5, 'Elena Rocha', 'Porto Alegre', 'RS')
  COMMIT;

-- Inserindo Vendas--
INSERT INTO vendas (id_vendas, id_cliente, valor, data_venda) VALUES
(101, 1, 150.50, '2025-11-01'),
(102, 3, 89.90, '2025-11-02'),
(103, 2, 450.00, '2025-11-05'),
(104, 1, 120.00, '2025-11-10'),
(105, 5, 310.25, '2025-11-12'),
(106, 4, 55.00, '2025-11-15')
COMMIT;

-- Retorno do nome dos clientes e valor de vendas, para vendas no estado do RJ maiores que R$100,00.
select c.nome,v.valor 
from clientes c inner join vendas v on
(v.id_cliente=c.id_cliente)
where c.uf = 'RJ' and v.valor > 100
;


-- Todas as vendas que não foram realizadas no estado de SP com valor menor ou igual a R$100,00.
select v.id_vendas,v.data_venda 
from vendas v inner join clientes c on
(v.id_cliente=c.id_cliente)
where c.uf<>'SP' and v.valor <= 100;

-- UF e soma total de vendas de cada Estado.
SELECT c.uf, SUM(v.valor) AS Total_Vendas
FROM vendas v INNER JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.uf;




