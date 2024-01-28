-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2023 at 02:08 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wma-maestro`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `nama_barang` varchar(125) NOT NULL,
  `deskripsi` text NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `harga_supplier` varchar(20) DEFAULT NULL,
  `stok_supplier` int(11) DEFAULT NULL,
  `harga_gudang` varchar(20) DEFAULT NULL,
  `stok_gudang` int(11) DEFAULT NULL,
  `stok_minimal` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `id_kategori`, `id_supplier`, `nama_barang`, `deskripsi`, `satuan`, `harga_supplier`, `stok_supplier`, `harga_gudang`, `stok_gudang`, `stok_minimal`, `gambar`, `type`) VALUES
(1, 1, 1, 'HVS A4 1 Dus', 'Kertas HVS Multifungsi untuk memenuhi kebutuhan sekolah maupun kantor', 'pcs', '225000', 1000, '', 0, 14, 'hvs.jpg', 2),
(2, 1, 1, 'Art Carton 100 pcs', 'Permukaan Kilap di kedua sisi dapat dicetak bolak balik (bagian depan dan belakang)', 'pcs', '140000', 1000, '', 0, 13, 'carton.jpg', 2),
(3, 2, 2, 'Jelly Glue 1 Kg', 'Bahan lem untuk percetakan', 'pcs', '212000', 1000, '', 0, 17, 'jellyglue.jpg', 2),
(4, 3, 2, 'Flexi 1 Roll', 'Bahan flexi yang lentur dan tidak mudah robek', 'pcs', '1645000', 1000, '', 0, 14, 'flexi.jpg', 2),
(5, 4, 1, 'Dye Base 1 Dus', 'Tinta dye merupakan tinta yang paling sering digunakan untuk keperluan rumahan atau kantoran untuk mencetak sebuah dokumen', 'pcs', '1250000', 1000, '', 0, 17, 'dye.jpeg', 2),
(6, 4, 1, 'Solvent 1 Dus', 'Tinta solvent merupakan tinta yang kebanyakan dipakai untuk keperluan cetak banner', 'pcs', '2050000', 1000, '', 0, 11, 'solvent.jpg', 2),
(7, 1, 0, 'Undangan', 'Cetak undangan pernikahan, khitanan, syukuran, dll', 'pcs', '', 0, '750', 1000, 0, 'undangan.jpg', 1),
(8, 1, 0, 'Buku Yasin', 'Cetak buku yasin', 'pcs', '', 0, '6500', 1000, 0, 'yasin.jpg', 1),
(9, 1, 0, 'Brosur', 'Cetak brosur iklan, kegiatan, majalah', 'pcs', '', 0, '1500', 1000, 0, 'brosur.jpg', 1),
(10, 1, 0, 'Banner', 'Cetak banner acara', 'pcs', '', 0, '27000', 1000, 0, 'banner.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Kertas'),
(2, 'Bahan Lem'),
(3, 'Bahan Banner'),
(4, 'Bahan Tinta');

-- --------------------------------------------------------

--
-- Table structure for table `po_barang`
--

CREATE TABLE `po_barang` (
  `id_po_bar` int(11) NOT NULL,
  `id_reseller` int(11) NOT NULL,
  `tgl_tran_bar` varchar(20) NOT NULL,
  `tot_bay_bar` varchar(20) NOT NULL,
  `stat_bay_bar` int(11) NOT NULL,
  `bukti_bay_bar` text NOT NULL,
  `stat_order_bar` int(11) NOT NULL,
  `alamat_kirim_bar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_barang`
--

INSERT INTO `po_barang` (`id_po_bar`, `id_reseller`, `tgl_tran_bar`, `tot_bay_bar`, `stat_bay_bar`, `bukti_bay_bar`, `stat_order_bar`, `alamat_kirim_bar`) VALUES
(1, 1, '2023-09-16', '10000', 1, 'Ini-Dia-Bukti-Transfer-Mandiri-Dari-ATM-mBanking-dan-Internet-Banking-Mandiri-11.jpg', 1, 'Kuningan, Jawa Barat'),
(2, 1, '2023-10-09', '31500', 0, '0', 0, 'Kuningan, Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `po_bb`
--

CREATE TABLE `po_bb` (
  `id_po_bb` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `tgl_transaksi` varchar(15) NOT NULL,
  `total_bayar` varchar(15) NOT NULL,
  `stat_bayar` int(11) NOT NULL,
  `bukti_bayar` text NOT NULL,
  `status_order` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_bb`
--

INSERT INTO `po_bb` (`id_po_bb`, `id_user`, `id_supplier`, `tgl_transaksi`, `total_bayar`, `stat_bayar`, `bukti_bayar`, `status_order`, `alamat_pengiriman`) VALUES
(1, 1, 1, '2023-01-03', '1350000', 1, '', 4, 'Jakarta'),
(2, 1, 1, '2023-01-03', '2520000', 1, '', 4, 'Jakarta'),
(3, 1, 2, '2023-01-05', '6580000', 1, '', 4, 'Jakarta'),
(4, 1, 2, '2023-01-09', '7500000', 1, '', 4, 'Jakarta'),
(5, 1, 1, '2023-01-11', '1484000', 1, '', 4, 'Jakarta'),
(6, 1, 1, '2023-01-11', '8200000', 1, '', 4, 'Jakarta'),
(7, 1, 2, '2023-01-16', '9870000', 1, '', 4, 'Jakarta'),
(8, 1, 1, '2023-01-19', '1800000', 1, '', 4, 'Jakarta'),
(9, 1, 2, '2023-01-24', '2120000', 1, '', 4, 'Jakarta'),
(10, 1, 1, '2023-01-27', '10250000', 1, '', 4, 'Jakarta'),
(11, 1, 1, '2023-01-27', '15000000', 1, '', 4, 'Jakarta'),
(12, 1, 1, '2023-01-31', '840000', 1, '', 4, 'Jakarta'),
(13, 1, 2, '2023-02-03', '2120000', 1, '', 4, 'Jakarta'),
(14, 1, 1, '2023-02-04', '900000', 1, '', 4, 'Jakarta'),
(15, 1, 2, '2023-02-07', '13160000', 1, '', 4, 'Jakarta'),
(16, 1, 1, '2023-02-10', '14350000', 1, '', 4, 'Jakarta'),
(17, 1, 1, '2023-02-14', '10000000', 1, '', 4, 'Jakarta'),
(18, 1, 1, '2023-02-14', '700000', 1, '', 4, 'Jakarta'),
(19, 1, 1, '2023-02-17', '1800000', 1, '', 4, 'Jakarta'),
(20, 1, 1, '2023-02-17', '7500000', 1, '', 4, 'Jakarta'),
(21, 1, 2, '2023-02-21', '9870000', 1, '', 4, 'Jakarta'),
(22, 1, 1, '2023-02-24', '840000', 1, '', 4, 'Jakarta'),
(23, 1, 2, '2023-02-25', '2544000', 1, '', 4, 'Jakarta'),
(24, 1, 1, '2023-02-28', '6150000', 1, '', 4, 'Jakarta'),
(25, 1, 2, '2023-03-03', '9870000', 1, '', 4, 'Jakarta'),
(26, 1, 1, '2023-03-04', '1800000', 1, '', 4, 'Jakarta'),
(27, 1, 2, '2023-03-08', '2120000', 1, '', 4, 'Jakarta'),
(28, 1, 1, '2023-03-10', '10250000', 1, '', 4, 'Jakarta'),
(29, 1, 1, '2023-03-14', '15000000', 1, '', 4, 'Jakarta'),
(30, 1, 1, '2023-03-14', '840000', 1, '', 4, 'Jakarta'),
(31, 1, 1, '2023-03-18', '2250000', 1, '', 4, 'Jakarta'),
(32, 1, 2, '2023-03-21', '848000', 1, '', 4, 'Jakarta'),
(33, 1, 2, '2023-03-21', '13160000', 1, '', 4, 'Jakarta'),
(34, 1, 1, '2023-03-27', '8750000', 1, '', 4, 'Jakarta'),
(35, 1, 1, '2023-03-31', '1120000', 1, '', 4, 'Jakarta'),
(36, 1, 1, '2023-03-31', '10250000', 1, '', 4, 'Jakarta'),
(37, 1, 1, '2023-04-05', '1800000', 1, '', 4, 'Jakarta'),
(38, 1, 2, '2023-04-08', '8225000', 1, '', 4, 'Jakarta'),
(39, 1, 2, '2023-04-08', '1060000', 1, '', 4, 'Jakarta'),
(40, 1, 1, '2023-04-11', '20500000', 1, '', 4, 'Jakarta'),
(41, 1, 1, '2023-04-11', '6250000', 1, '', 4, 'Jakarta'),
(42, 1, 1, '2023-04-15', '700000', 1, '', 4, 'Jakarta'),
(43, 1, 1, '2023-04-18', '1350000', 1, '', 4, 'Jakarta'),
(44, 1, 2, '2023-04-26', '13160000', 1, '', 4, 'Jakarta'),
(45, 1, 1, '2023-04-28', '1400000', 1, '', 4, 'Jakarta'),
(46, 1, 1, '2023-04-28', '6250000', 1, '', 4, 'Jakarta'),
(47, 1, 2, '2023-04-29', '2544000', 1, '', 4, 'Jakarta'),
(48, 1, 1, '2023-04-30', '12300000', 1, '', 4, 'Jakarta'),
(49, 1, 1, '2023-05-08', '1400000', 1, '', 4, 'Jakarta'),
(50, 1, 1, '2023-05-08', '900000', 1, '', 4, 'Jakarta'),
(51, 1, 2, '2023-05-11', '13160000', 1, '', 4, 'Jakarta'),
(52, 1, 1, '2023-05-13', '14350000', 1, '', 4, 'Jakarta'),
(53, 1, 1, '2023-05-13', '10000000', 1, '', 4, 'Jakarta'),
(54, 1, 2, '2023-05-16', '1060000', 1, '', 4, 'Jakarta'),
(55, 1, 1, '2023-05-20', '1350000', 1, '', 4, 'Jakarta'),
(56, 1, 1, '2023-05-20', '1400000', 1, '', 4, 'Jakarta'),
(57, 1, 2, '2023-05-25', '6580000', 1, '', 4, 'Jakarta'),
(58, 1, 2, '2023-05-25', '1272000', 1, '', 4, 'Jakarta'),
(59, 1, 1, '2023-05-29', '8750000', 1, '', 4, 'Jakarta'),
(60, 1, 1, '2023-05-29', '8200000', 1, '', 4, 'Jakarta'),
(61, 1, 2, '2023-06-07', '9870000', 1, '', 4, 'Jakarta'),
(62, 1, 1, '2023-06-09', '1800000', 1, '', 4, 'Jakarta'),
(63, 1, 2, '2023-06-13', '2120000', 1, '', 4, 'Jakarta'),
(64, 1, 1, '2023-06-14', '10250000', 1, '', 4, 'Jakarta'),
(65, 1, 1, '2023-06-14', '15000000', 1, '', 4, 'Jakarta'),
(66, 1, 1, '2023-06-17', '840000', 1, '', 4, 'Jakarta'),
(67, 1, 1, '2023-06-20', '2250000', 1, '', 4, 'Jakarta'),
(68, 1, 1, '2023-06-20', '8200000', 1, '', 4, 'Jakarta'),
(69, 1, 2, '2023-06-23', '1316000', 1, '', 4, 'Jakarta'),
(70, 1, 1, '2023-06-25', '8750000', 1, '', 4, 'Jakarta'),
(71, 1, 2, '2023-06-26', '1696000', 1, '', 4, 'Jakarta'),
(72, 1, 1, '2023-06-27', '700000', 1, '', 4, 'Jakarta'),
(73, 1, 1, '2023-07-05', '10250000', 1, '', 4, 'Jakarta'),
(74, 1, 1, '2023-07-05', '1800000', 1, '', 4, 'Jakarta'),
(75, 1, 2, '2023-07-08', '16450000', 1, '', 4, 'Jakarta'),
(76, 1, 2, '2023-07-08', '1272000', 1, '', 4, 'Jakarta'),
(77, 1, 1, '2023-07-12', '6250000', 1, '', 4, 'Jakarta'),
(78, 1, 1, '2023-07-15', '700000', 1, '', 4, 'Jakarta'),
(79, 1, 1, '2023-07-20', '1125000', 1, '', 4, 'Jakarta'),
(80, 1, 2, '2023-07-22', '1696000', 1, '', 4, 'Jakarta'),
(81, 1, 2, '2023-07-22', '16450000', 1, '', 4, 'Jakarta'),
(82, 1, 1, '2023-07-26', '6250000', 1, '', 4, 'Jakarta'),
(83, 1, 1, '2023-07-31', '1680000', 1, '', 4, 'Jakarta'),
(84, 1, 1, '2023-07-31', '12300000', 1, '', 4, 'Jakarta'),
(85, 1, 2, '2023-08-04', '2120000', 1, '', 4, 'Jakarta'),
(86, 1, 1, '2023-08-05', '900000', 1, '', 4, 'Jakarta'),
(87, 1, 2, '2023-08-08', '13160000', 1, '', 4, 'Jakarta'),
(88, 1, 1, '2023-08-10', '980000', 1, '', 4, 'Jakarta'),
(89, 1, 1, '2023-08-10', '10000000', 1, '', 4, 'Jakarta'),
(90, 1, 1, '2023-08-15', '10250000', 1, '', 4, 'Jakarta'),
(91, 1, 1, '2023-08-22', '1350000', 1, '', 4, 'Jakarta'),
(92, 1, 1, '2023-08-22', '1680000', 1, '', 4, 'Jakarta'),
(93, 1, 2, '2023-08-24', '6580000', 1, '', 4, 'Jakarta'),
(94, 1, 1, '2023-08-26', '7500000', 1, '', 4, 'Jakarta'),
(95, 1, 2, '2023-08-28', '1484000', 1, '', 4, 'Jakarta'),
(96, 1, 1, '2023-08-31', '8200000', 1, '', 4, 'Jakarta'),
(97, 1, 1, '2023-09-06', '840000', 1, '', 4, 'Jakarta'),
(98, 1, 1, '2023-09-06', '1800000', 1, '', 4, 'Jakarta'),
(99, 1, 2, '2023-09-08', '16450000', 1, '', 4, 'Jakarta'),
(100, 1, 1, '2023-09-11', '10250000', 1, '', 4, 'Jakarta'),
(101, 1, 1, '2023-09-11', '15000000', 1, '', 4, 'Jakarta'),
(102, 1, 2, '2023-09-14', '1272000', 1, '', 4, 'Jakarta'),
(103, 1, 1, '2023-09-21', '2250000', 1, '', 4, 'Jakarta'),
(104, 1, 1, '2023-09-21', '560000', 1, '', 4, 'Jakarta'),
(105, 1, 2, '2023-09-23', '13160000', 1, '', 4, 'Jakarta'),
(106, 1, 1, '2023-09-25', '8750000', 1, '', 4, 'Jakarta'),
(107, 1, 2, '2023-09-27', '1696000', 1, '', 4, 'Jakarta'),
(108, 1, 1, '2023-09-30', '10250000', 1, '', 4, 'Jakarta'),
(109, 1, 2, '2023-10-04', '9870000', 1, '', 4, 'Jakarta'),
(110, 1, 1, '2023-10-06', '2700000', 1, '', 4, 'Jakarta'),
(111, 1, 2, '2023-10-09', '848000', 1, '', 4, 'Jakarta'),
(112, 1, 1, '2023-10-12', '12300000', 1, '', 4, 'Jakarta'),
(113, 1, 1, '2023-10-12', '8750000', 1, '', 4, 'Jakarta'),
(114, 1, 1, '2023-10-14', '560000', 1, '', 4, 'Jakarta'),
(115, 1, 1, '2023-10-19', '1350000', 1, '', 4, 'Jakarta'),
(116, 1, 2, '2023-10-20', '1696000', 1, '', 4, 'Jakarta'),
(117, 1, 2, '2023-10-20', '16450000', 1, '', 4, 'Jakarta'),
(118, 1, 1, '2023-10-24', '6250000', 1, '', 4, 'Jakarta'),
(119, 1, 1, '2023-10-27', '1680000', 1, '', 4, 'Jakarta'),
(120, 1, 1, '2023-10-27', '12300000', 1, '', 4, 'Jakarta'),
(121, 1, 2, '2023-11-03', '2120000', 1, '', 4, 'Jakarta'),
(122, 1, 1, '2023-11-07', '900000', 1, '', 4, 'Jakarta'),
(123, 1, 2, '2023-11-08', '13160000', 1, '', 4, 'Jakarta'),
(124, 1, 1, '2023-11-11', '14350000', 1, '', 4, 'Jakarta'),
(125, 1, 1, '2023-11-15', '10000000', 1, '', 4, 'Jakarta'),
(126, 1, 1, '2023-11-15', '700000', 1, '', 4, 'Jakarta'),
(127, 1, 1, '2023-11-22', '1350000', 1, '', 4, 'Jakarta'),
(128, 1, 1, '2023-11-22', '15000000', 1, '', 4, 'Jakarta'),
(129, 1, 2, '2023-11-23', '6580000', 1, '', 4, 'Jakarta'),
(130, 1, 1, '2023-11-25', '840000', 1, '', 4, 'Jakarta'),
(131, 1, 2, '2023-11-28', '2544000', 1, '', 4, 'Jakarta'),
(132, 1, 1, '2023-11-30', '8200000', 1, '', 4, 'Jakarta'),
(133, 1, 2, '2023-12-05', '1272000', 1, '', 4, 'Jakarta'),
(134, 1, 1, '2023-12-06', '1800000', 1, '', 4, 'Jakarta'),
(135, 1, 2, '2023-12-09', '16450000', 1, '', 4, 'Jakarta'),
(136, 1, 1, '2023-12-11', '10250000', 1, '', 4, 'Jakarta'),
(137, 1, 1, '2023-12-11', '15000000', 1, '', 4, 'Jakarta'),
(138, 1, 1, '2023-12-12', '840000', 1, '', 4, 'Jakarta'),
(139, 1, 1, '2023-12-12', '2250000', 1, '', 4, 'Jakarta'),
(140, 1, 2, '2023-12-14', '6580000', 1, '', 4, 'Jakarta'),
(141, 1, 1, '2023-12-15', '16400000', 1, '', 4, 'Jakarta'),
(142, 1, 1, '2023-12-15', '980000', 1, '', 4, 'Jakarta'),
(143, 1, 2, '2023-12-18', '1696000', 1, '', 4, 'Jakarta'),
(144, 1, 1, '2023-12-22', '6250000', 1, '', 4, 'Jakarta'),
(655, 1, 1, '2023-10-22', '1125000', 0, '0', 0, 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `po_dbarang`
--

CREATE TABLE `po_dbarang` (
  `id_po_dbar` int(11) NOT NULL,
  `id_po_bar` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_dbarang`
--

INSERT INTO `po_dbarang` (`id_po_dbar`, `id_po_bar`, `id_jenis`, `qty`) VALUES
(1, 1, 12, 1),
(2, 2, 12, 2),
(3, 2, 13, 5);

-- --------------------------------------------------------

--
-- Table structure for table `po_dbb`
--

CREATE TABLE `po_dbb` (
  `id_po_dbb` int(11) NOT NULL,
  `id_po_bb` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_dbb`
--

INSERT INTO `po_dbb` (`id_po_dbb`, `id_po_bb`, `id_jenis`, `qty`) VALUES
(1, 1, 1, 6),
(2, 2, 2, 18),
(3, 3, 4, 4),
(4, 4, 5, 6),
(5, 5, 3, 7),
(6, 6, 6, 4),
(7, 7, 4, 6),
(8, 8, 1, 8),
(9, 9, 3, 10),
(10, 10, 6, 5),
(11, 11, 5, 12),
(12, 12, 2, 6),
(13, 13, 3, 10),
(14, 14, 1, 4),
(15, 15, 4, 8),
(16, 16, 6, 7),
(17, 17, 5, 8),
(18, 18, 2, 5),
(19, 19, 1, 8),
(20, 20, 5, 6),
(21, 21, 4, 6),
(22, 22, 2, 6),
(23, 23, 3, 12),
(24, 24, 6, 3),
(25, 25, 4, 6),
(26, 26, 1, 8),
(27, 27, 3, 10),
(28, 28, 6, 5),
(29, 29, 5, 12),
(30, 30, 2, 6),
(31, 31, 1, 10),
(32, 32, 3, 4),
(33, 33, 4, 8),
(34, 34, 5, 7),
(35, 35, 2, 8),
(36, 36, 6, 5),
(37, 37, 1, 8),
(38, 38, 4, 5),
(39, 39, 3, 5),
(40, 40, 6, 10),
(41, 41, 5, 5),
(42, 42, 2, 5),
(43, 43, 1, 6),
(44, 44, 4, 8),
(45, 45, 2, 10),
(46, 46, 5, 5),
(47, 47, 3, 12),
(48, 48, 6, 6),
(49, 49, 2, 10),
(50, 50, 1, 4),
(51, 51, 4, 8),
(52, 52, 6, 7),
(53, 53, 5, 8),
(54, 54, 3, 5),
(55, 55, 1, 6),
(56, 56, 2, 10),
(57, 57, 4, 4),
(58, 58, 3, 6),
(59, 59, 5, 7),
(60, 60, 6, 4),
(61, 61, 4, 6),
(62, 62, 1, 8),
(63, 63, 3, 10),
(64, 64, 6, 5),
(65, 65, 5, 12),
(66, 66, 2, 6),
(67, 67, 1, 10),
(68, 68, 6, 4),
(69, 69, 4, 8),
(70, 70, 5, 7),
(71, 71, 3, 8),
(72, 72, 2, 5),
(73, 73, 6, 5),
(74, 74, 1, 8),
(75, 75, 4, 10),
(76, 76, 3, 6),
(77, 77, 5, 5),
(78, 78, 2, 5),
(79, 79, 1, 6),
(80, 80, 3, 8),
(81, 81, 4, 10),
(82, 82, 5, 5),
(83, 83, 2, 12),
(84, 84, 6, 6),
(85, 85, 3, 10),
(86, 86, 1, 4),
(87, 87, 4, 8),
(88, 88, 2, 7),
(89, 89, 5, 8),
(90, 90, 6, 5),
(91, 91, 1, 6),
(92, 92, 2, 12),
(93, 93, 4, 4),
(94, 94, 5, 6),
(95, 95, 3, 7),
(96, 96, 6, 4),
(97, 97, 2, 6),
(98, 98, 1, 8),
(99, 99, 4, 10),
(100, 100, 6, 5),
(101, 101, 5, 12),
(102, 102, 3, 6),
(103, 103, 1, 10),
(104, 104, 2, 4),
(105, 105, 4, 8),
(106, 106, 5, 7),
(107, 107, 3, 8),
(108, 108, 6, 5),
(109, 109, 4, 6),
(110, 110, 1, 12),
(111, 111, 3, 4),
(112, 112, 6, 6),
(113, 113, 5, 7),
(114, 114, 2, 4),
(115, 115, 1, 6),
(116, 116, 3, 8),
(117, 117, 4, 10),
(118, 118, 5, 5),
(119, 119, 2, 12),
(120, 120, 6, 6),
(121, 121, 3, 10),
(122, 122, 1, 4),
(123, 123, 4, 8),
(124, 124, 6, 7),
(125, 125, 5, 8),
(126, 126, 2, 5),
(127, 127, 1, 6),
(128, 128, 5, 12),
(129, 129, 4, 4),
(130, 130, 2, 6),
(131, 131, 3, 12),
(132, 132, 6, 4),
(133, 133, 3, 6),
(134, 134, 1, 8),
(135, 135, 4, 10),
(136, 136, 6, 5),
(137, 137, 5, 12),
(138, 138, 2, 6),
(139, 139, 1, 10),
(140, 140, 4, 4),
(141, 141, 6, 8),
(142, 142, 2, 7),
(143, 143, 3, 8),
(144, 144, 5, 5),
(145, 655, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reseller`
--

CREATE TABLE `reseller` (
  `id_reseller` int(11) NOT NULL,
  `nama_reseller` varchar(125) NOT NULL,
  `alamat_reseller` text NOT NULL,
  `no_hp_reseller` varchar(15) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `username_reseller` varchar(50) NOT NULL,
  `password_reseller` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `nama_reseller`, `alamat_reseller`, `no_hp_reseller`, `jk`, `username_reseller`, `password_reseller`) VALUES
(1, 'Reseller 1', 'Kuningan, Jawa Barat', '089987656543', 'Perempuan', 'reseller1', 'reseller1');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(125) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp_supplier` varchar(15) NOT NULL,
  `username_supp` varchar(20) NOT NULL,
  `pass_supp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_hp_supplier`, `username_supp`, `pass_supp`) VALUES
(1, 'Grafika', 'Jakarta', '089987345162', 'grafika1', 'grafika1'),
(2, 'Max Pro', 'Jakarta', '08991227005', 'maxpro1', 'maxpro1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(125) NOT NULL,
  `alamat_user` text NOT NULL,
  `no_hp_user` varchar(15) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(125) NOT NULL,
  `level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat_user`, `no_hp_user`, `username`, `password`, `level_user`) VALUES
(1, 'Admin', 'Kuningan', '089987654543', 'admin', 'admin', 1),
(3, 'Pimpinan', 'Kuningan, Jawa Barat', '089987654543', 'pimpinan', 'pimpinan', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `po_barang`
--
ALTER TABLE `po_barang`
  ADD PRIMARY KEY (`id_po_bar`);

--
-- Indexes for table `po_bb`
--
ALTER TABLE `po_bb`
  ADD PRIMARY KEY (`id_po_bb`);

--
-- Indexes for table `po_dbarang`
--
ALTER TABLE `po_dbarang`
  ADD PRIMARY KEY (`id_po_dbar`);

--
-- Indexes for table `po_dbb`
--
ALTER TABLE `po_dbb`
  ADD PRIMARY KEY (`id_po_dbb`);

--
-- Indexes for table `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `po_barang`
--
ALTER TABLE `po_barang`
  MODIFY `id_po_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `po_bb`
--
ALTER TABLE `po_bb`
  MODIFY `id_po_bb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=656;

--
-- AUTO_INCREMENT for table `po_dbarang`
--
ALTER TABLE `po_dbarang`
  MODIFY `id_po_dbar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `po_dbb`
--
ALTER TABLE `po_dbb`
  MODIFY `id_po_dbb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
