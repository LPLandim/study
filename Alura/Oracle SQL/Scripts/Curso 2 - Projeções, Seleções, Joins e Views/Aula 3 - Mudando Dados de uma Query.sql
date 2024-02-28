-- Aula 3.1 -- Cl�usula DISTINCT com select

SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

SELECT DISTINCT(EMBALAGEM) FROM TABELA_DE_PRODUTOS;
    
SELECT DISTINCT(EMBALAGEM) FROM TABELA_DE_PRODUTOS
    WHERE SABOR = 'Laranja';    
    
SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;   

SELECT DISTINCT SABOR FROM TABELA_DE_PRODUTOS;

-------------------------------------------------------------------------------

-- Aula 3.2 -- Limitando a sa�da da consulta

SELECT * FROM TABELA_DE_PRODUTOS;

SELECT ROWNUM, TABELA_DE_PRODUTOS.* FROM TABELA_DE_PRODUTOS;

SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP; 

SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP
    WHERE ROWNUM <= 5;
    
SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP
    WHERE ROWNUM >= 2 AND ROWNUM <= 3; -- N�O FUNCIONA
    
SELECT * FROM NOTAS_FISCAIS;

SELECT * FROM NOTAS_FISCAIS
    WHERE DATA_VENDA = TO_DATE('01/10/2017', 'DD/MM/YYYY') AND ROWNUM <= 10;
    
----------------------------------------------------------------
    
-- Aula 3.3 - Ordenando a sa�da

SELECT * FROM TABELA_DE_PRODUTOS;

SELECT* FROM TABELA_DE_PRODUTOS
    ORDER BY PRECO_DE_LISTA; -- ASC PADR�O
    
SELECT* FROM TABELA_DE_PRODUTOS
    ORDER BY PRECO_DE_LISTA DESC;    
    
SELECT * FROM TABELA_DE_PRODUTOS
    ORDER BY NOME_DO_PRODUTO;
    
SELECT * FROM TABELA_DE_PRODUTOS
    ORDER BY EMBALAGEM, NOME_DO_PRODUTO;   
    
SELECT * FROM TABELA_DE_PRODUTOS
    ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO;   
    
SELECT * FROM TABELA_DE_PRODUTOS
    ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;
    
SELECT * FROM TABELA_DE_PRODUTOS 
WHERE nome_do_produto = 'Linha Refrescante - 1 Litro - Morango/Limao';

SELECT * FROM ITENS_NOTAS_FISCAIS
    WHERE codigo_do_produto = '1101035' ORDER BY QUANTIDADE DESC;
    
----------------------------------------------------------------------------

-- Aula 3.4 - Agrupando linhas das tabelas

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES
    ORDER BY CIDADE;
    
SELECT DISTINCT CIDADE, IDADE FROM TABELA_DE_CLIENTES
    ORDER BY CIDADE, IDADE;
    
SELECT CIDADE, SUM(IDADE) FROM TABELA_DE_CLIENTES
    GROUP BY CIDADE 
    ORDER BY CIDADE; 
    
SELECT CIDADE, SUM(LIMITE_DE_CREDITO), SUM(IDADE)
    FROM TABELA_DE_CLIENTES GROUP BY CIDADE;
    
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) 
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
    
SELECT EMBALAGEM, NOME_DO_PRODUTO
    FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM;
    
SELECT EMBALAGEM, COUNT(*) AS "Quantidade de produtos" FROM TABELA_DE_PRODUTOS
    GROUP BY EMBALAGEM ORDER BY EMBALAGEM;
    
SELECT EMBALAGEM, COUNT(*) AS "Quantidade de produtos" FROM TABELA_DE_PRODUTOS
    WHERE SABOR = 'Laranja'
    GROUP BY EMBALAGEM ORDER BY EMBALAGEM;
    
SELECT * FROM TABELA_DE_PRODUTOS;
SELECT * FROM ITENS_NOTAS_FISCAIS;

SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS
    WHERE codigo_do_produto = '1101035' AND quantidade = 99;
    
------------------------------------------------------------------------------

-- Aula 3.5 - Utilizando o Having para filtrar campos agregados

SELECT * FROM TABELA_DE_CLIENTES;

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES
    GROUP BY ESTADO;
    
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES
    WHERE SUM(LIMITE_DE_CREDITO) >= 900000
    GROUP BY ESTADO; -- ERRO
  
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES    
    GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS "Maior Pre�o", MIN(PRECO_DE_LISTA) AS "Menor Pre�o"
    FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;
    
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS "Maior Pre�o", MIN(PRECO_DE_LISTA) AS "Menor Pre�o"
    FROM TABELA_DE_PRODUTOS
    WHERE PRECO_DE_LISTA >= 10 GROUP BY EMBALAGEM; 
    
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS "Maior Pre�o", MIN(PRECO_DE_LISTA) AS "Menor Pre�o"
    FROM TABELA_DE_PRODUTOS
    WHERE PRECO_DE_LISTA >= 10
    GROUP BY EMBALAGEM 
HAVING MAX(PRECO_DE_LISTA) >= 20; 

SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS 
GROUP BY CODIGO_DO_PRODUTO ORDER BY SUM(QUANTIDADE) DESC;

SELECT CODIGO_DO_PRODUTO, SUM(QUANTIDADE) FROM ITENS_NOTAS_FISCAIS 
    GROUP BY CODIGO_DO_PRODUTO 
    HAVING SUM(QUANTIDADE) > 394000 
    ORDER BY SUM(QUANTIDADE) DESC;
    
------------------------------------------------------------------------------

-- Aula 3.6 -- Classificando os campos com CASE WHEN

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA
    FROM TABELA_DE_PRODUTOS;
    
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'Produto Caro'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'Produto em Conta'
          ELSE 'Produto Barato'
          END) AS Classifica��o  
    FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';
          
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'Produto Caro'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'Produto em Conta'
          ELSE 'Produto Barato'
          END) AS Classifica��o  
FROM TABELA_DE_PRODUTOS
    ORDER BY
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'Produto Caro'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'Produto em Conta'
          ELSE 'Produto Barato'
          END);  
          
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
    (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'Produto Caro'
          WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'Produto em Conta'
          ELSE 'Produto Barato'
          END) AS "Classifica��o" 
FROM TABELA_DE_PRODUTOS
    ORDER BY "Classifica��o";
    
SELECT NOME,
    (CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'Clientes grandes'
          WHEN LIMITE_DE_CREDITO BETWEEN 150000 AND 110000 THEN 'Clientes m�dios'
          WHEN LIMITE_DE_CREDITO < 110000 THEN 'Clientes pequenos'
          END) AS "Classifica��o"
FROM TABELA_DE_CLIENTES
    ORDER BY "Classifica��o";
    
------------------------------------------------------------------------------
