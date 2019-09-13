-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18-Out-2018 às 21:42
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
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cli` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `num_endereco` int(11) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha_cli` varchar(50) NOT NULL,
  `id_per_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cli`, `nome`, `cpf`, `endereco`, `num_endereco`, `cidade`, `uf`, `telefone`, `celular`, `email`, `senha_cli`, `id_per_fk`) VALUES
(5, 'ANA', '12345', 'r ddddd', 23, 'itape', 'sp', '33333', '4444', 'dfdfdf', '123', 3);

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
(2, 'lucas', 123456, '2018-10-18 19:36:55', 2, '123');

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
  `preco` decimal(10,0) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`cod_prod`, `nome`, `preco`, `categoria`, `quantidade`) VALUES
(1, '20 Sementes de Orquídea', '10', 'Sementes', 6),
(2, 'Buquê de 30 Rosas Vermelhas', '230', 'Buquês', 4),
(3, 'Cesta de Flores do Campo', '150', 'Cestas', 2),
(4, 'Cachepot de Cerâmica', '80', 'Vasos', 2),
(5, 'Violeta', '15', 'Flores', 0),
(6, 'Cacto Mandacaru Pote 30L', '100', 'Plantas', 8),
(7, 'Mix de Margaridas vaso de vidro', '50', 'Arranjos', 6),
(8, 'Coroa de Flores para Velório', '600', 'Coroas', 4),
(9, 'Terra Vegetal 5 Kg', '10', 'Insumos', 2),
(10, 'Cesta de Chocolate', '150', 'Presentes', 0);

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
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cli`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `id_per_fk` (`id_per_fk`);

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
  ADD PRIMARY KEY (`cod_prod`);

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
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_fun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_per` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `cod_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `cod_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_per_fk`) REFERENCES `perfil` (`id_per`);

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_per_fk`) REFERENCES `perfil` (`id_per`);

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
