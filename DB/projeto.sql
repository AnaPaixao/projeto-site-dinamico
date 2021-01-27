-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Jan-2021 às 00:00
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
(1, 3, NULL, 'Erick Rangel', 'eriel.rj@gmail.com', '$2y$10$1tOaujgz/RfImN.00SPFY.D53Jrbvnkiczk6DlX/Q66H1FNLU7VPC', '21044-630', 'Rio de Janeiro', 'Maré', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(2, 17, NULL, 'Willian Machado', 'will@gmail.com', '$2y$10$D1zapiIVtyiZqVqxVLOua.tSYNGoRaDedufthQP7vowaZLkQVtQWe', '36083-150', 'Juiz de Fora', 'Milho Branco', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(3, 1, NULL, 'Theodoro Otto Loetscher', 'thed@hotmail.com', '$2y$10$21.cFeSqBOFiCkJCMCbnT./RFTsVNn1YL0Bd3tAzBCkzQl330y9L2', '22070-012', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(4, 1, NULL, 'Edith Loetscher', 'edith@hotmail.com', '$2y$10$HJlOcPUffaSs23S6fjTbV.0y1RaWrmU8gEeLm4obWVuVa.sHWMlym', '22020-002', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(5, 1, NULL, 'Eda Burckhardtt', 'eda@hotmail.com', '$2y$10$iEyEvtKuEsEtNCHlC0qJ3O5Xv7/iqwSbwqt1gohmMUtTiNOcRuDYm', '22060-970', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(6, 1, 1, 'Key da Silva', 'key@hotmail.com', '$2y$10$eSsilhtRDlMaN7PPNyrPK.r.Cq66vmB5yYHLtgG1.HmJvE9IEXBeq', '22011-011', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(7, 13, NULL, 'David Viamonte', 'david@hotmail.com', '$2y$10$Dso7c36bssf6i/0i5iMuPeDgm4lgMhK0SHNZW3xphiKWjqmBfg0uq', '21360-202', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(8, 14, NULL, 'Andreas Muller', 'andreas@hotmail.com', '$2y$10$40oW48cCBEztWxHKKE2jA.jJdtPfJec8tQNCeHHuy8NCpG.s7bGnW', '21361-140', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(9, 19, NULL, 'Eduardo Otto', 'eduardo@hotmail.com', '$2y$10$5VejRU23CMKF6uFeBkKx1.dWDlW2hzH9ZsOXhFqKm.5uxl0rGy7hK', '21360-900', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(10, 15, NULL, 'Penelope da Silva', 'penelope@hotmail.com', '$2y$10$2FLLR/P55Ht5btxyU7tAseZl7qZt0jy/VpwTf22h3p9jGUqeJevzW', '21360-900', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(11, 16, NULL, 'Izabel de Sousa', 'izabel@hotmail.com', '$2y$10$./q9/m.O1AStUUqIFY3pUeqs7t23sDK9pBvu9b9OzAOTwKX0damrO', '20771-144', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(12, 3, NULL, 'Solange da Silva de Souza', 'solange@hotmail.com', '$2y$10$n/24g5lQVMWpY5JtO/y3ruCAr3TJV4db4IH7hc6PeaBPUb3k6kafm', '20730-390', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(13, 3, 9, 'José Guerra', 'guerra.bet@hotmail.com', '$2y$10$8MAzcF1JaCHrbifK9qoJPelC.8kPj.kV0v0dg6bJPiCnbAfPybn1q', '20770-001', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(14, 3, 7, 'Joseph Lietscher', 'joseph@hotmail.com', '$2y$10$GZkg5gsbvOhZ9nmnFq1yB.fWQumYho.b2FA5TYStLItYQywhwgFOu', '20730-400', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(15, 9, NULL, 'Ana Paixão', 'ana@hotmail.com', '$2y$10$Xq3gkctGZi1Fi8ER0i5gbO4IqXsmWyvNfh1mBB95DttYZbKvpOAwS', '21340-230', 'Rio de Janeiro', 'Oswaldo Cruz', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(16, 18, NULL, 'Beatriz Yakisoba', 'yakisoba@hotmail.com', '$2y$10$qdYN3SGhhki0qdjB.zO9/upOVVt.4ZS3Bam9aH1vlitfcweiN9Nhm', '21351-220', 'Rio de Janeiro', 'Oswaldo Cruz', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(17, 12, NULL, 'Paula Moraes', 'paula@hotmail.com', '$2y$10$gA.jekzNoh23LG9KdNHJ2OnK9.zhFqunEhvJkBp1p1TzPyABcR3Ea', '21340-380', 'Rio de Janeiro', 'Oswaldo Cruz', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(18, 11, NULL, 'Paulo Cesar', 'cesar@hotmail.com', '$2y$10$27YP3/eHB1/GXcZDOfaex.YE4eqepyMew/6UD5rSeK7H5Fq9k6LuO', '21340-463', 'Rio de Janeiro', 'Oswaldo Cruz', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(19, 12, NULL, 'Alain Polores', 'alain@hotmail.com', '$2y$10$LG83DJQEETrP57ly8NnmK.xrwOUN8liLopR/ZX7KpZ5Lx6euMRqXm', '21230-900', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(20, 1, NULL, 'Levi Alexandre', 'alex@hotmail.com', '$2y$10$k9l6P5SVzaP1Z8Ws.66hfu7eDgpBhqAfJu2gc0WUSSmRn9T7Zgpny', '21230-300', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(21, 17, NULL, 'Felipe Simantob', 'simantob@hotmail.com', '$2y$10$zJ4UnB6smJScHeBJBk6RVO4kRIYW/h0u1Yoq8ZoSftC6rwecuMk7m', '21230-000', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(22, 9, NULL, 'Eduardo Simantob', 'edusimantob@hotmail.com', '$2y$10$yLnjAeK/jado7HiRrn2ofeDCzUvjI/k1NsiCpZvBU4wT8vxWCqU0u', '21230-155', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(23, 5, 13, 'Edna Alves ', 'alves@hotmail.com', '$2y$10$eIWr8FIP2iqxC/3h5jF4R.WXyqMSvK1oXb.93VDTnUnUF0/pCGJym', '22776-010', 'Rio de Janeiro', 'Barra da Tijuca', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(24, 5, 14, 'Lucas Alves', 'lucasalves@hotmail.com', '$2y$10$Z/yU7NS0QTtPOMZXz/.mcuXteLYAMhGFWRnCkomXp75AaM3r5KxFq', '22776-020', 'Rio de Janeiro', 'Barra da Tijuca', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(25, 5, 15, 'Alessandra da Paz', 'paz@hotmail.com', '$2y$10$rP060m.AERmJZp7PDJkl1OllAQhQfkX1RTO/eGzEQMtGZbTvbQzqW', '22621-310', 'Rio de Janeiro', 'Barra da Tijuca', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(26, 5, 15, 'Camila Rodrigues', 'camilawillian@hotmail.com', '$2y$10$2ABZv/nC3gShBqxZRqVckesCjnEWFo0eKRlE7bIiIEjNmXn8T887G', '22640-000', 'Rio de Janeiro', 'Barra da Tijuca', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(27, 2, NULL, 'Dolores Alberto', 'dolores@hotmail.com', '$2y$10$7ZjS0CIStNaQASbZr76POueLDpv7cq0r/w3baIOyULFZvGU61kvsa', '21380-200', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(28, 18, NULL, 'Alberto Muller', 'albert@hotmail.com', '$2y$10$MgiMsmnF.Xc2vu7hhOgmBukGTSwWZhx9ei4QAaMlLdmiviGilcRUG', '21311-310', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(29, 9, NULL, 'Josedir Viamonte', 'josedir@hotmail.com', '$2y$10$ZH.nMlURtOyQiH6Zdn1/qOd7Q0B7NdW/O5TNLiuk1emDIa6CJ4efG', '21381-430', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(30, 18, NULL, 'Gilberto Souza', 'gilberto@hotmail.com', '$2y$10$w96bE94UuTysPxinaZHH4.PE7S.HW0xuT99CHizBnwH98W3FSwhQ6', '20740-232', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(31, 19, NULL, 'Piedade da Silva', 'piedade@hotmail.com', '$2y$10$rhWmkvihq9IZNJNCqcL9WegGpJoHO7L3tlLMaWrMfQQ.OxjTTGYQ.', '21380-007', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(32, 14, NULL, 'Rochelle Roxotte', 'rocha@hotmail.com', '$2y$10$U61KpH2oCOJRQgEqQAaJB.TwKjKUH.JOsbdHDiY3EczFEXnlVdW/i', '20740-610', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(33, 6, NULL, 'Julius  Rocha', 'julius@hotmail.com', '$2y$10$V.p.6XMcY04kON3QeW5vDupft7i2O2Tnip40APKPLliSBA.xcp7TW', '20756-160', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(34, 12, NULL, 'Chris Rocha', 'chris@hotmail.com', '$2y$10$bAW.MJ1HXoAoYpd.74qLpOV/UsDBnFOfBMWOUpWSGEJUt5zZgTbQ2', '20751-060', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(35, 4, NULL, 'Hugo Chavez', 'hugo@hotmail.com', '$2y$10$tHLXurhSjiuta5XpE1RQJOJNpKd7s3avqsf/QOcC9gQQn8gr3MPLu', '20950-312', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(36, 15, NULL, 'Pietra Alves', 'pietra@hotmail.com', '$2y$10$.vLr7kF7VLh4mDmehRpOueNfaum13UU6MDluQtozig.jxso7kpuAy', '20950-311', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(37, 8, NULL, 'Jessica Lopes', 'jess@hotmail.com', '$2y$10$C1Uiv63f6du.Rpe4sfMXyOCDflRXQ2gNVSRWjifcj.c5dMVpuofV.', '23017-660', 'Rio de Janeiro', 'Campo Grande', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(38, 15, NULL, 'Diego Lopes', 'diego@hotmail.com', '$2y$10$IvTSME2Tu8yW.bzkjsZxIuikjydvAD1vxZI4Jz2EhAWtdE.fqODli', '20961-410', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(39, 12, NULL, 'Adonis Rangel', 'adonis@hotmail.com', '$2y$10$6R2N.AcY4JYRXA0HfNcF6OBNYoTnBqJ7upvMuTlpFJsu/R5wVlNLO', '20960-160', 'Rio de Janeiro', 'Riachuelo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(40, 13, NULL, 'Valeria de Souza', 'valeria@hotmail.com', '$2y$10$gS9LADFAWDZSgHJn9Xih9OO1dR7DfeF4V1.1blaVn0MSRCthBtRke', '20970-090', 'Rio de Janeiro', 'Riachuelo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(41, 17, NULL, 'Mauricio de Sousa', 'mauricio@hotmail.com', '$2y$10$e4xfAMoPHJoLHS2lypwTx.fKmJALQ530.ox4qJKiPEXooKfcon4MW', '20961-010', 'Rio de Janeiro', 'Riachuelo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(42, 15, NULL, 'Augusto Viamonte', 'augusto@hotmail.com', '$2y$10$t1ki33UDriJw7X5fy8rnJOhNZTPPqF/ts5MEPgFAUkQLFckNjbvgy', '20230-014', 'Rio de Janeiro', 'Centro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(43, 8, NULL, 'Francisco Carlos', 'carlos@hotmail.com', '$2y$10$z0rKanEM3xuOuaxvjjweseeHI94Muf4WhSMV153UPv9qVaAQ6rV52', '23530-812', 'Rio de Janeiro', 'Sepetiba', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(44, 7, NULL, 'Maria Conceição', 'conceicao@hotmail.com', '$2y$10$uYXqb4tsaETIut8TNHSoJeF62FFbTJzKtFmCg4S7cUNATkqZVzyKW', '20550-010', 'Rio de Janeiro', 'Tijuca', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(45, 15, NULL, 'Danilo Santana', 'santana@hotmail.com', '$2y$10$T9aaoka9xclRd0m.XDGjmuerY8pgcLiMkTCFiNekfSkOCMt/GEAKW', '20550-018', 'Rio de Janeiro', 'São Francisco Xavier', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(46, 5, NULL, 'Carlos Francisco', 'francisco@hotmail.com', '$2y$10$x0LTWq8FL2McsVsw4JxowOdlpyX5CZAoVj5IIFwddmZwy2LBYTbFi', '20550-900', 'Rio de Janeiro', 'Maracanã', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(47, 20, NULL, 'Maradona Miller', 'maradona@homail.com', '$2y$10$Ie/jSqKs5ZfGKL/67ePe3eZs/nFcI7WoRKjv7MAVHysvi/FjaUoaG', '20271-903', 'Rio de Janeiro', 'Maracanã', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(48, 17, NULL, 'Gabriel Barbosa', 'gabriel@hotmail.com', '$2y$10$0zObjeIi72CSl7tgOZT14uYUpC1Z9e.zSNyPhWm4gRbBKwM8wO4Te', '20271-120', 'Rio de Janeiro', 'Maracanã', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(49, 11, NULL, 'Leonardo Moura', 'leo@hotmail.com', '$2y$10$wANHpzKTwCt5tEE/dhn0H.cSzVdiijSyV0bJYaXwaCUow9pXZZbxK', '20271-902', 'Rio de Janeiro', 'Maracanã', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(50, 19, NULL, 'Joao Pedro', 'joao@hotmail.com', '$2y$10$cBRsGjisYDVEVdCly5jpte5f/CTB5ELsxIYWP8aCUv5HmL3yEWcu6', '20271-080', 'Rio de Janeiro', 'Maracanã', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(51, 7, 19, 'Nento Ribeiro', 'bento@hotmail.com', '$2y$10$WhSWpX99dtKnhyf6rnmpL.2XOhM1LyFM2ToNtk8kAT6Rl84PgXpT2', '21555-123', 'Rio de Janeiro', 'Bento Ribeiro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(52, 7, 19, 'Ribeiro Alves', 'ribeiro@hotmail.com', '$2y$10$9S4VQJ6UMDlNrCNfUdVgpurboHa3/v3KOfj0HgF0.jiNY0DvrTCNO', '21331-595', 'Rio de Janeiro', 'Bento Ribeiro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(53, 7, 20, 'Oswaldo da Silva', 'dasilva@hotmail.com', '$2y$10$bIXdBTnOn.0kEUOswXBmneTpFE/aIoXfqsrgHJZue8bRmZ27oIxK2', '21331-290', 'Rio de Janeiro', 'Bento Ribeiro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(54, 7, NULL, 'Marechal Hermes', 'hermes@hotmail.com', '$2y$10$uRKXcGgjVZ9V3qHVyAEzNOPxwo1YzqaP29eqg4BdXCa7IciWRXnpS', '21331-280', 'Rio de Janeiro', 'Bento Ribeiro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(55, 1, 2, 'Abel Braga', 'abel@hotmail.com', '$2y$10$9FrkaIx/g6jpc2eB2AoY0uaXcOSVbGz45GVgJSMOMpplWH8pMkrja', '22050-002', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(56, 1, 2, 'Abílio Castro', 'abilio@hotmail.com', '$2y$10$ioznfIR42VHd9CjOFNF16O8miaRSJb2MHdtJiVVgD6S1QLqyXwqFG', '22031-000', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(57, 1, 1, 'Abreu Gustavo', 'abreu@hotmail.com', '$2y$10$ryUA6USxotwVN7Cu/eUMBuVoxNfHRYn0HZk5PQHdK7utzYrbO1eiq', '22020-002', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(58, 1, 2, 'Adaílton Da Silva', 'adailton@hotmail.com', '$2y$10$5SX1gBHyMIqd2bA9qj7XUeFzHFaMHgg.hUcGdAIsujUI.DN.7wrjS', '22060-002', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(59, 1, 3, 'Adeilaide Ramos', 'ramos@hotmail.com', '$2y$10$Gm.vGY05i6FZNVxnlllJK.H17Kh1i136GSsofwT4gUDdge8fiT0GO', '22060-001', 'Rio de Janeiro', 'Copacabana', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(60, 7, NULL, 'Adelson Vieira', 'adelson@hotmail.com', '$2y$10$viUc4AO0kfiUALALcxOa0e93qXj7.1MhpiIngA/hTSBKZpuKjgz5y', '21360-971', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(61, 20, NULL, 'Agnes Dos Santos', 'agnes@hotmail.com', '$2y$10$.k2SsEX.lJg132/juGhyy.1G21EkGrYjxgQm/McjrPU31acNq/8GG', '21351-900', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(62, 10, NULL, 'Bonífacio José', 'bonifacio@hotmail.com', '$2y$10$wqzqHMVxCizwC1i.8m90zukj42V2khDVaUqMJ9zs2gvS84Mkb.7ge', '21351-959', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(63, 18, NULL, 'Cácia Ramiro', 'cacia@hotmail.com', '$2y$10$yGnDT/4pgECh03VE7SsC2.uiSE49uQ6jlEvnfiP7c/WP7aNAdj7Rm', '21351-901', 'Rio de Janeiro', 'Madureira', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(64, 3, 9, 'Caetano Augusto', 'caetano@hotmail.com', '$2y$10$Z5jFLUo987pMwFnZ9yB9guNcLMJAyKyhvCbruDShHDt9aWcqI2h5y', '20730-160', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(65, 9, NULL, 'Cardoso Afonso', 'cardoso@hotmail.com', '$2y$10$Z0j5tap09IMV1UfXam3rlOUxZlNN2t0R3mxcsnmGz1jEHWI1YFqsa', '20730-040', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(66, 9, 25, 'Charlote Da Silva De Souza', 'charlote@hotmail.com', '$2y$10$iCtY8nwgk.ua24/RjLbz9uMyK69hn7SiqaE0VYPdu.3/yk/ewEn06', '20730-180', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(67, 9, 26, 'Clésia Dos Santos', 'clesia@hotmail.com', '$2y$10$yyU/asPEuSPMN4ncbMTfMubBJsmg7cjahO2pg.H.QSDQ/1ONPXT6O', '20730-400', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(68, 9, NULL, 'Dafne Alves', 'dafne@hotmail.com', '$2y$10$Y4OcYVPQgCXzIfEhlS39quikTNEXWlRP3L1NwXE6nyVBuB2nbgQXu', '20770-110', 'Rio de Janeiro', 'Engenho de Dentro', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(69, 1, NULL, 'Dagmar Edgar', 'dagmar@hotmail.com', '$2y$10$oHriJa9mjd0IXOy1wkJJFOTQ0Rat88zZmOsvlbwYeJcyClKXphyG2', '21361-430', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(70, 14, NULL, 'Dagoberto Roberto', 'roberto@hotmail.com', '$2y$10$NAnoCDQ5a29hBwpGoqm9UeluZz/JOjW2AWprd04k1zyB0HA/UNbBy', '21235-140', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(71, 14, NULL, 'Dagoberto Roberto', 'roberto1@hotmail.com', '$2y$10$yjJtgCaFkoYghGOiunJRpu64rK4SLVr8oOR6fCyeEbu0jadYfedl.', '21235-140', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(72, 15, NULL, 'Danila Santana', 'danila@hotmail.com', '$2y$10$9zsTcJbGt/.aVg.im2a9puQ2f6UUr1m8jlLUS4iCbKw8VKY7Iea52', '21235-460', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(73, 13, NULL, 'Candido José Maria', 'candido@hotmail.com', '$2y$10$/KnThu8xluj.LYCbv.K7g.BM6bXmBdQlAqmsMEDB9WTZfFsEKS0xq', '21235-505', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(74, 19, NULL, 'Camilo Rodrigues', 'camilo@hotmail.com', '$2y$10$cL/XGSYfVODn29ZL2CT3VePoQ4N5u.vpPTtc9ZkBVHOfdB7mRnBvC', '21235-528', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(75, 8, NULL, 'Diana Maravilha', 'diana@hotmail.com', '$2y$10$rSbVR26lQDlr0uxfquvzWeksa8kxZch2L/v7.wJz1yXMNemh2OVLC', '21230-000', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(76, 7, NULL, 'Cristine De Araujo', 'cristine@hotmail.com', '$2y$10$aNwU5dv6PgSdlCq8COuOZ.HTC7GnGHOWkoN570czbMbaqXp.ZgDuO', '21230-200', 'Rio de Janeiro', 'Irajá', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(77, 5, 15, 'Dinorá Whichester', 'dinora@hotmail.com', '$2y$10$tHvr2eoLQXTzcYcfNf7Yw.6YLbGoS57LFPyYfFSgY2e/xY5D8RskG', '22793-909', 'Rio de Janeiro', 'Barra da Tijuca', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(78, 19, NULL, 'Fabiana Meisinger', 'fabiana@hotmail.com', '$2y$10$Vxr93DcWlKOBb6zlMSlWD.UXZDXVA/2FYWVx7OUpuWF3fS6F38h4q', '20740-130', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(79, 8, NULL, 'Magdalena Meisinger', 'magda@hotmail.com', '$2y$10$MKhF/DuQSkcfvhzeyBgmUOI1HacudTix8/qLA9TcfuBqbAbeiHV5W', '21380-300', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(80, 1, NULL, 'Heinz Meisinger', 'heinz@hotmail.com', '$2y$10$LsWAukCUiR7WKlT9KolRtO8ybbAWAAyPX9Bs2HpkD//iVfebvR0Ae', '20740-231', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(81, 5, NULL, 'Evandro Heinz', 'evandro@hotmail.com', '$2y$10$q099WC42E2DIhioVwsPIDuepO4HvV8gF5m4/7HcpYWjxYaMMGnU0S', '21380-350', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(82, 7, NULL, 'Fausto Lopes', 'fausto@hotmail.com', '$2y$10$j.08dW3bLiUqt9GDyraNFuRaA9EApm78dhGOViAVu0XECbk8mpnkS', '21311-330', 'Rio de Janeiro', 'Quintino Bocaiúva', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(83, 19, NULL, 'Florencio De Sousa', 'florencio@hotmail.com', '$2y$10$XIbWiRdafyqO5DWsiMV1GegIJ/jW39I7PD5zBQx6swz3ogWFL.0Ji', '20751-060', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(84, 9, NULL, 'Franciele Francisco', 'franciele@hotmail.com', '$2y$10$JyPVuT.DZbXtzKjEcrWSzeCycFlGWiaIpAFv0/.ucK1bipYtnvnga', '20740-610', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(85, 16, NULL, 'Félisberto Albert', 'felisberto@hotmail.com', '$2y$10$R7djG6jbcPKx1TJtU6xTMOe82VgZX6luhmyc9RTwXUch1CJttmdZO', '20751-001', 'Rio de Janeiro', 'Piedade', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(86, 15, 45, 'Enrique Araujo', 'enrique@hotmail.com', '$2y$10$Kp2Ie2OvYGLFfrpnA.4qkO43DOHmNIN7PJOrq1zWMHgJP3RXR/eLq', '20715-190', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(87, 15, 44, 'Edviges Nobre', 'edviges@hotmail.com', '$2y$10$.0u07RALNYzcZzWsfxfaZeyE0ook5gGrCkykqmQIGIMEGHKvA16rW', '20715-410', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(88, 15, 44, 'Firmino Roberto', 'firmino@hotmail.com', '$2y$10$Vr5KGIlNjT06RRg5yQGlhODi84QtUeiwmWxNTrGR1BRy7j0NY2GIO', '20950-311', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
(89, 15, 45, 'Eustaquio Lopes', 'eustaquio@hotmail.com', '$2y$10$ZmIkjELIIlGPTf/Zoh.rkuvr6pFIrrHe71ym6depOoKFhbGNajMGu', '20950-440', 'Rio de Janeiro', 'Engenho Novo', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.');

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
(54, 54, '21', '99999-9999'),
(55, 55, '21', '99999-9999'),
(56, 56, '21', '99999-9999'),
(57, 57, '21', '99999-9999'),
(58, 58, '21', '99999-9999'),
(59, 59, '21', '99999-9999'),
(60, 60, '21', '99999-9999'),
(61, 61, '21', '99999-9999'),
(62, 62, '21', '99999-9999'),
(63, 63, '21', '99999-9999'),
(64, 64, '21', '99999-9999'),
(65, 65, '21', '99999-9999'),
(66, 66, '21', '99999-9999'),
(67, 67, '21', '99999-9999'),
(68, 68, '21', '99999-9999'),
(69, 69, '21', '99999-9999'),
(70, 70, '21', '99999-9999'),
(71, 71, '21', '99999-9999'),
(72, 72, '21', '99999-9999'),
(73, 73, '21', '99999-9999'),
(74, 74, '21', '99999-9999'),
(75, 75, '21', '99999-9999'),
(76, 76, '21', '99999-9999'),
(77, 77, '21', '99999-9999'),
(78, 78, '21', '99999-9999'),
(79, 79, '21', '99999-9999'),
(80, 80, '21', '99999-9999'),
(81, 81, '21', '99999-9999'),
(82, 82, '21', '99999-9999'),
(83, 83, '21', '99999-9999'),
(84, 84, '21', '99999-9999'),
(85, 85, '21', '99999-9999'),
(86, 86, '21', '99999-9999'),
(87, 87, '21', '99999-9999'),
(88, 88, '21', '99999-9999'),
(89, 89, '21', '99999-9999');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

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
