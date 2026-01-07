--Objetivo: Identificar o Top 10 clientes em receita no Q4/2025. 
--Estratégia de Performance: Para evitar o travamento do banco (150M de linhas), utilizei uma CTE para realizar a filtragem e agregação precoce.
-- 1.Filtrei as transações por status e data, reduzindo drasticamente o volume de dados.
-- 2.Agrupei os valores por usuário dentro da CTE, garantindo que o JOIN subsequente fosse feito com uma tabela reduzida (apenas um registro por usuário), otimizando o uso de memória e CPU.
-- 3.Apliquei o ranking final para extrair os 10 maiores faturamentos.

WITH receita_por_usuario AS (
SELECT id_usuario,SUM(valor) AS total_trimestre
FROM transacoes
WHERE data_transacao BETWEEN '2025-10-01' AND '2025-12-31'
AND status = 'concluida'
GROUP BY id_usuario
)
SELECT u.nome,r.total_trimestre
FROM usuarios u
JOIN receita_por_usuario r  on u.id_usuario = r.id_usuario
ORDER BY r.total_trimestre DESC
LIMIT 10;
