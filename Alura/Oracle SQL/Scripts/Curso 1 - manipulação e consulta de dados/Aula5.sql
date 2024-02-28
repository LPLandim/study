SELECT * FROM TB_CLIENTES;
SELECT * FROM TB_PRODUTOS;

SELECT produto, nome, embalagem, tamanho, sabor, preco_lista
    FROM tb_produtos;
    
SELECT PRODUTO AS "C�digo do Produto",
          NOME AS "Nome do Produto"
    FROM TB_PRODUTOS;
    
--------------------------------------

-- Aula 5.2 - Filtrando o resultado das consultas

SELECT * FROM TB_PRODUTOS;

SELECT * FROM TB_PRODUTOS WHERE PRODUTO = '1040107';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Melancia';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Limao';

UPDATE TB_PRODUTOS SET SABOR = 'Citricos' WHERE SABOR = 'Limao';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Citricos';

-------------------------------------------------------

-- Aula 5.3 - Filtros Condicionais

SELECT * FROM TB_CLIENTES;

SELECT * FROM TB_CLIENTES
    WHERE IDADE = 22;
    
SELECT * FROM TB_CLIENTES
    WHERE IDADE > 22;
    
SELECT * FROM TB_CLIENTES
    WHERE IDADE >= 22;   
    
SELECT * FROM TB_CLIENTES
    WHERE IDADE <= 22;  
    
SELECT * FROM TB_CLIENTES
    WHERE IDADE <> 22;      
    
SELECT * FROM TB_CLIENTES
    WHERE NOME > 'Marcelo Mattos';      

SELECT * FROM TB_CLIENTES
    WHERE NOME <> 'Marcelo Mattos';
    
SELECT * FROM TB_PRODUTOS 
    WHERE PRECO_LISTA > 16.008;
    
SELECT * FROM TB_PRODUTOS 
    WHERE PRECO_LISTA = 16.00;    

SELECT * FROM TB_PRODUTOS 
    WHERE PRECO_LISTA > 16.00;   
    
SELECT NOME, PERCENTUAL_COMISSAO FROM TB_VENDEDORES
    WHERE PERCENTUAL_COMISSAO < 0.17;

--------------------------------------------

-- Aula 5.4 - Filtros com datas

SELECT * FROM TB_CLIENTES;

SELECT * FROM TB_CLIENTES
    WHERE DATA_NASCIMENTO = '25/03/92';
    
SELECT * FROM TB_CLIENTES
    WHERE DATA_NASCIMENTO = TO_DATE('25/03/1992', 'DD/MM/YYYY');
    
SELECT * FROM TB_CLIENTES
    WHERE DATA_NASCIMENTO = TO_DATE('03/25/1992', 'MM/DD/YYYY');
    
SELECT * FROM TB_CLIENTES
    WHERE DATA_NASCIMENTO > TO_DATE('25/03/1992', 'DD/MM/YYYY');   
    
SELECT * FROM TB_CLIENTES
    WHERE DATA_NASCIMENTO < TO_DATE('25/03/1992', 'DD/MM/YYYY'); 
    
SELECT * FROM TB_CLIENTES
    WHERE TO_CHAR(DATA_NASCIMENTO, 'MM') = 9;    


SELECT * FROM TB_VENDEDORES 
    WHERE DT_ADMISSAO >= '01/01/2020';
    
--------------------------------------------------------

-- Aula 5.5 -- Consultando dados da tabela

-- AND (E) OR (OU)
-- VERDADEIRA AND VERDADEIRA = VERDADEIRA
-- VERDADEIRA AND FALSA = FALSA
-- VERDADEIRA OR VERDADEIRA = VERDADEIRA
-- VERDADEIRA OR FALSA = VERDADEIRA

-- NOT (VERDADEIRA AND VERDADEIRA) = FALSA
-- NOT (VERDADEIRA AND FALSA) = VERDADEIRA
-- NOT (VERDADEIRA OR VERDADEIRA) = FALSA
-- NOT (VERDADEIRA OR FALSA) = FALSA

SELECT * FROM TB_PRODUTOS;

SELECT * FROM TB_PRODUTOS
    WHERE PRECO_LISTA >= 16;
    
SELECT * FROM TB_PRODUTOS
    WHERE PRECO_LISTA >= 16 AND PRECO_LISTA <=21;    
    
SELECT * FROM TB_PRODUTOS
    WHERE PRECO_LISTA > 16 AND SABOR = 'Laranja';
    
SELECT * FROM TB_PRODUTOS
    WHERE PRECO_LISTA >= 16 OR SABOR = 'Laranja';    

SELECT * FROM TB_PRODUTOS
    WHERE NOT (PRECO_LISTA >= 16 OR SABOR = 'Laranja');
    
------------------------------------------------------------    
    
SELECT * FROM TB_CLIENTES 
    WHERE (IDADE >= 18 AND SEXO = 'F') AND BAIRRO = 'Jardins';
    
SELECT * FROM TB_CLIENTES 
    WHERE (IDADE >= 18 AND SEXO = 'F')
    AND (CIDADE = 'Sao Paulo' OR BAIRRO = 'Barra da Tijuca'); 

SELECT * FROM TB_CLIENTES 
    WHERE (IDADE >= 18 AND SEXO = 'F'
    AND CIDADE = 'Sao Paulo') OR BAIRRO = 'Barra da Tijuca'; 
    
SELECT * FROM TB_VENDEDORES
    WHERE PERCENTUAL_COMISSAO > 0.19 OR PERCENTUAL_COMISSAO < 0.15;

