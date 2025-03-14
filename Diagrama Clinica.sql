CREATE TABLE `Clinica` (
	`id_clinica` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`id_endereco` INTEGER,
	`telefone` VARCHAR(15),
	`email` VARCHAR(100),
	PRIMARY KEY(`id_clinica`)
);


CREATE TABLE `Funcionario` (
	`id_funcionario` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`cpf` VARCHAR(14) UNIQUE,
	`id_endereco` INTEGER,
	`telefone` VARCHAR(15),
	`email` VARCHAR(100),
	`cargo` VARCHAR(50),
	PRIMARY KEY(`id_funcionario`)
);


CREATE TABLE `Secretaria` (
	`id_secretaria` INTEGER AUTO_INCREMENT,
	`id_funcionario` INTEGER,
	`login` VARCHAR(50) UNIQUE,
	`senha` VARCHAR(100),
	PRIMARY KEY(`id_secretaria`)
);


CREATE TABLE `Medico` (
	`id_medico` INTEGER AUTO_INCREMENT,
	`id_funcionario` INTEGER,
	`crm` VARCHAR(20) UNIQUE,
	`especialidade` VARCHAR(100),
	PRIMARY KEY(`id_medico`)
);


CREATE TABLE `Paciente` (
	`id_paciente` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`cpf` VARCHAR(14) UNIQUE,
	`id_endereco` INTEGER,
	`telefone` VARCHAR(15),
	`email` VARCHAR(100),
	`data_nascimento` DATE,
	PRIMARY KEY(`id_paciente`)
);


CREATE TABLE `PlanoSaude` (
	`id_plano` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`codigo` VARCHAR(50),
	PRIMARY KEY(`id_plano`)
);


CREATE TABLE `Paciente_Plano` (
	`id_paciente` INTEGER,
	`id_plano` INTEGER,
	`numero_carteira` VARCHAR(50),
	PRIMARY KEY(`id_paciente`, `id_plano`)
);


CREATE TABLE `Consulta` (
	`id_consulta` INTEGER AUTO_INCREMENT,
	`id_paciente` INTEGER,
	`id_medico` INTEGER,
	`id_clinica` INTEGER,
	`data_hora` DATETIME,
	`observacoes` TEXT,
	PRIMARY KEY(`id_consulta`)
);


CREATE TABLE `Exame` (
	`id_exame` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`descricao` TEXT,
	PRIMARY KEY(`id_exame`)
);


CREATE TABLE `Solicitacao_Exame` (
	`id_solicitacao` INTEGER AUTO_INCREMENT,
	`id_consulta` INTEGER,
	`id_exame` INTEGER,
	`data_solicitacao` DATE,
	`data_resultado` DATE,
	`resultado` TEXT,
	PRIMARY KEY(`id_solicitacao`)
);


CREATE TABLE `Historico_Medico` (
	`id_historico` INTEGER AUTO_INCREMENT,
	`id_paciente` INTEGER,
	`id_medico` INTEGER,
	`data_observacao` DATE,
	`observacao` TEXT,
	PRIMARY KEY(`id_historico`)
);


CREATE TABLE `Clinica_Medico` (
	`id_clinica` INTEGER,
	`id_medico` INTEGER,
	PRIMARY KEY(`id_clinica`, `id_medico`)
);


CREATE TABLE `Secretaria_Medico` (
	`id_secretaria` INTEGER,
	`id_medico` INTEGER,
	PRIMARY KEY(`id_secretaria`, `id_medico`)
);


CREATE TABLE `Estado` (
	`id_estado` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(50) NOT NULL,
	PRIMARY KEY(`id_estado`)
);


CREATE TABLE `Cidade` (
	`id_cidade` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`id_estado` INTEGER,
	PRIMARY KEY(`id_cidade`)
);


CREATE TABLE `Bairro` (
	`id_bairro` INTEGER AUTO_INCREMENT,
	`nome` VARCHAR(100) NOT NULL,
	`id_cidade` INTEGER,
	PRIMARY KEY(`id_bairro`)
);


CREATE TABLE `Endereco` (
	`id_endereco` INTEGER AUTO_INCREMENT,
	`rua` VARCHAR(100) NOT NULL,
	`numero` VARCHAR(10),
	`complemento` VARCHAR(100),
	`id_bairro` INTEGER,
	PRIMARY KEY(`id_endereco`)
);


ALTER TABLE `Secretaria`
ADD FOREIGN KEY(`id_funcionario`) REFERENCES `Funcionario`(`id_funcionario`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Medico`
ADD FOREIGN KEY(`id_funcionario`) REFERENCES `Funcionario`(`id_funcionario`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Paciente_Plano`
ADD FOREIGN KEY(`id_paciente`) REFERENCES `Paciente`(`id_paciente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Paciente_Plano`
ADD FOREIGN KEY(`id_plano`) REFERENCES `PlanoSaude`(`id_plano`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Consulta`
ADD FOREIGN KEY(`id_paciente`) REFERENCES `Paciente`(`id_paciente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Consulta`
ADD FOREIGN KEY(`id_medico`) REFERENCES `Medico`(`id_medico`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Consulta`
ADD FOREIGN KEY(`id_clinica`) REFERENCES `Clinica`(`id_clinica`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Solicitacao_Exame`
ADD FOREIGN KEY(`id_consulta`) REFERENCES `Consulta`(`id_consulta`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Solicitacao_Exame`
ADD FOREIGN KEY(`id_exame`) REFERENCES `Exame`(`id_exame`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Historico_Medico`
ADD FOREIGN KEY(`id_paciente`) REFERENCES `Paciente`(`id_paciente`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Historico_Medico`
ADD FOREIGN KEY(`id_medico`) REFERENCES `Medico`(`id_medico`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Clinica_Medico`
ADD FOREIGN KEY(`id_clinica`) REFERENCES `Clinica`(`id_clinica`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Clinica_Medico`
ADD FOREIGN KEY(`id_medico`) REFERENCES `Medico`(`id_medico`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Secretaria_Medico`
ADD FOREIGN KEY(`id_secretaria`) REFERENCES `Secretaria`(`id_secretaria`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Secretaria_Medico`
ADD FOREIGN KEY(`id_medico`) REFERENCES `Medico`(`id_medico`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Clinica`
ADD FOREIGN KEY(`id_endereco`) REFERENCES `Endereco`(`id_endereco`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Endereco`
ADD FOREIGN KEY(`id_endereco`) REFERENCES `Funcionario`(`id_endereco`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Endereco`
ADD FOREIGN KEY(`id_bairro`) REFERENCES `Bairro`(`id_bairro`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Bairro`
ADD FOREIGN KEY(`id_cidade`) REFERENCES `Cidade`(`id_cidade`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Cidade`
ADD FOREIGN KEY(`id_estado`) REFERENCES `Estado`(`id_estado`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `Paciente`
ADD FOREIGN KEY(`id_endereco`) REFERENCES `Endereco`(`id_endereco`)
ON UPDATE NO ACTION ON DELETE NO ACTION;