-- Aula 6.1 - Campo autoincremento
DROP TABLE TAB_IDENTITY;

CREATE TABLE TAB_IDENTITY
(ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
 DESCRITOR VARCHAR2(20),
 PRIMARY KEY(ID));
 
SELECT * FROM TAB_IDENTITY;

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 1');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 2');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 3');

DELETE FROM TAB_IDENTITY WHERE ID = 2;

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 4');

DELETE FROM TAB_IDENTITY WHERE ID = 4;
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 5');

SELECT * FROM TAB_IDENTITY;

INSERT INTO TAB_IDENTITY (ID, DESCRITOR) VALUES (7, 'CLIENTE 7');

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 6');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 7A');

DELETE FROM TAB_IDENTITY WHERE ID = 7;

INSERT INTO TAB_IDENTITY (ID, DESCRITOR) VALUES (2, 'CLIENTE 2');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE 9');

SELECT * FROM TAB_IDENTITY;

INSERT INTO TAB_IDENTITY (ID, DESCRITOR) VALUES (NULL, 'CLIENTE 10');
--------------------------------------------------------------------------------

-- Aula 6.2 - Valores padr�es dos campos

CREATE TABLE TAB_PADRAO
(ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
 DESCRITOR VARCHAR2(20) NOT NULL,
 ENDERECO VARCHAR2(100) NULL,
 CIDADE VARCHAR2(50) DEFAULT ON NULL 'Rio de Janeiro',
 DATA_CRIACAO DATE DEFAULT ON NULL SYSDATE,
 PRIMARY KEY(ID));
 
INSERT INTO TAB_PADRAO (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO)
    VALUES('Cliente 1', 'Rua do Com�rcio', 'S�o Paulo', TO_DATE('2022-01-01', 'YYYY-MM-DD'));
    
SELECT * FROM TAB_PADRAO;

INSERT INTO TAB_PADRAO (DESCRITOR)
    VALUES('Cliente 2');
--------------------------------------------------------------------------------

-- Aula 6.3 - Trigger

DELETE FROM ITENS_NOTAS;
DELETE FROM NOTAS;

SELECT * FROM CLIENTES;

SELECT * FROM VENDEDORES;

SELECT * FROM PRODUTOS;

SELECT * FROM NOTAS;
INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
    VALUES('001', TO_DATE('2019-01-01', 'YYYY-MM-DD'), '1471156710', '235', 0.1);
    
SELECT * FROM ITENS_NOTAS;
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
    VALUES('001', '1000889', 10, 10);
    
INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
    VALUES('002', TO_DATE('2019-01-01', 'YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
    VALUES('002', '1000889', 15, 10);
    
INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
    VALUES('003', TO_DATE('2019-01-02', 'YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
    VALUES('003', '1000889', 18, 10);

SELECT * FROM ITENS_NOTAS;
SELECT * FROM NOTAS;

SELECT N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
    FROM NOTAS N
INNER JOIN ITENS_NOTAS ITN ON (N.NUMERO = ITN.NUMERO)
GROUP BY N.DATA_VENDA;



CREATE TABLE TAB_FATURAMENTO 
(DATA_VENDA DATE NULL,
 FATURAMENTO FLOAT);
 
INSERT INTO TAB_FATURAMENTO
SELECT N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
    FROM NOTAS N
INNER JOIN ITENS_NOTAS ITN ON (N.NUMERO = ITN.NUMERO)
GROUP BY N.DATA_VENDA;

SELECT * FROM TAB_FATURAMENTO;

INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
    VALUES('004', TO_DATE('2019-01-02', 'YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
    VALUES('004', '1000889', 21, 10);
    
    
DELETE FROM TAB_FATURAMENTO;
INSERT INTO TAB_FATURAMENTO
SELECT N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
    FROM NOTAS N
INNER JOIN ITENS_NOTAS ITN ON (N.NUMERO = ITN.NUMERO)
GROUP BY N.DATA_VENDA;

SELECT * FROM TAB_FATURAMENTO;

--------------------------------------------------------------------------------

-- Aula 6.4 - Implementando a Triggger
/*
CREATE TRIGGER TGR_TAB_FATURAMENTO
    AFTER INSERT ON ITENS_NOTAS
BEGIN
    DELETE FROM TAB_FATURAMENTO;
    INSERT INTO TAB_FATURAMENTO
    SELECT N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
        FROM NOTAS N
    INNER JOIN ITENS_NOTAS ITN ON (N.NUMERO = ITN.NUMERO)
    GROUP BY N.DATA_VENDA;
END; */


SELECT * FROM TAB_FATURAMENTO;
INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
    VALUES('006', TO_DATE('2019-01-03', 'YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
    VALUES('006', '1000889', 40, 10);
    
--------------------------------------------------------------------------------

-- Aula 6.5 - Trigger UPDATE e DELETE

SELECT * FROM TAB_FATURAMENTO;

SELECT * FROM NOTAS;

UPDATE ITENS_NOTAS SET QUANTIDADE = 1000 WHERE NUMERO = '005';

DELETE FROM ITENS_NOTAS WHERE NUMERO = '005';
DELETE FROM NOTAS WHERE NUMERO = '005';

DROP TRIGGER TGR_TAB_FATURAMENTO;

/*
CREATE OR REPLACE TRIGGER TGR_TAB_FATURAMENTO
    AFTER INSERT OR UPDATE OR DELETE ON ITENS_NOTAS
BEGIN
    DELETE FROM TAB_FATURAMENTO;
    INSERT INTO TAB_FATURAMENTO
    SELECT N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
        FROM NOTAS N
    INNER JOIN ITENS_NOTAS ITN ON (N.NUMERO = ITN.NUMERO)
    GROUP BY N.DATA_VENDA;
END; */


SELECT * FROM TAB_FATURAMENTO;
INSERT INTO NOTAS (NUMERO, DATA_VENDA, CPF, MATRICULA, IMPOSTO)
    VALUES('007', TO_DATE('2019-01-03', 'YYYY-MM-DD'), '1471156710', '235', 0.1);
INSERT INTO ITENS_NOTAS (NUMERO, CODIGO, QUANTIDADE, PRECO)
    VALUES('007', '1000889', 40, 10);
    
UPDATE ITENS_NOTAS SET QUANTIDADE = 1000 WHERE NUMERO = '007';


UPDATE ITENS_NOTAS SET QUANTIDADE = 1000 WHERE NUMERO = '005';

DELETE FROM ITENS_NOTAS WHERE NUMERO = '005';
DELETE FROM NOTAS WHERE NUMERO = '005';

DROP TRIGGER TGR_TAB_FATURAMENTO;

/*
CREATE OR REPLACE TRIGGER TGR_TAB_FATURAMENTO
    AFTER INSERT OR UPDATE OR DELETE ON ITENS_NOTAS
BEGIN
    DELETE FROM TAB_FATURAMENTO;
    INSERT INTO TAB_FATURAMENTO
    SELECT N.DATA_VENDA, SUM(ITN.QUANTIDADE * ITN.PRECO) AS FATURAMENTO
        FROM NOTAS N
    INNER JOIN ITENS_NOTAS ITN ON (N.NUMERO = ITN.NUMERO)
    GROUP BY N.DATA_VENDA;
END; */


SELECT * FROM TAB_FATURAMENTO;
DELETE FROM ITENS_NOTAS WHERE NUMERO = '007';
DELETE FROM NOTAS WHERE NUMERO = '007';
    
    
SELECT TD.COD_DEPARTAMENTO, COUNT(*) AS NUM_FUNCIONARIOS FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
GROUP BY TD.COD_DEPARTAMENTO;

SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO;

SELECT TD.COD_DEPARTAMENTO, COUNT(*) AS NUM_FUNCIONARIO, TP.SOMA
 FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
INNER JOIN
(SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO) TP
ON TD.COD_DEPARTAMENTO = TP.COD_DEPARTAMENTO
GROUP BY TD.COD_DEPARTAMENTO, TP.SOMA;

SELECT TD.NOME_DEPARTAMENTO AS DEPARTAMENTO, TP.SOMA AS VALOR, COUNT(*) AS NUM_FUNC, ROUND(TP.SOMA/COUNT(*),2) AS TOTAL 
 FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
INNER JOIN
(SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO) TP
ON TD.COD_DEPARTAMENTO = TP.COD_DEPARTAMENTO
GROUP BY TD.NOME_DEPARTAMENTO, TP.SOMA;

CREATE TABLE TAB_FUNCIONARIO_ORCAMENTO
(DEPARTAMENTO VARCHAR(100), VALOR FLOAT);


DELETE FROM TAB_FUNCIONARIO_ORCAMENTO;
INSERT INTO TAB_FUNCIONARIO_ORCAMENTO
SELECT TD.NOME_DEPARTAMENTO AS DEPARTAMENTO, ROUND(TP.SOMA/COUNT(*),2) AS TOTAL 
 FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
INNER JOIN
(SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO) TP
ON TD.COD_DEPARTAMENTO = TP.COD_DEPARTAMENTO
GROUP BY TD.NOME_DEPARTAMENTO, TP.SOMA;


CREATE OR REPLACE TRIGGER TGR_TAB_FUNCIONARIO
AFTER INSERT OR UPDATE OR DELETE ON TAB_FUNCIONARIO
BEGIN
DELETE FROM TAB_FUNCIONARIO_ORCAMENTO;
INSERT INTO TAB_FUNCIONARIO_ORCAMENTO
SELECT TD.NOME_DEPARTAMENTO AS DEPARTAMENTO, ROUND(TP.SOMA/COUNT(*),2) AS TOTAL 
 FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
INNER JOIN
(SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO) TP
ON TD.COD_DEPARTAMENTO = TP.COD_DEPARTAMENTO
GROUP BY TD.NOME_DEPARTAMENTO, TP.SOMA;
END;


CREATE OR REPLACE TRIGGER TGR_TAB_PROJETO
AFTER INSERT OR UPDATE OR DELETE ON TAB_FUNCIONARIO
BEGIN
DELETE FROM TAB_FUNCIONARIO_ORCAMENTO;
INSERT INTO TAB_FUNCIONARIO_ORCAMENTO
SELECT TD.NOME_DEPARTAMENTO AS DEPARTAMENTO, ROUND(TP.SOMA/COUNT(*),2) AS TOTAL 
 FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
INNER JOIN
(SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO) TP
ON TD.COD_DEPARTAMENTO = TP.COD_DEPARTAMENTO
GROUP BY TD.NOME_DEPARTAMENTO, TP.SOMA;
END;


CREATE OR REPLACE TRIGGER TGR_TAB_DEPARTAMENTO
AFTER INSERT OR UPDATE OR DELETE ON TAB_FUNCIONARIO
BEGIN
DELETE FROM TAB_FUNCIONARIO_ORCAMENTO;
INSERT INTO TAB_FUNCIONARIO_ORCAMENTO
SELECT TD.NOME_DEPARTAMENTO AS DEPARTAMENTO, ROUND(TP.SOMA/COUNT(*),2) AS TOTAL 
 FROM
TAB_DEPARTAMENTO TD
INNER JOIN
TAB_FUNCIONARIO TF
ON TD.COD_DEPARTAMENTO = TF.COD_DEPARTAMENTO
INNER JOIN
(SELECT P.COD_DEPARTAMENTO, SUM(P.ORCAMENTO) AS SOMA
FROM TAB_PROJETO P
GROUP BY P.COD_DEPARTAMENTO) TP
ON TD.COD_DEPARTAMENTO = TP.COD_DEPARTAMENTO
GROUP BY TD.NOME_DEPARTAMENTO, TP.SOMA;
END;