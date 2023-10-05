-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Okt 2023 pada 12.39
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
-- Struktur dari tabel `data_dummy`
--

CREATE TABLE `data_dummy` (
  `id_dummy` int(11) NOT NULL,
  `periode` varchar(125) NOT NULL,
  `permintaan` int(11) NOT NULL,
  `forecast` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `data_dummy`
--

INSERT INTO `data_dummy` (`id_dummy`, `periode`, `permintaan`, `forecast`) VALUES
(1, 'November', 3250, 0),
(2, 'Desember', 3240, 0),
(3, 'Januari', 3250, 0),
(4, 'Februari', 3260, 0),
(5, 'Maret', 3260, 0),
(6, 'April', 3250, 0),
(7, 'Mei', 3260, 0),
(8, 'Juni', 3250, 0),
(9, 'Juli', 3120, 0),
(10, 'Agustus', 3019, 0),
(11, 'September', 3112, 0),
(12, 'Oktober', 3240, 0);

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
(1, 1, 1, '2022-01-02', '307500', 1, '', 4, 'Jakarta'),
(2, 1, 1, '2022-01-05', '3050000', 1, '', 4, 'Jakarta'),
(3, 1, 2, '2022-01-08', '5750000', 1, '', 4, 'Jakarta'),
(4, 1, 1, '2022-01-11', '455000', 1, '', 4, 'Jakarta'),
(5, 1, 2, '2022-01-14', '1375000', 1, '', 4, 'Jakarta'),
(6, 1, 1, '2022-01-17', '3250000', 1, '', 4, 'Jakarta'),
(7, 1, 1, '2022-01-20', '5600000', 1, '', 4, 'Jakarta'),
(8, 1, 1, '2022-01-23', '1550000', 1, '', 4, 'Jakarta'),
(9, 1, 2, '2022-01-26', '4845000', 1, '', 4, 'Jakarta'),
(10, 1, 2, '2022-01-29', '6675000', 1, '', 4, 'Jakarta'),
(11, 1, 2, '2022-02-01', '2000000', 1, '', 4, 'Jakarta'),
(12, 1, 1, '2022-02-04', '227500', 1, '', 4, 'Jakarta'),
(13, 1, 1, '2022-02-07', '512500', 1, '', 4, 'Jakarta'),
(14, 1, 1, '2022-02-10', '7625000', 1, '', 4, 'Jakarta'),
(15, 1, 2, '2022-02-13', '8075000', 1, '', 4, 'Jakarta'),
(16, 1, 1, '2022-02-16', '930000', 1, '', 4, 'Jakarta'),
(17, 1, 2, '2022-02-19', '2062500', 1, '', 4, 'Jakarta'),
(18, 1, 2, '2022-02-22', '6675000', 1, '', 4, 'Jakarta'),
(19, 1, 2, '2022-02-25', '2300000', 1, '', 4, 'Jakarta'),
(20, 1, 1, '2022-02-28', '6500000', 1, '', 4, 'Jakarta'),
(21, 1, 1, '2022-03-03', '11200000', 1, '', 4, 'Jakarta'),
(22, 1, 2, '2022-03-06', '1000000', 1, '', 4, 'Jakarta'),
(23, 1, 1, '2022-03-09', '512500', 1, '', 4, 'Jakarta'),
(24, 1, 2, '2022-03-12', '2062500', 1, '', 4, 'Jakarta'),
(25, 1, 1, '2022-03-15', '4575000', 1, '', 4, 'Jakarta'),
(26, 1, 1, '2022-03-18', '4875000', 1, '', 4, 'Jakarta'),
(27, 1, 2, '2022-03-21', '1725000', 1, '', 4, 'Jakarta'),
(28, 1, 2, '2022-03-24', '1000000', 1, '', 4, 'Jakarta'),
(29, 1, 2, '2022-03-27', '4845000', 1, '', 4, 'Jakarta'),
(30, 1, 2, '2022-03-30', '6675000', 1, '', 4, 'Jakarta'),
(31, 1, 1, '2022-04-02', '8400000', 1, '', 4, 'Jakarta'),
(32, 1, 1, '2022-04-05', '1240000', 1, '', 4, 'Jakarta'),
(33, 1, 1, '2022-04-08', '410000', 1, '', 4, 'Jakarta'),
(34, 1, 2, '2022-04-11', '2300000', 1, '', 4, 'Jakarta'),
(35, 1, 1, '2022-04-14', '3250000', 1, '', 4, 'Jakarta'),
(36, 1, 2, '2022-04-17', '1000000', 1, '', 4, 'Jakarta'),
(37, 1, 1, '2022-04-20', '136500', 1, '', 4, 'Jakarta'),
(38, 1, 2, '2022-04-23', '8900000', 1, '', 4, 'Jakarta'),
(39, 1, 1, '2022-04-26', '7625000', 1, '', 4, 'Jakarta'),
(40, 1, 1, '2022-04-29', '930000', 1, '', 4, 'Jakarta'),
(41, 1, 2, '2022-05-02', '2750000', 1, '', 4, 'Jakarta'),
(42, 1, 2, '2022-05-05', '6460000', 1, '', 4, 'Jakarta'),
(43, 1, 1, '2022-05-08', '512500', 1, '', 4, 'Jakarta'),
(44, 1, 1, '2022-05-11', '1550000', 1, '', 4, 'Jakarta'),
(45, 1, 2, '2022-05-14', '3230000', 1, '', 4, 'Jakarta'),
(46, 1, 1, '2022-05-17', '6100000', 1, '', 4, 'Jakarta'),
(47, 1, 2, '2022-05-20', '1725000', 1, '', 4, 'Jakarta'),
(48, 1, 2, '2022-05-23', '1500000', 1, '', 4, 'Jakarta'),
(49, 1, 1, '2022-05-26', '6500000', 1, '', 4, 'Jakarta'),
(50, 1, 2, '2022-05-29', '2062500', 1, '', 4, 'Jakarta'),
(51, 1, 1, '2022-06-01', '136500', 1, '', 4, 'Jakarta'),
(52, 1, 1, '2022-06-04', '11200000', 1, '', 4, 'Jakarta'),
(53, 1, 2, '2022-06-07', '1500000', 1, '', 4, 'Jakarta'),
(54, 1, 2, '2022-06-10', '8900000', 1, '', 4, 'Jakarta'),
(55, 1, 2, '2022-06-13', '1000000', 1, '', 4, 'Jakarta'),
(56, 1, 1, '2022-06-16', '615000', 1, '', 4, 'Jakarta'),
(57, 1, 2, '2022-06-19', '3230000', 1, '', 4, 'Jakarta'),
(58, 1, 2, '2022-06-22', '1150000', 1, '', 4, 'Jakarta'),
(59, 1, 1, '2022-06-25', '91000', 1, '', 4, 'Jakarta'),
(60, 1, 1, '2022-06-28', '310000', 1, '', 4, 'Jakarta'),
(61, 1, 1, '2022-07-01', '7625000', 1, '', 4, 'Jakarta'),
(62, 1, 2, '2022-07-04', '1375000', 1, '', 4, 'Jakarta'),
(63, 1, 1, '2022-07-07', '512500', 1, '', 4, 'Jakarta'),
(64, 1, 2, '2022-07-10', '3230000', 1, '', 4, 'Jakarta'),
(65, 1, 1, '2022-07-13', '4575000', 1, '', 4, 'Jakarta'),
(66, 1, 1, '2022-07-16', '4875000', 1, '', 4, 'Jakarta'),
(67, 1, 2, '2022-07-19', '1000000', 1, '', 4, 'Jakarta'),
(68, 1, 2, '2022-07-22', '1150000', 1, '', 4, 'Jakarta'),
(69, 1, 1, '2022-07-25', '410000', 1, '', 4, 'Jakarta'),
(70, 1, 1, '2022-07-28', '227500', 1, '', 4, 'Jakarta'),
(71, 1, 2, '2022-07-31', '2750000', 1, '', 4, 'Jakarta'),
(72, 1, 2, '2022-08-03', '6460000', 1, '', 4, 'Jakarta'),
(73, 1, 2, '2022-08-06', '1500000', 1, '', 4, 'Jakarta'),
(74, 1, 1, '2022-08-09', '4575000', 1, '', 4, 'Jakarta'),
(75, 1, 1, '2022-08-12', '8400000', 1, '', 4, 'Jakarta'),
(76, 1, 1, '2022-08-15', '620000', 1, '', 4, 'Jakarta'),
(77, 1, 1, '2022-08-18', '6500000', 1, '', 4, 'Jakarta'),
(78, 1, 2, '2022-08-21', '4450000', 1, '', 4, 'Jakarta'),
(79, 1, 2, '2022-08-24', '2750000', 1, '', 4, 'Jakarta'),
(80, 1, 1, '2022-08-27', '6100000', 1, '', 4, 'Jakarta'),
(81, 1, 2, '2022-08-30', '3230000', 1, '', 4, 'Jakarta'),
(82, 1, 2, '2022-09-02', '1150000', 1, '', 4, 'Jakarta'),
(83, 1, 1, '2022-09-05', '136500', 1, '', 4, 'Jakarta'),
(84, 1, 1, '2022-09-08', '8400000', 1, '', 4, 'Jakarta'),
(85, 1, 1, '2022-09-11', '410000', 1, '', 4, 'Jakarta'),
(86, 1, 1, '2022-09-14', '620000', 1, '', 4, 'Jakarta'),
(87, 1, 2, '2022-09-17', '1000000', 1, '', 4, 'Jakarta'),
(88, 1, 1, '2022-09-20', '1550000', 1, '', 4, 'Jakarta'),
(89, 1, 2, '2022-09-23', '4845000', 1, '', 4, 'Jakarta'),
(90, 1, 1, '2022-09-26', '512500', 1, '', 4, 'Jakarta'),
(91, 1, 2, '2022-09-29', '1000000', 1, '', 4, 'Jakarta'),
(92, 1, 1, '2022-10-02', '182000', 1, '', 4, 'Jakarta'),
(93, 1, 2, '2022-10-05', '2875000', 1, '', 4, 'Jakarta'),
(94, 1, 2, '2022-10-08', '2750000', 1, '', 4, 'Jakarta'),
(95, 1, 1, '2022-10-11', '7625000', 1, '', 4, 'Jakarta'),
(96, 1, 2, '2022-10-14', '6675000', 1, '', 4, 'Jakarta'),
(97, 1, 2, '2022-10-17', '6460000', 1, '', 4, 'Jakarta'),
(98, 1, 1, '2022-10-20', '8125000', 1, '', 4, 'Jakarta'),
(99, 1, 1, '2022-10-23', '3050000', 1, '', 4, 'Jakarta'),
(100, 1, 2, '2022-10-26', '1150000', 1, '', 4, 'Jakarta'),
(101, 1, 2, '2022-10-29', '8900000', 1, '', 4, 'Jakarta'),
(102, 1, 2, '2022-11-01', '2750000', 1, '', 4, 'Jakarta'),
(103, 1, 1, '2022-11-04', '512500', 1, '', 4, 'Jakarta'),
(104, 1, 1, '2022-11-07', '227500', 1, '', 4, 'Jakarta'),
(105, 1, 2, '2022-11-10', '2500000', 1, '', 4, 'Jakarta'),
(106, 1, 1, '2022-11-13', '930000', 1, '', 4, 'Jakarta'),
(107, 1, 2, '2022-11-16', '8900000', 1, '', 4, 'Jakarta'),
(108, 1, 2, '2022-11-19', '6460000', 1, '', 4, 'Jakarta'),
(109, 1, 1, '2022-11-22', '7625000', 1, '', 4, 'Jakarta'),
(110, 1, 1, '2022-11-25', '6500000', 1, '', 4, 'Jakarta'),
(111, 1, 1, '2022-11-28', '512500', 1, '', 4, 'Jakarta'),
(112, 1, 1, '2022-12-01', '7625000', 1, '', 4, 'Jakarta'),
(113, 1, 2, '2022-12-04', '2062500', 1, '', 4, 'Jakarta'),
(114, 1, 2, '2022-12-07', '1000000', 1, '', 4, 'Jakarta'),
(115, 1, 1, '2022-12-10', '182000', 1, '', 4, 'Jakarta'),
(116, 1, 1, '2022-12-13', '6500000', 1, '', 4, 'Jakarta'),
(117, 1, 2, '2022-12-16', '4450000', 1, '', 4, 'Jakarta'),
(118, 1, 2, '2022-12-19', '3230000', 1, '', 4, 'Jakarta'),
(119, 1, 2, '2022-12-22', '1725000', 1, '', 4, 'Jakarta'),
(120, 1, 1, '2022-12-25', '1240000', 1, '', 4, 'Jakarta'),
(121, 1, 1, '2022-12-28', '6100000', 1, '', 4, 'Jakarta'),
(122, 1, 1, '2022-12-31', '410000', 1, '', 4, 'Jakarta'),
(123, 1, 2, '2023-03-13', '1375000', 1, '', 4, 'Jakarta'),
(124, 1, 1, '2023-03-16', '6100000', 1, '', 4, 'Jakarta'),
(125, 1, 2, '2023-03-20', '1000000', 1, '', 4, 'Jakarta'),
(126, 1, 1, '2023-03-25', '8400000', 1, '', 4, 'Jakarta'),
(127, 1, 2, '2023-03-28', '1150000', 1, '', 4, 'Jakarta'),
(128, 1, 1, '2023-04-01', '6100000', 1, '', 4, 'Jakarta'),
(129, 1, 2, '2023-04-04', '2062500', 1, '', 4, 'Jakarta'),
(130, 1, 1, '2023-04-07', '410000', 1, '', 4, 'Jakarta'),
(131, 1, 2, '2023-04-10', '4450000', 1, '', 4, 'Jakarta'),
(132, 1, 2, '2023-04-13', '4845000', 1, '', 4, 'Jakarta'),
(133, 1, 1, '2023-04-16', '4575000', 1, '', 4, 'Jakarta'),
(134, 1, 1, '2023-04-19', '11200000', 1, '', 4, 'Jakarta'),
(135, 1, 2, '2023-04-27', '4450000', 1, '', 4, 'Jakarta'),
(136, 1, 2, '2023-05-01', '1150000', 1, '', 4, 'Jakarta'),
(137, 1, 1, '2023-05-04', '227500', 1, '', 4, 'Jakarta'),
(138, 1, 1, '2023-05-08', '1550000', 1, '', 4, 'Jakarta'),
(139, 1, 2, '2023-05-11', '2000000', 1, '', 4, 'Jakarta'),
(140, 1, 1, '2023-05-15', '6100000', 1, '', 4, 'Jakarta'),
(141, 1, 2, '2023-05-19', '3230000', 1, '', 4, 'Jakarta'),
(142, 1, 1, '2023-05-22', '512500', 1, '', 4, 'Jakarta'),
(143, 1, 1, '2023-05-26', '4875000', 1, '', 4, 'Jakarta'),
(144, 1, 2, '2023-05-30', '1150000', 1, '', 4, 'Jakarta'),
(145, 1, 2, '2023-06-02', '1500000', 1, '', 4, 'Jakarta'),
(146, 1, 2, '2023-06-05', '4450000', 1, '', 4, 'Jakarta'),
(147, 1, 2, '2023-06-08', '4845000', 1, '', 4, 'Jakarta'),
(148, 1, 2, '2023-06-11', '2062500', 1, '', 4, 'Jakarta'),
(149, 1, 1, '2023-06-14', '930000', 1, '', 4, 'Jakarta'),
(150, 1, 1, '2023-06-18', '512500', 1, '', 4, 'Jakarta'),
(151, 1, 1, '2023-06-21', '4575000', 1, '', 4, 'Jakarta'),
(152, 1, 1, '2023-06-24', '5600000', 1, '', 4, 'Jakarta'),
(153, 1, 1, '2023-06-27', '3250000', 1, '', 4, 'Jakarta'),
(154, 1, 2, '2023-07-01', '1375000', 1, '', 4, 'Jakarta'),
(155, 1, 2, '2023-07-04', '1615000', 1, '', 4, 'Jakarta'),
(156, 1, 2, '2023-07-07', '2225000', 1, '', 4, 'Jakarta'),
(157, 1, 1, '2023-07-10', '182000', 1, '', 4, 'Jakarta'),
(158, 1, 1, '2023-07-13', '512500', 1, '', 4, 'Jakarta'),
(159, 1, 1, '2023-07-16', '8400000', 1, '', 4, 'Jakarta'),
(160, 1, 1, '2023-07-20', '6100000', 1, '', 4, 'Jakarta'),
(161, 1, 2, '2023-07-24', '4845000', 1, '', 4, 'Jakarta'),
(162, 1, 2, '2023-07-28', '1375000', 1, '', 4, 'Jakarta'),
(163, 1, 2, '2023-08-01', '2875000', 1, '', 4, 'Jakarta'),
(164, 1, 2, '2023-08-03', '2500000', 1, '', 4, 'Jakarta'),
(165, 1, 1, '2023-08-07', '620000', 1, '', 4, 'Jakarta'),
(166, 1, 1, '2023-08-10', '410000', 1, '', 4, 'Jakarta'),
(167, 1, 1, '2023-08-13', '5600000', 1, '', 4, 'Jakarta'),
(168, 1, 1, '2023-08-16', '3050000', 1, '', 4, 'Jakarta'),
(169, 1, 2, '2023-08-21', '3230000', 1, '', 4, 'Jakarta'),
(170, 1, 1, '2023-08-24', '4875000', 1, '', 4, 'Jakarta'),
(171, 1, 2, '2023-08-27', '2062500', 1, '', 4, 'Jakarta'),
(172, 1, 2, '2023-08-30', '1500000', 1, '', 4, 'Jakarta'),
(173, 1, 1, '2023-09-02', '91000', 1, '', 4, 'Jakarta'),
(174, 1, 1, '2023-09-04', '6500000', 1, '', 4, 'Jakarta'),
(175, 1, 1, '2023-09-07', '6100000', 1, '', 4, 'Jakarta'),
(176, 1, 1, '2023-09-09', '512500', 1, '', 4, 'Jakarta'),
(177, 1, 2, '2023-09-11', '1375000', 1, '', 4, 'Jakarta'),
(178, 1, 1, '2023-09-14', '3050000', 1, '', 4, 'Jakarta'),
(179, 1, 1, '2023-09-17', '8400000', 1, '', 4, 'Jakarta'),
(180, 1, 2, '2023-09-20', '1150000', 1, '', 4, 'Jakarta'),
(181, 1, 2, '2023-09-23', '1500000', 1, '', 4, 'Jakarta'),
(182, 1, 1, '2023-09-25', '512500', 1, '', 4, 'Jakarta');

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
(1, 1, 1, 15),
(2, 2, 9, 10),
(3, 3, 4, 50),
(4, 4, 2, 50),
(5, 5, 6, 10),
(6, 6, 10, 10),
(7, 7, 11, 10),
(8, 8, 3, 25),
(9, 9, 7, 15),
(10, 10, 8, 15),
(11, 11, 5, 20),
(12, 12, 2, 25),
(13, 13, 1, 25),
(14, 14, 9, 25),
(15, 15, 7, 25),
(16, 16, 3, 15),
(17, 17, 6, 15),
(18, 18, 8, 15),
(19, 19, 4, 20),
(20, 20, 10, 20),
(21, 21, 11, 20),
(22, 22, 5, 10),
(23, 23, 1, 25),
(24, 24, 6, 15),
(25, 25, 9, 15),
(26, 26, 10, 15),
(27, 27, 4, 15),
(28, 28, 5, 10),
(29, 29, 7, 15),
(30, 30, 8, 15),
(31, 31, 11, 15),
(32, 32, 3, 20),
(33, 33, 1, 20),
(34, 34, 4, 20),
(35, 35, 10, 10),
(36, 36, 5, 10),
(37, 37, 2, 15),
(38, 38, 8, 20),
(39, 39, 9, 25),
(40, 40, 3, 15),
(41, 41, 6, 20),
(42, 42, 7, 20),
(43, 43, 1, 25),
(44, 44, 3, 25),
(45, 45, 7, 10),
(46, 46, 9, 20),
(47, 47, 4, 15),
(48, 48, 5, 15),
(49, 49, 10, 20),
(50, 50, 6, 15),
(51, 51, 2, 15),
(52, 52, 11, 20),
(53, 53, 5, 15),
(54, 54, 8, 20),
(55, 55, 5, 10),
(56, 56, 1, 30),
(57, 57, 7, 10),
(58, 58, 4, 10),
(59, 59, 2, 10),
(60, 60, 3, 5),
(61, 61, 9, 25),
(62, 62, 6, 10),
(63, 63, 1, 25),
(64, 64, 7, 10),
(65, 65, 9, 15),
(66, 66, 10, 15),
(67, 67, 5, 10),
(68, 68, 4, 10),
(69, 69, 1, 20),
(70, 70, 2, 25),
(71, 71, 6, 20),
(72, 72, 7, 20),
(73, 73, 5, 15),
(74, 74, 9, 15),
(75, 75, 11, 15),
(76, 76, 3, 10),
(77, 77, 10, 20),
(78, 78, 8, 10),
(79, 79, 6, 20),
(80, 80, 9, 20),
(81, 81, 7, 10),
(82, 82, 4, 10),
(83, 83, 2, 15),
(84, 84, 11, 15),
(85, 85, 1, 20),
(86, 86, 3, 10),
(87, 87, 5, 10),
(88, 88, 3, 25),
(89, 89, 7, 15),
(90, 90, 1, 25),
(91, 91, 5, 10),
(92, 92, 2, 20),
(93, 93, 4, 25),
(94, 94, 6, 20),
(95, 95, 9, 25),
(96, 96, 8, 15),
(97, 97, 7, 20),
(98, 98, 10, 25),
(99, 99, 9, 10),
(100, 100, 4, 10),
(101, 101, 8, 20),
(102, 102, 6, 20),
(103, 103, 1, 25),
(104, 104, 2, 25),
(105, 105, 5, 25),
(106, 106, 3, 15),
(107, 107, 8, 20),
(108, 108, 7, 20),
(109, 109, 9, 25),
(110, 110, 10, 20),
(111, 111, 1, 25),
(112, 112, 9, 25),
(113, 113, 6, 15),
(114, 114, 5, 10),
(115, 115, 2, 20),
(116, 116, 10, 20),
(117, 117, 8, 10),
(118, 118, 7, 10),
(119, 119, 4, 15),
(120, 120, 3, 20),
(121, 121, 9, 20),
(122, 122, 1, 20),
(123, 123, 6, 10),
(124, 124, 9, 20),
(125, 125, 5, 10),
(126, 126, 11, 15),
(127, 127, 4, 10),
(128, 128, 9, 20),
(129, 129, 6, 15),
(130, 130, 1, 20),
(131, 131, 8, 10),
(132, 132, 7, 15),
(133, 133, 9, 15),
(134, 134, 11, 20),
(135, 135, 8, 10),
(136, 136, 4, 10),
(137, 137, 2, 25),
(138, 138, 3, 25),
(139, 139, 5, 20),
(140, 140, 9, 20),
(141, 141, 7, 10),
(142, 142, 1, 25),
(143, 143, 10, 15),
(144, 144, 4, 10),
(145, 145, 5, 15),
(146, 146, 8, 10),
(147, 147, 7, 15),
(148, 148, 6, 15),
(149, 149, 3, 15),
(150, 150, 1, 25),
(151, 151, 9, 15),
(152, 152, 11, 10),
(153, 153, 10, 10),
(154, 154, 6, 10),
(155, 155, 7, 5),
(156, 156, 8, 5),
(157, 157, 2, 20),
(158, 158, 1, 25),
(159, 159, 11, 15),
(160, 160, 9, 20),
(161, 161, 7, 15),
(162, 162, 6, 10),
(163, 163, 4, 25),
(164, 164, 5, 25),
(165, 165, 3, 10),
(166, 166, 1, 20),
(167, 167, 11, 10),
(168, 168, 9, 10),
(169, 169, 7, 10),
(170, 170, 10, 15),
(171, 171, 6, 15),
(172, 172, 5, 15),
(173, 173, 2, 10),
(174, 174, 10, 20),
(175, 175, 9, 20),
(176, 176, 1, 25),
(177, 177, 6, 10),
(178, 178, 9, 10),
(179, 179, 11, 15),
(180, 180, 4, 10),
(181, 181, 5, 15),
(182, 182, 1, 25);

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
-- Indeks untuk tabel `data_dummy`
--
ALTER TABLE `data_dummy`
  ADD PRIMARY KEY (`id_dummy`);

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
-- AUTO_INCREMENT untuk tabel `data_dummy`
--
ALTER TABLE `data_dummy`
  MODIFY `id_dummy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id_po_bb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=693;

--
-- AUTO_INCREMENT untuk tabel `po_dbarang`
--
ALTER TABLE `po_dbarang`
  MODIFY `id_po_dbar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `po_dbb`
--
ALTER TABLE `po_dbb`
  MODIFY `id_po_dbb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

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
