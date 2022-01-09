-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2021 at 06:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gamein`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nama_barang`, `jumlah_barang`, `harga_beli`, `harga_jual`, `tanggal_masuk`) VALUES
('B0001', 'Diamond Free Fire', 9975, 100, 200, '2021-07-01'),
('B0002', 'Diamond Mobile Legend', 7948, 150, 275, '2021-07-03'),
('B0003', 'UC PUBG', 13700, 125, 250, '2021-07-02'),
('B0004', 'Koin Emas Higgs Domino', 12000, 125, 200, '2021-07-04'),
('B0005', 'PB Cash', 10000, 100, 150, '2021-07-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_beli`
--

CREATE TABLE `tbl_beli` (
  `nofaktur` varchar(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_beli`
--

INSERT INTO `tbl_beli` (`nofaktur`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_beli`, `harga`, `bayar`, `kembalian`, `tanggal`) VALUES
('F0001', 'B0001', 'Diamond Free Fire', 200, 25, 5000, 50000, 11750, '2021-07-28'),
('F0001', 'B0002', 'Diamond Mobile Legend', 275, 30, 8250, 50000, 11750, '2021-07-28'),
('F0001', 'B0003', 'UC PUBG', 250, 100, 25000, 50000, 11750, '2021-07-28'),
('F0002', 'B0002', 'Diamond Mobile Legend', 275, 12, 3300, 5000, 1700, '2021-07-28'),
('F0003', 'B0002', 'Diamond Mobile Legend', 275, 1000, 275000, 300000, 25000, '2021-07-28'),
('F0004', 'B0002', 'Diamond Mobile Legend', 275, 500, 137500, 400000, 12500, '2021-07-28'),
('F0004', 'B0003', 'UC PUBG', 250, 1000, 250000, 400000, 12500, '2021-07-28'),
('F0004', 'B0002', 'Diamond Mobile Legend', 275, 10, 2750, 400000, 12500, '2021-07-28'),
('F0005', 'B0002', 'Diamond Mobile Legend', 275, 500, 137500, 200000, 12500, '2021-07-28'),
('F0005', 'B0003', 'UC PUBG', 250, 200, 50000, 200000, 12500, '2021-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` int(30) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`username`, `password`, `jenis_kelamin`, `email`, `no_telp`, `agama`, `alamat`) VALUES
('admin', 'admin', 'Laki-Laki', 'admin@gmail.com', 123456, 'Islam', 'purwokerto'),
('allam', 'allam', 'Laki-Laki', 'allam@gmail.com', 19102226, 'Islam', 'CIlongok');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tmp_beli`
--

CREATE TABLE `tbl_tmp_beli` (
  `id_tmp` int(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `tbl_tmp_beli`
--
DELIMITER $$
CREATE TRIGGER `batal` AFTER DELETE ON `tbl_tmp_beli` FOR EACH ROW BEGIN
UPDATE tbl_barang SET jumlah_barang = jumlah_barang + OLD.jumlah_beli
WHERE kd_barang = OLD.kd_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `beli` AFTER INSERT ON `tbl_tmp_beli` FOR EACH ROW BEGIN 
UPDATE tbl_barang SET jumlah_barang = jumlah_barang - new.jumlah_beli 
WHERE kd_barang = new.`kd_barang`; 
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_tmp_beli`
--
ALTER TABLE `tbl_tmp_beli`
  ADD PRIMARY KEY (`id_tmp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_tmp_beli`
--
ALTER TABLE `tbl_tmp_beli`
  MODIFY `id_tmp` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
