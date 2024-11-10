-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Clima'
-- 
-- ---

DROP TABLE IF EXISTS `Clima`;
		
CREATE TABLE `Clima` (
  `id` INTEGER NOT NULL AUTO_INCREMENT DEFAULT NULL,
  `descricao` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Praga'
-- 
-- ---

DROP TABLE IF EXISTS `Praga`;
		
CREATE TABLE `Praga` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome` VARCHAR NOT NULL DEFAULT 'NULL',
  `estagio` VARCHAR NULL DEFAULT NULL,
  `nivel_infestacao` VARCHAR NULL DEFAULT NULL,
  `clima_id` INTEGER NULL DEFAULT NULL,
  `new field` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `clima_id`)
);

-- ---
-- Table 'praga_cultura'
-- 
-- ---

DROP TABLE IF EXISTS `praga_cultura`;
		
CREATE TABLE `praga_cultura` (
  `praga_id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `cultura_id` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`praga_id`)
);

-- ---
-- Table 'cultura'
-- 
-- ---

DROP TABLE IF EXISTS `cultura`;
		
CREATE TABLE `cultura` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `tipo_cultura` VARCHAR NULL DEFAULT NULL,
  `estagio_fenologico` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Produto'
-- 
-- ---

DROP TABLE IF EXISTS `Produto`;
		
CREATE TABLE `Produto` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `nome_produto` VARCHAR NOT NULL DEFAULT 'NULL',
  `fabricante` VARCHAR NOT NULL DEFAULT 'NULL',
  `tipo` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'metodo_controle_produto'
-- 
-- ---

DROP TABLE IF EXISTS `metodo_controle_produto`;
		
CREATE TABLE `metodo_controle_produto` (
  `produto_id` INTEGER NULL DEFAULT NULL,
  `produto_id` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`produto_id`)
);

-- ---
-- Table 'metodo_controle'
-- 
-- ---

DROP TABLE IF EXISTS `metodo_controle`;
		
CREATE TABLE `metodo_controle` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `metodo` VARCHAR NOT NULL DEFAULT 'NULL',
  `produto_recomendado` VARCHAR NULL DEFAULT NULL,
  `dose_recomendada` VARCHAR NULL DEFAULT NULL,
  `metodo_alternativo` VARCHAR NULL DEFAULT NULL,
  `periodo_ideal` VARCHAR NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Clima` ADD FOREIGN KEY (id) REFERENCES `Praga` (`clima_id`);
ALTER TABLE `Praga` ADD FOREIGN KEY (id) REFERENCES `praga_cultura` (`praga_id`);
ALTER TABLE `praga_cultura` ADD FOREIGN KEY (cultura_id) REFERENCES `cultura` (`id`);
ALTER TABLE `Produto` ADD FOREIGN KEY (id) REFERENCES `metodo_controle_produto` (`produto_id`);
ALTER TABLE `metodo_controle_produto` ADD FOREIGN KEY (produto_id) REFERENCES `metodo_controle` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Clima` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Praga` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `praga_cultura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `cultura` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Produto` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `metodo_controle_produto` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `metodo_controle` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Clima` (`id`,`descricao`) VALUES
-- ('','');
-- INSERT INTO `Praga` (`id`,`nome`,`estagio`,`nivel_infestacao`,`clima_id`,`new field`) VALUES
-- ('','','','','','');
-- INSERT INTO `praga_cultura` (`praga_id`,`cultura_id`) VALUES
-- ('','');
-- INSERT INTO `cultura` (`id`,`tipo_cultura`,`estagio_fenologico`) VALUES
-- ('','','');
-- INSERT INTO `Produto` (`id`,`nome_produto`,`fabricante`,`tipo`) VALUES
-- ('','','','');
-- INSERT INTO `metodo_controle_produto` (`produto_id`,`produto_id`) VALUES
-- ('','');
-- INSERT INTO `metodo_controle` (`id`,`metodo`,`produto_recomendado`,`dose_recomendada`,`metodo_alternativo`,`periodo_ideal`) VALUES
-- ('','','','','','');