-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23-Jan-2021 às 01:39
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
CREATE DATABASE IF NOT EXISTS projeto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
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
(2, 17, NULL, 'Willian Machado', 'will@gmail.com', '$2y$10$D1zapiIVtyiZqVqxVLOua.tSYNGoRaDedufthQP7vowaZLkQVtQWe', '36083-150', 'Juiz de Fora', 'Milho Branco', NULL),
(3, 6, NULL, 'Theodoro Otto Loetscher', 'thed@hotmail.com', '$2y$10$21.cFeSqBOFiCkJCMCbnT./RFTsVNn1YL0Bd3tAzBCkzQl330y9L2', '22070-012', 'Rio de Janeiro', 'Copacabana', NULL),
(4, 1, NULL, 'Edith Loetscher', 'edith@hotmail.com', '$2y$10$HJlOcPUffaSs23S6fjTbV.0y1RaWrmU8gEeLm4obWVuVa.sHWMlym', '22020-002', 'Rio de Janeiro', 'Copacabana', NULL),
(5, 20, NULL, 'eda burckhardtt', 'eda@hotmail.com', '$2y$10$iEyEvtKuEsEtNCHlC0qJ3O5Xv7/iqwSbwqt1gohmMUtTiNOcRuDYm', '22060-970', 'Rio de Janeiro', 'Copacabana', NULL),
(6, 7, NULL, 'key da silva', 'key@hotmail.com', '$2y$10$eSsilhtRDlMaN7PPNyrPK.r.Cq66vmB5yYHLtgG1.HmJvE9IEXBeq', '22011-011', 'Rio de Janeiro', 'Copacabana', NULL),
(7, 13, NULL, 'david viamonte', 'david@hotmail.com', '$2y$10$Dso7c36bssf6i/0i5iMuPeDgm4lgMhK0SHNZW3xphiKWjqmBfg0uq', '21360-202', 'Rio de Janeiro', 'Madureira', NULL),
(8, 14, NULL, 'andreas muller', 'andreas@hotmail.com', '$2y$10$40oW48cCBEztWxHKKE2jA.jJdtPfJec8tQNCeHHuy8NCpG.s7bGnW', '21361-140', 'Rio de Janeiro', 'Madureira', NULL),
(9, 19, NULL, 'eduardo otto', 'eduardo@hotmail.com', '$2y$10$5VejRU23CMKF6uFeBkKx1.dWDlW2hzH9ZsOXhFqKm.5uxl0rGy7hK', '21360-900', 'Rio de Janeiro', 'Madureira', NULL),
(10, 15, NULL, 'penelope da silva', 'penelope@hotmail.com', '$2y$10$2FLLR/P55Ht5btxyU7tAseZl7qZt0jy/VpwTf22h3p9jGUqeJevzW', '21360-900', 'Rio de Janeiro', 'Madureira', NULL),
(11, 16, NULL, 'izabel de sousa', 'izabel@hotmail.com', '$2y$10$./q9/m.O1AStUUqIFY3pUeqs7t23sDK9pBvu9b9OzAOTwKX0damrO', '20771-144', 'Rio de Janeiro', 'Engenho de Dentro', NULL),
(12, 10, NULL, 'solange da silva de souza', 'solange@hotmail.com', '$2y$10$n/24g5lQVMWpY5JtO/y3ruCAr3TJV4db4IH7hc6PeaBPUb3k6kafm', '20730-390', 'Rio de Janeiro', 'Engenho de Dentro', NULL),
(13, 3, NULL, 'josé guerra', 'guerra.bet@hotmail.com', '$2y$10$8MAzcF1JaCHrbifK9qoJPelC.8kPj.kV0v0dg6bJPiCnbAfPybn1q', '20770-001', 'Rio de Janeiro', 'Engenho de Dentro', NULL),
(14, 8, NULL, 'joseph lietscher', 'joseph@hotmail.com', '$2y$10$GZkg5gsbvOhZ9nmnFq1yB.fWQumYho.b2FA5TYStLItYQywhwgFOu', '20730-400', 'Rio de Janeiro', 'Engenho de Dentro', NULL),
(15, 9, NULL, 'ana paixao', 'ana@hotmail.com', '$2y$10$Xq3gkctGZi1Fi8ER0i5gbO4IqXsmWyvNfh1mBB95DttYZbKvpOAwS', '21340-230', 'Rio de Janeiro', 'Oswaldo Cruz', NULL),
(16, 18, NULL, 'beatriz yakisoba', 'yakisoba@hotmail.com', '$2y$10$qdYN3SGhhki0qdjB.zO9/upOVVt.4ZS3Bam9aH1vlitfcweiN9Nhm', '21351-220', 'Rio de Janeiro', 'Oswaldo Cruz', NULL),
(17, 12, NULL, 'paula moraes', 'paula@hotmail.com', '$2y$10$gA.jekzNoh23LG9KdNHJ2OnK9.zhFqunEhvJkBp1p1TzPyABcR3Ea', '21340-380', 'Rio de Janeiro', 'Oswaldo Cruz', NULL),
(18, 11, NULL, 'paulo cesar', 'cesar@hotmail.com', '$2y$10$27YP3/eHB1/GXcZDOfaex.YE4eqepyMew/6UD5rSeK7H5Fq9k6LuO', '21340-463', 'Rio de Janeiro', 'Oswaldo Cruz', NULL),
(19, 12, NULL, 'alain polores', 'alain@hotmail.com', '$2y$10$LG83DJQEETrP57ly8NnmK.xrwOUN8liLopR/ZX7KpZ5Lx6euMRqXm', '21230-900', 'Rio de Janeiro', 'Irajá', NULL),
(20, 1, NULL, 'levi alexandre', 'alex@hotmail.com', '$2y$10$k9l6P5SVzaP1Z8Ws.66hfu7eDgpBhqAfJu2gc0WUSSmRn9T7Zgpny', '21230-300', 'Rio de Janeiro', 'Irajá', NULL),
(21, 17, NULL, 'felipe simantob', 'simantob@hotmail.com', '$2y$10$zJ4UnB6smJScHeBJBk6RVO4kRIYW/h0u1Yoq8ZoSftC6rwecuMk7m', '21230-000', 'Rio de Janeiro', 'Irajá', NULL),
(22, 9, NULL, 'eduardo simantob', 'edusimantob@hotmail.com', '$2y$10$yLnjAeK/jado7HiRrn2ofeDCzUvjI/k1NsiCpZvBU4wT8vxWCqU0u', '21230-155', 'Rio de Janeiro', 'Irajá', NULL),
(23, 5, NULL, 'edna alves ', 'alves@hotmail.com', '$2y$10$eIWr8FIP2iqxC/3h5jF4R.WXyqMSvK1oXb.93VDTnUnUF0/pCGJym', '22776-010', 'Rio de Janeiro', 'Barra da Tijuca', NULL),
(24, 14, NULL, 'lucas alves', 'lucasalves@hotmail.com', '$2y$10$Z/yU7NS0QTtPOMZXz/.mcuXteLYAMhGFWRnCkomXp75AaM3r5KxFq', '22776-020', 'Rio de Janeiro', 'Barra da Tijuca', NULL),
(25, 20, NULL, 'alessandra da paz', 'paz@hotmail.com', '$2y$10$rP060m.AERmJZp7PDJkl1OllAQhQfkX1RTO/eGzEQMtGZbTvbQzqW', '22621-310', 'Rio de Janeiro', 'Barra da Tijuca', NULL),
(26, 8, NULL, 'camila rodrigues', 'camilawillian@hotmail.com', '$2y$10$2ABZv/nC3gShBqxZRqVckesCjnEWFo0eKRlE7bIiIEjNmXn8T887G', '22640-000', 'Rio de Janeiro', 'Barra da Tijuca', NULL),
(27, 2, NULL, 'dolores alberto', 'dolores@hotmail.com', '$2y$10$7ZjS0CIStNaQASbZr76POueLDpv7cq0r/w3baIOyULFZvGU61kvsa', '21380-200', 'Rio de Janeiro', 'Quintino Bocaiúva', NULL),
(28, 18, NULL, 'alberto muller', 'albert@hotmail.com', '$2y$10$MgiMsmnF.Xc2vu7hhOgmBukGTSwWZhx9ei4QAaMlLdmiviGilcRUG', '21311-310', 'Rio de Janeiro', 'Quintino Bocaiúva', NULL),
(29, 9, NULL, 'josedir viamonte', 'josedir@hotmail.com', '$2y$10$ZH.nMlURtOyQiH6Zdn1/qOd7Q0B7NdW/O5TNLiuk1emDIa6CJ4efG', '21381-430', 'Rio de Janeiro', 'Quintino Bocaiúva', NULL),
(30, 18, NULL, 'gilberto souza', 'gilberto@hotmail.com', '$2y$10$w96bE94UuTysPxinaZHH4.PE7S.HW0xuT99CHizBnwH98W3FSwhQ6', '20740-232', 'Rio de Janeiro', 'Quintino Bocaiúva', NULL),
(31, 19, NULL, 'piedade da silva', 'piedade@hotmail.com', '$2y$10$rhWmkvihq9IZNJNCqcL9WegGpJoHO7L3tlLMaWrMfQQ.OxjTTGYQ.', '21380-007', 'Rio de Janeiro', 'Piedade', NULL),
(32, 14, NULL, 'rochelle roxotte', 'rocha@hotmail.com', '$2y$10$U61KpH2oCOJRQgEqQAaJB.TwKjKUH.JOsbdHDiY3EczFEXnlVdW/i', '20740-610', 'Rio de Janeiro', 'Piedade', NULL),
(33, 6, NULL, 'julius  rocha', 'julius@hotmail.com', '$2y$10$V.p.6XMcY04kON3QeW5vDupft7i2O2Tnip40APKPLliSBA.xcp7TW', '20756-160', 'Rio de Janeiro', 'Piedade', NULL),
(34, 12, NULL, 'chris rocha', 'chris@hotmail.com', '$2y$10$bAW.MJ1HXoAoYpd.74qLpOV/UsDBnFOfBMWOUpWSGEJUt5zZgTbQ2', '20751-060', 'Rio de Janeiro', 'Piedade', NULL),
(35, 4, NULL, 'hugo chavez', 'hugo@hotmail.com', '$2y$10$tHLXurhSjiuta5XpE1RQJOJNpKd7s3avqsf/QOcC9gQQn8gr3MPLu', '20950-312', 'Rio de Janeiro', 'Engenho Novo', NULL),
(36, 5, NULL, 'pietra alves', 'pietra@hotmail.com', '$2y$10$.vLr7kF7VLh4mDmehRpOueNfaum13UU6MDluQtozig.jxso7kpuAy', '20950-311', 'Rio de Janeiro', 'Engenho Novo', NULL),
(37, 8, NULL, 'jessica lopes', 'jess@hotmail.com', '$2y$10$C1Uiv63f6du.Rpe4sfMXyOCDflRXQ2gNVSRWjifcj.c5dMVpuofV.', '23017-660', 'Rio de Janeiro', 'Campo Grande', NULL),
(38, 18, NULL, 'diego lopes', 'diego@hotmail.com', '$2y$10$IvTSME2Tu8yW.bzkjsZxIuikjydvAD1vxZI4Jz2EhAWtdE.fqODli', '20961-410', 'Rio de Janeiro', 'Engenho Novo', NULL),
(39, 12, NULL, 'adonis rangel', 'adonis@hotmail.com', '$2y$10$6R2N.AcY4JYRXA0HfNcF6OBNYoTnBqJ7upvMuTlpFJsu/R5wVlNLO', '20960-160', 'Rio de Janeiro', 'Riachuelo', NULL),
(40, 13, NULL, 'valeria de souza', 'valeria@hotmail.com', '$2y$10$gS9LADFAWDZSgHJn9Xih9OO1dR7DfeF4V1.1blaVn0MSRCthBtRke', '20970-090', 'Rio de Janeiro', 'Riachuelo', NULL),
(41, 17, NULL, 'mauricio de sousa', 'mauricio@hotmail.com', '$2y$10$e4xfAMoPHJoLHS2lypwTx.fKmJALQ530.ox4qJKiPEXooKfcon4MW', '20961-010', 'Rio de Janeiro', 'Riachuelo', NULL),
(42, 15, NULL, 'augusto viamonte', 'augusto@hotmail.com', '$2y$10$t1ki33UDriJw7X5fy8rnJOhNZTPPqF/ts5MEPgFAUkQLFckNjbvgy', '20230-014', 'Rio de Janeiro', 'Centro', NULL),
(43, 8, NULL, 'francisco carlos', 'carlos@hotmail.com', '$2y$10$z0rKanEM3xuOuaxvjjweseeHI94Muf4WhSMV153UPv9qVaAQ6rV52', '23530-812', 'Rio de Janeiro', 'Sepetiba', NULL),
(44, 7, NULL, 'maria conceição', 'conceicao@hotmail.com', '$2y$10$uYXqb4tsaETIut8TNHSoJeF62FFbTJzKtFmCg4S7cUNATkqZVzyKW', '20550-010', 'Rio de Janeiro', 'Tijuca', NULL),
(45, 15, NULL, 'danilo santana', 'santana@hotmail.com', '$2y$10$T9aaoka9xclRd0m.XDGjmuerY8pgcLiMkTCFiNekfSkOCMt/GEAKW', '20550-018', 'Rio de Janeiro', 'São Francisco Xavier', NULL),
(46, 5, NULL, 'carlos francisco', 'francisco@hotmail.com', '$2y$10$x0LTWq8FL2McsVsw4JxowOdlpyX5CZAoVj5IIFwddmZwy2LBYTbFi', '20550-900', 'Rio de Janeiro', 'Maracanã', NULL),
(47, 20, NULL, 'maradona miller', 'maradona@homail.com', '$2y$10$Ie/jSqKs5ZfGKL/67ePe3eZs/nFcI7WoRKjv7MAVHysvi/FjaUoaG', '20271-903', 'Rio de Janeiro', 'Maracanã', NULL),
(48, 17, NULL, 'gabriel barbosa', 'gabriel@hotmail.com', '$2y$10$0zObjeIi72CSl7tgOZT14uYUpC1Z9e.zSNyPhWm4gRbBKwM8wO4Te', '20271-120', 'Rio de Janeiro', 'Maracanã', NULL),
(49, 11, NULL, 'leonardo moura', 'leo@hotmail.com', '$2y$10$wANHpzKTwCt5tEE/dhn0H.cSzVdiijSyV0bJYaXwaCUow9pXZZbxK', '20271-902', 'Rio de Janeiro', 'Maracanã', NULL),
(50, 19, NULL, 'joao  pedro', 'joao@hotmail.com', '$2y$10$cBRsGjisYDVEVdCly5jpte5f/CTB5ELsxIYWP8aCUv5HmL3yEWcu6', '20271-080', 'Rio de Janeiro', 'Maracanã', NULL),
(51, 7, NULL, 'bento ribeiro', 'bento@hotmail.com', '$2y$10$WhSWpX99dtKnhyf6rnmpL.2XOhM1LyFM2ToNtk8kAT6Rl84PgXpT2', '21555-123', 'Rio de Janeiro', 'Bento Ribeiro', NULL),
(52, 18, NULL, 'ribeiro alves', 'ribeiro@hotmail.com', '$2y$10$9S4VQJ6UMDlNrCNfUdVgpurboHa3/v3KOfj0HgF0.jiNY0DvrTCNO', '21331-595', 'Rio de Janeiro', 'Bento Ribeiro', NULL),
(53, 1, NULL, 'oswaldo da silva', 'dasilva@hotmail.com', '$2y$10$bIXdBTnOn.0kEUOswXBmneTpFE/aIoXfqsrgHJZue8bRmZ27oIxK2', '21331-290', 'Rio de Janeiro', 'Bento Ribeiro', NULL),
(54, 12, NULL, 'marechal hermes', 'hermes@hotmail.com', '$2y$10$uRKXcGgjVZ9V3qHVyAEzNOPxwo1YzqaP29eqg4BdXCa7IciWRXnpS', '21331-280', 'Rio de Janeiro', 'Bento Ribeiro', NULL);

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
(2, 2, '21', '83298-3223'),
(3, 3, '21', '99999-9999'),
(4, 4, '21', '99999-9999'),
(5, 5, '21', '99999-9999'),
(6, 6, '21', '99999-9999'),
(7, 7, '21', '99999-9999'),
(8, 8, '99', '99999-9999'),
(9, 9, '21', '99999-9999'),
(10, 10, '21', '99999-9999'),
(11, 11, '21', '99999-9999'),
(12, 12, '21', '99999-9999'),
(13, 13, '21', '99999-9999'),
(14, 14, '21', '99999-9999'),
(15, 15, '21', '99999-9999'),
(16, 16, '21', '99999-9999'),
(17, 17, '21', '99999-9999'),
(18, 18, '21', '99999-9999'),
(19, 19, '21', '99999-9999'),
(20, 20, '21', '99999-9999'),
(21, 21, '21', '99999-9999'),
(22, 22, '21', '99999-9999'),
(23, 23, '21', '99999-9999'),
(24, 24, '21', '99999-9999'),
(25, 25, '21', '99999-9999'),
(26, 26, '21', '99999-9999'),
(27, 27, '21', '99999-9999'),
(28, 28, '21', '99999-9999'),
(29, 29, '21', '99999-9999'),
(30, 30, '21', '99999-9999'),
(31, 31, '21', '99999-9999'),
(32, 32, '21', '99999-9999'),
(33, 33, '21', '99999-9999'),
(34, 34, '21', '99999-9999'),
(35, 35, '21', '99999-9999'),
(36, 36, '21', '99999-9999'),
(37, 37, '21', '99999-9999'),
(38, 38, '21', '99999-9999'),
(39, 39, '21', '99999-9999'),
(40, 40, '21', '99999-9999'),
(41, 41, '21', '99999-9999'),
(42, 42, '21', '99999-9999'),
(43, 43, '21', '99999-9999'),
(44, 44, '21', '99999-9999'),
(45, 45, '21', '99999-9999'),
(46, 46, '21', '99999-9999'),
(47, 47, '21', '99999-9999'),
(48, 48, '21', '99999-9999'),
(49, 49, '21', '99999-9999'),
(50, 50, '21', '99999-9999'),
(51, 51, '21', '99999-9999'),
(52, 52, '21', '99999-9999'),
(53, 53, '21', '99999-9999'),
(54, 54, '21', '99999-9999');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
