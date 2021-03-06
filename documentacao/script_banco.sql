CREATE DATABASE odontoenterprise;

CREATE TABLE usuarios(
	us_id INT AUTO_INCREMENT PRIMARY KEY,
	us_nome VARCHAR(255)NOT NULL,
	us_login VARCHAR(255) NOT NULL,
	us_senha CHAR(32) NOT NULL,
	us_administrador BOOLEAN DEFAULT FALSE,
	us_dentista BOOLEAN DEFAULT FALSE
);

CREATE TABLE clientes(
	cli_id INT AUTO_INCREMENT PRIMARY KEY,
	cli_nome VARCHAR(255) NOT NULL,
	cli_nascimento DATE,
	cli_endereco VARCHAR(255),
	cli_cidade VARCHAR(128),
	cli_uf CHAR(2),
	cli_cep CHAR(11),
	cli_compl_endereco TEXT,
	cli_mae VARCHAR(128),
	cli_empresa_trabalha VARCHAR(255),
	cli_profissao VARCHAR(50),
	cli_fone_trabalho VARCHAR(15),
	cli_fone_residencial VARCHAR(15),
	cli_fone_celular VARCHAR(15),
	cli_email VARCHAR(128),
	cli_obs TEXT
);

CREATE TABLE servicos(
	srv_id INT AUTO_INCREMENT PRIMARY KEY,
	srv_nome VARCHAR(255) NOT NULL,
	srv_valor DECIMAL(16,2) NOT NULL
);


CREATE TABLE orcamento(
	orc_id INT AUTO_INCREMENT PRIMARY KEY,
	orc_data DATE,
	orc_hora TIME,
	orc_cliente INT NOT NULL,
	orc_dentista INT NOT NULL,
	orc_valor_total DECIMAL(16,2),
	orc_forma_pagamento ENUM('DINHEIRO','CREDITO/DÉBITO','CHEQUE'),
	orc_parcelas INT,
	orc_obs TEXT
);


CREATE TABLE orcamento_item(
	ori_id INT AUTO_INCREMENT PRIMARY KEY,
	ori_atendimento INT NOT NULL,
	ori_servico INT NOT NULL,
	ori_valor DECIMAL(16,2)
);

CREATE TABLE parcelas(
	par_id INT AUTO_INCREMENT PRIMARY KEY,
	par_orcamento INT NOT NULL,
	par_numero_parcela INT,
	par_valor DECIMAL(16,2),
	par_pago BOOLEAN DEFAULT FALSE NOT NULL
);



CREATE TABLE anaminese(
	ans_id INT AUTO_INCREMENT PRIMARY KEY,
	ans_cliente INT NOT NULL,
	ans_orcamento INT,
	ans_fumante BOOLEAN DEFAULT FALSE NOT NULL,
	ans_exercicio BOOLEAN DEFAULT FALSE NOT NULL,
	ans_doenca BOOLEAN DEFAULT FALSE NOT NULL,
	ans_desc_doenca VARCHAR(255),
	ans_operacao_recente BOOLEAN DEFAULT FALSE NOT NULL,
	ans_desc_operacao VARCHAR(255),
	ans_doenca_hereditaria BOOLEAN DEFAULT FALSE NOT NULL,
	ans_desc_doenca_hereritaria VARCHAR(255),
	ans_medicacao_continua BOOLEAN DEFAULT FALSE NOT NULL,
	ans_desc_medicacao_continua VARCHAR(255),
	ans_alergia BOOLEAN DEFAULT FALSE NOT NULL,
	ans_desc_alegergias VARCHAR(255),
	ans_DST BOOLEAN DEFAULT FALSE NOT NULL,
	ans_desc_DST VARCHAR(255),
	ans_obs TEXT
);

