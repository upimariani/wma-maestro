-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Okt 2023 pada 00.33
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

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
-- Struktur dari tabel `jenis_barang`
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
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis`, `id_kategori`, `id_supplier`, `nama_barang`, `deskripsi`, `satuan`, `harga_supplier`, `stok_supplier`, `harga_gudang`, `stok_gudang`, `stok_minimal`, `gambar`, `type`) VALUES
(1, 1, 1, 'HVS A4 1 Dus', 'Kertas HVS Multifungsi untuk memenuhi kebutuhan sekolah maupun kantor', 'dus', '205000', 1000, '205000', 1000, 30, 'hvs.jpg', 2),
(2, 1, 1, 'Art Carton 100 Pcs', 'Kertas berbahan karton untuk memenuhi kebutuhan produksi percetakan', 'pcs', '91000', 1000, '91000', 1000, 30, 'carton.jpeg', 2),
(3, 1, 1, 'Kertas Glossy 100 Pcs', 'Kertas berbahan glossy untuk memenuhi kebutuhan produksi percetakan', 'pcs', '62000', 1000, '62000', 1000, 30, 'glossy.jpg', 2),
(4, 2, 2, 'Hot Melt Glue 1 Kg', 'Bahan lem untuk percetakan', 'kg', '115000', 1000, '', 0, 30, 'hotglue.jpg', 2),
(5, 2, 2, 'Jelly Glue 1 Kg', 'Bahan lem untuk percetakan', 'kg', '100000', 1000, '', 0, 30, 'jellyglue.jpg', 2),
(6, 3, 2, 'Flexi 1 Roll', 'Bahan flexi yang lentur dan tidak mudah robek', 'roll', '137500', 1000, '', 0, 30, 'flexi.jpg', 2),
(7, 3, 2, 'Albatros 1 Roll', 'Bahan albatros yang halus serta mengkilap memberikan kesan yang bagus untuk banner indoor', 'roll', '323000', 1000, '', 0, 30, 'albatros.jpg', 2),
(8, 3, 2, 'Luster 1 Roll', 'Bahan luster yang memiliki daya tahan lama dan menghasilkan efek doff', 'roll', '445000', 1000, '', 0, 30, 'luster.jpg', 2),
(9, 4, 1, 'Dye Base 1 Dus', 'Tinta dye merupakan tinta yang paling sering digunakan untuk keperluan rumahan atau kantoran untuk mencetak sebuah dokumen', 'dus', '305000', 1000, '305000', 1000, 30, 'dye.jpeg', 2),
(10, 4, 1, 'Pigment 1 Dus', 'Tinta pigment biasa digunakan untuk mencetak dokumen penting seperti ijazah, sertifikat, dll.', 'dus', '325000', 1000, '325000', 1000, 30, 'pigment.jpg', 2),
(11, 4, 1, 'Solvent 1 Dus', 'Tinta solvent merupakan tinta yang kebanyakan dipakai untuk keperluan cetak banner', 'dus', '560000', 1000, '560000', 1000, 30, 'solvent.jpg', 2),
(12, 1, 0, 'Undangan', 'Cetak undangan pernikahan, khitanan, syukuran', 'pcs', NULL, NULL, '750', 1000, 0, 'undangan.jpg', 1),
(13, 1, 0, 'Buku Yasin', 'Cetak buku yasin', 'pcs', NULL, NULL, '6000', 1000, 0, 'yasin.jpg', 1),
(14, 1, 0, 'Brosur', 'Cetak brosur, iklan dan majalah', 'pcs', NULL, NULL, '1200', 10000, 0, 'brosur.jpg', 1),
(15, 1, 0, 'Banner', 'Cetak banner acara', 'meter', NULL, NULL, '25000', 10000, 0, 'banner.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Kertas'),
(2, 'Bahan Lem'),
(3, 'Bahan Banner'),
(4, 'Bahan Tinta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_barang`
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
-- Dumping data untuk tabel `po_barang`
--

INSERT INTO `po_barang` (`id_po_bar`, `id_reseller`, `tgl_tran_bar`, `tot_bay_bar`, `stat_bay_bar`, `bukti_bay_bar`, `stat_order_bar`, `alamat_kirim_bar`) VALUES
(1, 1, '2023-09-16', '10000', 0, '0', 0, 'Kuningan, Jawa Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_bb`
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
-- Dumping data untuk tabel `po_bb`
--

INSERT INTO `po_bb` (`id_po_bb`, `id_user`, `id_supplier`, `tgl_transaksi`, `total_bayar`, `stat_bayar`, `bukti_bayar`, `status_order`, `alamat_pengiriman`) VALUES
(1, 1, 1, '2022-01-03', '1025000', 1, '', 4, 'Jakarta'),
(2, 1, 1, '2022-01-03', '455000', 1, '', 4, 'Jakarta'),
(3, 1, 2, '2022-01-06', '687500', 1, '', 4, 'Jakarta'),
(4, 1, 2, '2022-01-06', '1615000', 1, '', 4, 'Jakarta'),
(5, 1, 2, '2022-01-06', '2225000', 1, '', 4, 'Jakarta'),
(6, 1, 1, '2022-01-12', '3050000', 1, '', 4, 'Jakarta'),
(7, 1, 1, '2022-01-12', '3250000', 1, '', 4, 'Jakarta'),
(8, 1, 1, '2022-01-14', '5600000', 1, '', 4, 'Jakarta'),
(9, 1, 1, '2022-01-14', '310000', 1, '', 4, 'Jakarta'),
(10, 1, 2, '2022-01-24', '1150000', 1, '', 4, 'Jakarta'),
(11, 1, 2, '2022-01-24', '1000000', 1, '', 4, 'Jakarta'),
(12, 1, 1, '2022-02-02', '310000', 1, '', 4, 'Jakarta'),
(13, 1, 1, '2022-02-02', '455000', 1, '', 4, 'Jakarta'),
(14, 1, 2, '2022-02-07', '1150000', 1, '', 4, 'Jakarta'),
(15, 1, 2, '2022-02-07', '1000000', 1, '', 4, 'Jakarta'),
(16, 1, 2, '2022-02-14', '2225000', 1, '', 4, 'Jakarta'),
(17, 1, 2, '2022-02-14', '687500', 1, '', 4, 'Jakarta'),
(18, 1, 2, '2022-02-14', '1615000', 1, '', 4, 'Jakarta'),
(19, 1, 1, '2022-02-19', '1625000', 1, '', 4, 'Jakarta'),
(20, 1, 1, '2022-02-19', '1525000', 1, '', 4, 'Jakarta'),
(21, 1, 1, '2022-02-23', '2800000', 1, '', 4, 'Jakarta'),
(22, 1, 1, '2022-02-23', '2050000', 1, '', 4, 'Jakarta'),
(23, 1, 1, '2022-03-01', '455000', 1, '', 4, 'Jakarta'),
(24, 1, 1, '2022-03-01', '310000', 1, '', 4, 'Jakarta'),
(25, 1, 1, '2022-03-01', '1525000', 1, '', 4, 'Jakarta'),
(26, 1, 2, '2022-03-08', '1150000', 1, '', 4, 'Jakarta'),
(27, 1, 2, '2022-03-08', '1000000', 1, '', 4, 'Jakarta'),
(28, 1, 1, '2022-03-14', '1025000', 1, '', 4, 'Jakarta'),
(29, 1, 1, '2022-03-14', '3250000', 1, '', 4, 'Jakarta'),
(30, 1, 2, '2022-03-21', '1615000', 1, '', 4, 'Jakarta'),
(31, 1, 2, '2022-03-21', '2225000', 1, '', 4, 'Jakarta'),
(32, 1, 2, '2022-03-21', '1375000', 1, '', 4, 'Jakarta'),
(33, 1, 1, '2022-03-29', '2800000', 1, '', 4, 'Jakarta'),
(34, 1, 2, '2022-04-04', '1150000', 1, '', 4, 'Jakarta'),
(35, 1, 2, '2022-04-04', '1000000', 1, '', 4, 'Jakarta'),
(36, 1, 1, '2022-04-09', '2050000', 1, '', 4, 'Jakarta'),
(37, 1, 1, '2022-04-09', '445000', 1, '', 4, 'Jakarta'),
(38, 1, 2, '2022-04-18', '2225000', 1, '', 4, 'Jakarta'),
(39, 1, 2, '2022-04-18', '1615000', 1, '', 4, 'Jakarta'),
(40, 1, 2, '2022-04-18', '1375000', 1, '', 4, 'Jakarta'),
(41, 1, 1, '2022-04-23', '310000', 1, '', 4, 'Jakarta'),
(42, 1, 1, '2022-04-23', '2800000', 1, '', 4, 'Jakarta'),
(43, 1, 1, '2022-04-28', '3250000', 1, '', 4, 'Jakarta'),
(44, 1, 1, '2022-04-28', '3050000', 1, '', 4, 'Jakarta'),
(45, 1, 1, '2022-05-09', '2050000', 1, '', 4, 'Jakarta'),
(46, 1, 1, '2022-05-09', '1525000', 1, '', 4, 'Jakarta'),
(47, 1, 1, '2022-05-09', '1625000', 1, '', 4, 'Jakarta'),
(48, 1, 1, '2022-05-09', '455000', 1, '', 4, 'Jakarta'),
(49, 1, 2, '2022-05-17', '1000000', 1, '', 4, 'Jakarta'),
(50, 1, 2, '2022-05-17', '1150000', 1, '', 4, 'Jakarta'),
(51, 1, 2, '2022-05-23', '687500', 1, '', 4, 'Jakarta'),
(52, 1, 2, '2022-05-23', '1615000', 1, '', 4, 'Jakarta'),
(53, 1, 2, '2022-05-23', '4450000', 1, '', 4, 'Jakarta'),
(54, 1, 1, '2022-05-31', '310000', 1, '', 4, 'Jakarta'),
(55, 1, 1, '2022-05-31', '2800000', 1, '', 4, 'Jakarta'),
(56, 1, 2, '2022-06-06', '1150000', 1, '', 4, 'Jakarta'),
(57, 1, 2, '2022-06-06', '1000000', 1, '', 4, 'Jakarta'),
(58, 1, 1, '2022-06-13', '1025000', 1, '', 4, 'Jakarta'),
(59, 1, 1, '2022-06-13', '1525000', 1, '', 4, 'Jakarta'),
(60, 1, 2, '2022-06-18', '687500', 1, '', 4, 'Jakarta'),
(61, 1, 2, '2022-06-18', '3230000', 1, '', 4, 'Jakarta'),
(62, 1, 2, '2022-06-18', '2225000', 1, '', 4, 'Jakarta'),
(63, 1, 1, '2022-06-20', '910000', 1, '', 4, 'Jakarta'),
(64, 1, 1, '2022-06-20', '310000', 1, '', 4, 'Jakarta'),
(65, 1, 1, '2022-06-29', '1625000', 1, '', 4, 'Jakarta'),
(66, 1, 1, '2022-06-29', '2800000', 1, '', 4, 'Jakarta'),
(67, 1, 2, '2022-07-04', '1375000', 1, '', 4, 'Jakarta'),
(68, 1, 2, '2022-07-04', '1615000', 1, '', 4, 'Jakarta'),
(69, 1, 2, '2022-07-04', '4450000', 1, '', 4, 'Jakarta'),
(70, 1, 1, '2022-07-12', '2050000', 1, '', 4, 'Jakarta'),
(71, 1, 1, '2022-07-12', '455000', 1, '', 4, 'Jakarta'),
(72, 1, 1, '2022-07-12', '3050000', 1, '', 4, 'Jakarta'),
(73, 1, 1, '2022-07-12', '3250000', 1, '', 4, 'Jakarta'),
(74, 1, 2, '2022-07-18', '1150000', 1, '', 4, 'Jakarta'),
(75, 1, 2, '2022-07-18', '1000000', 1, '', 4, 'Jakarta'),
(76, 1, 1, '2022-07-28', '310000', 1, '', 4, 'Jakarta'),
(77, 1, 1, '2022-07-28', '2800000', 1, '', 4, 'Jakarta'),
(78, 1, 1, '2022-08-05', '1025000', 1, '', 4, 'Jakarta'),
(79, 1, 1, '2022-08-05', '1525000', 1, '', 4, 'Jakarta'),
(80, 1, 2, '2022-08-11', '1150000', 1, '', 4, 'Jakarta'),
(81, 1, 2, '2022-08-11', '1000000', 1, '', 4, 'Jakarta'),
(82, 1, 1, '2022-08-19', '455000', 1, '', 4, 'Jakarta'),
(83, 1, 1, '2022-08-19', '1625000', 1, '', 4, 'Jakarta'),
(84, 1, 1, '2022-08-19', '2800000', 1, '', 4, 'Jakarta'),
(85, 1, 2, '2022-08-24', '1375000', 1, '', 4, 'Jakarta'),
(86, 1, 2, '2022-08-24', '1615000', 1, '', 4, 'Jakarta'),
(87, 1, 1, '2022-08-30', '310000', 1, '', 4, 'Jakarta'),
(88, 1, 2, '2022-08-30', '2225000', 1, '', 4, 'Jakarta'),
(89, 1, 1, '2022-09-05', '910000', 1, '', 4, 'Jakarta'),
(90, 1, 1, '2022-09-05', '310000', 1, '', 4, 'Jakarta'),
(91, 1, 2, '2022-09-12', '575000', 1, '', 4, 'Jakarta'),
(92, 1, 2, '2022-09-12', '500000', 1, '', 4, 'Jakarta'),
(93, 1, 2, '2022-09-12', '687500', 1, '', 4, 'Jakarta'),
(94, 1, 2, '2022-09-17', '3230000', 1, '', 4, 'Jakarta'),
(95, 1, 2, '2022-09-17', '2225000', 1, '', 4, 'Jakarta'),
(96, 1, 1, '2022-09-21', '1025000', 1, '', 4, 'Jakarta'),
(97, 1, 1, '2022-09-21', '2800000', 1, '', 4, 'Jakarta'),
(98, 1, 1, '2022-09-27', '1625000', 1, '', 4, 'Jakarta'),
(99, 1, 1, '2022-09-27', '3050000', 1, '', 4, 'Jakarta'),
(100, 1, 2, '2022-10-04', '575000', 1, '', 4, 'Jakarta'),
(101, 1, 2, '2022-10-04', '500000', 1, '', 4, 'Jakarta'),
(102, 1, 1, '2022-10-13', '2050000', 1, '', 4, 'Jakarta'),
(103, 1, 1, '2022-10-13', '1525000', 1, '', 4, 'Jakarta'),
(104, 1, 2, '2022-10-19', '1375000', 1, '', 4, 'Jakarta'),
(105, 1, 2, '2022-10-19', '1615000', 1, '', 4, 'Jakarta'),
(106, 1, 2, '2022-10-19', '2225000', 1, '', 4, 'Jakarta'),
(107, 1, 1, '2022-10-19', '310000', 1, '', 4, 'Jakarta'),
(108, 1, 1, '2022-10-25', '455000', 1, '', 4, 'Jakarta'),
(109, 1, 1, '2022-10-25', '2800000', 1, '', 4, 'Jakarta'),
(110, 1, 1, '2022-10-25', '3250000', 1, '', 4, 'Jakarta'),
(111, 1, 2, '2022-11-04', '687500', 1, '', 4, 'Jakarta'),
(112, 1, 2, '2022-11-04', '1615000', 1, '', 4, 'Jakarta'),
(113, 1, 2, '2022-11-04', '4450000', 1, '', 4, 'Jakarta'),
(114, 1, 1, '2022-11-11', '1025000', 1, '', 4, 'Jakarta'),
(115, 1, 1, '2022-11-11', '3050000', 1, '', 4, 'Jakarta'),
(116, 1, 1, '2022-11-11', '455000', 1, '', 4, 'Jakarta'),
(117, 1, 1, '2022-11-24', '620000', 1, '', 4, 'Jakarta'),
(118, 1, 1, '2022-11-24', '1625000', 1, '', 4, 'Jakarta'),
(119, 1, 1, '2022-11-24', '5600000', 1, '', 4, 'Jakarta'),
(120, 1, 2, '2022-11-30', '1150000', 1, '', 4, 'Jakarta'),
(121, 1, 2, '2022-11-30', '1000000', 1, '', 4, 'Jakarta'),
(122, 1, 1, '2022-12-08', '1025000', 1, '', 4, 'Jakarta'),
(123, 1, 1, '2022-12-08', '1525000', 1, '', 4, 'Jakarta'),
(124, 1, 2, '2022-12-14', '575000', 1, '', 4, 'Jakarta'),
(125, 1, 2, '2022-12-14', '500000', 1, '', 4, 'Jakarta'),
(126, 1, 1, '2022-12-19', '455000', 1, '', 4, 'Jakarta'),
(127, 1, 1, '2022-12-19', '310000', 1, '', 4, 'Jakarta'),
(128, 1, 1, '2022-12-23', '1625000', 1, '', 4, 'Jakarta'),
(129, 1, 1, '2022-12-23', '2800000', 1, '', 4, 'Jakarta'),
(130, 1, 2, '2022-12-29', '687500', 1, '', 4, 'Jakarta'),
(131, 1, 2, '2022-12-29', '1615000', 1, '', 4, 'Jakarta'),
(132, 1, 2, '2022-12-29', '2225000', 1, '', 4, 'Jakarta'),
(133, 1, 1, '2023-01-09', '1025000', 1, '', 4, 'Jakarta'),
(134, 1, 1, '2023-01-09', '455000', 1, '', 4, 'Jakarta'),
(135, 1, 1, '2023-01-09', '3050000', 1, '', 4, 'Jakarta'),
(136, 1, 1, '2023-01-09', '3250000', 1, '', 4, 'Jakarta'),
(137, 1, 2, '2023-01-20', '1375000', 1, '', 4, 'Jakarta'),
(138, 1, 2, '2023-01-20', '1615000', 1, '', 4, 'Jakarta'),
(139, 1, 2, '2023-01-20', '2225000', 1, '', 4, 'Jakarta'),
(140, 1, 1, '2023-01-25', '310000', 1, '', 4, 'Jakarta'),
(141, 1, 1, '2023-01-25', '5600000', 1, '', 4, 'Jakarta'),
(142, 1, 2, '2023-01-31', '1150000', 1, '', 4, 'Jakarta'),
(143, 1, 2, '2023-01-31', '1000000', 1, '', 4, 'Jakarta'),
(144, 1, 1, '2023-02-06', '2050000', 1, '', 4, 'Jakarta'),
(145, 1, 1, '2023-02-06', '3050000', 1, '', 4, 'Jakarta'),
(146, 1, 2, '2023-02-10', '687500', 1, '', 4, 'Jakarta'),
(147, 1, 2, '2023-02-10', '3230000', 1, '', 4, 'Jakarta'),
(148, 1, 1, '2023-02-16', '3250000', 1, '', 4, 'Jakarta'),
(149, 1, 1, '2023-02-16', '2800000', 1, '', 4, 'Jakarta'),
(150, 1, 1, '2023-02-22', '910000', 1, '', 4, 'Jakarta'),
(151, 1, 1, '2023-02-22', '310000', 1, '', 4, 'Jakarta'),
(152, 1, 2, '2023-02-28', '1150000', 1, '', 4, 'Jakarta'),
(153, 1, 2, '2023-02-28', '500000', 1, '', 4, 'Jakarta'),
(154, 1, 2, '2023-02-28', '2225000', 1, '', 4, 'Jakarta'),
(155, 1, 2, '2023-03-07', '1375000', 1, '', 4, 'Jakarta'),
(156, 1, 2, '2023-03-07', '1615000', 1, '', 4, 'Jakarta'),
(157, 1, 1, '2023-03-13', '1025000', 1, '', 4, 'Jakarta'),
(158, 1, 1, '2023-03-13', '1525000', 1, '', 4, 'Jakarta'),
(159, 1, 2, '2023-03-17', '575000', 1, '', 4, 'Jakarta'),
(160, 1, 2, '2023-03-17', '1000000', 1, '', 4, 'Jakarta'),
(161, 1, 2, '2023-03-17', '4450000', 1, '', 4, 'Jakarta'),
(162, 1, 1, '2023-03-25', '455000', 1, '', 4, 'Jakarta'),
(163, 1, 1, '2023-03-25', '310000', 1, '', 4, 'Jakarta'),
(164, 1, 1, '2023-03-30', '1625000', 1, '', 4, 'Jakarta'),
(165, 1, 1, '2023-03-30', '5600000', 1, '', 4, 'Jakarta'),
(166, 1, 2, '2023-04-05', '687500', 1, '', 4, 'Jakarta'),
(167, 1, 2, '2023-04-05', '1615000', 1, '', 4, 'Jakarta'),
(168, 1, 2, '2023-04-05', '4450000', 1, '', 4, 'Jakarta'),
(169, 1, 1, '2023-04-10', '1025000', 1, '', 4, 'Jakarta'),
(170, 1, 1, '2023-04-10', '910000', 1, '', 4, 'Jakarta'),
(171, 1, 1, '2023-04-14', '310000', 1, '', 4, 'Jakarta'),
(172, 1, 1, '2023-04-14', '1525000', 1, '', 4, 'Jakarta'),
(173, 1, 1, '2023-04-14', '1625000', 1, '', 4, 'Jakarta'),
(174, 1, 2, '2023-04-28', '575000', 1, '', 4, 'Jakarta'),
(175, 1, 2, '2023-04-28', '500000', 1, '', 4, 'Jakarta'),
(176, 1, 1, '2023-04-28', '2800000', 1, '', 4, 'Jakarta'),
(177, 1, 1, '2023-05-05', '2050000', 1, '', 4, 'Jakarta'),
(178, 1, 1, '2023-05-05', '3050000', 1, '', 4, 'Jakarta'),
(179, 1, 2, '2023-05-11', '575000', 1, '', 4, 'Jakarta'),
(180, 1, 2, '2023-05-11', '500000', 1, '', 4, 'Jakarta'),
(181, 1, 1, '2023-05-16', '455000', 1, '', 4, 'Jakarta'),
(182, 1, 1, '2023-05-16', '310000', 1, '', 4, 'Jakarta'),
(183, 1, 2, '2023-05-20', '687500', 1, '', 4, 'Jakarta'),
(184, 1, 2, '2023-05-20', '1615000', 1, '', 4, 'Jakarta'),
(185, 1, 2, '2023-05-20', '2225000', 1, '', 4, 'Jakarta'),
(186, 1, 1, '2023-05-25', '1625000', 1, '', 4, 'Jakarta'),
(187, 1, 1, '2023-05-25', '2800000', 1, '', 4, 'Jakarta'),
(188, 1, 2, '2023-06-03', '575000', 1, '', 4, 'Jakarta'),
(189, 1, 2, '2023-06-03', '500000', 1, '', 4, 'Jakarta'),
(190, 1, 2, '2023-06-03', '1375000', 1, '', 4, 'Jakarta'),
(191, 1, 2, '2023-06-03', '1615000', 1, '', 4, 'Jakarta'),
(192, 1, 2, '2023-06-03', '2225000', 1, '', 4, 'Jakarta'),
(193, 1, 1, '2023-06-08', '1025000', 1, '', 4, 'Jakarta'),
(194, 1, 1, '2023-06-08', '455000', 1, '', 4, 'Jakarta'),
(195, 1, 1, '2023-06-15', '310000', 1, '', 4, 'Jakarta'),
(196, 1, 1, '2023-06-15', '1525000', 1, '', 4, 'Jakarta'),
(197, 1, 1, '2023-06-26', '3250000', 1, '', 4, 'Jakarta'),
(198, 1, 1, '2023-06-26', '2800000', 1, '', 4, 'Jakarta'),
(199, 1, 2, '2023-07-04', '1150000', 1, '', 4, 'Jakarta'),
(200, 1, 2, '2023-07-04', '1000000', 1, '', 4, 'Jakarta'),
(201, 1, 2, '2023-07-04', '687500', 1, '', 4, 'Jakarta'),
(202, 1, 1, '2023-07-13', '2050000', 1, '', 4, 'Jakarta'),
(203, 1, 1, '2023-07-13', '3050000', 1, '', 4, 'Jakarta'),
(204, 1, 1, '2023-07-17', '455000', 1, '', 4, 'Jakarta'),
(205, 1, 1, '2023-07-17', '310000', 1, '', 4, 'Jakarta'),
(206, 1, 2, '2023-07-22', '1615000', 1, '', 4, 'Jakarta'),
(207, 1, 2, '2023-07-22', '2225000', 1, '', 4, 'Jakarta'),
(208, 1, 1, '2023-07-26', '2800000', 1, '', 4, 'Jakarta'),
(209, 1, 1, '2023-07-26', '1625000', 1, '', 4, 'Jakarta'),
(210, 1, 2, '2023-08-02', '1375000', 1, '', 4, 'Jakarta'),
(211, 1, 2, '2023-08-02', '1615000', 1, '', 4, 'Jakarta'),
(212, 1, 1, '2023-08-08', '1025000', 1, '', 4, 'Jakarta'),
(213, 1, 1, '2023-08-08', '910000', 1, '', 4, 'Jakarta'),
(214, 1, 1, '2023-08-08', '310000', 1, '', 4, 'Jakarta'),
(215, 1, 1, '2023-08-08', '1525000', 1, '', 4, 'Jakarta'),
(216, 1, 1, '2023-08-12', '3250000', 1, '', 4, 'Jakarta'),
(217, 1, 1, '2023-08-12', '2800000', 1, '', 4, 'Jakarta'),
(218, 1, 2, '2023-08-22', '575000', 1, '', 4, 'Jakarta'),
(219, 1, 2, '2023-08-22', '1000000', 1, '', 4, 'Jakarta'),
(220, 1, 2, '2023-08-22', '2225000', 1, '', 4, 'Jakarta'),
(221, 1, 1, '2023-09-01', '2050000', 1, '', 4, 'Jakarta'),
(222, 1, 1, '2023-09-01', '1525000', 1, '', 4, 'Jakarta'),
(223, 1, 2, '2023-09-06', '1150000', 1, '', 4, 'Jakarta'),
(224, 1, 2, '2023-09-06', '500000', 1, '', 4, 'Jakarta'),
(225, 1, 1, '2023-09-12', '455000', 1, '', 4, 'Jakarta'),
(226, 1, 1, '2023-09-12', '1625000', 1, '', 4, 'Jakarta'),
(227, 1, 1, '2023-09-12', '2800000', 1, '', 4, 'Jakarta'),
(228, 1, 2, '2023-09-18', '687500', 1, '', 4, 'Jakarta'),
(229, 1, 2, '2023-09-18', '1615000', 1, '', 4, 'Jakarta'),
(230, 1, 2, '2023-09-22', '2225000', 1, '', 4, 'Jakarta'),
(231, 1, 1, '2023-09-22', '620000', 1, '', 4, 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_dbarang`
--

CREATE TABLE `po_dbarang` (
  `id_po_dbar` int(11) NOT NULL,
  `id_po_bar` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_dbarang`
--

INSERT INTO `po_dbarang` (`id_po_dbar`, `id_po_bar`, `id_jenis`, `qty`) VALUES
(1, 1, 12, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `po_dbb`
--

CREATE TABLE `po_dbb` (
  `id_po_dbb` int(11) NOT NULL,
  `id_po_bb` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `po_dbb`
--

INSERT INTO `po_dbb` (`id_po_dbb`, `id_po_bb`, `id_jenis`, `qty`) VALUES
(1, 1, 1, 5),
(2, 2, 2, 5),
(3, 3, 6, 5),
(4, 4, 7, 5),
(5, 5, 8, 5),
(6, 6, 9, 10),
(7, 7, 10, 10),
(8, 8, 11, 10),
(9, 9, 3, 5),
(10, 10, 4, 10),
(11, 11, 5, 10),
(12, 12, 3, 5),
(13, 13, 2, 5),
(14, 14, 4, 10),
(15, 15, 5, 10),
(16, 16, 8, 5),
(17, 17, 6, 5),
(18, 18, 7, 5),
(19, 19, 10, 5),
(20, 20, 9, 5),
(21, 21, 11, 5),
(22, 22, 1, 10),
(23, 23, 2, 5),
(24, 24, 3, 5),
(25, 25, 9, 5),
(26, 26, 4, 10),
(27, 27, 5, 10),
(28, 28, 1, 5),
(29, 29, 10, 10),
(30, 30, 7, 5),
(31, 31, 8, 5),
(32, 32, 6, 10),
(33, 33, 11, 5),
(34, 34, 4, 10),
(35, 35, 5, 10),
(36, 36, 1, 10),
(37, 37, 2, 5),
(38, 38, 8, 5),
(39, 39, 7, 5),
(40, 40, 6, 10),
(41, 41, 3, 5),
(42, 42, 11, 5),
(43, 43, 10, 10),
(44, 44, 9, 10),
(45, 45, 1, 10),
(46, 46, 9, 5),
(47, 47, 10, 5),
(48, 48, 2, 5),
(49, 49, 5, 10),
(50, 50, 4, 10),
(51, 51, 6, 5),
(52, 52, 7, 5),
(53, 53, 8, 10),
(54, 54, 3, 5),
(55, 55, 11, 5),
(56, 56, 4, 10),
(57, 57, 5, 10),
(58, 58, 1, 5),
(59, 59, 9, 5),
(60, 60, 6, 5),
(61, 61, 7, 10),
(62, 62, 8, 5),
(63, 63, 2, 10),
(64, 64, 3, 5),
(65, 65, 10, 5),
(66, 66, 11, 5),
(67, 67, 6, 10),
(68, 68, 7, 5),
(69, 69, 8, 10),
(70, 70, 1, 10),
(71, 71, 2, 5),
(72, 72, 9, 10),
(73, 73, 10, 10),
(74, 74, 4, 10),
(75, 75, 5, 10),
(76, 76, 3, 5),
(77, 77, 11, 5),
(78, 78, 1, 5),
(79, 79, 9, 5),
(80, 80, 4, 10),
(81, 81, 5, 10),
(82, 82, 2, 5),
(83, 83, 10, 5),
(84, 84, 11, 5),
(85, 85, 6, 10),
(86, 86, 7, 5),
(87, 87, 3, 5),
(88, 88, 8, 5),
(89, 89, 2, 10),
(90, 90, 3, 5),
(91, 91, 4, 5),
(92, 92, 5, 5),
(93, 93, 6, 5),
(94, 94, 7, 10),
(95, 95, 8, 5),
(96, 96, 1, 5),
(97, 97, 11, 5),
(98, 98, 10, 5),
(99, 99, 9, 10),
(100, 100, 4, 5),
(101, 101, 5, 5),
(102, 102, 1, 10),
(103, 103, 9, 5),
(104, 104, 6, 10),
(105, 105, 7, 5),
(106, 106, 8, 5),
(107, 107, 3, 5),
(108, 108, 2, 5),
(109, 109, 11, 5),
(110, 110, 10, 10),
(111, 111, 6, 5),
(112, 112, 7, 5),
(113, 113, 8, 10),
(114, 114, 1, 5),
(115, 115, 9, 10),
(116, 116, 2, 5),
(117, 117, 3, 10),
(118, 118, 10, 5),
(119, 119, 11, 10),
(120, 120, 4, 10),
(121, 121, 5, 10),
(122, 122, 1, 5),
(123, 123, 9, 5),
(124, 124, 4, 5),
(125, 125, 5, 5),
(126, 126, 2, 5),
(127, 127, 3, 5),
(128, 128, 10, 5),
(129, 129, 11, 5),
(130, 130, 6, 5),
(131, 131, 7, 5),
(132, 132, 8, 5),
(133, 133, 1, 5),
(134, 134, 2, 5),
(135, 135, 9, 10),
(136, 136, 10, 10),
(137, 137, 6, 10),
(138, 138, 7, 5),
(139, 139, 8, 5),
(140, 140, 3, 5),
(141, 141, 11, 10),
(142, 142, 4, 10),
(143, 143, 5, 10),
(144, 144, 1, 10),
(145, 145, 9, 10),
(146, 146, 6, 5),
(147, 147, 7, 10),
(148, 148, 10, 10),
(149, 149, 11, 5),
(150, 150, 2, 10),
(151, 151, 3, 5),
(152, 152, 4, 10),
(153, 153, 5, 5),
(154, 154, 8, 5),
(155, 155, 6, 10),
(156, 156, 7, 5),
(157, 157, 1, 5),
(158, 158, 9, 5),
(159, 159, 4, 5),
(160, 160, 5, 10),
(161, 161, 8, 10),
(162, 162, 2, 5),
(163, 163, 3, 5),
(164, 164, 10, 5),
(165, 165, 11, 10),
(166, 166, 6, 5),
(167, 167, 7, 5),
(168, 168, 8, 10),
(169, 169, 1, 5),
(170, 170, 2, 10),
(171, 171, 3, 5),
(172, 172, 9, 5),
(173, 173, 10, 5),
(174, 174, 4, 5),
(175, 175, 5, 5),
(176, 176, 11, 5),
(177, 177, 1, 10),
(178, 178, 9, 10),
(179, 179, 4, 5),
(180, 180, 5, 5),
(181, 181, 2, 5),
(182, 182, 3, 5),
(183, 183, 6, 5),
(184, 184, 7, 5),
(185, 185, 8, 5),
(186, 186, 10, 5),
(187, 187, 11, 5),
(188, 188, 4, 5),
(189, 189, 5, 5),
(190, 190, 6, 10),
(191, 191, 7, 5),
(192, 192, 8, 5),
(193, 193, 1, 5),
(194, 194, 2, 5),
(195, 195, 3, 5),
(196, 196, 9, 5),
(197, 197, 10, 10),
(198, 198, 11, 5),
(199, 199, 4, 10),
(200, 200, 5, 10),
(201, 201, 6, 5),
(202, 202, 1, 10),
(203, 203, 9, 10),
(204, 204, 2, 5),
(205, 205, 3, 5),
(206, 206, 7, 5),
(207, 207, 8, 10),
(208, 208, 11, 5),
(209, 209, 10, 5),
(210, 210, 6, 10),
(211, 211, 7, 5),
(212, 212, 1, 5),
(213, 213, 2, 10),
(214, 214, 3, 5),
(215, 215, 9, 5),
(216, 216, 10, 10),
(217, 217, 11, 5),
(218, 218, 4, 5),
(219, 219, 5, 10),
(220, 220, 8, 5),
(221, 221, 1, 10),
(222, 222, 9, 5),
(223, 223, 4, 10),
(224, 224, 5, 5),
(225, 225, 2, 5),
(226, 226, 10, 5),
(227, 227, 11, 5),
(228, 228, 6, 5),
(229, 229, 7, 5),
(230, 230, 8, 5),
(231, 231, 3, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reseller`
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
-- Dumping data untuk tabel `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `nama_reseller`, `alamat_reseller`, `no_hp_reseller`, `jk`, `username_reseller`, `password_reseller`) VALUES
(1, 'Reseller 1', 'Kuningan, Jawa Barat', '089987656543', 'Perempuan', 'reseller1', 'reseller1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
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
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_hp_supplier`, `username_supp`, `pass_supp`) VALUES
(1, 'Grafika', 'Jakarta', '089987345162', 'grafika1', 'grafika1'),
(2, 'Max Pro', 'Jakarta', '08991227005', 'maxpro1', 'maxpro1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `alamat_user`, `no_hp_user`, `username`, `password`, `level_user`) VALUES
(1, 'Admin', 'Kuningan', '089987654543', 'admin', 'admin', 1),
(3, 'Pimpinan', 'Kuningan, Jawa Barat', '089987654543', 'pimpinan', 'pimpinan', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `po_barang`
--
ALTER TABLE `po_barang`
  ADD PRIMARY KEY (`id_po_bar`);

--
-- Indeks untuk tabel `po_bb`
--
ALTER TABLE `po_bb`
  ADD PRIMARY KEY (`id_po_bb`);

--
-- Indeks untuk tabel `po_dbarang`
--
ALTER TABLE `po_dbarang`
  ADD PRIMARY KEY (`id_po_dbar`);

--
-- Indeks untuk tabel `po_dbb`
--
ALTER TABLE `po_dbb`
  ADD PRIMARY KEY (`id_po_dbb`);

--
-- Indeks untuk tabel `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `po_barang`
--
ALTER TABLE `po_barang`
  MODIFY `id_po_bar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `po_bb`
--
ALTER TABLE `po_bb`
  MODIFY `id_po_bb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=742;

--
-- AUTO_INCREMENT untuk tabel `po_dbarang`
--
ALTER TABLE `po_dbarang`
  MODIFY `id_po_dbar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `po_dbb`
--
ALTER TABLE `po_dbb`
  MODIFY `id_po_dbb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT untuk tabel `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
