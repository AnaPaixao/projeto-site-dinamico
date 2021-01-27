-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Jan-2021 às 23:43
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissao`
--

CREATE TABLE `profissao` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `icone` varchar(255) NOT NULL DEFAULT 'icone-profissional.png'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `profissao`
--

INSERT INTO `profissao` (`id`, `nome`, `icone`) VALUES
(1, 'Médico', 'icon-medico.svg'),
(2, 'Pedreiro', 'icon-pedreiro.svg'),
(3, 'Computação', 'icon-computacao.svg'),
(4, 'Motorista', 'icon-motorista.svg'),
(5, 'Engenheiro', 'icon-engenheiro.svg'),
(6, 'Técnico', 'icone-profissional.png'),
(7, 'Professor', 'icon-professor.svg'),
(8, 'Odontologia', 'icon-odontologia.svg'),
(9, 'Fisoterapeuta', 'icon-fisioterapeuta.svg'),
(10, 'Farmacia', 'icon-farmacia.svg'),
(11, 'Advogado', 'icon-advogado.svg'),
(12, 'Arquiteto', 'icon-arquiteto.svg'),
(13, 'Fotógrafo', 'icon-fotografo.svg'),
(14, 'Pintor de Obras', 'icon-pintor-de-obras.svg'),
(15, 'Psicólogo', 'icon-psicologo.svg'),
(16, 'Nutricionista', 'icone-profissional.png'),
(17, 'Porteiro', 'icon-porteiro.svg'),
(18, 'Encanador', 'icone-profissional.png'),
(19, 'Cozinheiro', 'icon-cozinheiro.svg'),
(20, 'Auxiliar de Limpeza', 'icon-auxiliar-de-limpeza.svg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profissao`
--
ALTER TABLE `profissao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profissao`
--
ALTER TABLE `profissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
