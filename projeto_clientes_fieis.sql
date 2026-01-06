--Identificação de clientes que compraram acima de R$5000,00.

WITH total_por_cliente AS (
SELECT id_cliente,SUM(valor) AS total
FROM vendas
GROUP BY id_cliente
),
cliente_master AS (
SELECT id_cliente, total
FROM total_por_cliente
WHERE total > 5000
)
SELECT c.nome,cm.total
FROM clientes c
JOIN cliente_master cm on c.id_cliente = cm.id_cliente;