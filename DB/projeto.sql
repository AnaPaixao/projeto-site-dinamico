-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 19-Jan-2021 às 00:16
-- Versão do servidor: 10.1.39-MariaDB
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto`
--
CREATE DATABASE IF NOT EXISTS `projeto` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

CREATE TABLE `especialidade` (
  `id` int(11) NOT NULL,
  `profissao_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `especialidade`
--

INSERT INTO `especialidade` (`id`, `profissao_id`, `nome`) VALUES
(1, 1, 'Cardiologista'),
(2, 1, 'Dermatologista'),
(3, 1, 'Ginecologista'),
(4, 2, 'Geral'),
(5, 2, 'Acabamento'),
(6, 2, 'Azulejista'),
(7, 3, 'Manutenção e Montagem'),
(8, 3, 'Analista de Sistemas'),
(9, 3, 'Programador'),
(10, 4, 'Condutor'),
(11, 4, 'Piloto'),
(12, 4, 'Taxista'),
(13, 5, 'Engenharia Aeronáutica'),
(14, 5, 'Engenharia Ambiental'),
(15, 5, 'Engenharia Civil'),
(16, 6, 'Técnico Radiologia'),
(17, 6, 'Técnico De Moda'),
(18, 6, 'Técnico em Confeitaria'),
(19, 7, 'Matemática'),
(20, 7, 'Português'),
(21, 7, 'Educação Física'),
(22, 8, 'Dentística'),
(23, 8, 'Disfunção'),
(24, 8, 'Estomatologia'),
(25, 9, 'Acupuntura'),
(26, 9, 'Cardiovascular'),
(27, 9, 'Esportiva'),
(28, 10, 'Cosmético'),
(29, 10, 'Hospitalar'),
(30, 10, 'Administração'),
(31, 11, 'Civil'),
(32, 11, 'Administrativo'),
(33, 11, 'Previdenciário'),
(34, 12, 'Design de interiores'),
(35, 12, 'Desenho de Mobiliário'),
(36, 12, 'Design Geral'),
(37, 13, 'Infantil'),
(38, 13, 'Moda'),
(39, 13, 'Casamento'),
(40, 14, 'Pintura de exteriores'),
(41, 14, 'Pintura de interiores'),
(42, 14, 'Pintura decorativa'),
(43, 15, 'Psicologia do Esporte'),
(44, 15, 'Psicologia Clínica'),
(45, 15, 'Psicologia do Idoso'),
(46, 16, 'Nutrição esportiva'),
(47, 16, 'Marketing nutricional'),
(48, 16, 'Nutrição domiciliar'),
(49, 17, 'Estabelecimentos Comerciais'),
(50, 17, 'Estabelecimentos Empresariais'),
(51, 17, 'Vigilância Patrimonial'),
(52, 18, 'Hidráulica residencial'),
(53, 18, 'Encanador instalador predial'),
(54, 18, 'Encanador industrial'),
(55, 19, 'Culinária Árabe'),
(56, 19, 'Culinária Brasileira'),
(57, 19, 'Culinária Italiana'),
(58, 20, 'Restaurantes'),
(59, 20, 'Domicílio'),
(60, 20, 'Empresas');

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissao`
--

CREATE TABLE `profissao` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `profissao`
--

INSERT INTO `profissao` (`id`, `nome`) VALUES
(1, 'Médico'),
(2, 'Pedreiro'),
(3, 'Computação'),
(4, 'Motorista'),
(5, 'Engenheiro'),
(6, 'Técnico'),
(7, 'Professor'),
(8, 'Odontologia'),
(9, 'Fisoterapeuta'),
(10, 'Farmacia'),
(11, 'Advogado'),
(12, 'Arquiteto'),
(13, 'Fotógrafo'),
(14, 'Pintor de Obras'),
(15, 'Psicólogo'),
(16, 'Nutricionista'),
(17, 'Porteiro'),
(18, 'Encanador'),
(19, 'Cozinheiro'),
(20, 'Auxiliar de Limpeza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissional`
--

CREATE TABLE `profissional` (
  `id` int(11) NOT NULL,
  `profissao_id` int(11) DEFAULT NULL,
  `especialidade_id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `municipio` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `profissional`
--

INSERT INTO `profissional` (`id`, `profissao_id`, `especialidade_id`, `nome`, `email`, `senha`, `cep`, `municipio`, `bairro`, `descricao`) VALUES
(1, 3, NULL, 'Erick Rangel', 'eriel.rj@gmail.com', '$2y$10$1tOaujgz/RfImN.00SPFY.D53Jrbvnkiczk6DlX/Q66H1FNLU7VPC', '21044-630', 'Rio de Janeiro', 'Maré', NULL),
(2, 17, NULL, 'Willian Machado', 'will@gmail.com', '$2y$10$D1zapiIVtyiZqVqxVLOua.tSYNGoRaDedufthQP7vowaZLkQVtQWe', '36083-150', 'Juiz de Fora', 'Milho Branco', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `id` int(11) NOT NULL,
  `profissional_id` int(11) NOT NULL,
  `ddd` char(2) NOT NULL DEFAULT '',
  `numero` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `telefone`
--

INSERT INTO `telefone` (`id`, `profissional_id`, `ddd`, `numero`) VALUES
(1, 1, '21', '99717-0603'),
(2, 2, '21', '83298-3223');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `especialidade`
--
ALTER TABLE `especialidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profissao_id` (`profissao_id`) USING BTREE;

--
-- Indexes for table `profissao`
--
ALTER TABLE `profissao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profissional`
--
ALTER TABLE `profissional`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `profissao_id` (`profissao_id`) USING BTREE,
  ADD KEY `FK_especialidade` (`especialidade_id`);

--
-- Indexes for table `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `profissao_id` (`profissional_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `especialidade`
--
ALTER TABLE `especialidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `profissao`
--
ALTER TABLE `profissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `profissional`
--
ALTER TABLE `profissional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD CONSTRAINT `FK_especialidade_profissao` FOREIGN KEY (`profissao_id`) REFERENCES `profissao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `profissional`
--
ALTER TABLE `profissional`
  ADD CONSTRAINT `FK` FOREIGN KEY (`profissao_id`) REFERENCES `profissao` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_especialidade` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `FK_telefone_profissional` FOREIGN KEY (`profissional_id`) REFERENCES `profissional` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
