
-- Aula 4.1 - Juntando tabelas

SELECT * FROM TABELA_DE_VENDEDORES;
SELECT * FROM NOTAS_FISCAIS;

SELECT MATRICULA, COUNT(*) AS "N�mero de notas" FROM NOTAS_FISCAIS
    GROUP BY MATRICULA;
    
SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS "N�mero de notas"
    FROM TABELA_DE_VENDEDORES TV 
INNER JOIN NOTAS_FISCAIS NF ON( NF.MATRICULA = TV.MATRICULA)
    GROUP BY NF.MATRICULA, TV.NOME;
    
SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO HAVING SUM(QUANTIDADE) > 394000 
ORDER BY SUM(QUANTIDADE) DESC;    

SELECT INF.CODIGO_DO_PRODUTO, SUM(INF.QUANTIDADE) FROM ITENS_NOTAS_FISCAIS INF
GROUP BY CODIGO_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) 
    FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

--------------------------------------------------------------------------------------

-- Aula 4.2 -- LEFT JOIN

SELECT DISTINCT TC.CPF AS "CPF do Cliente", TC.NOME AS "Nome do Cliente", NF.CPF AS "CPF das Vendas"
    FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON (TC.CPF = NF.CPF);

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

SELECT DISTINCT 
TC.CPF AS "CPF do Cliente", TC.NOME AS "Nome do Cliente"
    FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF ON (TC.CPF = NF.CPF) 
    WHERE NF.CPF IS NULL; -- Cliente que nunca comprou
    
-------------------------------------------------------------------------------

-- Aula 4.3 -- Outros joins

SELECT DISTINCT TV.NOME AS "Nome do Vendedor",
                TV.BAIRRO AS "Bairro do Vendedor",
                TC.NOME AS "Nome do Cliente",
                TC.BAIRRO AS "Bairro do Cliente"
    FROM TABELA_DE_CLIENTES TC
INNER JOIN TABELA_DE_VENDEDORES TV ON (TV.BAIRRO = TC.BAIRRO);

SELECT DISTINCT TV.NOME AS "Nome do Vendedor",
                TV.BAIRRO AS "Bairro do Vendedor",
                TC.NOME AS "Nome do Cliente",
                TC.BAIRRO AS "Bairro do Cliente"
    FROM TABELA_DE_CLIENTES TC
LEFT JOIN TABELA_DE_VENDEDORES TV ON (TV.BAIRRO = TC.BAIRRO);  


SELECT DISTINCT TV.NOME AS "Nome do Vendedor",
                TV.BAIRRO AS "Bairro do Vendedor",
                TC.NOME AS "Nome do Cliente",
                TC.BAIRRO AS "Bairro do Cliente"
    FROM TABELA_DE_CLIENTES TC
RIGHT JOIN TABELA_DE_VENDEDORES TV ON (TV.BAIRRO = TC.BAIRRO); 

SELECT DISTINCT TV.NOME AS "Nome do Vendedor",
                TV.BAIRRO AS "Bairro do Vendedor",
                TC.NOME AS "Nome do Cliente",
                TC.BAIRRO AS "Bairro do Cliente"
    FROM TABELA_DE_CLIENTES TC
FULL OUTER JOIN TABELA_DE_VENDEDORES TV ON (TV.BAIRRO = TC.BAIRRO);

--------------------------------------------------------------------------

-- Aula 4.4 -- Unindo consultas

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES; -- 12 bairros
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES; -- 4 bairros

SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES 
UNION                                                -- 13 bairros
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;


SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES -- 16 bairros (com duplicata)
UNION  ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;


SELECT DISTINCT BAIRRO, 'Cliente' AS "Origem" FROM TABELA_DE_CLIENTES -- 16 bairros (com duplicata)
UNION  ALL
SELECT DISTINCT BAIRRO, 'Fornecedor' AS "Origem" FROM TABELA_DE_VENDEDORES;


SELECT DISTINCT BAIRRO, 'Cliente' AS "Origem" FROM TABELA_DE_CLIENTES -- 16 bairros (com duplicata)
UNION 
SELECT DISTINCT BAIRRO, 'Fornecedor' AS "Origem" FROM TABELA_DE_VENDEDORES;

------------------------------------------------------------------------------------

-- Aula 4.5 -- Subconsultas com IN

SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

SELECT * FROM TABELA_DE_CLIENTES
    WHERE BAIRRO IN ('Tijuca', 'Jardins', 'Copacabana', 'Santo Amaro');
    
-- Mesma consulta   
SELECT * FROM TABELA_DE_CLIENTES 
    WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES); 
    
    
SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS 
    WHERE CODIGO_DO_PRODUTO 
    IN (SELECT INF.CODIGO_DO_PRODUTO FROM ITENS_NOTAS_FISCAIS INF
        INNER JOIN TABELA_DE_PRODUTOS TP 
            ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
        GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000);
        
----------------------------------------------------------------------------------------

-- Aula 4.6 -- Subqueries usando o Having     

SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
    
SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) >= 80;   


SELECT SOMA_EMBALAGENS.EMBALAGEM, SOMA_EMBALAGENS.SOMA_PRECO
    FROM
(SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO -- Mesma consulta sem o having
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
    ) SOMA_EMBALAGENS
    WHERE SOMA_EMBALAGENS.SOMA_PRECO >= 80;
    
    
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) 
    FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;   

SELECT SC.CODIGO_DO_PRODUTO, SC.NOME_DO_PRODUTO, SC.QUANTIDADE_TOTAL
    FROM
(SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
    FROM ITENS_NOTAS_FISCAIS INF
        INNER JOIN TABELA_DE_PRODUTOS TP 
        ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
    GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO) SC
    WHERE SC.QUANTIDADE_TOTAL > 394000 
        ORDER BY SC.QUANTIDADE_TOTAL DESC
        
-------------------------------------------------------------------------------------------

-- Aula 4.7 -- Views

SELECT SOMA_EMBALAGENS.EMBALAGEM, SOMA_EMBALAGENS.SOMA_PRECO
    FROM
(SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO -- Mesma consulta sem o having
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
    ) SOMA_EMBALAGENS
    WHERE SOMA_EMBALAGENS.SOMA_PRECO >= 80;
 
CREATE VIEW VW_SOMA_EMBALAGENS AS   
 SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO -- Mesma consulta sem o having
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
    
SELECT EMBALAGEM, SOMA_PRECO
    FROM VW_SOMA_EMBALAGENS
WHERE SOMA_PRECO >= 80;

SELECT * FROM TABELA_DE_PRODUTOS TP
    INNER JOIN VW_SOMA_EMBALAGENS VW ON (TP.EMBALAGEM = VW.EMBALAGEM)
WHERE VW.SOMA_PRECO >= 80;   

-- Usando uma view para substituir o Having

-- Redesenhe esta consulta, criando uma vis�o para a lista de quantidades totais
-- por produto e aplicando a condi��o e ordena��o sobre essa mesma vis�o.
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) 
    FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO 
HAVING SUM(INF.QUANTIDADE) > 394000 
ORDER BY SUM(INF.QUANTIDADE) DESC;

CREATE VIEW VW_QUANTIDADE_PRODUTOS AS 
SELECT INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO, SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL 
    FROM ITENS_NOTAS_FISCAIS INF
INNER JOIN TABELA_DE_PRODUTOS TP ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO;

SELECT * FROM VW_QUANTIDADE_PRODUTOS
WHERE QUANTIDADE_TOTAL > 394000 
ORDER BY QUANTIDADE_TOTAL DESC