--Operadoras--
CREATE TABLE operadoras(
	Registro_ANS VARCHAR(6) PRIMARY KEY,
	CNPJ VARCHAR(14),
	Razao_Social VARCHAR(200),
	Nome_Fantasia VARCHAR(200),
	Modalidade VARCHAR(200),
	Logradouro VARCHAR(200),
	Numero VARCHAR(20),
	Complemento VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP CHAR(8),
    DDD CHAR(2),
    Telefone VARCHAR(20),
    Fax VARCHAR(15),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(150),
    Cargo_Representante VARCHAR(100),
    Regiao_de_Comercializacao INTEGER,
    Data_Registro_ANS DATE
);

--Importar CSV para tabela Operadoras--
SET client_encoding to 'WIN1252';
\COPY operadoras FROM 'C:/Users/luiza/relatorios/Relatorio_cadop.csv' DELIMITER ';' CSV HEADER;

--1t23
CREATE TABLE primeiro_trimestre_23 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

--tabela auxiliar
CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);
--importar dados
\COPY estagio FROM 'C:/Users/luiza/relatorios/1T2023.csv' DELIMITER ';' CSV HEADER;

--inserir apenas se o registro ans existir em operadoras
INSERT INTO primeiro_trimestre_23 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from primeiro_trimestre_23;

--2t23
CREATE TABLE segundo_trimestre_23 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/2t2023.csv' DELIMITER ';' CSV HEADER;

INSERT INTO segundo_trimestre_23 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from segundo_trimestre_23;


--3t23
CREATE TABLE terceiro_trimestre_23 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/3T2023.csv' DELIMITER ';' CSV HEADER;

INSERT INTO terceiro_trimestre_23 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from terceiro_trimestre_23;

--4t23
CREATE TABLE quarto_trimestre_23 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/4T2023.csv' DELIMITER ';' CSV HEADER;

INSERT INTO quarto_trimestre_23 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from quarto_trimestre_23;


--1t24
CREATE TABLE primeiro_trimestre_24 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/1T2024.csv' DELIMITER ';' CSV HEADER;

INSERT INTO primeiro_trimestre_24 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from primeiro_trimestre_24;


--2t24
CREATE TABLE segundo_trimestre_24 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/2T2024.csv' DELIMITER ';' CSV HEADER;

INSERT INTO segundo_trimestre_24 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from segundo_trimestre_24;

--3t24
CREATE TABLE terceiro_trimestre_24 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/3T2024.csv' DELIMITER ';' CSV HEADER;

INSERT INTO terceiro_trimestre_24 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from terceiro_trimestre_24;

--4t24
CREATE TABLE quarto_trimestre_24 (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2),
    CONSTRAINT fk_reg_ans
        FOREIGN KEY (REG_ANS)
        REFERENCES Operadoras(Registro_ANS)
);

CREATE TABLE estagio (
    Data DATE,
    Reg_ans VARCHAR(50),
    Cd_conta_contabil VARCHAR(50),
    Descricao VARCHAR(255),
    Vl_saldo_inicial NUMERIC(15,2),
    Vl_saldo_final NUMERIC(15,2)
);

\COPY estagio FROM 'C:/Users/luiza/relatorios/4T2024.csv' DELIMITER ';' CSV HEADER;

INSERT INTO quarto_trimestre_24 
SELECT 
	e.Data,
	e.Reg_ans,
	e.Cd_conta_contabil,
	e.Descricao,
	e.Vl_saldo_inicial,
	e.Vl_saldo_final
FROM estagio e
JOIN operadoras o
ON e.Reg_ans = o.Registro_ANS;

DROP TABLE estagio;
select *from quarto_trimestre_24;

--10 operadoras com maiores despesas no último trimestre
SELECT 
	o.Razao_Social,
	SUM(q.vl_saldo_final - q.vl_saldo_inicial) AS Total_gasto
FROM quarto_trimestre_24 q
JOIN operadoras o 
	on o.Registro_ANS = q.Reg_ans
WHERE q.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR %'
GROUP BY o.Razao_Social
ORDER BY Total_gasto DESC
LIMIT 10;

--10 operadoras com maiores despesas no último ano
SELECT 
    o.Razao_Social,
    SUM(d.VL_SALDO_FINAL - d.VL_SALDO_INICIAL) AS Total_gasto
FROM (
    SELECT * FROM primeiro_trimestre_24
    UNION ALL
    SELECT * FROM segundo_trimestre_24
    UNION ALL
    SELECT * FROM terceiro_trimestre_24
    UNION ALL
    SELECT * FROM quarto_trimestre_24
) AS d
JOIN Operadoras o 
    ON d.REG_ANS = o.Registro_ANS
WHERE d.DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR %'
GROUP BY o.Razao_Social
ORDER BY Total_gasto DESC
LIMIT 10;


