"CRIANDO A TABELA teste_titan"

CREATE DATABASE IF NOT EXISTS `teste_titan` DEFAULT CHARACTER SET utf8;
USE `teste_titan`;

"CRIANDO tabela_loja"

CREATE TABLE IF NOT EXISTS `teste_titan`.`tabela_loja` (
  `loj_prod` INT(8) UNSIGNED NOT NULL,
  `desc_loj` CHAR(40) NULL,
  PRIMARY KEY (`loj_prod`)
);

"CRIANDO tabela_produto"

CREATE TABLE IF NOT EXISTS `teste_titan`.`tabela_produto` (
  `cod_prod` INT(8) UNSIGNED UNIQUE NOT NULL,
  `loj_prod` INT(8) UNSIGNED NOT NULL,
  `desc_prod` CHAR(40) NULL,
  `dt_inclu_prod` DATE NULL,
  `preco_prod` DECIMAL(8,3) NULL,
  PRIMARY KEY (`cod_prod`)
);
ALTER TABLE `teste_titan`.`tabela_produto` ADD FOREIGN KEY (`loj_prod`) REFERENCES `teste_titan`.`tabela_loja`(`loj_prod`);

"CRIANDO tabela_estoque"

CREATE TABLE IF NOT EXISTS `teste_titan`.`tabela_estoque` (
  `cod_prod` INT(8) UNSIGNED UNIQUE NOT NULL,
  `loj_prod` INT(8) UNSIGNED NOT NULL,
  `qtd_prod` DECIMAL(15,3) NULL

);
ALTER TABLE `teste_titan`.`tabela_estoque` ADD FOREIGN KEY (`cod_prod`) REFERENCES `teste_titan`.`tabela_produto`(`cod_prod`);
ALTER TABLE `teste_titan`.`tabela_estoque` ADD FOREIGN KEY (`loj_prod`) REFERENCES `teste_titan`.`tabela_loja`(`loj_prod`);

"CRIANDO A tabela_loja"

INSERT `teste_titan`.`tabela_loja` (loj_prod, desc_loj)
VALUES
   (1, 'ZONA LESTE'),
   (2, 'ZONA SUL');

"INSERINDO PRODUTOS NAS LOJAS 1 E 2"

INSERT `teste_titan`.`tabela_produto` (cod_prod, loj_prod, desc_prod, dt_inclu_prod, preco_prod)
VALUES
   (170, 2, 'LEITE CONDESADO MOCOCA', '2010-12-30', 45.40),
   (174, 2, 'AÇUCAR', '2010-12-30', 4.99),
   (171, 2, 'REFREGERANTE', '2010-12-20', 8.00),
   (172, 2, 'FEIJÃO', '2010-12-30', 9.50),
   (173, 2, 'ARROZ', '2010-01-30', 8.70),
   
   
   (169, 1, 'PÃO DE FORMA', '2010-02-14', 6.50),
   (162, 1, 'QUEIJO PRATO', '2010-02-14', 12.00),
   (164, 1, 'PREZUNTO', '2010-02-14', 10.00),
   (163, 1, 'REQUEIJÃO', '2010-02-14', 4.50);

"ATUALIZANDO ESTOQUE COM A QUANTIDADE DE CADA PRODUTO"

INSERT `teste_titan`.`tabela_estoque` (cod_prod, loj_prod, qtd_prod)
VALUES
   (170, 2, 5.000),
   (174, 2, 2.000),
   (171, 2, 1.000),
   (172, 2, 5.000),
   (173, 2, 5.000),
   (169, 1, 500),
   (162, 1, 100),
   (164, 1, 100),
   (163, 1, 100);