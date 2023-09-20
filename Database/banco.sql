-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.9.3-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para abpedidos
CREATE DATABASE IF NOT EXISTS `abpedidos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `abpedidos`;

-- Copiando estrutura para tabela abpedidos.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT IGNORE INTO `cliente` (`id_cliente`, `nome`, `cidade`, `uf`) VALUES
	(1, 'Audrey', 'Coronel Vivida', 'PR'),
	(2, 'Maria Mangoni', 'Chopinzinho', 'PR'),
	(3, 'Maria Eduarda', 'Coronel Vivida', 'PR'),
	(4, 'Thays', 'Honorio Serpa', 'PR'),
	(5, 'Deise', 'Pato Branco', 'PR');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela abpedidos.cond_pagto
CREATE TABLE IF NOT EXISTS `cond_pagto` (
  `id_cond_pagto` int(11) NOT NULL AUTO_INCREMENT,
  `cond_pagto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cond_pagto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.cond_pagto: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cond_pagto` DISABLE KEYS */;
INSERT IGNORE INTO `cond_pagto` (`id_cond_pagto`, `cond_pagto`) VALUES
	(1, 'A Vista'),
	(2, '15 Dias'),
	(3, '30 Dias'),
	(4, '45 Dias'),
	(5, '60 Dias');
/*!40000 ALTER TABLE `cond_pagto` ENABLE KEYS */;

-- Copiando estrutura para tabela abpedidos.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_cond_pagto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `dt_pedido` datetime DEFAULT NULL,
  `dt_entrega` datetime DEFAULT NULL,
  `vl_total` decimal(12,2) DEFAULT NULL,
  `obs` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_cond_pagto` (`id_cond_pagto`),
  KEY `id_usuario` (`id_usuario`),
  KEY `status` (`status`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_cond_pagto`) REFERENCES `cond_pagto` (`id_cond_pagto`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `pedido_ibfk_4` FOREIGN KEY (`status`) REFERENCES `pedido_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.pedido: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT IGNORE INTO `pedido` (`id_pedido`, `id_cliente`, `id_cond_pagto`, `id_usuario`, `status`, `dt_pedido`, `dt_entrega`, `vl_total`, `obs`) VALUES
	(1, 1, 1, 1, 'A', '2023-07-06 14:37:42', '2023-04-15 00:00:00', 1400.00, 'Entregar na parte da manhã'),
	(2, 2, 2, 1, 'A', '2023-07-06 14:37:42', '2023-03-01 00:00:00', 180.00, NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela abpedidos.pedido_item
CREATE TABLE IF NOT EXISTS `pedido_item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `qtd` decimal(12,3) DEFAULT NULL,
  `vl_unit` decimal(12,2) DEFAULT NULL,
  `vl_total` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pedido_item_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.pedido_item: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_item` DISABLE KEYS */;
INSERT IGNORE INTO `pedido_item` (`id_item`, `id_pedido`, `id_produto`, `qtd`, `vl_unit`, `vl_total`) VALUES
	(1, 1, 1, 2.000, 440.00, 880.00),
	(2, 1, 2, 1.000, 520.00, 520.00),
	(3, 2, 3, 2.000, 90.00, 180.00);
/*!40000 ALTER TABLE `pedido_item` ENABLE KEYS */;

-- Copiando estrutura para tabela abpedidos.pedido_status
CREATE TABLE IF NOT EXISTS `pedido_status` (
  `status` char(1) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.pedido_status: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_status` DISABLE KEYS */;
INSERT IGNORE INTO `pedido_status` (`status`, `descricao`) VALUES
	('A', 'Em aberto'),
	('F', 'Finalizado');
/*!40000 ALTER TABLE `pedido_status` ENABLE KEYS */;

-- Copiando estrutura para tabela abpedidos.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `vl_produto` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.produto: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT IGNORE INTO `produto` (`id_produto`, `descricao`, `vl_produto`) VALUES
	(1, 'Monitor Dell', 440.00),
	(2, 'Monitor HP', 520.00),
	(3, 'Mouse Microsoft', 90.00),
	(4, 'Mouse Logitech', 79.90),
	(5, 'HD Seagate 2TB ', 330.00),
	(6, 'Webcam Logitech', 295.00),
	(7, 'Teclado Logitech', 140.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela abpedidos.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela abpedidos.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT IGNORE INTO `usuario` (`id_usuario`, `email`, `senha`, `nome`) VALUES
	(1, 'audrey@teste.com', '12345', 'Audrey');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;