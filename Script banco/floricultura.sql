-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Nov-2018 às 20:18
-- Versão do servidor: 10.1.35-MariaDB
-- versão do PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `floricultura`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `cod_car` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `fkvenda` int(11) NOT NULL,
  `idpprod` varchar(50) NOT NULL,
  `unidade` int(11) NOT NULL,
  `val_total` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`cod_car`, `cod_prod`, `fkvenda`, `idpprod`, `unidade`, `val_total`, `valor_unitario`) VALUES
(18, 2, 2, 'sera', 2, '10.00', '10.00');

--
-- Acionadores `carrinho`
--
DELIMITER $$
CREATE TRIGGER `insert_det` AFTER UPDATE ON `carrinho` FOR EACH ROW INSERT INTO detalhe_venda  (produto, unidade, valor_unitario, valor_total, idfk_venda, idfk_prod)  VALUES (New.idpprod,New.unidade, New.valor_unitario,  New.val_total,New.fkvenda, New.cod_prod)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`cod_categoria`, `nome_categoria`) VALUES
(1, 'Sementes'),
(2, 'Buquês'),
(3, 'Cestas'),
(4, 'Vasos'),
(5, 'Flores'),
(6, 'Plantas'),
(7, 'Arranjos'),
(8, 'Coroas'),
(9, 'Insumos'),
(10, 'Presentes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cli` int(11) NOT NULL,
  `nome_cli` varchar(100) NOT NULL,
  `cpf_cli` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `num_endereco` int(11) NOT NULL,
  `cidade_uf` varchar(50) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cli`, `nome_cli`, `cpf_cli`, `endereco`, `num_endereco`, `cidade_uf`, `bairro`, `telefone`, `celular`) VALUES
(5, 'ANA', '12345', 'r dd', 23, 'Itape/sp', 'lalala', '33333', '4444'),
(7, 'cesar', '102030', 'erere', 233, 'frfrf', 'vffvf', '34344', '4545');

-- --------------------------------------------------------

--
-- Estrutura da tabela `detalhe_venda`
--

CREATE TABLE `detalhe_venda` (
  `cod_detalhe` int(11) NOT NULL,
  `produto` varchar(20) NOT NULL,
  `unidade` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `idfk_venda` int(11) NOT NULL,
  `idfk_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `detalhe_venda`
--

INSERT INTO `detalhe_venda` (`cod_detalhe`, `produto`, `unidade`, `valor_unitario`, `valor_total`, `idfk_venda`, `idfk_prod`) VALUES
(12, '3', 10, '0.00', '30.00', 3, 1),
(13, '4', 10, '0.00', '40.00', 3, 1),
(14, 'fffffffffff', 3, '4.00', '30.00', 3, 2),
(15, 'ddd', 2, '10.00', '20.00', 3, 2),
(16, 'dfdfdf', 3, '10.00', '30.00', 3, 5),
(17, 'sedefre', 4, '5.00', '30.00', 3, 5),
(18, '3', 10, '0.00', '30.00', 4, 1),
(19, '4', 10, '0.00', '40.00', 4, 1),
(20, 'fffffffffff', 3, '4.00', '30.00', 4, 2),
(21, 'ddd', 2, '10.00', '20.00', 4, 2),
(22, 'dfdfdf', 3, '10.00', '30.00', 4, 5),
(23, 'sedefre', 4, '5.00', '30.00', 4, 5),
(24, 'sementes', 6, '10.00', '30.00', 4, 1),
(28, 'kkkk', 3, '4.00', '30.00', 7, 1),
(29, 'kkkk', 3, '4.00', '30.00', 8, 1),
(30, 'fffffffffff', 3, '4.00', '30.00', 8, 2),
(31, 'fff', 5, '55.00', '40.00', 8, 3);

--
-- Acionadores `detalhe_venda`
--
DELIMITER $$
CREATE TRIGGER `desconto_trigger` AFTER INSERT ON `detalhe_venda` FOR EACH ROW UPDATE produto as pd inner JOIN detalhe_venda as dt set pd.quantidade=pd.quantidade-NEW.unidade where pd.cod_prod=new.idfk_prod
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id_fun` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf_func` int(11) NOT NULL,
  `data_reg` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_per_fk` int(11) NOT NULL,
  `senha_fun` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id_fun`, `nome`, `cpf_func`, `data_reg`, `id_per_fk`, `senha_fun`) VALUES
(1, 'cesar', 1234567, '2018-10-18 19:36:55', 1, '123'),
(2, 'lucas', 123456, '2018-10-18 19:36:55', 2, '123'),
(6, 'suzana', 12345678, '2018-11-07 19:25:53', 2, '123'),
(7, 'ss', 0, '2018-11-19 00:33:47', 1, '123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_per` int(11) NOT NULL,
  `perfil` varchar(1) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id_per`, `perfil`, `data`) VALUES
(1, 'A', '2018-10-18 19:17:29'),
(2, 'U', '2018-10-18 19:17:29'),
(3, 'C', '2018-10-18 19:17:57');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `cod_prod` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` double(10,2) NOT NULL,
  `Id_categoria_fk` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`cod_prod`, `nome`, `preco`, `Id_categoria_fk`, `quantidade`) VALUES
(1, '20 Sementes de Orquídea', 10.00, 1, 5),
(2, 'Buquê de 30 Rosas Vermelhas', 230.00, 2, 8),
(3, 'Cesta de Flores do Campo', 150.00, 3, 12),
(4, 'Cachepot de Cerâmica', 80.00, 4, 17),
(5, 'Violeta', 15.00, 5, 11),
(6, 'Cacto Mandacaru Pote 30L', 100.00, 6, 17),
(7, 'Mix de Margaridas vaso de vidro', 50.00, 7, 17),
(8, 'Coroa de Flores para Velório', 600.00, 8, 17),
(9, 'Terra Vegetal 5 Kg', 10.00, 9, 17),
(10, 'Cesta de Chocolate', 150.00, 10, 17),
(13, 'tulipa', 1.00, 5, 17),
(32, 'sd', 43.00, 5, 31),
(33, 'weweweweewe', 3434343.00, 5, 17),
(35, 'Margarida', 14.00, 5, 47),
(36, 'yyy', 34.00, 6, 17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `cod_venda` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cod_cli` int(11) NOT NULL,
  `form_pg` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`cod_venda`, `data`, `cod_cli`, `form_pg`) VALUES
(1, '2018-11-28 16:50:20', 5, 'cartao'),
(2, '2018-11-28 16:50:20', 7, 'a vista'),
(3, '2018-11-28 16:50:20', 5, 'cartao'),
(4, '2018-11-28 16:50:20', 7, 'a vista'),
(5, '2018-11-28 16:50:20', 5, 'a vista'),
(6, '2018-11-28 16:50:20', 7, 'cartao'),
(7, '2018-11-28 16:50:20', 5, 'a vista'),
(8, '2018-11-28 16:50:38', 5, 'a vista');

--
-- Acionadores `venda`
--
DELIMITER $$
CREATE TRIGGER `upccarrinho` AFTER INSERT ON `venda` FOR EACH ROW UPDATE carrinho set fkvenda=new.cod_venda
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`cod_car`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cli`);

--
-- Indexes for table `detalhe_venda`
--
ALTER TABLE `detalhe_venda`
  ADD PRIMARY KEY (`cod_detalhe`),
  ADD KEY `fk_venda` (`idfk_venda`),
  ADD KEY `fk_prod` (`idfk_prod`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_fun`),
  ADD KEY `id_per_fk` (`id_per_fk`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_per`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_prod`),
  ADD KEY `Id_categoria_fk` (`Id_categoria_fk`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`cod_venda`),
  ADD KEY `fk_venda_cliente` (`cod_cli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `cod_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `detalhe_venda`
--
ALTER TABLE `detalhe_venda`
  MODIFY `cod_detalhe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_fun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `cod_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `cod_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `detalhe_venda`
--
ALTER TABLE `detalhe_venda`
  ADD CONSTRAINT `fk_prod` FOREIGN KEY (`idfk_prod`) REFERENCES `produto` (`cod_prod`),
  ADD CONSTRAINT `fk_venda` FOREIGN KEY (`idfk_venda`) REFERENCES `venda` (`cod_venda`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_per_fk`) REFERENCES `perfil` (`id_per`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`Id_categoria_fk`) REFERENCES `categoria` (`cod_categoria`);

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cod_cli`) REFERENCES `cliente` (`cod_cli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
