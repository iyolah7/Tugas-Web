-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2022 at 10:45 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_depan`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(4) NOT NULL,
  `nama` varchar(22) NOT NULL,
  `telepon` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama`, `telepon`) VALUES
(1, 'Fatur,S.pd', '081236476376'),
(2, 'Titin, S.com', '08154565464'),
(3, 'Mamat ,M.pd', '0215454354465');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(3) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama`) VALUES
(1, 'Bimbingan Konseling'),
(2, 'Bahasa Indonesia'),
(3, 'DKV'),
(4, 'Bahasa japan');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(12) NOT NULL,
  `nama` varchar(22) NOT NULL,
  `id_jurusan` int(3) NOT NULL,
  `alamat` varchar(22) NOT NULL,
  `telepon` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `id_jurusan`, `alamat`, `telepon`) VALUES
('1092323213', 'aji', 4, 'Jakarta', '098808800'),
('201943508899', 'Jojon', 2, 'depok', '08121234000'),
('20194351703', 'Depan', 4, 'jakarta', '0211231238'),
('20194358989', 'Tina', 1, 'Bogor', '0211231277');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(4) NOT NULL,
  `id_dosen` int(4) NOT NULL,
  `nama` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `id_dosen`, `nama`) VALUES
(1, 3, 'DKV'),
(2, 1, 'Bahasa Japan'),
(3, 2, 'Bimbingan Konseling');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(4) NOT NULL,
  `nim` char(12) NOT NULL,
  `id_dosen` int(4) NOT NULL,
  `id_matkul` int(4) NOT NULL,
  `nilai` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `nim`, `id_dosen`, `id_matkul`, `nilai`) VALUES
(1, '20194351703', 1, 1, 100),
(77, '20194351703', 2, 2, 90);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_detail_nilai`
-- (See below for the actual view)
--
CREATE TABLE `v_detail_nilai` (
`nim` char(12)
,`nama_mhs` varchar(22)
,`nama_jurusan` varchar(50)
,`nama_dosen` varchar(22)
,`id_matkul` int(4)
,`nama_matkul` varchar(22)
,`nilai` int(3)
);

-- --------------------------------------------------------

--
-- Structure for view `v_detail_nilai`
--
DROP TABLE IF EXISTS `v_detail_nilai`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_detail_nilai`  AS  select `nilai`.`nim` AS `nim`,`mahasiswa`.`nama` AS `nama_mhs`,`jurusan`.`nama` AS `nama_jurusan`,`dosen`.`nama` AS `nama_dosen`,`nilai`.`id_matkul` AS `id_matkul`,`matkul`.`nama` AS `nama_matkul`,`nilai`.`nilai` AS `nilai` from ((((`nilai` join `mahasiswa` on(`nilai`.`nim` = `mahasiswa`.`nim`)) join `jurusan` on(`mahasiswa`.`id_jurusan` = `jurusan`.`id_jurusan`)) join `dosen` on(`nilai`.`id_dosen` = `dosen`.`id_dosen`)) join `matkul` on(`nilai`.`id_matkul` = `matkul`.`id_matkul`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_jurusan_2` (`id_jurusan`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`),
  ADD KEY `id_dosen` (`id_dosen`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `nim` (`nim`),
  ADD KEY `id_dosen` (`id_dosen`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_jurusan`) REFERENCES `jurusan` (`id_jurusan`);

--
-- Constraints for table `matkul`
--
ALTER TABLE `matkul`
  ADD CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`id_dosen`) REFERENCES `dosen` (`id_dosen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`id_matkul`) REFERENCES `matkul` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
