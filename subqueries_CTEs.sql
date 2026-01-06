--Subqueries e CTEs--

-- Quais vendas tiveram um valor acima da média geral de todas as vendas--
SELECT id_vendas,valor
FROM vendas
WHERE valor > (SELECT AVG(valor) FROM vendas)
COMMIT;

-- Utilizando HAVING---
SELECT id_vendas,AVG(valor) as media_por_cliente
from vendas
group by
   id_vendas
   HAVING AVG(valor) > (SELECT AVG(valor) FROM vendas)
COMMIT;