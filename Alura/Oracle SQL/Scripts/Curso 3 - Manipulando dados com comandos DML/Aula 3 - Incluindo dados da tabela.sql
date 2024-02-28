-- Aula 3 - Incluindo dados na tabela

-- Aula 3.1 - Incluindo linhas na tabela

INSERT INTO PRODUTOS(codigo, descritor, sabor, tamanho, embalagem, preco_lista)
    VALUES ('1040107', 'Light - 350 ml - Melancia', 'Melancia', '350 ml', 'Lata', 4.6);
    
SELECT * FROM PRODUTOS;    

INSERT INTO PRODUTOS(codigo, descritor, sabor, tamanho, embalagem, preco_lista)
    VALUES ('1040108', 'Light - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 5);
    
INSERT INTO PRODUTOS
    VALUES ('1040109', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 3.6);
    
INSERT INTO PRODUTOS
    VALUES ('1040110', 'Light - 350 ml - Maca', 'Maca', '350 ml', 'Lata', 6); 
    
INSERT INTO PRODUTOS
    VALUES ('1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 8);

INSERT INTO TAB_EMPRESA (nome_empresa, cod_empresa) VALUES ('EMPRESA E0001','E0001');
INSERT INTO TAB_EMPRESA (nome_empresa, cod_empresa) VALUES ('EMPRESA E0002','E0002');


-- Aula 3.2 - Incluindo V�RIAS linhas na tabela

INSERT ALL
INTO PRODUTOS(CODIGO, DESCRITOR, PRECO_LISTA, TAMANHO, EMBALAGEM, SABOR)
    VALUES('1040112', 'Light - 450 ml - Manga', 5.8, '450 ml', 'Lata', 'Manga')
INTO PRODUTOS (CODIGO, DESCRITOR, PRECO_LISTA, TAMANHO, EMBALAGEM, SABOR)
    VALUES('1040113', 'Light - 450 ml - Melancia', 5.9, '450 ml', 'Lata', 'Melancia')
INTO PRODUTOS(CODIGO, DESCRITOR, PRECO_LISTA, TAMANHO, EMBALAGEM, SABOR)
    VALUES('1040114', 'Light - 450 ml - Maca', 6.8, '450 ml', 'Lata', 'Maca')   
SELECT * FROM DUAL;

SELECT * FROM PRODUTOS;

----------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABELA_DE_PRODUTOS_FONTE
(CODIGO_DO_PRODUTO NVARCHAR2(10) NOT NULL,
 NOME_DO_PRODUTO NVARCHAR2(50) NULL,
 EMBALAGEM NVARCHAR2(20) NULL,
 TAMANHO NVARCHAR2(10) NULL,
 SABOR NVARCHAR2(20) NULL,
 PRECO_DE_LISTA FLOAT NOT NULL);
 

INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1000889', 'Sabor da Montanha - 700 ml - Uva', 'Garrafa', '700 ml', 'Uva', 6.3090);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002334', 'Linha Citros - 1 Litro - Lima/Limao', 'PET', '1 Litro', 'Lima/Limao', 7.0040);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1002767', 'Videira do Campo - 700 ml - Cereja/Maca', 'Garrafa', '700 ml', 'Cereja/Maca', 8.4100);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1004327', 'Videira do Campo - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.5100);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1013793', 'Videira do Campo - 2 Litros - Cereja/Maca', 'PET', '2 Litros', 'Cereja/Maca', 24.0100);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1022450', 'Festival de Sabores - 2 Litros - Acai', 'PET', '2 Litros', 'Acai', 38.0120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1037797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.0080);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1040107', 'Light - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.5550);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1041119', 'Linha Citros - 700 ml - Lima/Limao', 'Garrafa', '700 ml', 'Lima/Limao', 4.9040);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1078680', 'Frescor do Verao - 470 ml - Manga', 'Garrafa', '470 ml', 'Manga', 5.1795);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1086543', 'Linha Refrescante - 1 Litro - Manga', 'PET', '1 Litro', 'Manga', 11.0105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1096818', 'Linha Refrescante - 700 ml - Manga', 'Garrafa', '700 ml', 'Manga', 7.7105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('1101035', 'Linha Refrescante - 1 Litro - Morango/Limao', 'PET', '1 Litro', 'Morango/Limao', 9.0105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('229900', 'Pedacos de Frutas - 350 ml - Maca', 'Lata', '350 ml', 'Maca', 4.2110);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('231776', 'Festival de Sabores - 700 ml - Acai', 'Garrafa', '700 ml', 'Acai', 13.3120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('235653', 'Frescor do Verao - 350 ml - Manga', 'Lata', '350 ml', 'Manga', 3.8595);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('243083', 'Festival de Sabores - 1,5 Litros - Maracuja', 'PET', '1,5 Litros', 'Maracuja', 10.5120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('290478', 'Videira do Campo - 350 ml - Melancia', 'Lata', '350 ml', 'Melancia', 4.5600);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('326779', 'Linha Refrescante - 1,5 Litros - Manga', 'PET', '1,5 Litros', 'Manga', 16.5105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('394479', 'Sabor da Montanha - 700 ml - Cereja', 'Garrafa', '700 ml', 'Cereja', 8.4090);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('479745', 'Clean - 470 ml - Laranja', 'Garrafa', '470 ml', 'Laranja', 3.7680);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('520380', 'Pedacos de Frutas - 1 Litro - Maca', 'PET', '1 Litro', 'Maca', 12.0110);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('695594', 'Festival de Sabores - 1,5 Litros - Acai', 'PET', '1,5 Litros', 'Acai', 28.5120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('723457', 'Festival de Sabores - 700 ml - Maracuja', 'Garrafa', '700 ml', 'Maracuja', 4.9120);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('746596', 'Light - 1,5 Litros - Melancia', 'PET', '1,5 Litros', 'Melancia', 19.5050);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('773912', 'Clean - 1 Litro - Laranja', 'PET', '1 Litro', 'Laranja', 8.0080);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('783663', 'Sabor da Montanha - 700 ml - Morango', 'Garrafa', '700 ml', 'Morango', 7.7090);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('788975', 'Pedacos de Frutas - 1,5 Litros - Maca', 'PET', '1,5 Litros', 'Maca', 18.0110);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('812829', 'Clean - 350 ml - Laranja', 'Lata', '350 ml', 'Laranja', 2.8080);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('826490', 'Linha Refrescante - 700 ml - Morango/Limao', 'Garrafa', '700 ml', 'Morango/Limao', 6.3105);
INSERT INTO TABELA_DE_PRODUTOS_FONTE (CODIGO_DO_PRODUTO, NOME_DO_PRODUTO, EMBALAGEM, TAMANHO, SABOR, PRECO_DE_LISTA) VALUES ('838819', 'Clean - 1,5 Litros - Laranja', 'PET', '1,5 Litros', 'Laranja', 12.0080);

INSERT INTO PRODUTOS
SELECT
    codigo_do_produto as CODIGO, 
    nome_do_produto as DESCRITOR,
    sabor,
    embalagem,
    tamanho,
    preco_de_lista
    FROM tabela_de_produtos_fonte;

SELECT * FROM PRODUTOS;

INSERT ALL
INTO TAB_DEPARTAMENTO
VALUES ('D0001','DEPARTAMENTO D0001', 'CAMPINAS','E0001')
INTO TAB_DEPARTAMENTO
VALUES ('D0002','DEPARTAMENTO D0002', 'CAMPO GRANDE','E0001')
INTO TAB_DEPARTAMENTO
VALUES ('D0003','DEPARTAMENTO D0003', 'CAMPINAS','E0001')
INTO TAB_DEPARTAMENTO
VALUES ('D0004','DEPARTAMENTO D0004', 'CURITIBA','E0002')
INTO TAB_DEPARTAMENTO
VALUES ('D0005','DEPARTAMENTO D0005', 'CAMPO GRANDE','E0002')
SELECT * FROM DUAL;

--------------------------------------------------------------------------------

-- Aula 3.3 Resolvendo o problema da chave prim�ria da aula passada

SELECT * FROM PRODUTOS;

INSERT INTO PRODUTOS
    VALUES ('1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 8);

SELECT P.CODIGO, TPF.CODIGO_DO_PRODUTO
    FROM produtos P
INNER JOIN TABELA_DE_PRODUTOS_FONTE TPF ON (P.CODIGO = TPF.CODIGO_DO_PRODUTO);

INSERT INTO PRODUTOS
SELECT
    codigo_do_produto as CODIGO, 
    nome_do_produto as DESCRITOR,
    sabor,
    embalagem,
    tamanho,
    preco_de_lista
    FROM tabela_de_produtos_fonte
WHERE CODIGO_DO_PRODUTO <> '1040107';  

-- OU

INSERT INTO PRODUTOS
SELECT
    codigo_do_produto as CODIGO, 
    nome_do_produto as DESCRITOR,
    sabor,
    embalagem,
    tamanho,
    preco_de_lista
    FROM tabela_de_produtos_fonte
WHERE NOT (CODIGO_DO_PRODUTO IN (
SELECT P.CODIGO, TPF.CODIGO_DO_PRODUTO
    FROM produtos P
INNER JOIN TABELA_DE_PRODUTOS_FONTE TPF ON (P.CODIGO = TPF.CODIGO_DO_PRODUTO)));

INSERT INTO TABELA_DE_PRODUTOS_FONTE
    VALUES('9999999', 'Novo Produto', 'Pet', '1 Litro', 'Indefinido', 10); 
    
--------------------------------------------------------------------------------

-- Aula 3.4 - Lendo dados de um arquivo externo

-- importando dados

Select * from clientes;

-- Aula 3.5 - Lendo dados de um arquivo CSV

SELECT * FROM VENDEDORES;

INSERT INTO VENDEDORES (MATRICULA, NOME, COMISSAO, DATA_ADMISSAO, FERIAS, BAIRRO) 
VALUES ('235', 'M�rcio Almeida Silva', 8, to_date('2014-08-15', 'RRRR-MM-DD'), 0, 'Tijuca');

INSERT INTO VENDEDORES (MATRICULA, NOME, COMISSAO, DATA_ADMISSAO, FERIAS, BAIRRO) 
VALUES ('236', 'Cl�udia Morais', 8, to_date('2013-09-17', 'RRRR-MM-DD'), 1, 'Jardins');

INSERT INTO VENDEDORES (MATRICULA, NOME, COMISSAO, DATA_ADMISSAO, FERIAS, BAIRRO) 
VALUES ('237', 'Roberta Martins', 11, to_date('2017-03-18', 'RRRR-MM-DD'), 1, 'Copacabana');

INSERT INTO VENDEDORES (MATRICULA, NOME, COMISSAO, DATA_ADMISSAO, FERIAS, BAIRRO) 
VALUES ('238', 'P�ricles Alves', 0, to_date('2016-08-21', 'RRRR-MM-DD'), 0, 'Santo Amaro');    

SELECT * FROM TAB_PROJETO;

-- Aula 3.6 - Lendo dados de um arquivo Excel

SELECT * FROM NOTAS;
