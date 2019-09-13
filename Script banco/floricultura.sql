-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Nov-2018 às 20:05
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
(5, 'ANA', '12345', 'r ddddd', 23, 'Itape/sp', 'lalala', '33333', '4444'),
(6, 'Souza', '1010', 'r ahsuahs', 65, 'Itape/sp', 'fantasia', '232323', '34343'),
(7, 'cesar', '102030', 'erere', 233, 'frfrf', 'vffvf', '34344', '4545');

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
(1, '20 Sementes de Orquídea', 10.00, 1, 6),
(2, 'Buquê de 30 Rosas Vermelhas', 230.00, 2, 4),
(3, 'Cesta de Flores do Campo', 150.00, 3, 2),
(4, 'Cachepot de Cerâmica', 80.00, 4, 2),
(5, 'Violeta', 15.00, 5, 0),
(6, 'Cacto Mandacaru Pote 30L', 100.00, 6, 8),
(7, 'Mix de Margaridas vaso de vidro', 50.00, 7, 6),
(8, 'Coroa de Flores para Velório', 600.00, 8, 4),
(9, 'Terra Vegetal 5 Kg', 10.00, 9, 2),
(10, 'Cesta de Chocolate', 150.00, 10, 0),
(13, 'tulipa', 1.00, 5, 1),
(32, 'sd', 43.00, 5, 34),
(33, 'weweweweewe', 3434343.00, 5, 454545454),
(35, 'Margarida', 14.00, 5, 50),
(36, 'yyy', 34.00, 6, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `cod_venda` int(11) NOT NULL,
  `data` varchar(20) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `forma_pagamento` varchar(50) NOT NULL,
  `cod_cli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_produto`
--

CREATE TABLE `venda_produto` (
  `cod_venda` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `qtd_prod_venda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD PRIMARY KEY (`cod_venda`,`cod_prod`),
  ADD KEY `fk_vp_produto` (`cod_prod`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `cod_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

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

--
-- Limitadores para a tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD CONSTRAINT `fk_vp_produto` FOREIGN KEY (`cod_prod`) REFERENCES `produto` (`cod_prod`),
  ADD CONSTRAINT `fk_vp_venda` FOREIGN KEY (`cod_venda`) REFERENCES `venda` (`cod_venda`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
